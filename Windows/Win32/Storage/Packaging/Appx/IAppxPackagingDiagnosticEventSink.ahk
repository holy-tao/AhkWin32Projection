#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\APPX_PACKAGING_CONTEXT_CHANGE_TYPE.ahk" { APPX_PACKAGING_CONTEXT_CHANGE_TYPE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxPackagingDiagnosticEventSink extends IUnknown {
    /**
     * The interface identifier for IAppxPackagingDiagnosticEventSink
     * @type {Guid}
     */
    static IID := Guid("{17239d47-6adb-45d2-80f6-f9cbc3bf059d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxPackagingDiagnosticEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReportContextChange : IntPtr
        ReportError         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxPackagingDiagnosticEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {APPX_PACKAGING_CONTEXT_CHANGE_TYPE} _changeType 
     * @param {Integer} contextId 
     * @param {PSTR} contextName 
     * @param {PWSTR} contextMessage 
     * @param {PWSTR} detailsMessage 
     * @returns {HRESULT} 
     */
    ReportContextChange(_changeType, contextId, contextName, contextMessage, detailsMessage) {
        contextName := contextName is String ? StrPtr(contextName) : contextName
        contextMessage := contextMessage is String ? StrPtr(contextMessage) : contextMessage
        detailsMessage := detailsMessage is String ? StrPtr(detailsMessage) : detailsMessage

        result := ComCall(3, this, APPX_PACKAGING_CONTEXT_CHANGE_TYPE, _changeType, "int", contextId, "ptr", contextName, "ptr", contextMessage, "ptr", detailsMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} errorMessage 
     * @returns {HRESULT} 
     */
    ReportError(errorMessage) {
        errorMessage := errorMessage is String ? StrPtr(errorMessage) : errorMessage

        result := ComCall(4, this, "ptr", errorMessage, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxPackagingDiagnosticEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReportContextChange := CallbackCreate(GetMethod(implObj, "ReportContextChange"), flags, 6)
        this.vtbl.ReportError := CallbackCreate(GetMethod(implObj, "ReportError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReportContextChange)
        CallbackFree(this.vtbl.ReportError)
    }
}
