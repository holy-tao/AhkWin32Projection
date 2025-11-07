#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CountedString.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Defines a registered NAP component such as a SHA, SHV, or enforcement client.
 * @remarks
 * 
 * This registration information is not localized, it is provided in US-English only.
 * 
 * When NAP components are registered through the registration APIs, the <i>registrationDate</i> field is ignored.
 * 
 * When information about registered NAP
 *    components is retrieved, if there is no valid <i>infoClsid</i>,  <i>configClsid</i>, or <i>registrationDate</i>, they are set to 0.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//naptypes/ns-naptypes-napcomponentregistrationinfo
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class NapComponentRegistrationInfo extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-datatypes">NapComponentId</a> value that contains the unique identifier of the component.
     * @type {Integer}
     */
    id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-countedstring">CountedString</a> structure that contains the friendly (human-readable) name of the component.
     * @type {CountedString}
     */
    friendlyName{
        get {
            if(!this.HasProp("__friendlyName"))
                this.__friendlyName := CountedString(8, this)
            return this.__friendlyName
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-countedstring">CountedString</a> structure that contains a description of the component.
     * @type {CountedString}
     */
    description{
        get {
            if(!this.HasProp("__description"))
                this.__description := CountedString(24, this)
            return this.__description
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-countedstring">CountedString</a> structure that contains the version of the component.
     * @type {CountedString}
     */
    version{
        get {
            if(!this.HasProp("__version"))
                this.__version := CountedString(40, this)
            return this.__version
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-countedstring">CountedString</a> structure that contains the vendor name for the component.
     * @type {CountedString}
     */
    vendorName{
        get {
            if(!this.HasProp("__vendorName"))
                this.__vendorName := CountedString(56, this)
            return this.__vendorName
        }
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/com/clsid-key-hklm">CLSID</a>of the COM object that implements
     *    the <a href="https://docs.microsoft.com/windows/desktop/NAP/inapcomponentinfo">INapComponentInfo</a> interface. This interface
     *    is used to retrieve more detailed and localized
     *    information about the NAP component.
     * 
     * Currently, enforcement clients do not need to
     *    provide a valid <i>infoClsid</i>.
     * @type {Pointer<Guid>}
     */
    infoClsid {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/com/clsid-key-hklm">CLSID</a> of the COM object that implements
     *    the <a href="https://docs.microsoft.com/windows/desktop/NAP/inapcomponentconfig">INapComponentConfig</a> interface. This interface is used to launch a customized user interface and to get and set SHV configuration settings.
     * 
     * Currently, SHAs and enforcement clients do not need to
     *    provide a valid <i>configClsid</i>.
     * @type {Pointer<Guid>}
     */
    configClsid {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the registration information date.
     * @type {FILETIME}
     */
    registrationDate{
        get {
            if(!this.HasProp("__registrationDate"))
                this.__registrationDate := FILETIME(88, this)
            return this.__registrationDate
        }
    }

    /**
     * A value that defines the component type.
     * 
     * For enforcement clients this value should be either  <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">ComponentTypeEnforcementClientSoH</a> or <b>ComponentTypeEnforcementClientRp</b>.
     * 
     * Currently, <i>componentType</i> is ignored for SHAs and SHVs and should be set to 0x00000000.
     * @type {Integer}
     */
    componentType {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
