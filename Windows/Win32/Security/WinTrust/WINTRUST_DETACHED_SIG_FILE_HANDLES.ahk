#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_DETACHED_SIG_FILE_HANDLES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    hContentFile{
        get {
            if(!this.HasProp("__hContentFile"))
                this.__hContentFile := HANDLE(this.ptr + 0)
            return this.__hContentFile
        }
    }

    /**
     * @type {HANDLE}
     */
    hSignatureFile{
        get {
            if(!this.HasProp("__hSignatureFile"))
                this.__hSignatureFile := HANDLE(this.ptr + 8)
            return this.__hSignatureFile
        }
    }
}
