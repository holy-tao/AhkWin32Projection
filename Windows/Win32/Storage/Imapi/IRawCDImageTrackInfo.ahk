#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMAPI_CD_TRACK_DIGITAL_COPY_SETTING.ahk" { IMAPI_CD_TRACK_DIGITAL_COPY_SETTING }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IMAPI_CD_SECTOR_TYPE.ahk" { IMAPI_CD_SECTOR_TYPE }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Use this interface to track per-track properties that are applied to CD media.
 * @remarks
 * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-irawcdimagetrackinfo
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IRawCDImageTrackInfo extends IDispatch {
    /**
     * The interface identifier for IRawCDImageTrackInfo
     * @type {Guid}
     */
    static IID := Guid("{25983551-9d65-49ce-b335-40630d901227}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRawCDImageTrackInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StartingLba             : IntPtr
        get_SectorCount             : IntPtr
        get_TrackNumber             : IntPtr
        get_SectorType              : IntPtr
        get_ISRC                    : IntPtr
        put_ISRC                    : IntPtr
        get_DigitalAudioCopySetting : IntPtr
        put_DigitalAudioCopySetting : IntPtr
        get_AudioHasPreemphasis     : IntPtr
        put_AudioHasPreemphasis     : IntPtr
        get_TrackIndexes            : IntPtr
        AddTrackIndex               : IntPtr
        ClearTrackIndex             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRawCDImageTrackInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {IMAPI_CD_SECTOR_TYPE} 
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
     * @type {IMAPI_CD_TRACK_DIGITAL_COPY_SETTING} 
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
     * @remarks
     * Most tracks also include a pregap and postgap, which are not included in this value.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Integer} The LBA of the first user sectors in this track.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_startinglba
     */
    get_StartingLba() {
        result := ComCall(7, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of user sectors in this track.
     * @remarks
     * The end of the track is typically the <b>StartingLBA</b> plus the <b>SectorCount</b>.  The start of the next track includes both of these properties plus any required pregap or postgap.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Integer} The number of user sectors in this track.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_sectorcount
     */
    get_SectorCount() {
        result := ComCall(8, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the track number for this track.
     * @remarks
     * While this value is often identical to the <b>TrackIndex</b> property, it is possible for pure audio discs to start with a track other than track number 1.  This means that the more general formula is that this value is ( TrackIndex + FirstTrackNumber - 1).
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Integer} The track number for this track.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_tracknumber
     */
    get_TrackNumber() {
        result := ComCall(9, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the type of data provided for the sectors in this track. For more detail on the possible sector types, see IMAPI_CD_SECTOR_TYPE.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {IMAPI_CD_SECTOR_TYPE} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_cd_sector_type">IMAPI_CD_SECTOR_TYPE</a> enumeration that specifies the type of data provided for the sectors on the track.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_sectortype
     */
    get_SectorType() {
        result := ComCall(10, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the International Standard Recording Code (ISRC) currently associated with the track. This property value defaults to NULL (or a zero-length string) and may only be set for tracks containing audio data.
     * @remarks
     * The format of the ISRC is provided to the caller formatted per ISRC standards (DIN-31-621) recommendations, such as "US-K7Y-98-12345".  When set, the provided string may optionally exclude all the '-' characters.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {BSTR} The ISRC currently associated with the track.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_isrc
     */
    get_ISRC() {
        value := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * Sets the International Standard Recording Code (ISRC) currently associated with the track. This property value defaults to NULL (or a zero-length string) and may only be set for tracks containing audio data.
     * @remarks
     * The format of the ISRC is provided to the caller formatted per ISRC standards (DIN-31-621) recommendations, such as "US-K7Y-98-12345".  When set, the provided string may optionally exclude all the '-' characters.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {BSTR} value The ISRC to associate with the track.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-put_isrc
     */
    put_ISRC(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(12, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Retrieves the value for the bit that represents the current digital audio copy setting on the resulting media. Please see the IMAPI_CD_TRACK_DIGITAL_COPY_SETTING enumeration for possible values.
     * @remarks
     * This property may only be set for tracks containing audio data.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {IMAPI_CD_TRACK_DIGITAL_COPY_SETTING} The current digital audio copy setting.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_digitalaudiocopysetting
     */
    get_DigitalAudioCopySetting() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the digital audio copy &quot;Allowed&quot; bit to one of three values on the resulting media. Please see the IMAPI_CD_TRACK_DIGITAL_COPY_SETTING enumeration for additional information on each possible value.
     * @remarks
     * This property may only be set for tracks containing audio data.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {IMAPI_CD_TRACK_DIGITAL_COPY_SETTING} value The digital audio copy setting value to assign.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-put_digitalaudiocopysetting
     */
    put_DigitalAudioCopySetting(value) {
        result := ComCall(14, this, IMAPI_CD_TRACK_DIGITAL_COPY_SETTING, value, "HRESULT")
        return result
    }

    /**
     * Retrieves the value that specifies if an audio track has an additional pre-emphasis added to the audio data.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {VARIANT_BOOL} Value that specifies if an audio track has an additional pre-emphasis added to the audio data.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_audiohaspreemphasis
     */
    get_AudioHasPreemphasis() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the value that specifies if an audio track has an additional pre-emphasis added to the audio data prior to being written to CD.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {VARIANT_BOOL} value Value that specifies if an audio track has an additional pre-emphasis added to the audio data.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-put_audiohaspreemphasis
     */
    put_AudioHasPreemphasis(value) {
        result := ComCall(16, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Retrieves the one-based index of the tracks on the disc.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Pointer<SAFEARRAY>} The one-based index associated with this track.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_trackindexes
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

    Query(iid) {
        if (IRawCDImageTrackInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StartingLba := CallbackCreate(GetMethod(implObj, "get_StartingLba"), flags, 2)
        this.vtbl.get_SectorCount := CallbackCreate(GetMethod(implObj, "get_SectorCount"), flags, 2)
        this.vtbl.get_TrackNumber := CallbackCreate(GetMethod(implObj, "get_TrackNumber"), flags, 2)
        this.vtbl.get_SectorType := CallbackCreate(GetMethod(implObj, "get_SectorType"), flags, 2)
        this.vtbl.get_ISRC := CallbackCreate(GetMethod(implObj, "get_ISRC"), flags, 2)
        this.vtbl.put_ISRC := CallbackCreate(GetMethod(implObj, "put_ISRC"), flags, 2)
        this.vtbl.get_DigitalAudioCopySetting := CallbackCreate(GetMethod(implObj, "get_DigitalAudioCopySetting"), flags, 2)
        this.vtbl.put_DigitalAudioCopySetting := CallbackCreate(GetMethod(implObj, "put_DigitalAudioCopySetting"), flags, 2)
        this.vtbl.get_AudioHasPreemphasis := CallbackCreate(GetMethod(implObj, "get_AudioHasPreemphasis"), flags, 2)
        this.vtbl.put_AudioHasPreemphasis := CallbackCreate(GetMethod(implObj, "put_AudioHasPreemphasis"), flags, 2)
        this.vtbl.get_TrackIndexes := CallbackCreate(GetMethod(implObj, "get_TrackIndexes"), flags, 2)
        this.vtbl.AddTrackIndex := CallbackCreate(GetMethod(implObj, "AddTrackIndex"), flags, 2)
        this.vtbl.ClearTrackIndex := CallbackCreate(GetMethod(implObj, "ClearTrackIndex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StartingLba)
        CallbackFree(this.vtbl.get_SectorCount)
        CallbackFree(this.vtbl.get_TrackNumber)
        CallbackFree(this.vtbl.get_SectorType)
        CallbackFree(this.vtbl.get_ISRC)
        CallbackFree(this.vtbl.put_ISRC)
        CallbackFree(this.vtbl.get_DigitalAudioCopySetting)
        CallbackFree(this.vtbl.put_DigitalAudioCopySetting)
        CallbackFree(this.vtbl.get_AudioHasPreemphasis)
        CallbackFree(this.vtbl.put_AudioHasPreemphasis)
        CallbackFree(this.vtbl.get_TrackIndexes)
        CallbackFree(this.vtbl.AddTrackIndex)
        CallbackFree(this.vtbl.ClearTrackIndex)
    }
}
