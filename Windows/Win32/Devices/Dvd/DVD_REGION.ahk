#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies the DVD region as reported by the local system components.
 * @remarks
 * The AM_PROPERTY_DVDCOPY_REGION property uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-dvd_region
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_REGION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Specifies whether the disk is copy protected.
     * @type {Integer}
     */
    CopySystem {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Contains information about the region from the decoder.
     * @type {Integer}
     */
    RegionData {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Contains information about region from DVD drive.
     * @type {Integer}
     */
    SystemRegion {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    ResetCount {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
