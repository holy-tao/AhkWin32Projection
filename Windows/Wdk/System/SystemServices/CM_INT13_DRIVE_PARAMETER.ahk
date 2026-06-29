#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_INT13_DRIVE_PARAMETER {
    #StructPack 4

    DriveSelect : UInt16

    MaxCylinders : UInt32

    SectorsPerTrack : UInt16

    MaxHeads : UInt16

    NumberDrives : UInt16

}
