#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants for the AE_CURRENT_POSITION structure. These constants describe the degree of validity of the current position.
 * @remarks
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/ne-audioengineendpoint-ae_position_flags
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct AE_POSITION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The position is not valid and must not be used.
     * @type {Integer (Int32)}
     */
    static POSITION_INVALID => 0

    /**
     * The position is valid; however, there has been
     *     a disruption such as a glitch or state transition.
     *     This current position is not correlated with the previous position. The start of a stream should not reflect a discontinuity.
     * @type {Integer (Int32)}
     */
    static POSITION_DISCONTINUOUS => 1

    /**
     * The position is valid. The previous packet and the current packet are both synchronized with the timeline.
     * @type {Integer (Int32)}
     */
    static POSITION_CONTINUOUS => 2

    /**
     * The quality performance counter (QPC) timer value associated with this position is not accurate. This flag is set when a position error is encountered and the implementation is unable to compute an accurate QPC value that correlates with the position.
     * @type {Integer (Int32)}
     */
    static POSITION_QPC_ERROR => 4
}
