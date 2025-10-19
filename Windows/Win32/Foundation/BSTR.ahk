#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\Apis.ahk
#Include ..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class BSTR extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * @type {Pointer<Char>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @readonly The length of the allocated string in characters, not including the null terminator
     * @type {Integer}
     */
    length => Foundation.SysStringLen(this)
    
    /**
     * @readonly The length of the allocated string in bytes, not including the null terminator
     * @type {Integer}
     */
    byteLength => Foundation.SysStringByteLen(this)
    
    /**
     * Creates a new BSTR from an existing AHK string
     * @param {String | Integer} str the string to allocate, or a pointer to a string to allocate
     */
    static Alloc(str){
        return Foundation.SysAllocString(str)
    }
    
    /**
     * Changes the contents of the BSTR, resizing it if necessary
     * @param {String} str the new contents of the BSTR
     */
    ReAlloc(str){
        result := Foundation.SysReallocString(this, str)
        if(result == 0)
            throw MemoryError("Not enough memory to reallocate string")
    }
    
    /**
     * Gets the value of the BSTR as a native AHK string
     * @returns {String}
     */
    ToString(){
        return StrGet(this.value, this.length, "UTF-16")
    }

    Free(){
        Foundation.SysFreeString(this.Value)
        this.Value := 0
    }
}
