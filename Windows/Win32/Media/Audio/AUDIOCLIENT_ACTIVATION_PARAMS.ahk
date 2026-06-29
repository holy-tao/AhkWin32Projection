#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESS_LOOPBACK_MODE.ahk" { PROCESS_LOOPBACK_MODE }
#Import ".\AUDIOCLIENT_PROCESS_LOOPBACK_PARAMS.ahk" { AUDIOCLIENT_PROCESS_LOOPBACK_PARAMS }
#Import ".\AUDIOCLIENT_ACTIVATION_TYPE.ahk" { AUDIOCLIENT_ACTIVATION_TYPE }

/**
 * Specifies the activation parameters for a call to ActivateAudioInterfaceAsync.
 * @see https://learn.microsoft.com/windows/win32/api/audioclientactivationparams/ns-audioclientactivationparams-audioclient_activation_params
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AUDIOCLIENT_ACTIVATION_PARAMS {
    #StructPack 4

    /**
     * A member of the [AUDIOCLIENT_ACTIVATION_TYPE](ns-audioclientactivationparams-audioclient_activation_params) specifying the type of audio interface activation. Currently default activation and loopback activation are supported.
     */
    ActivationType : AUDIOCLIENT_ACTIVATION_TYPE

    ProcessLoopbackParams : AUDIOCLIENT_PROCESS_LOOPBACK_PARAMS

}
