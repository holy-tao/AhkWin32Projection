#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\OSUpdateAssessment.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets the OS update assessment by comparing the latest build from Microsoft against the build running on the current device.
 * @remarks
 * 
  * The <b>IWaaSAssessor</b> interface retrieves the <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-osupdateassessment">OSUpdateAssessment</a>. This assessment may be cached; if there is no cached entry, the assessment will be created on demand through the WaaS Assessment Client. The client creates the assessment by contacting the WaaS Assessment Service for update information applicable to the device. The client then performs the assessment using the retrieved information. 
  * 
  * Your code must have administrator privileges to use the <b>IWaaSAssessor</b> interface. For more details about developing applications that require administrator privileges, see [this article](/windows/win32/secauthz/developing-applications-that-require-administrator-privilege).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//waasapi/nn-waasapi-iwaasassessor
 * @namespace Windows.Win32.System.UpdateAssessment
 * @version v4.0.30319
 */
class IWaaSAssessor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWaaSAssessor
     * @type {Guid}
     */
    static IID => Guid("{2347bbef-1a3b-45a4-902d-3e09c269b45e}")

    /**
     * The class identifier for WaaSAssessor
     * @type {Guid}
     */
    static CLSID => Guid("{098ef871-fa9f-46af-8958-c083515d7c9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOSUpdateAssessment"]

    /**
     * 
     * @returns {OSUpdateAssessment} 
     * @see https://learn.microsoft.com/windows/win32/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment
     */
    GetOSUpdateAssessment() {
        result := OSUpdateAssessment()
        result := ComCall(3, this, "ptr", result, "HRESULT")
        return result
    }
}
