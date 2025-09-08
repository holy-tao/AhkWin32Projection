#Requires AutoHotkey v2.0
#Include Win32Struct.ahk

/**
 * An ArrayList-like data structure. Contains primitive or struct types laid out sequentially
 * in memory, as they are in a C array. Unlike `Win32FixedArray`, CStyleArray instances can be
 * resized and reallocated, though they cannot be created a existing memory locations.
 * 
 * `CStyleArray` conforms to the documented behavior of the native AutoHotkey `Array`, with the
 * following exceptions:
 *  - `__New`: the initializer requires type information about the array
 *  - `Delete`: there is no concept of an "unset " array index; the memory exists. Thus, an item
 *          cannot be "deleted", though you may set it to an arbitrary "null" value if you wish.
 *  - `Default`: because indices cannot be unset, it does not make sense to have a default value
 */
class CStyleArrayList extends Win32Struct {

;@region Static Properties

    /**
     * Map of DllCall types to their widths
     * @type {Map<String, Integer>} 
     * @see {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#types `DllCall` types}
     */
    static DllCallTypeWidths := Map(
        "Int64",    8,
        "Int",      4,	
        "Short",    2,
        "Char",     1,
        "Ptr",      A_PtrSize,
        "UInt64",   8,
        "UInt",     4,
        "UShort",   2,
        "UChar",    1,
        "UPtr",     A_PtrSize,
        "Double",   8,
        "Float",    4,
        "Int64*",   A_PtrSize,
        "Int*",     A_PtrSize,	
        "Short*",   A_PtrSize,
        "Char*",    A_PtrSize,
        "Ptr*",     A_PtrSize,
        "UInt64*",  A_PtrSize,
        "UInt*",    A_PtrSize,
        "UShort*",  A_PtrSize,
        "UChar*",   A_PtrSize,
        "UPtr*",    A_PtrSize,
        "Double*",  A_PtrSize,
        "Float*",   A_PtrSize
    )

;@region Static Properties

;@region Instance Properties
    __buf := unset

    ptr => this.__buf.ptr
    size => this.__buf.size

    /**
     * @readonly The type of the elements in the array. If this is `Primitive`, consult `dllCallType` for
     * the type of the elements
     * @type {Class}
     */
    elementType {
        get => this.__elementType
        set{
            if(this.HasProp("__elementType"))
                throw PropertyError("This property is read-only", , "length")
            this.__elementType := value
        }
    }

    /**
     * @readonly The DllCall type of the elements, if primitives. Otherwise, this is an empty string
     * @see {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#types `DllCall` types}
     * @type {String}
     */
    dllCallType {
        get => this.__dllCallType
        set{
            if(this.HasProp("__dllCallType"))
                throw PropertyError("This property is read-only", , "dllCallType")
            this.__dllCallType := value
        }
    }

    /**
     * The length of the array. Setting this to a value higher than its current value may
     * cause the array to be resized. Increasing the length of the array **does not** initialize
     * its new elements; their values are arbitrary.
     * @type {Integer}
     */
    length {
        get => this.__length
        set {
            while(value >= this.Capacity && this.HasProp("__length")){
                this._Resize()
            }
            this.__length := value
        }
    }

    /**
     * The capacity of the array. Do not modify this value directly, unless you enjoy
     * segmentation faults
     * @type {Integer}
     */
    capacity := unset

;@endregion Instance Properties
;@region Instance Methods

