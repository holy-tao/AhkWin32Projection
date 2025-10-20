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
     * 
     * @param {BSTR} bstrMessage 
     * @returns {HRESULT} 
     */
    RegisterErrorLogMessage(bstrMessage) {
        bstrMessage := bstrMessage is String ? BSTR.Alloc(bstrMessage).Value : bstrMessage

        result := ComCall(3, this, "ptr", bstrMessage, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    IsErrorMessageRegistered(bstrWkspId, dwErrorType, bstrErrorMessageType, dwErrorCode, pfErrorExist) {
        bstrWkspId := bstrWkspId is String ? BSTR.Alloc(bstrWkspId).Value : bstrWkspId
        bstrErrorMessageType := bstrErrorMessageType is String ? BSTR.Alloc(bstrErrorMessageType).Value : bstrErrorMessageType

        result := ComCall(4, this, "ptr", bstrWkspId, "uint", dwErrorType, "ptr", bstrErrorMessageType, "uint", dwErrorCode, "ptr", pfErrorExist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrWkspId 
     * @param {Integer} dwErrorType 
     * @param {BSTR} bstrErrorMessageType 
     * @param {Integer} dwErrorCode 
     * @returns {HRESULT} 
     */
    RegisterErrorEvent(bstrWkspId, dwErrorType, bstrErrorMessageType, dwErrorCode) {
        bstrWkspId := bstrWkspId is String ? BSTR.Alloc(bstrWkspId).Value : bstrWkspId
        bstrErrorMessageType := bstrErrorMessageType is String ? BSTR.Alloc(bstrErrorMessageType).Value : bstrErrorMessageType

        result := ComCall(5, this, "ptr", bstrWkspId, "uint", dwErrorType, "ptr", bstrErrorMessageType, "uint", dwErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
