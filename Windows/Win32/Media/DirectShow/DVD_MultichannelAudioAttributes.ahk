#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DVD_MUA_MixingInfo.ahk
#Include .\DVD_MUA_Coeff.ahk

/**
 * The DVD_MultichannelAudioAttributes structure describes the multichannel attributes of one audio stream within a specified title.
 * @remarks
 * The [DVD_TitleAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_titleattributes) structure contains an array of up to eight <b>DVD_MultichannelAudioAttributes</b> structures. When <c>DVD_TitleAttributes</c> is filled by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-gettitleattributes">IDvdInfo2::GetTitleAttributes</a> method, the array will be populated with one <b>DVD_MultichannelAudioAttributes</b> structure for each available audio stream in the title.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_multichannelaudioattributes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_MultichannelAudioAttributes extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Array of eight [DVD_MUA_MixingInfo](/windows/desktop/api/strmif/ns-strmif-dvd_mua_mixinginfo) structures, which contain the mixing information for each channel in the audio stream.
     * @type {Array<DVD_MUA_MixingInfo>}
     */
    Info{
        get {
            if(!this.HasProp("__InfoProxyArray"))
                this.__InfoProxyArray := Win32FixedArray(this.ptr + 0, 8, DVD_MUA_MixingInfo, "")
            return this.__InfoProxyArray
        }
    }

    /**
     * Array of eight [DVD_MUA_Coeff](/windows/desktop/api/strmif/ns-strmif-dvd_mua_coeff) structures, which contain the mixing coefficients for each channel in the audio stream.
     * @type {Array<DVD_MUA_Coeff>}
     */
    Coeff{
        get {
            if(!this.HasProp("__CoeffProxyArray"))
                this.__CoeffProxyArray := Win32FixedArray(this.ptr + 64, 8, DVD_MUA_Coeff, "")
            return this.__CoeffProxyArray
        }
    }
}
