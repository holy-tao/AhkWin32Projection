#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PACKAGE_VERSION.ahk" { PACKAGE_VERSION }

/**
 * Represents package identification information, such as name, version, and publisher.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ns-appmodel-package_id
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @architecture X64, Arm64
 */
export default struct PACKAGE_ID {
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
     * The processor architecture of the package. This member must be one of the values of the <b>PROCESSOR_ARCHITECTURE_...</b> constants that matches the <b><a href="https://docs.microsoft.com/uwp/api/Windows.System.ProcessorArchitecture">ProcessorArchitecture</b> enumeration</a> values. This includes:
     * 
     * * PROCESSOR_ARCHITECTURE_AMD64
     * * PROCESSOR_ARCHITECTURE_ARM
     * * PROCESSOR_ARCHITECTURE_ARM64
     * * PROCESSOR_ARCHITECTURE_INTEL
     * * PROCESSOR_ARCHITECTURE_IA32_ON_ARM64
     * * PROCESSOR_ARCHITECTURE_NEUTRAL
     * * PROCESSOR_ARCHITECTURE_UNKNOWN
     */
    processorArchitecture : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_version">PACKAGE_VERSION</a></b>
     * 
     * The version of the package.
     */
    version : PACKAGE_VERSION

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The name of the package.
     */
    name : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The publisher of the package. If there is no publisher for the package, this member is <b>NULL</b>.
     */
    publisher : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The resource identifier (ID) of the package. If there is no resource ID for the package, this member is <b>NULL</b>.
     */
    resourceId : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The publisher identifier (ID) of the package. If there is no publisher ID for the package, this member is <b>NULL</b>.
     */
    publisherId : PWSTR

}