    /**
     * Initializes a new CStyleArray proxy object
     * @param {Class} elementType The type of the elements contained in the array. If this is not `Primitive`, it
     *          must be a class extending `Win32Struct`
     * @param {Integer|String} lengthOrDllCallType If `elementType` is `Primitive`, this is the DllCall type of the
     *          elements in the array. Otherwise, it is the starting length of the array (default: 1)
     * @param {Integer} length The starting length of the array if `elementType` is `Primitive` (default: 1)
     * @see {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#types `DllCall` types}
     */
    __New(elementType, lengthOrDllCallType, length := 1){
        if(!(elementType is Class))
            throw TypeError("Expected a Class, but got a(n) " . Type(elementType) . ". Use Primitive for arrays of primitive types")

        if(!IsInteger(length))
            throw TypeError("Expected an Integer, but got a(n) " . Type(length))

        if(elementType == Primitive){
            ;Expect lengthOrDllCallType to be a dllCalltype and length to be an integer
            if(!CStyleArrayList.DllCallTypeWidths.Has(lengthOrDllCallType))
                throw TypeError("Unknown or invalid DllCall type", , lengthOrDllCallType)

            this.elementType := elementType
            this.capacity := Max(1, 2 * length)
            this.dllCallType := lengthOrDllCallType
            this.Length := length
        }
        else{
            if(!IsInteger(lengthOrDllCallType))
                throw TypeError("Expected an Integer, but got a(n) " . Type(lengthOrDllCallType))

            this.elementType := elementType
            this.capacity := Max(1, 2 * Integer(lengthOrDllCallType))
            this.Length := Integer(lengthOrDllCallType)
        }

        this.__buf := Buffer(this.Capacity * this._GetElementWidth())
    }

    /**
     * Set or retrieve an item in the array
     * @param {Integer} index the item to access 
     */
    __Item[index]{
        get => this.Get(index)
        set => this.Set(index, value)
    }

    /**
     * Returns an enumerator, mimicking the behavior of native Array enumeration:
     * ```autohotkey
     *     for([index], item in myCStyleArray) { ... }
     * ```
     * @param {Integer} numberOfVars Variables in the enumeration. In 1-variable mode, enumerates members
     *          in 2-variable mode, the first is the index
     * @see https://www.autohotkey.com/docs/v2/lib/Enumerator.htm
     */
    __Enum(numberOfVars){
        if(numberOfVars != 1 && numberOfVars != 2)
            throw MethodError("Enumeration only supports 1 or 2 variables")

        return numberOfVars == 1? _Enumerator1 : _Enumerator2
        
        /**
         * 1-variable enumerator
         */
        _Enumerator1(&item){
            static index := 1

            if(index > this.length){
                index := 1
                return false
            }

            item := this[index++]
            return true
        }

        /**
         * 2-variable enumerator.
         */
        _Enumerator2(&index, &item){
            static enumIndex := 1

            if(enumIndex > this.length){
                enumIndex := 1
                return false
            }
            
            index := enumIndex
            item := this[enumIndex++]
            return true
        }
    }

    /**
     * Appends zero or more elements to the array in the order provided
     * @param {Array<Integer|Win32Struct>} values a variadic array of zero or more elements to append
     */
    Push(values*){
        for(value in values){
            this._AssertMemberType(value)
            this.length += 1
            this[this.length] := value
        }
    }

    /**
     * Removes the last element of the array and returns it
     * @returns {Integer|Win32Struct} the value previously at the last index of the array
     */
    Pop(){
        val := this[this.length]
        this.length -= 1
        return val
    }

    /**
     * Inserts zero or more new elements at a specified index. Existing values at indices greater 
     * to or equal than `index` are shifted to the right
     * @param {Integer} index index to insert the new value at
     * @param {Array<Integer|Win32Struct>} values a variadic array of zero or more elements to inset
     * @see {@link https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/nf-wdm-rtlmovememory RtlMoveMemory macro (wdm.h) - Windows drivers | Microsoft Learn}
     */
    InsertAt(index, values*){
        this._AssertIndexInRange(index)

        for(value in values){
            this._AssertMemberType(value)

            this.length += 1

            shiftSize := (this.length - index) * this._GetElementWidth()
            A_LastError := 0
            DllCall("kernel32\RtlMoveMemory", 
                "ptr", this.ptr + this._GetOffsetForIndex(index + 1), 
                "ptr", this.ptr + this._GetOffsetForIndex(index), 
                "int", shiftSize)

            if(A_LastError)
                throw OSError()

            this[index++] := value
        }
    }

    /**
     * Removes and returns an item from the array at a specified index. Values at or to the
     * right of this index are shifted left
     * @param {Integer} index the index of the element to remove
     * @returns {Integer|Win32Struct} the removed element
     */
    RemoveAt(index){
        val := this[index]

        shiftSize := (this.length - index) * this._GetElementWidth()
        A_LastError := 0
        DllCall("kernel32\RtlMoveMemory", 
            "ptr", this.ptr + this._GetOffsetForIndex(index), 
            "ptr", this.ptr + this._GetOffsetForIndex(index + 1), 
            "int", shiftSize)

        if(A_LastError)
            throw OSError()

        this.length -= 1
        return val
    }

