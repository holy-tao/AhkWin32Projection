#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents summary information about a COM+ component hosted in a particular process. It can also represent a Services Without Components (SWC) context.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ns-comsvcs-componentsummary
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ComponentSummary extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The application instance GUID that uniquely identifies the process that hosts the component.
     * @type {Pointer<Guid>}
     */
    ApplicationInstanceId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The partition ID of the component.
     * @type {Pointer<Guid>}
     */
    PartitionId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The application ID of the component. The special value {84ac4168-6fe5-4308-a2ed-03688a023c7a} indicates that this is an SWC context.
     * @type {Pointer<Guid>}
     */
    ApplicationId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The CLSID of the component.
     * @type {Pointer<Guid>}
     */
    Clsid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The name of the component. Usually, this is the component's ProgID (or the string representation of the component's CLSID if the component does not have a ProgID). For SWC contexts, this is the context name property configured for the context. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_CLASS_NAME flag when you call a method that returns a <b>ComponentSummary</b> structure.
     * @type {Pointer<Char>}
     */
    ClassName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The name of the COM+ application, or the application name property configured for an SWC context. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_APPLICATION_NAME flag when you call a method that returns a <b>ComponentSummary</b> structure.
     * @type {Pointer<Char>}
     */
    ApplicationName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
