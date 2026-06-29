#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents summary information about a COM+ component hosted in a particular process. It can also represent a Services Without Components (SWC) context.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-componentsummary
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ComponentSummary {
    #StructPack 8

    /**
     * The application instance GUID that uniquely identifies the process that hosts the component.
     */
    ApplicationInstanceId : Guid

    /**
     * The partition ID of the component.
     */
    PartitionId : Guid

    /**
     * The application ID of the component. The special value {84ac4168-6fe5-4308-a2ed-03688a023c7a} indicates that this is an SWC context.
     */
    ApplicationId : Guid

    /**
     * The CLSID of the component.
     */
    Clsid : Guid

    /**
     * The name of the component. Usually, this is the component's ProgID (or the string representation of the component's CLSID if the component does not have a ProgID). For SWC contexts, this is the context name property configured for the context. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_CLASS_NAME flag when you call a method that returns a <b>ComponentSummary</b> structure.
     */
    ClassName : PWSTR

    /**
     * The name of the COM+ application, or the application name property configured for an SWC context. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_APPLICATION_NAME flag when you call a method that returns a <b>ComponentSummary</b> structure.
     */
    ApplicationName : PWSTR

}
