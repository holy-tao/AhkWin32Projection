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
     * Registers the specified error message to use in the UI.
     * @param {BSTR} bstrMessage A string containing the error message to use in the UI.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspacereportmessage-registererrorlogmessage
     */
    RegisterErrorLogMessage(bstrMessage) {
        bstrMessage := bstrMessage is String ? BSTR.Alloc(bstrMessage).Value : bstrMessage

        result := ComCall(3, this, "ptr", bstrMessage, "HRESULT")
        return result
    }

    /**
     * Determines whether a specified error message is registered in a specified workspace.
     * @param {BSTR} bstrWkspId A string containing the ID of the workspace to check.
     * @param {Integer} dwErrorType The error type associated with the error message.
     * @param {BSTR} bstrErrorMessageType A string containing the error message type.
     * @param {Integer} dwErrorCode The error code of the event.
     * @returns {VARIANT_BOOL} On success, returns a pointer to <b>VARIANT_TRUE</b> if the error message is registered in the specified workspace; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspacereportmessage-iserrormessageregistered
     */
    IsErrorMessageRegistered(bstrWkspId, dwErrorType, bstrErrorMessageType, dwErrorCode) {
        bstrWkspId := bstrWkspId is String ? BSTR.Alloc(bstrWkspId).Value : bstrWkspId
        bstrErrorMessageType := bstrErrorMessageType is String ? BSTR.Alloc(bstrErrorMessageType).Value : bstrErrorMessageType

        result := ComCall(4, this, "ptr", bstrWkspId, "uint", dwErrorType, "ptr", bstrErrorMessageType, "uint", dwErrorCode, "short*", &pfErrorExist := 0, "HRESULT")
        return pfErrorExist
    }

    /**
     * Registers the specified error event message to use in the UI.
     * @param {BSTR} bstrWkspId A string containing the workspace ID in which the error event is to be registered.
     * @param {Integer} dwErrorType The error type of the event.
     * @param {BSTR} bstrErrorMessageType A string containing the error message.
     * @param {Integer} dwErrorCode The error code for the event.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspacereportmessage-registererrorevent
     */
    RegisterErrorEvent(bstrWkspId, dwErrorType, bstrErrorMessageType, dwErrorCode) {
        bstrWkspId := bstrWkspId is String ? BSTR.Alloc(bstrWkspId).Value : bstrWkspId
        bstrErrorMessageType := bstrErrorMessageType is String ? BSTR.Alloc(bstrErrorMessageType).Value : bstrErrorMessageType

        result := ComCall(5, this, "ptr", bstrWkspId, "uint", dwErrorType, "ptr", bstrErrorMessageType, "uint", dwErrorCode, "HRESULT")
        return result
    }
}
