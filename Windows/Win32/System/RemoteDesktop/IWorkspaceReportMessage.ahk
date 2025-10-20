#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that support error message handling for remote workspaces.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nn-workspaceruntime-iworkspacereportmessage
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspaceReportMessage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspaceReportMessage
     * @type {Guid}
     */
    static IID => Guid("{a7c06739-500f-4e8c-99a8-2bd6955899eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterErrorLogMessage", "IsErrorMessageRegistered", "RegisterErrorEvent"]

    /**
     * 
     * @param {BSTR} bstrMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacereportmessage-registererrorlogmessage
     */
    RegisterErrorLogMessage(bstrMessage) {
        bstrMessage := bstrMessage is String ? BSTR.Alloc(bstrMessage).Value : bstrMessage

        result := ComCall(3, this, "ptr", bstrMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWkspId 
     * @param {Integer} dwErrorType 
     * @param {BSTR} bstrErrorMessageType 
     * @param {Integer} dwErrorCode 
     * @param {Pointer<VARIANT_BOOL>} pfErrorExist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacereportmessage-iserrormessageregistered
     */
    IsErrorMessageRegistered(bstrWkspId, dwErrorType, bstrErrorMessageType, dwErrorCode, pfErrorExist) {
        bstrWkspId := bstrWkspId is String ? BSTR.Alloc(bstrWkspId).Value : bstrWkspId
        bstrErrorMessageType := bstrErrorMessageType is String ? BSTR.Alloc(bstrErrorMessageType).Value : bstrErrorMessageType

        result := ComCall(4, this, "ptr", bstrWkspId, "uint", dwErrorType, "ptr", bstrErrorMessageType, "uint", dwErrorCode, "ptr", pfErrorExist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWkspId 
     * @param {Integer} dwErrorType 
     * @param {BSTR} bstrErrorMessageType 
     * @param {Integer} dwErrorCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacereportmessage-registererrorevent
     */
    RegisterErrorEvent(bstrWkspId, dwErrorType, bstrErrorMessageType, dwErrorCode) {
        bstrWkspId := bstrWkspId is String ? BSTR.Alloc(bstrWkspId).Value : bstrWkspId
        bstrErrorMessageType := bstrErrorMessageType is String ? BSTR.Alloc(bstrErrorMessageType).Value : bstrErrorMessageType

        result := ComCall(5, this, "ptr", bstrWkspId, "uint", dwErrorType, "ptr", bstrErrorMessageType, "uint", dwErrorCode, "HRESULT")
        return result
    }
}
