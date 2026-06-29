#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INSTALLSPEC.ahk" { INSTALLSPEC }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INSTALLSPECTYPE.ahk" { INSTALLSPECTYPE }

/**
 * The INSTALLDATA structure specifies a group-policy application to be installed by InstallApplication.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-installdata
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct INSTALLDATA {
    #StructPack 8

    /**
     * Defines  how <b>Spec</b> specifies the application to <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/nf-appmgmt-installapplication">InstallApplication</a>.     <b>Type</b> can be  one of the <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ne-appmgmt-installspectype">INSTALLSPECTYPE</a> enumeration values. Set <b>Type</b> to APPNAME to install an application specified by its user-friendly name and GPO GUID. Set <b>Type</b> to FILEEXT to install  an application specified by its file name extension.
     */
    Type : INSTALLSPECTYPE

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-installspec">INSTALLSPEC</a> structure that specifies the application.
     */
    Spec : INSTALLSPEC

}
