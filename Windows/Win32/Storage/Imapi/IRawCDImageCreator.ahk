#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IRawCDImageTrackInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to create a RAW CD image for use in writing to CD media in Disc-at-Once (DAO) mode. Images created with this interface can be written to CD media using the IDiscFormat2RawCD interface.
 * @remarks
 * 
  * Images created with this interface can be written to persistent storage for later use, or can be provided directly to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2rawcd">IDiscFormat2RawCD</a> interface for writing to CD media.
  * 
  * DVD media does not support this type of writing.
  * 
  * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-irawcdimagecreator
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IRawCDImageCreator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawCDImageCreator
     * @type {Guid}
     */
    static IID => Guid("{25983550-9d65-49ce-b335-40630d901227}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateResultImage", "AddTrack", "AddSpecialPregap", "AddSubcodeRWGenerator", "put_ResultingImageType", "get_ResultingImageType", "get_StartOfLeadout", "put_StartOfLeadoutLimit", "get_StartOfLeadoutLimit", "put_DisableGaplessAudio", "get_DisableGaplessAudio", "put_MediaCatalogNumber", "get_MediaCatalogNumber", "put_StartingTrackNumber", "get_StartingTrackNumber", "get_TrackInfo", "get_NumberOfExistingTracks", "get_LastUsedUserSectorInImage", "get_ExpectedTableOfContents"]

    /**
     * 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-createresultimage
     */
    CreateResultImage() {
        result := ComCall(7, this, "ptr*", &resultStream := 0, "HRESULT")
        return IStream(resultStream)
    }

    /**
     * 
     * @param {Integer} dataType 
     * @param {IStream} data 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-addtrack
     */
    AddTrack(dataType, data) {
        result := ComCall(8, this, "int", dataType, "ptr", data, "int*", &trackIndex := 0, "HRESULT")
        return trackIndex
    }

    /**
     * 
     * @param {IStream} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-addspecialpregap
     */
    AddSpecialPregap(data) {
        result := ComCall(9, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} subcode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-addsubcoderwgenerator
     */
    AddSubcodeRWGenerator(subcode) {
        result := ComCall(10, this, "ptr", subcode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-put_resultingimagetype
     */
    put_ResultingImageType(value) {
        result := ComCall(11, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-get_resultingimagetype
     */
    get_ResultingImageType() {
        result := ComCall(12, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-get_startofleadout
     */
    get_StartOfLeadout() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-put_startofleadoutlimit
     */
    put_StartOfLeadoutLimit(value) {
        result := ComCall(14, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-get_startofleadoutlimit
     */
    get_StartOfLeadoutLimit() {
        result := ComCall(15, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-put_disablegaplessaudio
     */
    put_DisableGaplessAudio(value) {
        result := ComCall(16, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-get_disablegaplessaudio
     */
    get_DisableGaplessAudio() {
        result := ComCall(17, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-put_mediacatalognumber
     */
    put_MediaCatalogNumber(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(18, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-get_mediacatalognumber
     */
    get_MediaCatalogNumber() {
        value := BSTR()
        result := ComCall(19, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-put_startingtracknumber
     */
    put_StartingTrackNumber(value) {
        result := ComCall(20, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-get_startingtracknumber
     */
    get_StartingTrackNumber() {
        result := ComCall(21, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} trackIndex 
     * @returns {IRawCDImageTrackInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-get_trackinfo
     */
    get_TrackInfo(trackIndex) {
        result := ComCall(22, this, "int", trackIndex, "ptr*", &value := 0, "HRESULT")
        return IRawCDImageTrackInfo(value)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-get_numberofexistingtracks
     */
    get_NumberOfExistingTracks() {
        result := ComCall(23, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-get_lastusedusersectorinimage
     */
    get_LastUsedUserSectorInImage() {
        result := ComCall(24, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-get_expectedtableofcontents
     */
    get_ExpectedTableOfContents() {
        result := ComCall(25, this, "ptr*", &value := 0, "HRESULT")
        return value
    }
}
