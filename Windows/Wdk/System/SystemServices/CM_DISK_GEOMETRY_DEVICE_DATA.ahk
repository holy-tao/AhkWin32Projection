#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_DISK_GEOMETRY_DEVICE_DATA {
    #StructPack 4

    BytesPerSector : UInt32

    NumberOfCylinders : UInt32

    SectorsPerTrack : UInt32

    NumberOfHeads : UInt32

}
