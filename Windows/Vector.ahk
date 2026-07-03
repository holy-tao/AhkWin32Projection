#Requires AutoHotkey >=v2.1-alpha.30 

#DllLoad kernel32.dll

/**
 * Global cache of typed Vector classes. Map is vector element type -> cached class instance
 */
_TypeCache := Map()

/**
 * A contiguous, growable array of {@link https://www.autohotkey.com/docs/alpha/Structs.htm Structs}.
 */
export default class Vector {
    /**
     * The vector's backing memory
     * @type {Struct.Array}
     */
    data := unset

    /**
     * The number of elements in the vector
     */
    length := 0

    capacity => this.data.Length

    ; Make the vector buffer-like
    ptr => ObjGetDataPtr(this.data)
    size => ObjGetDataSize(this.data)

    /**
     * Get the Class representing a Vector of elements of type T. This class is cached so that
     * type comparisons work as expected. Thus:
     * 
     *      Vector(Int64) is Vector.Of(Int64)   ; 1 / true
     * 
     * The {@link Vector.Prototype.__New constructor} will create an appropriate class if necessary, so
     * it is generally not necessary to call this method unless you are performing type checks.
     * 
     * @param {T extends Struct} dataType The type of the vector's elements. This must be a class extending
     *      {@link https://www.autohotkey.com/docs/alpha/lib/Struct.htm `Struct`}.
     * @returns {Class} the Class
     */
    static Of(dataType) {
        if !HasBase(dataType, Struct)
            throw TypeError("Vector element type must be a Struct, but got a(n) " Type(dataType), , dataType)
        if _TypeCache.Has(dataType)
            return _TypeCache[dataType]

        cls := Class("Vector<" dataType.Prototype.__Class ">", Vector)
        cls.Prototype.DefineProp("ElementType", { get: (_) => dataType })
        cls.Prototype.DefineProp("__New",
            { call: (self, values*) => Vector.Prototype.__New.Call(self, dataType, values*) })

        _TypeCache[dataType] := cls
        return cls
    }

    /**
     * Create a new Vector and optionally initialize it with the given set of values.
     * 
     * The instantiated Vector is a typed class extending Vector with a name like `Vector<Int32>`. See
     * {@link Vector.Of `Vector.Of`} for details.
     * 
     * @param {T extends Struct} dataType The type of the vector's elements. This must be a class extending
     *      {@link https://www.autohotkey.com/docs/alpha/lib/Struct.htm `Struct`}.
     * @param {Array<T>} values Variadic array of elements to initialize the vector with.
     */
    __New(dataType, values*) {
        ObjSetBase(this, Vector.Of(dataType).Prototype)

        this.data := dataType[1]()
        this.Push(values*)
    }

    __Enum(n){
        if(n != 1 && n != 2)
            throw MethodError("Enumeration only supports 1 or 2 variables")

        return Vector.Enumerator(this, n)
    }

    /**
     * Set or retrieve an item in the array
     * @param {Integer} index the item to access 
     */
    __Item[index]{
        get => this.Get(index)
        set {
            this.Set(index, value)
        }
    }

    class Enumerator {
        __New(vec, n) {
            this.vec := vec
            this.idx := 1
            this.n := n
        }

        Call(&idxOrItm, &itm?) {
            if this.idx > this.vec.length {
                return false
            }

            if this.n == 2 {
                idxOrItm := this.idx
                itm := this.vec.Get(this.idx)
            } else {
                idxOrItm := this.vec.Get(this.idx)
            }

            this.idx++
            return true
        }
    }

    /**
     * Append zero or more elements to the array in the order provided
     * @param {Array<Struct | Primitive>} values a variadic array of zero or more elements to append
     */
    Push(values*) {
        this.Reserve(values.length)

        for val in values {
            this.Set(++this.length, val)
        }
    }

