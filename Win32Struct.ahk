#Requires AutoHotkey v2.0 64-bit
#Include Win32FixedArray.ahk

/**
 * A Win32Struct is the base class from which all generated structs are derived. It's a 
 * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#like buffer-like} object that can either be 
 * created at a specific memory location. If created "new", the struct is backed by a native AutoHotkey 
 * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm `Buffer`} in script-managed memory.
 */
class Win32Struct extends Object{

;@region Properties
    __buf := unset

    /**
     * @readoly Pointer to the struct's memory location.
     * @type {Integer}
     */
    ptr => this.__buf.ptr

    /**
     * @readonly The size of the struct in bytes.
     * @type {Integer}
     */
    size => this.__buf.size

    /**
     * @readonly Whether or not this struct is "owned" by the script. Ownership
     *          is inherited by any handles in the struct, but has no effect on
     *          the structure itself. Structs created by the user are owned, structs
     *          created by the OS are not.
     * @type {Boolean}
     */
    __owned => this.__buf is Buffer

    /**
     * @readonly The size of the struct for packing purposes. This value may be larger than the
     * size of the struct, as the default packing size for almost every struct is 8.
     * @see {@link https://learn.microsoft.com/en-us/windows/win32/winprog/using-the-windows-headers#controlling-structure-packing "Controlling Structure Packing" in Using the Windows Headers - Win32 apps | Microsoft Learn}
     * @type {Integer}
     */
    static packedSize {
        get{
            ; Ignore these warnings - classes extending this must have these properties
            packingSize := this.packingSize
            sizeof := this.sizeof

            return sizeof + Mod(packingSize - Mod(sizeof, packingSize), packingSize)
        }
    }

;@endregion Properties

;@region Instance Methods
    /**
     * Initializes a new `Win32Struct` object at the given memory location. Classes extending `Struct`
     * must contain a static member called `sizeof`, which is taken to be the size of the struct.
     * 
     * The constructor can also accept an object, in which case a new `Buffer` is allocated and the
     * object is used to initialize the struct's members
     * 
     * @param {Integer} ptrOrObj Pointer to the memory location at which to create the struct -
     *      0 to use a new `Buffer` - or an object from which to initialize the values of a new struct
     */
    __New(ptrOrObj := 0){
        size := Win32Struct.ResolveClassName(this.__Class).sizeof

        if(IsInteger(ptrOrObj) && ptrOrObj != 0){
            this.__buf := {ptr: ptrOrObj, size: size}
            return
        }
        
        this.__buf := Buffer(size, 0)
        if(IsObject(ptrOrObj)){
            Win32Struct._InitFromObject(this, ptrOrObj)
        }
    }

    /**
     * Creates a copy of the struct in script-managed memory. This can be used to "extract" structs created
     * externally which would otherwise be invalidated by the operating system
     * @returns {Win32Struct} a copy of the struct managed by the script
     */
    Clone(){
        clone := Win32Struct.ResolveClassName(this.__Class).Call(0)
        this.CopyTo(clone)

        return clone
    }

    /**
     * Copies the struct's memory to another location in memory. The two memory blocks cannot overlap.
     * @see {@link https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/nf-wdm-rtlcopymemory RtlCopyMemory macro (wdm.h) - Windows drivers | Microsoft Learn}
     * @param {Integer | Buffer-Like Object} target the target location to copy the struct to. If
     *          this is a buffer-like object and its `size` is less than the size of the struct on which
     *          `CopyTo` is being called, the struct's memory is truncated to fit the destination.
     */
    CopyTo(target){
        size := this.size
        ptr := Win32Struct.ResolveToPtr(target, &size)

        A_LastError := 0
        ;Switch to RtlMoveMemory if 32-bit AHK is ever supported (or pick based on A_PtrSize)
        DllCall("kernel32\RtlCopyMemory", "ptr", ptr, "ptr", this.ptr, "int", size)
        if(A_LastError){
            throw OSError()
        }
    }

    /**
     * Compares the struct with another block of memory `other`. If `other` is buffer-like, the sizes
     * must match, otherwise, the size of `other` is taken to be the size of the struct.
     * @see {@link https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/nf-wdm-rtlcomparememory RtlCompareMemory function (wdm.h) - Windows drivers | Microsoft Learn}
     * @param {Integer | Buffer-Like Object} other the block of memory or a pointer to the start of the block
     *          of memory to which to compare the current struct 
     * @param {VarRef<Integer>} matchingBytes an optional output variable in which to store the number of bytes
     *          between the struct and `other` that match up until the first difference. If `other` is buffer-like
     *          and its size differs from the current struct's, this value is not modified 
     */
    MemoryEquals(other, &matchingBytes := 0){
        otherSize := this.size
        otherPtr := Win32Struct.ResolveToPtr(other, &otherSize)

        if(otherSize != this.size){
            return false
        }

        A_LastError := 0
        matchingBytes := DllCall("kernel32\RtlCompareMemory", "ptr", this.ptr, "ptr", otherPtr, "int", this.size)
        if(A_LastError){
            throw OSError()
        }

        return matchingBytes == this.size
    }

