#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\System\Com\IUri.ahk" { IUri }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Settings for encrypted Windows app packages.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ns-appxpackaging-appx_encrypted_package_settings
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_ENCRYPTED_PACKAGE_SETTINGS {
    #StructPack 8

    /**
     * The key length.
     */
    keyLength : UInt32

    /**
     * The encryption algorithm used.
     */
    encryptionAlgorithm : PWSTR

    /**
     * True is diffusion is used, false otherwise.
     */
    useDiffusion : BOOL

    /**
     * The Uri of the block map hash algorithm.
     */
    blockMapHashAlgorithm : IUri

}
