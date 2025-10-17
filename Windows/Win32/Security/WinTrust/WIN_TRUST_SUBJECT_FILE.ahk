#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WIN_TRUST_SUBJECT_FILE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    hFile{
        get {
            if(!this.HasProp("__hFile"))
                this.__hFile := HANDLE(0, this)
            return this.__hFile
        }
    }

    /**
     * @type {PWSTR}
     */
    lpPath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
