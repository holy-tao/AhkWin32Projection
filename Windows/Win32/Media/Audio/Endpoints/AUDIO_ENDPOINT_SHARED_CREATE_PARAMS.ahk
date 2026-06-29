#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\EndpointConnectorType.ahk" { EndpointConnectorType }

/**
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct AUDIO_ENDPOINT_SHARED_CREATE_PARAMS {
    #StructPack 4

    u32Size : UInt32

    u32TSSessionId : UInt32

    targetEndpointConnectorType : EndpointConnectorType

    wfxDeviceFormat : WAVEFORMATEX

}
