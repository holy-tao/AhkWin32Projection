#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk

/**
 * IMFAudioMediaType is no longer available for use as of Windows 7.
 * @remarks
 * 
 * <b>Windows Server 2008 and Windows Vista:  </b>If the major type of a media type is <b>MFMediaType_Audio</b>, you can query the media type object for the <b>IMFAudioMediaType</b> interface.
 * 
 * To convert an audio media type into a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatewaveformatexfrommfmediatype">MFCreateWaveFormatExFromMFMediaType</a>.
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfaudiomediatype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAudioMediaType extends IMFMediaType{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFAudioMediaType
     * @type {Guid}
     */
    static IID => Guid("{26a0adc3-ce26-4672-9304-69552edd3faf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 38

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAudioFormat"]

    /**
     * 
     * @returns {Pointer<WAVEFORMATEX>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfaudiomediatype-getaudioformat
     */
    GetAudioFormat() {
        result := ComCall(38, this, "ptr")
        return result
    }
}
