#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\INSTALLSPEC.ahk

/**
 * The INSTALLDATA structure specifies a group-policy application to be installed by InstallApplication.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-installdata
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class INSTALLDATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Defines  how <b>Spec</b> specifies the application to <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/nf-appmgmt-installapplication">InstallApplication</a>.     <b>Type</b> can be  one of the <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ne-appmgmt-installspectype">INSTALLSPECTYPE</a> enumeration values. Set <b>Type</b> to APPNAME to install an application specified by its user-friendly name and GPO GUID. Set <b>Type</b> to FILEEXT to install  an application specified by its file name extension.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-installspec">INSTALLSPEC</a> structure that specifies the application.
     * @type {INSTALLSPEC}
     */
    Spec{
        get {
            if(!this.HasProp("__Spec"))
                this.__Spec := INSTALLSPEC(this.ptr + 8)
            return this.__Spec
        }
    }
}
