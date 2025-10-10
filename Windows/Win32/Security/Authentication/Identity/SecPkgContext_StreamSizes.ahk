#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Indicates the sizes of the various parts of a stream for use with the message support functions. The QueryContextAttributes (General) function uses this structure.
 * @remarks
 * 
  * Applications calling <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage (General)</a> should check the values of the <b>cbHeader</b>, <b>cbTrailer</b>, and <b>cbMaximumMessage</b> members to determine the size of the encrypted packet.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_streamsizes
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_StreamSizes extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Specifies the size, in bytes, of the header portion. If zero, no header is used.
     * @type {Integer}
     */
    cbHeader {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the maximum size, in bytes, of the trailer portion. If zero, no trailer is used.
     * @type {Integer}
     */
    cbTrailer {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the size, in bytes, of the largest message that can be encapsulated.
     * @type {Integer}
     */
    cbMaximumMessage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the number of buffers to pass.
     * @type {Integer}
     */
    cBuffers {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the preferred integral size of the messages. For example, eight indicates that messages should be of size zero mod eight for optimal performance. Messages other than this block size can be padded.
     * @type {Integer}
     */
    cbBlockSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
