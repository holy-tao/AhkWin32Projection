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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_startinglba
     */
    get_StartingLba() {
        result := ComCall(7, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_sectorcount
     */
    get_SectorCount() {
        result := ComCall(8, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_tracknumber
     */
    get_TrackNumber() {
        result := ComCall(9, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_sectortype
     */
    get_SectorType() {
        result := ComCall(10, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_isrc
     */
    get_ISRC() {
        value := BSTR()
        result := ComCall(11, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-put_isrc
     */
    put_ISRC(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(12, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_digitalaudiocopysetting
     */
    get_DigitalAudioCopySetting() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-put_digitalaudiocopysetting
     */
    put_DigitalAudioCopySetting(value) {
        result := ComCall(14, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-get_audiohaspreemphasis
     */
    get_AudioHasPreemphasis() {
        result := ComCall(15, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagetrackinfo-put_audiohaspreemphasis
     */
    put_AudioHasPreemphasis(value) {
        result := ComCall(16, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
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
}
