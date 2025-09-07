#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
                this.__hFile := HANDLE(this.ptr + 0)
            return this.__hFile
        }
    }

    /**
     * @type {PWSTR}
     */
    lpPath{
        get {
            if(!this.HasProp("__lpPath"))
                this.__lpPath := PWSTR(this.ptr + 8)
            return this.__lpPath
        }
    }
}
