#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\System\Com\IUri.ahk" { IUri }

/**
 * Encrypted Windows app package settings.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ns-appxpackaging-appx_encrypted_package_settings2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_ENCRYPTED_PACKAGE_SETTINGS2 {
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
     * The Uri of the block map hash algorithm.
     */
    blockMapHashAlgorithm : IUri

    /**
     * Additional options for encrypted packages. Options come from the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_encrypted_package_options">APPX_ENCRYPTED_PACKAGE_OPTIONS</a> enum.
     */
    options : UInt32

}
