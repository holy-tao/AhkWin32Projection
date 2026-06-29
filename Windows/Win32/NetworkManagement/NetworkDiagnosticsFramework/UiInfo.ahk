#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\UI_INFO_TYPE.ahk" { UI_INFO_TYPE }
#Import ".\ShellCommandInfo.ahk" { ShellCommandInfo }

/**
 * The UiInfo structure is used to display repair messages to the user.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-uiinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct UiInfo {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/ndattrib/ne-ndattrib-ui_info_type">UI_INFO_TYPE</a></b>
     * 
     * The type of user interface (UI) to use. This can be one of the values shown in the following members.
     */
    type : UI_INFO_TYPE

    pwzNull : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'ShellInfo', { type: ShellCommandInfo, offset: 8 })
        DefineProp(this.Prototype, 'pwzHelpUrl', { type: PWSTR, offset: 8 })
        DefineProp(this.Prototype, 'pwzDui', { type: PWSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}
