#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Reports the current frame position from the device to the clients.
 * @remarks
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/ns-audioengineendpoint-ae_current_position
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class AE_CURRENT_POSITION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The device position, in frames.
     * @type {Integer}
     */
    u64DevicePosition {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The stream position, in frames, used to determine the starting point for audio capture and the render device position relative to the stream.
     * @type {Integer}
     */
    u64StreamPosition {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The amount of padding, in frames, between the current position and the stream fill point.
     * @type {Integer}
     */
    u64PaddingFrames {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A translated quality performance counter (QPC) timer value taken at the time that the <b>u64DevicePosition</b> member was checked.
     * @type {Integer}
     */
    hnsQPCPosition {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The calculated data rate at the point at the time the  position was set.
     * @type {Float}
     */
    f32FramesPerSecond {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/ne-audioengineendpoint-ae_position_flags">AE_POSITION_FLAGS</a> enumeration that indicates the validity of the position information.
     * @type {Integer}
     */
    Flag {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
