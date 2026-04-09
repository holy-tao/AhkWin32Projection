#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SECPKG_FAILURE_SPECIAL_REASON.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SECPKG_FAILURE_REASON extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {NTSTATUS}
     */
    Status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {SECPKG_FAILURE_SPECIAL_REASON}
     */
    Reason {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