    /**
     * Returns a non-zero number if the index is valid. Note unlike native AutoHotkey arrays,
     * there is no concept of an "unset" array element here - the memory exists and it has some
     * value, whether you want it to or not.
     * @param {Integer} index index to check
     * @returns {Boolean} 1 if the index is valid, 0 if not
     */
    Has(index){
        return (index >= 1 && index <= this.length)
    }

    /**
     * Returns the value at a given index. This is equivalent to `ArrayObj[Index]`, 
     * except that `__Item` is not called.
     * @param {Integer} index the index of the item to get 
     * @param {Any} default this parameter is always ignored; it is provided for conformance with the native
     *          AutoHotkey `Array` API
     * @returns {Integer|Win32Struct} the value at `index`
     */
    Get(index, default?){
        this._AssertIndexInRange(index)

        offset := this._GetOffsetForIndex(index)

        return this.elementType == Primitive?
            NumGet(this.ptr, offset, this.dllCallType) :
            this.elementType.Call(this.ptr + offset)
    }

    /**
     * Sets the value at a given index
     * @param {Integer} index the index of the item to set
     * @param {Integer|Win32Struct} value the value to set 
     */
    Set(index, value){
        this._AssertIndexInRange(index)
        this._AssertMemberType(value)

        offset := this._GetOffsetForIndex(index)

        if(this.elementType == Primitive){
            return NumPut(this.dllCallType, value, this, offset)
        }
        else{
            ;Copy the actual memory
            value.CopyTo(this.ptr + offset)
        }
    }

    /**
     * Creates and returns a string repesentation of the array. If the array contains Primitive
     * types, they are printed, otherwise, the string contains the element type and length but no
     * specifics about its members
     */
    ToString(){
        if(this.elementType == Primitive){
            outStr := "["
            for(index, value in this){
                outStr .= value
                if(index < this.length)
                    outStr .= ", "
            }
            outStr .= "]"
            return outStr
        }
        else{
            return Format("{1}<{2}> ({3})", Type(this), this.elementType.Prototype.__Class, this.length)
        }
    }

;@region Instance Methods
;@region Private Methods

    /**
     * @private Resizes the array by creating a new Buffer and copying the contents of the array. The
     *      capacity is always doubled and can never decrease
     * @see {@link https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/nf-wdm-rtlcopymemory RtlCopyMemory macro (wdm.h) - Windows drivers | Microsoft Learn}
     */
    _Resize(){
        this.capacity *= 2
        newBuf := Buffer(this.capacity * this._GetElementWidth())

        this.CopyTo(newBuf)
                
        this.__buf := newBuf
    }

    /**
     * @private Get the width in bytes of a single element in the array
     */
    _GetElementWidth(){
        if(this.elementType == Primitive){
            return CStyleArrayList.DllCallTypeWidths[this.dllCallType]
        }
        else{
            return this.elementType.sizeof
        }
    }

    /**
     * @private Get the offset into the array for an item at a given index
     * @param {Integer} index index into the array to get memory offset for 
     */
    _GetOffsetForIndex(index){
        if(!IsInteger(index))
            throw TypeError("Expected an Integer but got a(n) " . Type(index))

        offset := (index - 1) * (this._GetElementWidth())
        return offset
    }

    /**
     * @private Throw a TypeError if `member` can't go in our array.
     * @param {Any} item the item to check
     */
    _AssertMemberType(item){
        if(this.elementType == Primitive)
            return  ;Can't check these

        if(!(item is this.elementType)){
            throw TypeError(Format("Expected a(n) {1} but got a(n) {2}", this.elementType.Prototype.__Class, Type(item)), -1, item)
        }
    }

    /**
     * @private Throw an error if `index` is invalid
     * @param {Integer} index the index to check
     */
    _AssertIndexInRange(index){
        if(!IsInteger(index))
            throw TypeError("Expected an Integer but got a(n) " . Type(index), -1, index)

        if(index < 1 || index > this.length)
            throw IndexError("Index out of range for array of length " . this.length, -1, index)
    }

;@endregion Private Methods

}