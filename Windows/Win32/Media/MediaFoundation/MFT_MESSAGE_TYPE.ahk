#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines messages for a Media Foundation transform (MFT).
 * @remarks
 * 
 * Some messages require specific actions from the MFT. These events have "MESSAGE" in the message name. Other messages are informational; they notify the MFT of some action by the client, and do not require any particular response from the MFT. These messages have "NOTIFY" in the messages name. Except where noted, an MFT should not rely on the client sending notification messages.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/ne-mftransform-mft_message_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFT_MESSAGE_TYPE extends Win32Enum{

    /**
     * Requests the MFT to flush all stored data. 
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-message-command-flush">MFT_MESSAGE_COMMAND_FLUSH</a>.
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_COMMAND_FLUSH => 0

    /**
     * Requests the MFT to drain any stored data.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-message-command-drain">MFT_MESSAGE_COMMAND_DRAIN</a>.
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_COMMAND_DRAIN => 1

    /**
     * Sets or clears the <a href="https://docs.microsoft.com/windows/desktop/medfound/direct3d-device-manager">Direct3D Device Manager</a> for DirectX Video Accereration (DXVA).
     *             
     *             
     *           
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-message-set-d3d-manager">MFT_MESSAGE_SET_D3D_MANAGER</a>.
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_SET_D3D_MANAGER => 2

    /**
     * <b>Note</b> Requires Windows 7.
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_DROP_SAMPLES => 3

    /**
     * <b>Note</b> Requires Windows 8.
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_COMMAND_TICK => 4

    /**
     * Notifies the MFT that streaming is about to begin.
     *             
     *           
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-message-notify-begin-streaming">MFT_MESSAGE_NOTIFY_BEGIN_STREAMING</a>.
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_NOTIFY_BEGIN_STREAMING => 268435456

    /**
     * Notifies the MFT that streaming is about to end.
     *             
     *           
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-message-notify-end-streaming">MFT_MESSAGE_NOTIFY_END_STREAMING</a>.
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_NOTIFY_END_STREAMING => 268435457

    /**
     * Notifies the MFT that an input stream has ended.
     *             
     *           
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-message-notify-end-of-stream">MFT_MESSAGE_NOTIFY_END_OF_STREAM</a>.
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_NOTIFY_END_OF_STREAM => 268435458

    /**
     * Notifies the MFT that the first sample is about to be processed. 
     * 
     * See
     *             
     *            <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-message-notify-start-of-stream">MFT_MESSAGE_NOTIFY_START_OF_STREAM</a>.
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_NOTIFY_START_OF_STREAM => 268435459

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_NOTIFY_RELEASE_RESOURCES => 268435460

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_NOTIFY_REACQUIRE_RESOURCES => 268435461

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_NOTIFY_EVENT => 268435462

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_COMMAND_SET_OUTPUT_STREAM_STATE => 268435463

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_COMMAND_FLUSH_OUTPUT_STREAM => 268435464

    /**
     * Marks a point in the stream. This message applies only to asynchronous MFTs. 
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-message-command-marker">MFT_MESSAGE_COMMAND_MARKER</a>.
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFT_MESSAGE_COMMAND_MARKER => 536870912
}
