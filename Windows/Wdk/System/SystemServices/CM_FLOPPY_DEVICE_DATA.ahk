#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_FLOPPY_DEVICE_DATA {
    #StructPack 4

    Version : UInt16

    Revision : UInt16

    Size : CHAR[8]

    MaxDensity : UInt32

    MountDensity : UInt32

    StepRateHeadUnloadTime : Int8

    HeadLoadTime : Int8

    MotorOffTime : Int8

    SectorLengthCode : Int8

    SectorPerTrack : Int8

    ReadWriteGapLength : Int8

    DataTransferLength : Int8

    FormatGapLength : Int8

    FormatFillCharacter : Int8

    HeadSettleTime : Int8

    MotorSettleTime : Int8

    MaximumTrackValue : Int8

    DataTransferRate : Int8

}
