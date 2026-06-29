#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PACKAGE_ID.ahk" { PACKAGE_ID }
#Import ".\PACKAGE_VERSION.ahk" { PACKAGE_VERSION }

/**
 * Represents package identification information that includes the package identifier, full name, and install location.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ns-appmodel-package_info
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @architecture X64, Arm64
 */
export default struct PACKAGE_INFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a></b>
     * 
     * Reserved; do not use.
     */
    reserved : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a></b>
     * 
     * Properties of the package.
     */
    flags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The location of the package.
     */
    path : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The package full name.
     */
    packageFullName : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The package family name.
     */
    packageFamilyName : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_id">PACKAGE_ID</a></b>
     * 
     * The package identifier (ID).
     */
    packageId : PACKAGE_ID

}
