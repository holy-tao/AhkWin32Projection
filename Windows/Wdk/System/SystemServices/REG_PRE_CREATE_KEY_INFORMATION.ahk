#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class REG_PRE_CREATE_KEY_INFORMATION extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    CompleteName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
