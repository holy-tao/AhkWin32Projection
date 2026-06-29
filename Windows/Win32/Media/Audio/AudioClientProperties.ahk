#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUDCLNT_STREAMOPTIONS.ahk" { AUDCLNT_STREAMOPTIONS }
#Import ".\AUDIO_STREAM_CATEGORY.ahk" { AUDIO_STREAM_CATEGORY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The AudioClientProperties structure (audioclient.h) is used to set the parameters that describe the properties of the client's audio stream.
 * @remarks
 * Starting with Windows 10, hardware-offloaded audio streams must be event driven. This means that if you call <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient2-setclientproperties">IAudioClient2::SetClientProperties</a> and set the <i>bIsOffload</i> parameter of the <b>AudioClientProperties</b> to TRUE, you must specify the <b>AUDCLNT_STREAMFLAGS_EVENTCALLBACK</b> flag in the <i>StreamFlags</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a>.
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ns-audioclient-audioclientproperties~r1
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AudioClientProperties {
    #StructPack 4

    /**
     * The size of the <b>AudioClientProperties</b> structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Boolean value to indicate whether or not the audio stream is hardware-offloaded.
     */
    bIsOffload : BOOL

    /**
     * An enumeration that is used to specify the category of the audio stream.
     */
    eCategory : AUDIO_STREAM_CATEGORY

    Options : AUDCLNT_STREAMOPTIONS

}
