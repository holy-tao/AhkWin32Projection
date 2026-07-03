#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A structure that is used to specify a set of callbacks that can transform the content type and encoded bytes of a received message.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> may wish to decompress, modify, or otherwise transform
 *                 the encoded bytes of a message as soon as they are received. A <b>WS_CHANNEL_DECODER</b> 
 *                 provides the necessary hooks to intercept and perform these modifications.
 *             
 * 
 * When creating the channel, the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_DECODER</a> should be
 *                 set with the appropriate functions.
 *             
 * 
 * The callbacks specified will get invoked according to the following grammar:
 *               
 * 
 * 
 *               
 * 
 * 
 * ``` syntax
 * 
 * decodercalls := create decoderloop* free
 * decoderloop  := decodestart
 *              |  decodestart getcontenttype
 *              |  decodestart getcontenttype (decode*)
 *              |  decodestart getcontenttype (decode*) decodeend
 * ```
 * 
 * The decoder may not see the full decode sequence for a message if the channel 
 *               or the decoder encounters an error while reading the message.  A decoder must be 
 *               prepared to handle transitioning to the appropriate state based upon the callbacks invoked.
 *             
 * 
 * When using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a> with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE_SESSION</a>, the content type
 *               is fixed for the channel.  In this case, the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_get_content_type_callback">WS_DECODER_GET_CONTENT_TYPE_CALLBACK</a> must return
 *               exactly the same value for the content type of every message.
 *             
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_end_callback">WS_DECODER_END_CALLBACK</a> will not be invoked until <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_decode_callback">WS_DECODER_DECODE_CALLBACK</a> returns 0 bytes.
 *             
 * 
 * When the channel is finished using the decoder instance it will free it via the 
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_free_decoder_callback">WS_FREE_DECODER_CALLBACK</a>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_channel_decoder
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CHANNEL_DECODER {
    #StructPack 8

    /**
     * A context that will be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_decoder_callback">WS_CREATE_DECODER_CALLBACK</a>.
     */
    createContext : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_decoder_callback">WS_CREATE_DECODER_CALLBACK</a> callback that creates an instance of a decoder.
     */
    createDecoderCallback : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_get_content_type_callback">WS_DECODER_GET_CONTENT_TYPE_CALLBACK</a> callback that is invoked to get the content type of the message.
     */
    decoderGetContentTypeCallback : IntPtr

    /**
     * A 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_start_callback">WS_DECODER_START_CALLBACK</a> callback that is invoked at the start of decoding a message.
     */
    decoderStartCallback : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_decode_callback">WS_DECODER_DECODE_CALLBACK</a> callback that is invoked to decode a message.
     */
    decoderDecodeCallback : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_end_callback">WS_DECODER_END_CALLBACK</a> callback that is invoked at the end of decoding a message.
     */
    decoderEndCallback : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_free_decoder_callback">WS_FREE_DECODER_CALLBACK</a> callback that frees an instance of a decoder.
     */
    freeDecoderCallback : IntPtr

}
