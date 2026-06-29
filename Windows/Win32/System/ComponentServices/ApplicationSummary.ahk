#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\COMPLUS_APPTYPE.ahk" { COMPLUS_APPTYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents a COM+ application hosted in a particular process. It can also represent a pseudo-application entry for all Services Without Components (SWC) contexts in the process.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-applicationsummary
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ApplicationSummary {
    #StructPack 8

    /**
     * The application instance GUID that uniquely identifies the process hosting the COM+ application.
     */
    ApplicationInstanceId : Guid

    /**
     * The partition ID of the COM+ application.
     */
    PartitionId : Guid

    /**
     * The application ID of the COM+ application. The special value {84ac4168-6fe5-4308-a2ed-03688a023c7a} is used for the SWC pseudo-application.
     */
    ApplicationId : Guid

    /**
     * The type of COM+ application. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-complus_apptype">COMPLUS_APPTYPE</a>.
     */
    Type : COMPLUS_APPTYPE

    /**
     * The name of the COM+ application, or an empty string for the SWC pseudo-application. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_APPLICATION_NAME flag when you call a method that returns an <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-applicationprocesssummary">ApplicationProcessSummary</a> structure.
     */
    ApplicationName : PWSTR

    /**
     * The number of distinct components from this COM+ application instantiated in the hosting process.
     */
    NumTrackedComponents : UInt32

    /**
     * The number of component instances from this COM+ application in the hosting process.
     */
    NumComponentInstances : UInt32

}
