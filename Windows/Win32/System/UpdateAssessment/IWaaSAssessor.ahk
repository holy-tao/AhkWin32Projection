#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\OSUpdateAssessment.ahk" { OSUpdateAssessment }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets the OS update assessment by comparing the latest build from Microsoft against the build running on the current device.
 * @remarks
 * The <b>IWaaSAssessor</b> interface retrieves the <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-osupdateassessment">OSUpdateAssessment</a>. This assessment may be cached; if there is no cached entry, the assessment will be created on demand through the WaaS Assessment Client. The client creates the assessment by contacting the WaaS Assessment Service for update information applicable to the device. The client then performs the assessment using the retrieved information. 
 * 
 * Your code must have administrator privileges to use the <b>IWaaSAssessor</b> interface. For more details about developing applications that require administrator privileges, see [this article](/windows/win32/secauthz/developing-applications-that-require-administrator-privilege).
 * @see https://learn.microsoft.com/windows/win32/api/waasapi/nn-waasapi-iwaasassessor
 * @namespace Windows.Win32.System.UpdateAssessment
 */
export default struct IWaaSAssessor extends IUnknown {
    /**
     * The interface identifier for IWaaSAssessor
     * @type {Guid}
     */
    static IID := Guid("{2347bbef-1a3b-45a4-902d-3e09c269b45e}")

    /**
     * The class identifier for WaaSAssessor
     * @type {Guid}
     */
    static CLSID := Guid("{098ef871-fa9f-46af-8958-c083515d7c9c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWaaSAssessor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOSUpdateAssessment : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWaaSAssessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the OS update assessment by comparing the latest release OS version from Microsoft to the OS build running on the device.
     * @remarks
     * <b>GetOSUpdateAssessment</b> retrieves the OS update assessment. The assessment provides information on updates applicable to a device: specifically, if the OS on the device is up-to-date. If the OS is not up-to-date, the assessment provides some reasons why. The assessment also suggests the potential impact being out-of-date has on the device.
     * 
     * Your code must have administrator privileges to use the <b>GetOSUpdateAssessment</b> method. For more details about developing applications that require administrator privileges, see [this article](/windows/win32/secauthz/developing-applications-that-require-administrator-privilege).
     * @returns {OSUpdateAssessment} On success, contains a pointer to the OS update assessment.
     * @see https://learn.microsoft.com/windows/win32/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment
     */
    GetOSUpdateAssessment() {
        result := OSUpdateAssessment()
        result := ComCall(3, this, OSUpdateAssessment.Ptr, result, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWaaSAssessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOSUpdateAssessment := CallbackCreate(GetMethod(implObj, "GetOSUpdateAssessment"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOSUpdateAssessment)
    }
}
