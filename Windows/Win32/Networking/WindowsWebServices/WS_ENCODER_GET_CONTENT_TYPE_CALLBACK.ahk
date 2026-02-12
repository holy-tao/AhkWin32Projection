#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets the content type of the message. (WS_ENCODER_GET_CONTENT_TYPE_CALLBACK)
 * @remarks
 * The callback may inspect the content type provided, and then should return the 
 *               content type to use for the encoded message.
 *             
 * 
 * The content type and content encoding returned must remain valid until the 
 *               callback is invoked again, or the encoder is freed.
 *             
 * 
 * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a>, if a non-zero length content encoding
 *               is returned, the HTTP header "Content-Encoding" will be added to the message
 *               with this value.
 *             
 * 
 * For other channel bindings, it is an error to return a non-zero length 
 *               content encoding.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_encoder_get_content_type_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ENCODER_GET_CONTENT_TYPE_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} encoderContext 
     * @param {Pointer<WS_STRING>} contentType 
     * @param {Pointer<WS_STRING>} newContentType 
     * @param {Pointer<WS_STRING>} contentEncoding 
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
    Invoke(encoderContext, contentType, newContentType, contentEncoding, error) {
        encoderContextMarshal := encoderContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, encoderContextMarshal, encoderContext, "ptr", contentType, "ptr", newContentType, "ptr", contentEncoding, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
