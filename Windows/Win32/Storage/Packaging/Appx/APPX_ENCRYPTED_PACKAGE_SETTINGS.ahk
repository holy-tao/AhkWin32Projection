#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Settings for encrypted Windows app packages.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ns-appxpackaging-appx_encrypted_package_settings
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_ENCRYPTED_PACKAGE_SETTINGS extends Win32Struct
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
     * True is diffusion is used, false otherwise.
     * @type {Integer}
     */
    useDiffusion {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The Uri of the block map hash algorithm.
     * @type {Pointer<IUri>}
     */
    blockMapHashAlgorithm {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
