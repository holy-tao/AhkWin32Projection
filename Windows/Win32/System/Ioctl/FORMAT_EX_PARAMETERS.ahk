#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used in formatting a contiguous set of disk tracks. It is used by the IOCTL_DISK_FORMAT_TRACKS_EX control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-format_ex_parameters
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FORMAT_EX_PARAMETERS extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * The media type. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-media_type">MEDIA_TYPE</a>.
     * @type {Integer}
     */
    MediaType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The cylinder number at which to begin the format.
     * @type {Integer}
     */
    StartCylinderNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The cylinder number at which to end the format.
     * @type {Integer}
     */
    EndCylinderNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The beginning head location.
     * @type {Integer}
     */
    StartHeadNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The ending head location.
     * @type {Integer}
     */
    EndHeadNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The length of the gap between two successive sectors on a track.
     * @type {Integer}
     */
    FormatGapLength {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * The number of sectors in each track.
     * @type {Integer}
     */
    SectorsPerTrack {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * An array of values specifying the sector numbers of the sectors to be included in the track to be formatted.
     * @type {Array<UInt16>}
     */
    SectorNumber{
        get {
            if(!this.HasProp("__SectorNumberProxyArray"))
                this.__SectorNumberProxyArray := Win32FixedArray(this.ptr + 24, 2, Primitive, "ushort")
            return this.__SectorNumberProxyArray
        }
    }
}
