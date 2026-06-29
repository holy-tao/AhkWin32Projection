#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_MUA_Coeff.ahk" { DVD_MUA_Coeff }
#Import ".\DVD_MUA_MixingInfo.ahk" { DVD_MUA_MixingInfo }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DVD_MultichannelAudioAttributes structure describes the multichannel attributes of one audio stream within a specified title.
 * @remarks
 * The [DVD_TitleAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_titleattributes) structure contains an array of up to eight <b>DVD_MultichannelAudioAttributes</b> structures. When <c>DVD_TitleAttributes</c> is filled by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-gettitleattributes">IDvdInfo2::GetTitleAttributes</a> method, the array will be populated with one <b>DVD_MultichannelAudioAttributes</b> structure for each available audio stream in the title.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_multichannelaudioattributes
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_MultichannelAudioAttributes {
    #StructPack 8

    /**
     * Array of eight [DVD_MUA_MixingInfo](/windows/desktop/api/strmif/ns-strmif-dvd_mua_mixinginfo) structures, which contain the mixing information for each channel in the audio stream.
     */
    Info : DVD_MUA_MixingInfo[8]

    /**
     * Array of eight [DVD_MUA_Coeff](/windows/desktop/api/strmif/ns-strmif-dvd_mua_coeff) structures, which contain the mixing coefficients for each channel in the audio stream.
     */
    Coeff : DVD_MUA_Coeff[8]

}
