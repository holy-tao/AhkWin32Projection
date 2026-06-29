#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the DVD region as reported by the local system components.
 * @remarks
 * The AM_PROPERTY_DVDCOPY_REGION property uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-dvd_region
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_REGION {
    #StructPack 1

    /**
     * Specifies whether the disk is copy protected.
     */
    CopySystem : Int8

    /**
     * Contains information about the region from the decoder.
     */
    RegionData : Int8

    /**
     * Contains information about region from DVD drive.
     */
    SystemRegion : Int8

    /**
     * Reserved.
     */
    ResetCount : Int8

}
