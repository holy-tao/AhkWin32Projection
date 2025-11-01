#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\Apis.ahk
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecMgmt/lsa-handle
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_HANDLE extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [-1, 0]

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    Free(){
        Identity.LsaClose(this.Value)
        this.Value := -1
    }
}
