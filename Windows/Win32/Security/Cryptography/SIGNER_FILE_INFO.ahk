#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Specifies a file to sign.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-file-info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_FILE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that contains the name of the file to sign.
     * @type {PWSTR}
     */
    pwszFileName{
        get {
            if(!this.HasProp("__pwszFileName"))
                this.__pwszFileName := PWSTR(this.ptr + 8)
            return this.__pwszFileName
        }
    }

    /**
     * An open handle to the file specified by the **pwszFileName** member. If this member contains a valid handle, this handle is used to access the file. This member can be set to **NULL**.
     * @type {HANDLE}
     */
    hFile{
        get {
            if(!this.HasProp("__hFile"))
                this.__hFile := HANDLE(this.ptr + 16)
            return this.__hFile
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
