#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the sizes of the various parts of a stream for use with the message support functions. The QueryContextAttributes (General) function uses this structure.
 * @remarks
 * Applications calling <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage (General)</a> should check the values of the <b>cbHeader</b>, <b>cbTrailer</b>, and <b>cbMaximumMessage</b> members to determine the size of the encrypted packet.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_streamsizes
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_StreamSizes {
    #StructPack 4

    /**
     * Specifies the size, in bytes, of the header portion. If zero, no header is used.
     */
    cbHeader : UInt32

    /**
     * Specifies the maximum size, in bytes, of the trailer portion. If zero, no trailer is used.
     */
    cbTrailer : UInt32

    /**
     * Specifies the size, in bytes, of the largest message that can be encapsulated.
     */
    cbMaximumMessage : UInt32

    /**
     * Specifies the number of buffers to pass.
     */
    cBuffers : UInt32

    /**
     * Specifies the preferred integral size of the messages. For example, eight indicates that messages should be of size zero mod eight for optimal performance. Messages other than this block size can be padded.
     */
    cbBlockSize : UInt32

}
