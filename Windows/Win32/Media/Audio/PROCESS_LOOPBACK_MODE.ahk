#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the loopback mode for an AUDIOCLIENT_ACTIVATION_PARAMS structure passed into a call to ActivateAudioInterfaceAsync.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioclientactivationparams/ne-audioclientactivationparams-process_loopback_mode
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class PROCESS_LOOPBACK_MODE{

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
