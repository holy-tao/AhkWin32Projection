#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that support error message handling for remote workspaces.
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nn-workspaceruntime-iworkspacereportmessage
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspaceReportMessage extends IUnknown {
    /**
     * The interface identifier for IWorkspaceReportMessage
     * @type {Guid}
     */
    static IID := Guid("{a7c06739-500f-4e8c-99a8-2bd6955899eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspaceReportMessage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterErrorLogMessage  : IntPtr
        IsErrorMessageRegistered : IntPtr
        RegisterErrorEvent       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspaceReportMessage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers the specified error message to use in the UI.
     * @param {BSTR} bstrMessage A string containing the error message to use in the UI.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacereportmessage-registererrorlogmessage
     */
    RegisterErrorLogMessage(bstrMessage) {
        bstrMessage := bstrMessage is String ? BSTR.Alloc(bstrMessage).Value : bstrMessage

        result := ComCall(3, this, BSTR, bstrMessage, "HRESULT")
        return result
    }

    /**
     * Determines whether a specified error message is registered in a specified workspace.
     * @param {BSTR} bstrWkspId A string containing the ID of the workspace to check.
     * @param {Integer} dwErrorType The error type associated with the error message.
     * @param {BSTR} bstrErrorMessageType A string containing the error message type.
     * @param {Integer} dwErrorCode The error code of the event.
     * @returns {VARIANT_BOOL} On success, returns a pointer to <b>VARIANT_TRUE</b> if the error message is registered in the specified workspace; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacereportmessage-iserrormessageregistered
     */
    IsErrorMessageRegistered(bstrWkspId, dwErrorType, bstrErrorMessageType, dwErrorCode) {
        bstrWkspId := bstrWkspId is String ? BSTR.Alloc(bstrWkspId).Value : bstrWkspId
        bstrErrorMessageType := bstrErrorMessageType is String ? BSTR.Alloc(bstrErrorMessageType).Value : bstrErrorMessageType

        result := ComCall(4, this, BSTR, bstrWkspId, "uint", dwErrorType, BSTR, bstrErrorMessageType, "uint", dwErrorCode, VARIANT_BOOL.Ptr, &pfErrorExist := 0, "HRESULT")
        return pfErrorExist
    }

    /**
     * Registers the specified error event message to use in the UI.
     * @param {BSTR} bstrWkspId A string containing the workspace ID in which the error event is to be registered.
     * @param {Integer} dwErrorType The error type of the event.
     * @param {BSTR} bstrErrorMessageType A string containing the error message.
     * @param {Integer} dwErrorCode The error code for the event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacereportmessage-registererrorevent
     */
    RegisterErrorEvent(bstrWkspId, dwErrorType, bstrErrorMessageType, dwErrorCode) {
        bstrWkspId := bstrWkspId is String ? BSTR.Alloc(bstrWkspId).Value : bstrWkspId
        bstrErrorMessageType := bstrErrorMessageType is String ? BSTR.Alloc(bstrErrorMessageType).Value : bstrErrorMessageType

        result := ComCall(5, this, BSTR, bstrWkspId, "uint", dwErrorType, BSTR, bstrErrorMessageType, "uint", dwErrorCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWorkspaceReportMessage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterErrorLogMessage := CallbackCreate(GetMethod(implObj, "RegisterErrorLogMessage"), flags, 2)
        this.vtbl.IsErrorMessageRegistered := CallbackCreate(GetMethod(implObj, "IsErrorMessageRegistered"), flags, 6)
        this.vtbl.RegisterErrorEvent := CallbackCreate(GetMethod(implObj, "RegisterErrorEvent"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterErrorLogMessage)
        CallbackFree(this.vtbl.IsErrorMessageRegistered)
        CallbackFree(this.vtbl.RegisterErrorEvent)
    }
}
