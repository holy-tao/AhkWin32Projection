#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The FUSION_INSTALL_REFERENCE structure contains information about the application which references the side-by-side assembly.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ns-winsxs-fusion_install_reference
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct FUSION_INSTALL_REFERENCE {
    #StructPack 8

    /**
     * The size of the structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Reserved, this member must be zero.
     */
    dwFlags : UInt32

    /**
     * The application  that uses the side-by-side assembly.
     */
    guidScheme : Guid

    /**
     * A pointer to a string value that identifies the application that references assembly. The meaning of this identifier depends on the <b>guidScheme</b> parameter.
     */
    szIdentifier : PWSTR

    /**
     * A string that is used only by the application that reference the assembly.
     */
    szNonCannonicalData : PWSTR

}
