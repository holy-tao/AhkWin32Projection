#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles the WsCreateChannelForListener call for a WS_CUSTOM_CHANNEL_BINDING.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a> for information about the contract
 *                 of this API.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_create_channel_for_listener_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CREATE_CHANNEL_FOR_LISTENER_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} listenerInstance 
     * @param {Pointer} channelParameters 
     * @param {Integer} channelParametersSize 
     * @param {Pointer<WS_ERROR>} error 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(listenerInstance, channelParameters, channelParametersSize, error) {
        listenerInstanceMarshal := listenerInstance is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, listenerInstanceMarshal, listenerInstance, "ptr", channelParameters, "uint", channelParametersSize, "ptr*", &channelInstance := 0, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return channelInstance
    }
}
