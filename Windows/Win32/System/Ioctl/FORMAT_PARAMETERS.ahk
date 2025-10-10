#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used in formatting a contiguous set of disk tracks.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-format_parameters
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FORMAT_PARAMETERS extends Win32Struct
{
    static sizeof => 20

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
}
