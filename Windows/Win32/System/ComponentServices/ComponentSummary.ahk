#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents summary information about a COM+ component hosted in a particular process. It can also represent a Services Without Components (SWC) context.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-componentsummary
 * @namespace Windows.Win32.System.ComponentServices
 */
class ComponentSummary extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * The application instance GUID that uniquely identifies the process that hosts the component.
     * @type {Guid}
     */
    ApplicationInstanceId {
        get {
            if(!this.HasProp("__ApplicationInstanceId"))
                this.__ApplicationInstanceId := Guid(0, this)
            return this.__ApplicationInstanceId
        }
    }

    /**
     * The partition ID of the component.
     * @type {Guid}
     */
    PartitionId {
        get {
            if(!this.HasProp("__PartitionId"))
                this.__PartitionId := Guid(16, this)
            return this.__PartitionId
        }
    }

    /**
     * The application ID of the component. The special value {84ac4168-6fe5-4308-a2ed-03688a023c7a} indicates that this is an SWC context.
     * @type {Guid}
     */
    ApplicationId {
        get {
            if(!this.HasProp("__ApplicationId"))
                this.__ApplicationId := Guid(32, this)
            return this.__ApplicationId
        }
    }

    /**
     * The CLSID of the component.
     * @type {Guid}
     */
    Clsid {
        get {
            if(!this.HasProp("__Clsid"))
                this.__Clsid := Guid(48, this)
            return this.__Clsid
        }
    }

    /**
     * The name of the component. Usually, this is the component's ProgID (or the string representation of the component's CLSID if the component does not have a ProgID). For SWC contexts, this is the context name property configured for the context. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_CLASS_NAME flag when you call a method that returns a <b>ComponentSummary</b> structure.
     * @type {PWSTR}
     */
    ClassName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The name of the COM+ application, or the application name property configured for an SWC context. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_APPLICATION_NAME flag when you call a method that returns a <b>ComponentSummary</b> structure.
     * @type {PWSTR}
     */
    ApplicationName {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
