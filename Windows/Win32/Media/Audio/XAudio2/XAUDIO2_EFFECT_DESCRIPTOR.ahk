#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an XAPO for use in an effect chain.
 * @remarks
 * XAPO instances are passed to XAudio2 as <b>IUnknown</b> interfaces and XAudio2 uses <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ee418457(v=vs.85)">IXAPO::QueryInterface</a> to acquire an <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nn-xapo-ixapo">IXAPO</a> interface and to detect whether the XAPO implements the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nn-xapo-ixapoparameters">IXAPOParameters</a> interface.
 * 
 * 
 * 
 * For additional information on using XAPOs with XAudio2 see <a href="https://docs.microsoft.com/windows/desktop/xaudio2/how-to--create-an-effect-chain">How to: Create an Effect Chain</a> and <a href="https://docs.microsoft.com/windows/desktop/xaudio2/how-to--use-an-xapo-in-xaudio2">How to: Use an XAPO in XAudio2</a>.
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/ns-xaudio2-xaudio2_effect_descriptor
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAUDIO2_EFFECT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to the <b>IUnknown</b> interface of the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xapo-overview">XAPO</a> object.
     * @type {IUnknown}
     */
    pEffect {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * TRUE if the effect should begin in the enabled state. Otherwise, FALSE.
     * @type {BOOL}
     */
    InitialState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Number of output channels the effect should produce.
     * @type {Integer}
     */
    OutputChannels {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
