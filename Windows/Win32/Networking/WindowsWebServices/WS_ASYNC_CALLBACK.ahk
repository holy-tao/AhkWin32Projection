#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The callback function parameter used with the asynchronous model.
 * @remarks
 * All error return codes of an operation are represented as HRESULTs. This API defines a set of HRESULTs in the FACILITY_WS range, but also returns errors defined elsewhere in the Windows API.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_async_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ASYNC_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HRESULT} errorCode 
     * @param {Integer} callbackModel 
     * @param {Pointer<Void>} callbackState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(errorCode, callbackModel, callbackState) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "int", errorCode, "int", callbackModel, callbackStateMarshal, callbackState)
    }
}
