#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AUDIOCLIENT_PROCESS_LOOPBACK_PARAMS.ahk
#Include .\AUDIOCLIENT_ACTIVATION_TYPE.ahk
#Include .\PROCESS_LOOPBACK_MODE.ahk

/**
 * Specifies the activation parameters for a call to ActivateAudioInterfaceAsync.
 * @see https://learn.microsoft.com/windows/win32/api/audioclientactivationparams/ns-audioclientactivationparams-audioclient_activation_params
 * @namespace Windows.Win32.Media.Audio
 */
class AUDIOCLIENT_ACTIVATION_PARAMS extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * A member of the [AUDIOCLIENT_ACTIVATION_TYPE](ns-audioclientactivationparams-audioclient_activation_params) specifying the type of audio interface activation. Currently default activation and loopback activation are supported.
     * @type {AUDIOCLIENT_ACTIVATION_TYPE}
     */
    ActivationType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {AUDIOCLIENT_PROCESS_LOOPBACK_PARAMS}
     */
    ProcessLoopbackParams {
        get {
            if(!this.HasProp("__ProcessLoopbackParams"))
                this.__ProcessLoopbackParams := AUDIOCLIENT_PROCESS_LOOPBACK_PARAMS(4, this)
            return this.__ProcessLoopbackParams
        }
    }
}
