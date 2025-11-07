#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DVD_MUA_Coeff structure defines the mixing coefficients for one channel in a multichannel audio stream. The DVD_MultichannelAudioAttributes structure contains an array of eight DVD_MUA_Coeff structures, one for each channel in the stream.
 * @remarks
 * 
 * The information contained in this structure reflects the mixing coefficients as authored on the digital video disc (DVD). An application cannot modify these values or otherwise use them unless it is also decoding the audio. In the typical DVD filter graph, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter does not send this information to the decoder.
 * 
 * The alpha coefficient is used to mix to audio channel 0 and the beta coefficient is used to mix to audio channel 1. In general, the following formula calculates the mixing coefficients.
 * 
 * <div class="code"><span codelanguage="ManagedCPlusPlus"><table>
 * <tr>
 * <th>C++</th>
 * </tr>
 * <tr>
 * <td>
 * <pre>
 * Audio channel 0 = coeff[0].alpha * value[0] + coeff[1].alpha * value[1] + ... 
 * Audio channel 1 = coeff[0].beta * value[0]  + coeff[1].beta * value[1] + ... 
 * </pre>
 * </td>
 * </tr>
 * </table></span></div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-dvd_mua_coeff
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_MUA_Coeff extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The mixing coefficient for this channel to channel 0.
     * @type {Float}
     */
    log2_alpha {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The mixing coefficient for this channel to channel 1.
     * @type {Float}
     */
    log2_beta {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }
}
