#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the activation type for an AUDIOCLIENT_ACTIVATION_PARAMS structure passed into a call to ActivateAudioInterfaceAsync.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audioclientactivationparams/ne-audioclientactivationparams-audioclient_activation_type
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDIOCLIENT_ACTIVATION_TYPE{

    /**
     * Default activation.
     * @type {Integer (Int32)}
     */
    static AUDIOCLIENT_ACTIVATION_TYPE_DEFAULT => 0

    /**
     * Process loopback activation, allowing for the inclusion or exclusion of audio rendered by the specified process and its child processes.
     * @type {Integer (Int32)}
     */
    static AUDIOCLIENT_ACTIVATION_TYPE_PROCESS_LOOPBACK => 1
}
