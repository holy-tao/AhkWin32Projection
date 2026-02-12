#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WS_STRING.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets the content type of the message. (WS_DECODER_GET_CONTENT_TYPE_CALLBACK)
 * @remarks
 * The callback should verify that the content type provided matches what is expected,
 *               and then should return the content type of the decoded message.
 *             
 * 
 * The content type returned must remain valid until the next time the callback is
 *               invoked, or the decoder is freed.
 *             
 * 
 * The callback has to set newContentType to one that is supported by underlying channel.
 *                 For example, with TCP session channel using SOAP 1.2 and binary encoding, 
 *                 the new content type should always be application/soap+msbinsession1.
 *             
 * 
 * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a> the content encoding parameter will
 *               be set to the value of the "Content-Encoding" HTTP header.  If this header does
 *               not exist, then <b>NULL</b> will be passed.
 *             
 * 
 * For all other channel bindings, <b>NULL</b> will be passed for the content encoding.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_decoder_get_content_type_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DECODER_GET_CONTENT_TYPE_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} decoderContext 
     * @param {Pointer<WS_STRING>} contentType 
     * @param {Pointer<WS_STRING>} contentEncoding 
     * @param {Pointer<WS_ERROR>} error 
     * @returns {WS_STRING} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(decoderContext, contentType, contentEncoding, error) {
        decoderContextMarshal := decoderContext is VarRef ? "ptr" : "ptr"

        newContentType := WS_STRING()
        result := ComCall(3, this, decoderContextMarshal, decoderContext, "ptr", contentType, "ptr", contentEncoding, "ptr", newContentType, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return newContentType
    }
}