    /**
     * Returns the value at a given index. This is equivalent to `ArrayObj[Index]`, 
     * except that `__Item` is not called.
     * 
     * @param {Integer} index the index of the item to get 
     * @param {Any} default Ignored; this parameter is provided for conformance with the native
     *          AutoHotkey `Array` API
     * @returns {Struct | Primitive} the value at `index`
     */
    Get(index, default?) {
        index := this._ResolveIndex(index)
        return this.data[index]
    }

    /**
     * Sets the value at a given index by copying the provided value into the array.
     *
     * @param {Integer} index the index of the item to set
     * @param {Struct | Primitive} value the value to set
     */
    Set(index, value) {
        index := this._ResolveIndex(index)
        this._AssertMemberType(value)

        if (value is this.ElementType && !HasProp(this.ElementType.Prototype, "__value")) {
            DllCall("kernel32\RtlCopyMemory",
                IntPtr, ObjGetDataPtr(this.data[index]),
                IntPtr, ObjGetDataPtr(value),
                Int64, this._elemWidth)
        } else {
            this.data[index] := value
        }
    }

    /**
     * Resize the Vector to the given capacity. This may change the vector's data pointer. The new
     * capacity must be >= the vector's length.
     * 
     * @param {Integer} newCapacity the new requested capcity of the vector (default: 2 * current capacity)
     * @returns {Integer} the new capacity of the Vector 
     */
    Resize(newCapacity := this.capacity * 2) {
        if newCapacity < this.length
            throw ValueError("Cannot resize Vector to capcity less than length")

        if newCapacity <= 0
            throw ValueError("Capacity must be a positive Integer", , newCapacity)

        newArr := this.ElementType[newCapacity]()
        DllCall("kernel32\RtlCopyMemory",
            IntPtr, ObjGetDataPtr(newArr),
            IntPtr, ObjGetDataPtr(this.data),
            Int64, ObjGetDataSize(this.ElementType.Prototype) * this.length)

        this.data := newArr
        return this.capacity
    }

    /**
     * Resize the vector to fit at least `vec.length + requested` elements. If the vector
     * can already fit the requested number of elements, does nothing.
     * 
     * @param {Integer} requested the number of elements to reserve space for.
     * @returns {Integer} the new capacity of the vector
     */
    Reserve(requested) {
        while this.length + requested > this.capacity {
            this.Resize()
        }

        return this.capacity
    }

    /**
     * Shrink the vector so that `capacity` == `length`
     * @returns {Integer} the new capacity of the vector
     */
    ShrinkToFit() => this.Resize(this.length)

    /**
     * Removes the last element of the vector and returns it. For struct element types, the
     * returned value is an owned copy, not a view into the (now-freed) backing slot.
     * @returns {Struct | Primitive} the value previously at the last index
     */
    Pop() {
        if this.length < 1
            throw Error("Cannot Pop from an empty Vector", -1)

        val := this._GetOwned(this.length)
        this.length -= 1
        return val
    }

    /**
     * Inserts zero or more new elements at a specified index. Existing values at indices greater
     * than or equal to `index` are shifted to the right.
     * @param {Integer} index index to insert the new value(s) at, from 1 to `length + 1`. A negative
     *      index counts from the end, so `-1` inserts before the last element.
     * @param {Array<Struct | Primitive>} values a variadic array of zero or more elements to insert
     * @see {@link https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/nf-wdm-rtlmovememory RtlMoveMemory}
     */
    InsertAt(index, values*) {
        index := this._ResolveIndex(index, true)
        this.Reserve(values.length)

        for val in values {
            this._AssertMemberType(val)
            this.length += 1

            ; shift [index .. length-1] right by one element to open a slot at `index`
            DllCall("kernel32\RtlMoveMemory",
                IntPtr, this.ptr + this._OffsetForIndex(index + 1),
                IntPtr, this.ptr + this._OffsetForIndex(index),
                UInt32, (this.length - index) * this._elemWidth)

            this.Set(index++, val)
        }
    }

