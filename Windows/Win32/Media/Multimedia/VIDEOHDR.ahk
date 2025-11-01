#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VIDEOHDR structure is used by the capVideoStreamCallback function.
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-videohdr
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class VIDEOHDR extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Pointer to locked data buffer.
     * @type {Pointer<Integer>}
     */
    lpData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Length of data buffer.
     * @type {Integer}
     */
    dwBufferLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Bytes actually used.
     * @type {Integer}
     */
    dwBytesUsed {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Milliseconds from start of stream.
     * @type {Integer}
     */
    dwTimeCaptured {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * User-defined data.
     * @type {Pointer}
     */
    dwUser {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The flags are defined as follows.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>VHDR_DONE</td>
     * <td>Done bit</td>
     * </tr>
     * <tr>
     * <td>VHDR_PREPARED</td>
     * <td>Set if this header has been prepared</td>
     * </tr>
     * <tr>
     * <td>VHDR_INQUEUE</td>
     * <td>Reserved for driver</td>
     * </tr>
     * <tr>
     * <td>VHDR_KEYFRAME</td>
     * <td>Key Frame</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved for driver.
     * @type {Array<UIntPtr>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 40, 4, Primitive, "ptr")
            return this.__dwReservedProxyArray
        }
    }
}
