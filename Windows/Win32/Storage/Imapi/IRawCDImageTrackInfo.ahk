#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to track per-track properties that are applied to CD media.
 * @remarks
 * 
 * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-irawcdimagetrackinfo
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IRawCDImageTrackInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawCDImageTrackInfo
     * @type {Guid}
     */
    static IID => Guid("{25983551-9d65-49ce-b335-40630d901227}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartingLba", "get_SectorCount", "get_TrackNumber", "get_SectorType", "get_ISRC", "put_ISRC", "get_DigitalAudioCopySetting", "put_DigitalAudioCopySetting", "get_AudioHasPreemphasis", "put_AudioHasPreemphasis", "get_TrackIndexes", "AddTrackIndex", "ClearTrackIndex"]

    /**
     * @type {Integer} 
     */
    StartingLba {
        get => this.get_StartingLba()
    }

    /**
     * @type {Integer} 
     */
    SectorCount {
        get => this.get_SectorCount()
    }

    /**
     * @type {Integer} 
     */
    TrackNumber {
        get => this.get_TrackNumber()
    }

    /**
     * @type {Integer} 
     */
    SectorType {
        get => this.get_SectorType()
    }

    /**
     * @type {BSTR} 
     */
    ISRC {
        get => this.get_ISRC()
        set => this.put_ISRC(value)
    }

    /**
     * @type {Integer} 
     */
    DigitalAudioCopySetting {
        get => this.get_DigitalAudioCopySetting()
        set => this.put_DigitalAudioCopySetting(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AudioHasPreemphasis {
        get => this.get_AudioHasPreemphasis()
        set => this.put_AudioHasPreemphasis(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    TrackIndexes {
        get => this.get_TrackIndexes()
    }

    /**
     * Retrieves the LBA of the first user sectors in this track.
     * @returns {Integer} The LBA of the first user sectors in this track.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-get_startinglba
     */
    get_StartingLba() {
        result := ComCall(7, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of user sectors in this track.
     * @returns {Integer} The number of user sectors in this track.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-get_sectorcount
     */
    get_SectorCount() {
        result := ComCall(8, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the track number for this track.
     * @returns {Integer} The track number for this track.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-get_tracknumber
     */
    get_TrackNumber() {
        result := ComCall(9, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the type of data provided for the sectors in this track. For more detail on the possible sector types, see IMAPI_CD_SECTOR_TYPE.
     * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_cd_sector_type">IMAPI_CD_SECTOR_TYPE</a> enumeration that specifies the type of data provided for the sectors on the track.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-get_sectortype
     */
    get_SectorType() {
        result := ComCall(10, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the International Standard Recording Code (ISRC) currently associated with the track. This property value defaults to NULL (or a zero-length string) and may only be set for tracks containing audio data.
     * @returns {BSTR} The ISRC currently associated with the track.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-get_isrc
     */
    get_ISRC() {
        value := BSTR()
        result := ComCall(11, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * Sets the International Standard Recording Code (ISRC) currently associated with the track. This property value defaults to NULL (or a zero-length string) and may only be set for tracks containing audio data.
     * @param {BSTR} value The ISRC to associate with the track.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-put_isrc
     */
    put_ISRC(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(12, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the value for the bit that represents the current digital audio copy setting on the resulting media. Please see the IMAPI_CD_TRACK_DIGITAL_COPY_SETTING enumeration for possible values.
     * @returns {Integer} The current digital audio copy setting.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-get_digitalaudiocopysetting
     */
    get_DigitalAudioCopySetting() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the digital audio copy &quot;Allowed&quot; bit to one of three values on the resulting media. Please see the IMAPI_CD_TRACK_DIGITAL_COPY_SETTING enumeration for additional information on each possible value.
     * @param {Integer} value The digital audio copy setting value to assign.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-put_digitalaudiocopysetting
     */
    put_DigitalAudioCopySetting(value) {
        result := ComCall(14, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the value that specifies if an audio track has an additional pre-emphasis added to the audio data.
     * @returns {VARIANT_BOOL} Value that specifies if an audio track has an additional pre-emphasis added to the audio data.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-get_audiohaspreemphasis
     */
    get_AudioHasPreemphasis() {
        result := ComCall(15, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the value that specifies if an audio track has an additional pre-emphasis added to the audio data prior to being written to CD.
     * @param {VARIANT_BOOL} value Value that specifies if an audio track has an additional pre-emphasis added to the audio data.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-put_audiohaspreemphasis
     */
    put_AudioHasPreemphasis(value) {
        result := ComCall(16, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the one-based index of the tracks on the disc.
     * @returns {Pointer<SAFEARRAY>} The one-based index associated with this track.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-irawcdimagetrackinfo-get_trackindexes
     */
    get_TrackIndexes() {
        result := ComCall(17, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} lbaOffset 
     * @returns {HRESULT} 
     */
    AddTrackIndex(lbaOffset) {
        result := ComCall(18, this, "int", lbaOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lbaOffset 
     * @returns {HRESULT} 
     */
    ClearTrackIndex(lbaOffset) {
        result := ComCall(19, this, "int", lbaOffset, "HRESULT")
        return result
    }
}
