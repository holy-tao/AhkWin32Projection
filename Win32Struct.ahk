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
     * @readonly The size of the struct for packing purposes. This value may be larger than the
     * size of the struct, as the default packing size for almost every struct is 8.
     * @see {@link https://learn.microsoft.com/en-us/windows/win32/winprog/using-the-windows-headers#controlling-structure-packing "Controlling Structure Packing" in Using the Windows Headers - Win32 apps | Microsoft Learn}
     * @type {Integer}
     */
    packedSize {
        get{
            packingSize := %this.__Class%.packingSize
            return this.size + Mod(packingSize - Mod(this.size, packingSize), packingSize)
        }
    }

;@endregion Properties

;@region Instance Methods
    /**
     * Initializes a new `Win32Struct` object at the given memory location. Classes extending `Struct`
     * must contain a static member called `sizeof`, which is taken to be the size of the struct.
     * 
     * @param {Integer} ptr Pointer to the memory location at which to create the struct, or
     *      0 to use a new `Buffer`.
     */
    __New(ptr := 0){
        size := %this.__Class%.sizeof

        if(ptr == 0){
            this.__buf := Buffer(size, 0)
        }
        else{
            this.__buf := {ptr: ptr, size: size}
        }
    }

    /**
     * Creates a copy of the struct in script-managed memory. This can be used to "extract" structs created
     * externally which would otherwise be invalidated by the operating system
     * @returns {Win32Struct} a copy of the struct managed by the script
     */
    Clone(){
        clone := %this.__Class%.Call(0)
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
     * @returns {String}
     */
    HexDump(){
        dump := "", asciiBuffer := ""
        dumpLength := this.size + Mod(8 - Mod(this.size, 8), 8)     ;Pad to 8 byte boundary
        VarSetStrCapacity(&dump, 70 * (dumpLength / 8))             ;Every row is 69 chars + newline (nice)

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
     * Initializes a new `Win32Struct` object, setting its members based on the
     * object literal `Obj` that contains name-value pairs. 
     * 
     * @example
     * Rc := RECT.FromObject({ top: 0, bottom: 100, left: 0, right: 100 })
     * 
     * @param {Object} Obj object literal containing fields to set
     * @returns {Win32Struct} a new `Win32Struct`
     */
    static FromObject(Obj) {
        if (ObjGetBase(this) == Object) {
            throw TypeError("This method cannot be used by 'Win32Struct' directly", -2)
        }
        if (!IsObject(Obj) || (ObjGetBase(Obj) != Object.Prototype)) {
            throw TypeError("Expected an Object literal",, Type(Obj))
        }
        Result := this()
        for PropertyName, Value in ObjOwnProps(Obj) {
            if (PropertyName == "__Class") {
                throw ValueError("Invalid field",, PropertyName)
            }
            if (!ObjHasOwnProp(this.Prototype, PropertyName)) {
                throw ValueError("Invalid field",, PropertyName)
            }
            Result.%PropertyName% := Obj.%PropertyName%
        }
        return Result
    }
;@endregion Static Methods
}