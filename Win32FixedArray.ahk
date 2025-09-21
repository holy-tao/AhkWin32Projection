#Requires AutoHotkey v2.0

/**
 * Win32FixedArray is a helper class used with Win32Struct proxy objects to allow for more
 * friendly handling of fixed-length arrays which are members of structs.
 * 
 * For resizeable arrays which are *not* struct members, use `CStyleArray`, which implements
 * ArrayList behavior and is resizeable, but can only be created in script-managed memory.
 */
class Win32FixedArray {

    /**
     * Map of DllCall types to their widths
     * @type {Map<String, Integer>} 
     * @see https://www.autohotkey.com/docs/v2/lib/DllCall.htm#types
     */
    static DllCallTypeWidths := (M := Map(), M.CaseSense := false, M.Set(
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
    ), M)

    /**
     * @readonly The memory address of the array's first element
     * @type {Integer}
     */
    ptr {
        get => this.__ptr
        set{
            if(this.HasProp("__ptr"))
                throw PropertyError("This property is read-only", , "ptr")
            this.__ptr := value
        }
    }

    /**
     * @readonly The number of elements in the array
     * @type {Integer}
     */
    length {
        get => this.__length
        set{
            if(this.HasProp("__length"))
                throw PropertyError("Fixed arrays cannot be resized", , "length")
            this.__length := value
        }
    }

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
     * Initializes a new fixed array at a given memory address 
     * @param {Integer} ptr The address of the first element in the array
     * @param {Integer} length The number of elements in the array
     * @param {Class} elementType The type of the elements contained in the array. If the elements
     *          are primitives, this must be `Primitive`, and dllCallType must be set
     * @param {String} dllCallType If `elementType` is `Primitive`, this is the type of the elements in the
     *          array.
     */
    __New(ptr, length, elementType, dllCallType := ""){
        if(!IsInteger(ptr))
            throw TypeError("Expected an Integer, but got a(n) " . Type(ptr))

        if(!IsInteger(length) || length < 0)
            throw TypeError("Length must be a non-negative Integer, but got a(n) " . Type(length))

        if(!(elementType is Class))
            throw TypeError("Expected an Integer, but got a(n) " . Type(elementType))

        if(elementType == Primitive && !Win32FixedArray.DllCallTypeWidths.Has(dllCallType))
            throw UnsetError("Empty or unknown DllCallType", , dllCallType)

        this.ptr := ptr
        this.length := length
        this.elementType := elementType
        this.dllCallType := dllCallType
    }

    /**
     * Gets or sets a value in the array. If the array's element type is a struct, the struct's memory
     * is copied into the array at the appropriate position. The struct proxy class is not modified nor
     * is a reference to it maintained.
     * 
     * If the same item is retrieved multiple times, each call to `get` returns a new variable or struct
     * proxy class instance. Thus, if the element type is a struct,
     * ```autohotkey
     *     myFixedArray[i] == myFixedArray[i]   ;False, because the proxy objects are different instances
     * ```
     * returns `false`. To compare structs for, use `MemoryEquals`:
     * ```autohotkey
     *     myFixedArray[i].MemoryEquals(myFixedArray[i])    ;true
     * ```
     * 
     * @param {Integer} index The 1-based index into the array to get or set
     * @see https://www.autohotkey.com/docs/v2/Objects.htm#__Item
     */
    __Item[index] {
        get{
            if(index < 1 || index > this.length)
                throw IndexError("Index out of range for array of length " . this.length, , index)

            offset := this._GetOffsetForIndex(index)

            return this.elementType == Primitive?
                NumGet(this.ptr, offset, this.dllCallType) :
                this.elementType.Call(this.ptr + offset)
        }
        
        set{
            if(index < 1 || index > this.length)
                throw IndexError("Index out of range for array of length " . this.length, , index)

            if(this.elementType != Primitive && !(value is this.elementType)){
                throw TypeError(Format("Expected a(n) {1} but got a(n) {2}", this.elementType.Prototype.__Class, Type(value)))
            }

            offset := this._GetOffsetForIndex(index)

            if(this.elementType == Primitive){
                return NumPut(this.dllCallType, value, this.ptr, offset)
            }
            else{
                ;Copy the actual memory
                value.CopyTo(this.ptr + offset)
            }
        }
    }

    /**
     * @private Get the offset into the array for an item at a given index
     * @param {Integer} index index into the array to get memory offset for 
     */
    _GetOffsetForIndex(index){
        if(!IsInteger(index))
            throw TypeError("Expected an Integer but got a(n) " . Type(index))

        elementWidth := this.elementType == Primitive? 
            Win32FixedArray.DllCallTypeWidths[this.dllCallType] :
            this.elementType.packedSize
        offset := (index - 1) * (elementWidth)
        return offset
    }

    /**
     * Returns an enumerator, mimicking the behavior of native Array enumeration:
     * ```autohotkey
     *     for([index], item in myWin32FixedArray) { ... }
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
}