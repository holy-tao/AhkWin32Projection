#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Encrypted Windows app package settings.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ns-appxpackaging-appx_encrypted_package_settings2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_ENCRYPTED_PACKAGE_SETTINGS2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The key length.
     * @type {Integer}
     */
    keyLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The encryption algorithm used.
     * @type {Pointer<Char>}
     */
    encryptionAlgorithm {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The Uri of the block map hash algorithm.
     * @type {Pointer<IUri>}
     */
    blockMapHashAlgorithm {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Additional options for encrypted packages. Options come from the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_encrypted_package_options">APPX_ENCRYPTED_PACKAGE_OPTIONS</a> enum.
     * @type {Integer}
     */
    options {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
