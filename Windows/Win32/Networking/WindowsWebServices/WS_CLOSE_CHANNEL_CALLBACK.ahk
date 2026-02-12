#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles the WsCloseChannel call for a WS_CUSTOM_CHANNEL_BINDING.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsclosechannel">WsCloseChannel</a> for information about the contract
 *                 of this API.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_close_channel_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CLOSE_CHANNEL_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} channelInstance 
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext 
     * @param {Pointer<WS_ERROR>} error 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(channelInstance, asyncContext, error) {
        channelInstanceMarshal := channelInstance is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, channelInstanceMarshal, channelInstance, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
