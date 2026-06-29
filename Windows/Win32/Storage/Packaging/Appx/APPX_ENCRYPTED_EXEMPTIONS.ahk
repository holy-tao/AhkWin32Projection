#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Files exempted from Windows app package encryption.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ns-appxpackaging-appx_encrypted_exemptions
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_ENCRYPTED_EXEMPTIONS {
    #StructPack 8

    /**
     * The count of files exempted.
     */
    count : UInt32

    /**
     * Files exempted from encryption.
     */
    plainTextFiles : PWSTR.Ptr

}
