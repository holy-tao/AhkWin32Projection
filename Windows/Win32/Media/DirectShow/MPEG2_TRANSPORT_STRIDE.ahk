#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MPEG2\_TRANSPORT\_STRIDE structure describes the format of MPEG-2 transport stream (TS) packets.
 * @remarks
 * The following diagram illustrates the relations between the structure members.
  * 
  * ![mpeg-2 stride packet](images/mpeg2-stride-packet.png)
  * 
  * Input buffers that contain multiplexed stride packets have some restrictions:
  * 
  * -   Stride packets must be packed contiguously within the buffer.
  * -   No bytes may precede the first stride packet or follow the last stride packet.
  * -   An integral number of stride packets must fit in the buffer; that is, buffer length % dwStride equals zero.
  * 
  * There is no restriction on the number of stride packets per buffer.
  * 
  * If the media type does not contain a format block (**pbFormat** is **NULL**), the following default values are used:
  * 
  * -   **dwOffset**: 0
  * -   **dwPacketLength**: 188
  * -   **dwStride**: 188
 * @see https://learn.microsoft.com/windows/win32/DirectShow/mpeg2-transport-stride
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class MPEG2_TRANSPORT_STRIDE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies the offset, in bytes, from the beginning of the packet to the first byte of the embedded transport packet. The value must range from zero to `(dwStride - dwPacketLength)`, inclusive.
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the length of the embedded transport packet, in bytes. For standard MPEG-2 transport packets, the value must be 188 bytes.
     * @type {Integer}
     */
    dwPacketLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the length of the entire stride packet, in bytes. The value must be at least `(dwOffset + dwPacketLength)`.
     * @type {Integer}
     */
    dwStride {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
