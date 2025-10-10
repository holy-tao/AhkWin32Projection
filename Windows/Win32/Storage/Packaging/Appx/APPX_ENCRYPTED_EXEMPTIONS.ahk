#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Files exempted from Windows app package encryption.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/ns-appxpackaging-appx_encrypted_exemptions
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_ENCRYPTED_EXEMPTIONS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The count of files exempted.
     * @type {Integer}
     */
    count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Files exempted from encryption.
     * @type {Pointer<Char>}
     */
    plainTextFiles {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
