#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AudioClientProperties structure (audioclient.h) is used to set the parameters that describe the properties of the client's audio stream.
 * @remarks
 * Starting with Windows 10, hardware-offloaded audio streams must be event driven. This means that if you call <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient2-setclientproperties">IAudioClient2::SetClientProperties</a> and set the <i>bIsOffload</i> parameter of the <b>AudioClientProperties</b> to TRUE, you must specify the <b>AUDCLNT_STREAMFLAGS_EVENTCALLBACK</b> flag in the <i>StreamFlags</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a>.
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ns-audioclient-audioclientproperties~r1
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AudioClientProperties extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The size of the <b>AudioClientProperties</b> structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Boolean value to indicate whether or not the audio stream is hardware-offloaded.
     * @type {BOOL}
     */
    bIsOffload {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * An enumeration that is used to specify the category of the audio stream.
     * @type {Integer}
     */
    eCategory {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Options {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
