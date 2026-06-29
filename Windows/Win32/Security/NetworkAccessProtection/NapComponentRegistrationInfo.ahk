#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CountedString.ahk" { CountedString }

/**
 * Defines a registered NAP component such as a SHA, SHV, or enforcement client.
 * @remarks
 * This registration information is not localized, it is provided in US-English only.
 * 
 * When NAP components are registered through the registration APIs, the <i>registrationDate</i> field is ignored.
 * 
 * When information about registered NAP
 *    components is retrieved, if there is no valid <i>infoClsid</i>,  <i>configClsid</i>, or <i>registrationDate</i>, they are set to 0.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-napcomponentregistrationinfo
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct NapComponentRegistrationInfo {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-datatypes">NapComponentId</a> value that contains the unique identifier of the component.
     */
    id : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-countedstring">CountedString</a> structure that contains the friendly (human-readable) name of the component.
     */
    friendlyName : CountedString

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-countedstring">CountedString</a> structure that contains a description of the component.
     */
    description : CountedString

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-countedstring">CountedString</a> structure that contains the version of the component.
     */
    version : CountedString

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-countedstring">CountedString</a> structure that contains the vendor name for the component.
     */
    vendorName : CountedString

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/com/clsid-key-hklm">CLSID</a> of the COM object that implements
     *    the <a href="https://docs.microsoft.com/windows/desktop/NAP/inapcomponentinfo">INapComponentInfo</a> interface. This interface
     *    is used to retrieve more detailed and localized
     *    information about the NAP component.
     * 
     * Currently, enforcement clients do not need to
     *    provide a valid <i>infoClsid</i>.
     */
    infoClsid : Guid

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/com/clsid-key-hklm">CLSID</a> of the COM object that implements
     *    the <a href="https://docs.microsoft.com/windows/desktop/NAP/inapcomponentconfig">INapComponentConfig</a> interface. This interface is used to launch a customized user interface and to get and set SHV configuration settings.
     * 
     * Currently, SHAs and enforcement clients do not need to
     *    provide a valid <i>configClsid</i>.
     */
    configClsid : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the registration information date.
     */
    registrationDate : FILETIME

    /**
     * A value that defines the component type.
     * 
     * For enforcement clients this value should be either  <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">ComponentTypeEnforcementClientSoH</a> or <b>ComponentTypeEnforcementClientRp</b>.
     * 
     * Currently, <i>componentType</i> is ignored for SHAs and SHVs and should be set to 0x00000000.
     */
    componentType : UInt32

}
