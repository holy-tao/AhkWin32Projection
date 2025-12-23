#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a COM+ application hosted in a particular process. It can also represent a pseudo-application entry for all Services Without Components (SWC) contexts in the process.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-applicationsummary
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ApplicationSummary extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The application instance GUID that uniquely identifies the process hosting the COM+ application.
     * @type {Pointer<Guid>}
     */
    ApplicationInstanceId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The partition ID of the COM+ application.
     * @type {Pointer<Guid>}
     */
    PartitionId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The application ID of the COM+ application. The special value {84ac4168-6fe5-4308-a2ed-03688a023c7a} is used for the SWC pseudo-application.
     * @type {Pointer<Guid>}
     */
    ApplicationId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The type of COM+ application. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-complus_apptype">COMPLUS_APPTYPE</a>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The name of the COM+ application, or an empty string for the SWC pseudo-application. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_APPLICATION_NAME flag when you call a method that returns an <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-applicationprocesssummary">ApplicationProcessSummary</a> structure.
     * @type {PWSTR}
     */
    ApplicationName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The number of distinct components from this COM+ application instantiated in the hosting process.
     * @type {Integer}
     */
    NumTrackedComponents {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of component instances from this COM+ application in the hosting process.
     * @type {Integer}
     */
    NumComponentInstances {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
