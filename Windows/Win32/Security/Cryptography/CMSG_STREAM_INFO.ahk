#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to enable stream processing of data rather than single block processing.
 * @remarks
 * Messages can be so large that processing them all at once by storing the whole message in memory can be difficult, if not impossible. It is possible to process large messages without encountering memory limitations by streaming the data that is to be processed into manageable sized blocks. The 
  * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">low-level message functions</a> can be used with streaming to encode or decode a message. Any level of nesting of messages is supported when streaming to encode and streaming to decode.
  * 
  * The input message to be processed as a stream feeds into 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgupdate">CryptMsgUpdate</a> one block at a time, with the application determining the size of the block. As the streamed message is processed for encoding or decoding, the resulting output data is passed back to the application through an application-specified callback function that is specified by the <b>pfnStreamOutput</b> member.
  * 
  * No assumptions can be made about the block size of the output data because the size can vary for several reasons, such as the jitter in output block size caused by the block size for the encryption algorithm when processing an enveloped message, or when blocks that contain the message header and the SignerInfo as defined by PKCS # 7 are processed.
  * 
  * The size of the output block is passed to the callback function in its <i>cbData</i> parameter. The use of output data is determined in the calling application. Typically, output from stream processing will not be persisted in memory as a whole due to memory limitations; rather, it will be serialized to a disk or server file.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_stream_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_STREAM_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the size, in bytes, of the content. Normal <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoding is used unless <b>CMSG_INDEFINITE_LENGTH</b>(0xFFFFFFFF) is passed, indicating that the application is not specifying the content length. This forces the use of indefinite-length <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">Basic Encoding Rules</a> (BER) encoding.
     * @type {Integer}
     */
    cbContent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The address of a callback function used to read from and write data to a disk when processing large messages. 
     * 
     * 
     * 
     * 
     * The callback function must have the following signature and parameters:
     * 
     * 
     * ```cpp
     * @type {Pointer<Ptr>}
     */
    pfnStreamOutput {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the argument to pass to the callback function. Typically, this is used for state data that includes the handle to a more deeply nested message (when decoding) or a less deeply nested message (when encoding).
     * @type {Pointer<Void>}
     */
    pvArg {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
