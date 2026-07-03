#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\JOB_OBJECT_IO_RATE_CONTROL_FLAGS.ahk" { JOB_OBJECT_IO_RATE_CONTROL_FLAGS }

/**
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V2 {
    #StructPack 8

    MaxIops : Int64

    MaxBandwidth : Int64

    ReservationIops : Int64

    VolumeName : PWSTR

    BaseIoSize : UInt32

    ControlFlags : JOB_OBJECT_IO_RATE_CONTROL_FLAGS

    VolumeNameLength : UInt16

    CriticalReservationIops : Int64

    ReservationBandwidth : Int64

    CriticalReservationBandwidth : Int64

    MaxTimePercent : Int64

    ReservationTimePercent : Int64

    CriticalReservationTimePercent : Int64

}