    /**
     * Sets every byte in the struct to 0.
     */
    Clear() => this.Fill(0)

    /**
     * Fills the struct with one byte.
     * @see {@link https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/nf-wdm-rtlfillmemory RtlFillMemory macro (wdm.h) - Windows drivers | Microsoft Learn}
     * @param {Integer} byte the byte to fill the struct with. If the number supplied fits into more than one byte,
     *          the lowest-order byte is used. The valid range is 0 - 255, or `0x00` to `0xFF` in hex.
     */
    Fill(byte){
        if(!IsInteger(byte)){
            throw TypeError("Expected an Integer but got a(n) " . Type(byte))
        }

        byte := byte & 0xFF     ;Truncate to a 1 byte

        A_LastError := 0
        DllCall("kernel32\RtlFillMemory", "ptr", this.ptr, "ptr", this.size, "int", byte)
        if(A_LastError){
            throw OSError()
        }
    }

    /**
     * Returns a string with the type of the struct, its size, and its memory location.
     * @returns {String} A string reprsentation of the struct
     */
    ToString(){
        return Format("{1} ({2} bytes at 0x{3:X})", Type(this), this.size, this.ptr)
    }

    /**
     * Returns the raw contents of the struct as an unformatted string of hex values. This is probably
     * less useful for human debugging but may be preferred in some cases over `HexDump` for compactness
     * @returns {String}
     */
    ToHexString(){
        hex := "", VarSetStrCapacity(&hex, this.size * 2)
        Loop(this.size){
            byte := NumGet(this, A_Index - 1, "char") & 0xFF
            hex .= Format("{1:02X}", byte)
        }
        
        return hex
    }

