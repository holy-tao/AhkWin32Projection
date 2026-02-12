#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles the WsGetChannelProperty call for a WS_CUSTOM_CHANNEL_BINDING.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetchannelproperty">WsGetChannelProperty</a> for information about the contract
 *                 of this API.
 *             
 * 
 * Every custom channel implementation must support returning
 *                 a value for at least the following properties:
 *             
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ADDRESSING_VERSION</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ENVELOPE_VERSION</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_TRANSFER_MODE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_PROTECTION_LEVEL</a>
 * </li>
 * </ul>
 * Service Model layer provides its own logic of call timeouts as such it requires 
 *                 disabling timeouts in the underlying channel. In order for a custom channel to be 
 *                 used from Service Model layer, it should support disabling all of its timeouts and 
 *                 implement this callback for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ENABLE_TIMEOUTS</a>. A custom 
 *                 channel cannot be used through Service Model unless query for 
 *                 <b>WS_CHANNEL_PROPERTY_ENABLE_TIMEOUTS</b> returns <b>FALSE</b>.
 *             
 * 
 * It is up to the custom channel implementation to determine any
 *                 additional properties it wishes to support.
 *             
 * 
 * If a property is not supported, the <b>E_INVALIDARG</b> should be returned.
 *              (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_get_channel_property_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_GET_CHANNEL_PROPERTY_CALLBACK extends IUnknown {

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
     * @param {Integer} id 
     * @param {Pointer} value 
     * @param {Integer} valueSize 
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
    Invoke(channelInstance, id, value, valueSize, error) {
        channelInstanceMarshal := channelInstance is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, channelInstanceMarshal, channelInstance, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
