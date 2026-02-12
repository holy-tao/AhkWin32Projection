#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles the WsCreateListener call for a WS_CUSTOM_CHANNEL_BINDING.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_create_listener_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CREATE_LISTENER_CALLBACK extends IUnknown {

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
     * @param {Integer} channelType_ 
     * @param {Pointer} listenerParameters 
     * @param {Integer} listenerParametersSize 
     * @param {Pointer<WS_ERROR>} error 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(channelType_, listenerParameters, listenerParametersSize, error) {
        result := ComCall(3, this, "int", channelType_, "ptr", listenerParameters, "uint", listenerParametersSize, "ptr*", &listenerInstance := 0, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return listenerInstance
    }
}
