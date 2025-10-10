#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies parameters for a call to ActivateAudioInterfaceAsync where loopback activation is requested.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioclientactivationparams/ns-audioclientactivationparams-audioclient_process_loopback_params
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDIOCLIENT_PROCESS_LOOPBACK_PARAMS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The ID of the process for which the render streams, and the render streams of its child processes, will be included or excluded when activating the process loopback stream.
     * @type {Integer}
     */
    TargetProcessId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value from the [PROCESS_LOOPBACK_MODE](ne-audioclientactivationparams-process_loopback_mode.md) enumeration specifying whether the render streams for the process and child processes specified in the *TargetProcessId* field should be included or excluded when activating the audio interface.
     * @type {Integer}
     */
    ProcessLoopbackMode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
