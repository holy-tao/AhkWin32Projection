#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines messages for an enhanced video renderer (EVR) presenter.
 * @see https://learn.microsoft.com/windows/win32/api/evr/ne-evr-mfvp_message_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVP_MESSAGE_TYPE{

    /**
     * The presenter should discard any pending samples. The <i>ulParam</i> parameter is not used and should be zero.
     * @type {Integer (Int32)}
     */
    static MFVP_MESSAGE_FLUSH => 0

    /**
     * The mixer's output format has changed. The EVR will initiate format negotiation. The <i>ulParam</i> parameter is not used and should be zero.
     * @type {Integer (Int32)}
     */
    static MFVP_MESSAGE_INVALIDATEMEDIATYPE => 1

    /**
     * One input stream on the mixer has received a new sample. The <i>ulParam</i> parameter is not used and should be zero.
     * @type {Integer (Int32)}
     */
    static MFVP_MESSAGE_PROCESSINPUTNOTIFY => 2

    /**
     * The EVR switched from stopped to paused. The presenter should allocate resources. The <i>ulParam</i> parameter is not used and should be zero.
     * @type {Integer (Int32)}
     */
    static MFVP_MESSAGE_BEGINSTREAMING => 3

    /**
     * The EVR switched from running or paused to stopped. The presenter should free resources. The <i>ulParam</i> parameter is not used and should be zero.
     * @type {Integer (Int32)}
     */
    static MFVP_MESSAGE_ENDSTREAMING => 4

    /**
     * All streams have ended. The <i>ulParam</i> parameter is not used and should be zero.
     * @type {Integer (Int32)}
     */
    static MFVP_MESSAGE_ENDOFSTREAM => 5

    /**
     * Requests a frame step. The lower <b>DWORD</b> of the <i>ulParam</i> parameter contains the number of frames to step. If the value is <i>N</i>, the presenter should skip <i>N</i>–1 frames and display the <i>N</i>th frame. When that frame has been displayed, the presenter should send an <b>EC_STEP_COMPLETE</b> event to the EVR. If the presenter is not paused when it receives this message, it should return MF_E_INVALIDREQUEST.
     * @type {Integer (Int32)}
     */
    static MFVP_MESSAGE_STEP => 6

    /**
     * Cancels a frame step. The <i>ulParam</i> parameter is not used and should be zero.
     * @type {Integer (Int32)}
     */
    static MFVP_MESSAGE_CANCELSTEP => 7
}
