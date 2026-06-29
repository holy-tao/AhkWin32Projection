#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESS_LOOPBACK_MODE.ahk" { PROCESS_LOOPBACK_MODE }

/**
 * Specifies parameters for a call to ActivateAudioInterfaceAsync where loopback activation is requested.
 * @see https://learn.microsoft.com/windows/win32/api/audioclientactivationparams/ns-audioclientactivationparams-audioclient_process_loopback_params
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AUDIOCLIENT_PROCESS_LOOPBACK_PARAMS {
    #StructPack 4

    /**
     * The ID of the process for which the render streams, and the render streams of its child processes, will be included or excluded when activating the process loopback stream.
     */
    TargetProcessId : UInt32

    /**
     * A value from the [PROCESS_LOOPBACK_MODE](ne-audioclientactivationparams-process_loopback_mode.md) enumeration specifying whether the render streams for the process and child processes specified in the *TargetProcessId* field should be included or excluded when activating the audio interface. For sample code that demonstrates the process loopback capture scenario, see the [Application Loopback API Capture Sample](https://docs.microsoft.com/en-us/samples/microsoft/windows-classic-samples/applicationloopbackaudio-sample/).
     */
    ProcessLoopbackMode : PROCESS_LOOPBACK_MODE

}
