#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains a service description. (Unicode)
 * @remarks
 * A description of <b>NULL</b> indicates no service description exists. The service description is NULL when the service is created.
 * 
 * The description is simply a comment that explains the purpose of the service. For example, for the DHCP service, you could use the description "Provides internet addresses for computer on your network."
 * 
 * You can set the description using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a> function. You can retrieve the description using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfig2a">QueryServiceConfig2</a> function. The description is also displayed by the Services snap-in.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_descriptionw
 * @namespace Windows.Win32.System.Services
 * @charset Unicode
 */
export default struct SERVICE_DESCRIPTIONW {
    #StructPack 8

    /**
     * The description of the service. If this member is <b>NULL</b>, the description remains unchanged. If this value is an empty string (""), the current description is deleted. 
     * 
     * 
     * 
     * 
     * The service description must not exceed the size of a registry value of type <b>REG_SZ</b>.
     * 
     * This member can specify a localized string using the following format:
     * 
     * @[<i>path</i>\]<i>dllname</i>,-<i>strID</i>
     * 
     * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadmuistringa">RegLoadMUIString</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Localized strings are not supported until Windows Vista.
     */
    lpDescription : PWSTR

}
