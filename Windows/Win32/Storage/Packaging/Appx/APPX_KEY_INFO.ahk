#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Windows app package key information.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ns-appxpackaging-appx_key_info
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_KEY_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The length of the key.
     * @type {Integer}
     */
    keyLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length of the key Id.
     * @type {Integer}
     */
    keyIdLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The app package key.
     * @type {Pointer<Byte>}
     */
    key {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The app package key Id.
     * @type {Pointer<Byte>}
     */
    keyId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
