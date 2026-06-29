#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IStringCollection.ahk" { IStringCollection }

/**
 * Records the result for an update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iinstallationagent
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IInstallationAgent extends IDispatch {
    /**
     * The interface identifier for IInstallationAgent
     * @type {Guid}
     */
    static IID := Guid("{925cbc18-a2ea-4648-bf1c-ec8badcfe20a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInstallationAgent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        RecordInstallationResult : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInstallationAgent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Records the result for an update. The result is specified by an IStringCollection object.
     * @param {BSTR} installationResultCookie A string value that identifies the result cookie.
     * @param {Integer} _hresult The identifier of the result.
     * @param {IStringCollection} extendedReportingData An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-istringcollection">IStringCollection</a> interface that represents a collection of strings that contain the result for an update.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationagent-recordinstallationresult
     */
    RecordInstallationResult(installationResultCookie, _hresult, extendedReportingData) {
        installationResultCookie := installationResultCookie is String ? BSTR.Alloc(installationResultCookie).Value : installationResultCookie

        result := ComCall(7, this, BSTR, installationResultCookie, "int", _hresult, "ptr", extendedReportingData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInstallationAgent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RecordInstallationResult := CallbackCreate(GetMethod(implObj, "RecordInstallationResult"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RecordInstallationResult)
    }
}
