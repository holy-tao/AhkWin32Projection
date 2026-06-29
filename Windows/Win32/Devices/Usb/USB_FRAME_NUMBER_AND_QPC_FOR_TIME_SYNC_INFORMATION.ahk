#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC_INFORMATION {
    #StructPack 8

    TimeTrackingHandle : HANDLE

    InputFrameNumber : UInt32

    InputMicroFrameNumber : UInt32

    QueryPerformanceCounterAtInputFrameOrMicroFrame : Int64

    QueryPerformanceCounterFrequency : Int64

    PredictedAccuracyInMicroSeconds : UInt32

    CurrentGenerationID : UInt32

    CurrentQueryPerformanceCounter : Int64

    CurrentHardwareFrameNumber : UInt32

    CurrentHardwareMicroFrameNumber : UInt32

    CurrentUSBFrameNumber : UInt32

}
