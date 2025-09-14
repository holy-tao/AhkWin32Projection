#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class WS_CHANNEL_ENCODER extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A context that will be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_encoder_callback">WS_CREATE_ENCODER_CALLBACK</a>.
     * @type {Pointer<Void>}
     */
    createContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_encoder_callback">WS_CREATE_ENCODER_CALLBACK</a> callback that creates an instance of an encoder.
     * @type {Pointer<WS_CREATE_ENCODER_CALLBACK>}
     */
    createEncoderCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_get_content_type_callback">WS_ENCODER_GET_CONTENT_TYPE_CALLBACK</a> callback that is invoked when a message is to be encoded.
     * @type {Pointer<WS_ENCODER_GET_CONTENT_TYPE_CALLBACK>}
     */
    encoderGetContentTypeCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_start_callback">WS_ENCODER_START_CALLBACK</a> callback that is invoked to start encoding a message.
     * @type {Pointer<WS_ENCODER_START_CALLBACK>}
     */
    encoderStartCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_encode_callback">WS_ENCODER_ENCODE_CALLBACK</a> callback that is invoked to encode a message.
     * @type {Pointer<WS_ENCODER_ENCODE_CALLBACK>}
     */
    encoderEncodeCallback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_end_callback">WS_ENCODER_END_CALLBACK</a> callback that is invoked to at the end of encoding a message.
     * @type {Pointer<WS_ENCODER_END_CALLBACK>}
     */
    encoderEndCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_free_encoder_callback">WS_FREE_ENCODER_CALLBACK</a> callback that frees an instance of an encoder.
     * @type {Pointer<WS_FREE_ENCODER_CALLBACK>}
     */
    freeEncoderCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
