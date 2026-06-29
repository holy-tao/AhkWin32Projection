#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AE_POSITION_FLAGS.ahk" { AE_POSITION_FLAGS }

/**
 * Reports the current frame position from the device to the clients.
 * @remarks
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/ns-audioengineendpoint-ae_current_position
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct AE_CURRENT_POSITION {
    #StructPack 8

    /**
     * The device position, in frames.
     */
    u64DevicePosition : Int64

    /**
     * The stream position, in frames, used to determine the starting point for audio capture and the render device position relative to the stream.
     */
    u64StreamPosition : Int64

    /**
     * The amount of padding, in frames, between the current position and the stream fill point.
     */
    u64PaddingFrames : Int64

    /**
     * A translated quality performance counter (QPC) timer value taken at the time that the <b>u64DevicePosition</b> member was checked.
     */
    hnsQPCPosition : Int64

    /**
     * The calculated data rate at the point at the time the  position was set.
     */
    f32FramesPerSecond : Float32

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/ne-audioengineendpoint-ae_position_flags">AE_POSITION_FLAGS</a> enumeration that indicates the validity of the position information.
     */
    Flag : AE_POSITION_FLAGS

}
