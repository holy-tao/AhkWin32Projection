#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A structure that is used to specify a set of callbacks that can transform the content type and encoded bytes of a sent message.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> may wish to compress, modify, or otherwise transform
 *                 the encoded bytes of a message before they are sent. A <b>WS_CHANNEL_ENCODER</b> 
 *                 provides the necessary hooks to intercept and perform these modifications.
 *             
 * 
 * When creating the channel, the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ENCODER</a> should be
 *                 set with the appropriate functions.
 *             
 * 
 * The grammar for the encoder callbacks is:
 * 
 * 
 * ``` syntax
 * 
 * encodercalls := create encoderloop* free
 * encoderloop  := getcontenttype
 *              |  getcontenttype encodestart
 *              |  getcontenttype encodestart (encode*)
 *              |  getcontenttype encodestart (encode*) encodeend
 * 
 * ```
 * 
 * The encoder may not see the full encode sequence for a message if the channel or the 
 *               encoder encounters an error while writing the message.  An encoder must be prepared to 
 *               handle transitioning to the appropriate state based upon the callbacks invoked.
 * 
 * 
 * When using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a> with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE_SESSION</a>, the content type
 *               is fixed for the channel.  In this case, the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_get_content_type_callback">WS_ENCODER_GET_CONTENT_TYPE_CALLBACK</a> must return
 *               exactly the same value for the content type of every message.
 *             
 * 
 * When the channel is finished using the encoder instance it will free it via the
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_free_encoder_callback">WS_FREE_ENCODER_CALLBACK</a>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_channel_encoder
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CHANNEL_ENCODER {
    #StructPack 8

    /**
     * A context that will be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_encoder_callback">WS_CREATE_ENCODER_CALLBACK</a>.
     */
    createContext : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_encoder_callback">WS_CREATE_ENCODER_CALLBACK</a> callback that creates an instance of an encoder.
     */
    createEncoderCallback : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_get_content_type_callback">WS_ENCODER_GET_CONTENT_TYPE_CALLBACK</a> callback that is invoked when a message is to be encoded.
     */
    encoderGetContentTypeCallback : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_start_callback">WS_ENCODER_START_CALLBACK</a> callback that is invoked to start encoding a message.
     */
    encoderStartCallback : IntPtr

    /**
     * A 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_encode_callback">WS_ENCODER_ENCODE_CALLBACK</a> callback that is invoked to encode a message.
     */
    encoderEncodeCallback : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_end_callback">WS_ENCODER_END_CALLBACK</a> callback that is invoked to at the end of encoding a message.
     */
    encoderEndCallback : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_free_encoder_callback">WS_FREE_ENCODER_CALLBACK</a> callback that frees an instance of an encoder.
     */
    freeEncoderCallback : IntPtr

}