    /**
     * Removes and returns the element at a specified index. Values to the right of this index are
     * shifted left. For struct element types, the returned value is an owned copy.
     * @param {Integer} index the index of the element to remove. A negative index counts from the
     *      end, so `-1` is the last element.
     * @returns {Struct | Primitive} the removed element
     */
    RemoveAt(index) {
        index := this._ResolveIndex(index)
        val := this._GetOwned(index)

        ; shift (index, length] left by one element, overwriting `index`
        DllCall("kernel32\RtlMoveMemory",
            IntPtr, this.ptr + this._OffsetForIndex(index),
            IntPtr, this.ptr + this._OffsetForIndex(index + 1),
            Int64, (this.length - index) * this._elemWidth)

        this.length -= 1
        return val
    }

    /**
     * Returns a non-zero number if `index` is valid. Unlike native AutoHotkey arrays, there is no
     * concept of an "unset" element: the memory exists and has some value regardless. A negative
     * index counts from the end.
     * @param {Integer} index index to check
     * @returns {Boolean} true if the index is in range, false otherwise
     */
    Has(index) {
        if !IsInteger(index)
            return false

        resolved := index < 0 ? index + this.length + 1 : index
        return resolved >= 1 && resolved <= this.length
    }

    /**
     * Creates a string representation of the vector, e.g. `Vector<Int32>[1, 2, 3]`. Each element is
     * rendered with `String()` if it is a Primitive or has a `ToString`, with strings quoted;
     * otherwise its type name is used.
     */
    ToString() {
        out := Type(this) "["
        for index, value in this {
            if value is String {
                out .= '"' value '"'
            } else if (value is Primitive || HasMethod(value, "ToString", 0)) {
                out .= String(value)
            }
            else {
                out .= Type(value)
            }
            if index < this.length
                out .= ", "
        }
        return out "]"
    }

    /**
     * @private The width in bytes of a single element.
     */
    _elemWidth => ObjGetDataSize(this.ElementType.Prototype)

    /**
     * @private The byte offset into the backing memory of the element at `index`.
     */
    _OffsetForIndex(index) => (index - 1) * this._elemWidth

    /**
     * @private Returns an owned copy of the element at `index`. Element types with a `__value`
     *      yield whatever it returns; struct types are deep-copied so the result does not
     *      alias the backing slot.
     */
    _GetOwned(index) {
        if HasProp(this.ElementType.Prototype, "__value")
            return this.data[index]

        dataType := this.ElementType
        copy := dataType()
        DllCall("kernel32\RtlCopyMemory",
            "ptr", ObjGetDataPtr(copy),
            "ptr", ObjGetDataPtr(this.data[index]),
            "uptr", this._elemWidth)
        return copy
    }

    /**
     * @private Throws a TypeError if `item` cannot be stored in this vector. Element types with a
     *      `__value` accept whatever their setter coerces, so they are not type-checked.
     */
    _AssertMemberType(item) {
        if HasProp(this.ElementType.Prototype, "__value")
            return

        if !(item is this.ElementType)
            throw TypeError(Format("Expected a(n) {1} but got a(n) {2}",
                this.ElementType.Prototype.__Class, Type(item)), -1, item)
    }

    /**
     * @private Validates `index` and resolves a negative index (counting from the end, `-1` == last)
     *      to its positive equivalent. When `allowAppend` is true, the one-past-the-end index
     *      (`length + 1`) is also permitted, as for {@link Vector.Prototype.InsertAt}.
     * @param {Integer} index the index to resolve
     * @param {Boolean} allowAppend whether `length + 1` is a valid position
     * @returns {Integer} the resolved 1-based index
     */
    _ResolveIndex(index, allowAppend := false) {
        if !IsInteger(index)
            throw TypeError("Expected an Integer but got a(n) " Type(index), -1, index)

        resolved := index < 0 ? index + this.length + 1 : index

        if resolved < 1 || resolved > this.length + (allowAppend ? 1 : 0)
            throw IndexError("Index out of range for Vector of length " this.length, -1, index)

        return resolved
    }
}
