#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The INSTALLSPEC structure specifies a group policy application by its user-friendly name and group policy GUID or by its file name extension. The Spec member of the INSTALLDATA structure provides this information to the InstallApplication function.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-installspec
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct INSTALLSPEC {
    #StructPack 8


    struct _AppName {
        Name : PWSTR

        GPOId : Guid

    }

    struct _COMClass {
        Clsid : Guid

        ClsCtx : UInt32

    }

    /**
     * Structure that contains the following members.
     */
    AppName : INSTALLSPEC._AppName

    static __New() {
        DefineProp(this.Prototype, 'FileExt', { type: PWSTR, offset: 0 })
        DefineProp(this.Prototype, 'ProgId', { type: PWSTR, offset: 0 })
        DefineProp(this.Prototype, 'COMClass', { type: INSTALLSPEC._COMClass, offset: 0 })
        this.DeleteProp("__New")
    }
}