    /**
     * Returns a formatted string representing the contents of the struct in hex, with the bytes' ASCII
     * representations (if printable) on the right. This dump is intended to be as human-readable as
     * possible
     * @returns {String} A hex string representing the memory block of the struct, formatted for humans
     */
    HexDump(){
        dump := "", asciiBuffer := ""
        dumpLength := this.size + Mod(16 - Mod(this.size, 16), 16)     ;Pad to 8 byte boundary
        VarSetStrCapacity(&dump, 70 * (dumpLength / 16))             ;Every row is 69 chars + newline (nice)

        Loop(dumpLength){
            if(A_Index > 1){
                if(Mod(A_Index - 1, 16) == 0){
                    ;Newline, unless we're on the first line
                    dump .= Format(" |{1}|`n", asciiBuffer)
                    asciiBuffer := ""
                }
                else if(Mod(A_Index - 1, 8) == 0){
                    dump .= " "
                }
            }
            
            if(A_Index <= this.size){
                byte := NumGet(this, A_Index - 1, "char") & 0xFF
                dump .= Format("{1:02X} ", byte)
                
                asciiBuffer .= (byte >= 32 && byte <= 126)? Chr(byte) : "."
            }
            else{
                asciiBuffer .= " "
                dump .= "-- "
            }
        }

        dump .= Format(" |{1}|`n", asciiBuffer)
        return dump
    }

;@endregion Instance Methods

;@region Static Methods
    /**
     * Takes in a pointer or buffer-like object and retrieves its pointer and optionally its size. This method also
     * strictly validates the types of these properties. If passed a pointer, size is not changed.
     * @param {Object} ptrOrBufferLike the object to resolve
     * @param {VarRef<Integer>} size an optional output variable in which to store the size of `ptrOrBufferLike` if
     *          it is a buffer-like object
     * @returns {Integer} the pointer of `ptrOrbufferLike`
     */
    static ResolveToPtr(ptrOrBufferLike, &size := 0){
        if(IsInteger(ptrOrBufferLike)){
            return ptrOrBufferLike
        }
        else if(IsObject(ptrOrBufferLike)){
            if(!(ptrOrBufferLike.HasProp("ptr") && ptrOrBufferLike.HasProp("size"))){
                throw TypeError(Format("Object of type `"{1}`" is not buffer-like", ptrOrBufferLike))
            }

            if(!IsInteger(ptrOrBufferLike.size)){
                throw TypeError("Buffer-like object's size must be an Integer, but got a(n) " . Type(ptrOrBufferLike.size))
            }

            if(!IsInteger(ptrOrBufferLike.ptr)){
                throw TypeError("Buffer-like object's ptr must be an Integer, but got a(n) " . Type(ptrOrBufferLike.ptr))
            }

            size := Integer(ptrOrBufferLike.size)
            return Integer(ptrOrBufferLike.ptr)
        }

        throw TypeError("Expected an Integer or buffer-like Object, but got a(n) " . type(ptrOrBufferLike))
    }

    /**
     * Creates a new `Win32Struct` and initializes its members from the given object.
     * 
     * If a member is itself a struct (or a pointer to one), you can assign either
     * another object literal or an existing `Win32Struct` instance.
     * 
     * To define an array member, use an existing `Win32FixedArray` instance or an
     * `Array`.
     * 
     * @example
     * Rc := RECT.FromObject({ top: 0, bottom: 100, left: 0, right: 100 })
     * Wp := WINDOWPLACEMENT.FromObject({
     *     showCmd: 1,
     *     rcNormalPosition: Rc ; another object literal, or an existing struct
     * })
     * 
     * @example
     * Hdr1 := "Content-Type: application/json"
     * Hdr2 := "Accept: application/json"
     * Headers := HTTP_REQUEST_HEADERS.FromObject({
     *   KnownHeaders: [
     *     { RawValueLength: StrLen(Hdr1), pRawValue: StrPtr(Hdr1) },
     *     { RawValueLength: StrLen(Hdr2), pRawValue: StrPtr(Hdr2) }
     *   ]
     * })
     * 
     * @param {Object} Obj object literal containing fields to set
     * @returns {Win32Struct} a new initialized `Win32Struct`
     */
    static FromObject(Obj) {
        if (ObjGetBase(this) == Object) {
            throw TypeError("This method cannot be used by 'Win32Struct' directly", -2)
        }
        return Win32Struct._InitFromObject(this(), Obj)
    }

    /**
     * Initializes a struct by copying the keys of an object
     */
    static _InitFromObject(Target, Obj) {
        if (!IsObject(Obj) || (ObjGetBase(Obj) != Object.Prototype)) {
            throw TypeError("Expected an Object literal", -2, Type(Obj))
        }

        targetBase := ObjGetBase(Target)

        for PropertyName in ObjOwnProps(Obj) {
            if (PropertyName == "__Class") {
                throw PropertyError('"__Class" is not a valid struct member', -2)
            }
            if (!ObjHasOwnProp(targetBase, PropertyName)) {
                throw PropertyError(Format('struct "{1}" has no member "{2}"', Type(Target), PropertyName), -2)
            }

            ; alternatively: Obj.GetOwnPropDesc(PropertyName).Value
            Value := Obj.%PropertyName%

            PropDesc := targetBase.GetOwnPropDesc(PropertyName)
            Inner := (PropDesc.Get)(Target)

            ; ==------------- regular struct member -------------== ;
            if (!IsObject(Inner)) {
                (PropDesc.Set)(Target, Value)
                continue
            }

            ; ==-------- nested struct or struct pointer --------== ;
            if (Inner is Win32Struct) {
                if (!(Value is Win32Struct)) {
                    Win32Struct._InitFromObject(Inner, Value)
                    continue
                }
                ; ensure structs are the same type
                if (ObjGetBase(Inner) != ObjGetBase(Value)) {
                    Msg := Format("Invalid struct type for member {1}; expected a(n) {2}",
                            PropertyName, Type(Inner))
                    throw TypeError(Msg, -2, Type(Value))
                }
                ; copy to our new struct
                Value.CopyTo(Inner)
                continue
            }

            ; ==------------------ fixed array ------------------== ;
            if (Value is Win32FixedArray) {
                Loop (Value.Length) {
                    Inner[A_Index] := Value[A_Index]
                }
                continue
            }

            if (!(Value is Array)) {
                Msg := Format('Expected a Win32FixedArray or an Array for member "{1}"', PropertyName)
                throw TypeError(Msg, -2, Type(Value))
            }

            if (Inner.ElementType == Primitive) {
                Loop (Value.Length) {
                    Inner[A_Index] := Value[A_Index]
                }
                continue
            }

            Loop (Value.Length) {
                Element := Value[A_Index]
                Inner[A_Index] := (Element is Win32Struct)
                        ? Element
                        : Inner.ElementType.FromObject(Element)
            }
        }
        return Target
    }

    /**
     * Resolve a potentially nested class name to the actual class object. E.g.
     * 
     *      "Outer.Inner" => Outer.Inner
     * @param {String} className name of the class to resolve
     * @returns {Class} the resolved class
     */
    static ResolveClassName(className) {
        current := ""
        for(name in StrSplit(className, ".")){
            current := A_Index == 1? %name% : current.%name%
        }

        return current
    }
;@endregion Static Methods
}