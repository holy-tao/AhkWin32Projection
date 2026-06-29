#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PROTOCOLDATA.ahk" { PROTOCOLDATA }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetProtocolSink extends IUnknown {
    /**
     * The interface identifier for IInternetProtocolSink
     * @type {Guid}
     */
    static IID := Guid("{79eac9e5-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetProtocolSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Switch         : IntPtr
        ReportProgress : IntPtr
        ReportData     : IntPtr
        ReportResult   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetProtocolSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<PROTOCOLDATA>} pProtocolData 
     * @returns {HRESULT} 
     */
    Switch(pProtocolData) {
        result := ComCall(3, this, PROTOCOLDATA.Ptr, pProtocolData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStatusCode 
     * @param {PWSTR} szStatusText 
     * @returns {HRESULT} 
     */
    ReportProgress(ulStatusCode, szStatusText) {
        szStatusText := szStatusText is String ? StrPtr(szStatusText) : szStatusText

        result := ComCall(4, this, "uint", ulStatusCode, "ptr", szStatusText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfBSCF 
     * @param {Integer} ulProgress 
     * @param {Integer} ulProgressMax 
     * @returns {HRESULT} 
     */
    ReportData(grfBSCF, ulProgress, ulProgressMax) {
        result := ComCall(5, this, "uint", grfBSCF, "uint", ulProgress, "uint", ulProgressMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrResult 
     * @param {Integer} dwError 
     * @param {PWSTR} szResult 
     * @returns {HRESULT} 
     */
    ReportResult(hrResult, dwError, szResult) {
        szResult := szResult is String ? StrPtr(szResult) : szResult

        result := ComCall(6, this, "int", hrResult, "uint", dwError, "ptr", szResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetProtocolSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Switch := CallbackCreate(GetMethod(implObj, "Switch"), flags, 2)
        this.vtbl.ReportProgress := CallbackCreate(GetMethod(implObj, "ReportProgress"), flags, 3)
        this.vtbl.ReportData := CallbackCreate(GetMethod(implObj, "ReportData"), flags, 4)
        this.vtbl.ReportResult := CallbackCreate(GetMethod(implObj, "ReportResult"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Switch)
        CallbackFree(this.vtbl.ReportProgress)
        CallbackFree(this.vtbl.ReportData)
        CallbackFree(this.vtbl.ReportResult)
    }
}
