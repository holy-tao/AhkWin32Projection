#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the loopback mode for an AUDIOCLIENT_ACTIVATION_PARAMS structure passed into a call to ActivateAudioInterfaceAsync.
 * @see https://learn.microsoft.com/windows/win32/api/audioclientactivationparams/ne-audioclientactivationparams-process_loopback_mode
 * @namespace Windows.Win32.Media.Audio
 */
export default struct PROCESS_LOOPBACK_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Render streams from the specified process and its child processes are included in the activated process loopback stream.
     * @type {Integer (Int32)}
     */
    static PROCESS_LOOPBACK_MODE_INCLUDE_TARGET_PROCESS_TREE => 0

    /**
     * Render streams from the specified process and its child processes are excluded from the activated process loopback stream.
     * @type {Integer (Int32)}
     */
    static PROCESS_LOOPBACK_MODE_EXCLUDE_TARGET_PROCESS_TREE => 1
}
