#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IStream>} resultStream 
     * @returns {HRESULT} 
     */
    CreateResultImage(resultStream) {
        result := ComCall(7, this, "ptr", resultStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dataType 
     * @param {Pointer<IStream>} data 
     * @param {Pointer<Int32>} trackIndex 
     * @returns {HRESULT} 
     */
    AddTrack(dataType, data, trackIndex) {
        result := ComCall(8, this, "int", dataType, "ptr", data, "int*", trackIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} data 
     * @returns {HRESULT} 
     */
    AddSpecialPregap(data) {
        result := ComCall(9, this, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} subcode 
     * @returns {HRESULT} 
     */
    AddSubcodeRWGenerator(subcode) {
        result := ComCall(10, this, "ptr", subcode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ResultingImageType(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_ResultingImageType(value) {
        result := ComCall(12, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_StartOfLeadout(value) {
        result := ComCall(13, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StartOfLeadoutLimit(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_StartOfLeadoutLimit(value) {
        result := ComCall(15, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_DisableGaplessAudio(value) {
        result := ComCall(16, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_DisableGaplessAudio(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_MediaCatalogNumber(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_MediaCatalogNumber(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StartingTrackNumber(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_StartingTrackNumber(value) {
        result := ComCall(21, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} trackIndex 
     * @param {Pointer<IRawCDImageTrackInfo>} value 
     * @returns {HRESULT} 
     */
    get_TrackInfo(trackIndex, value) {
        result := ComCall(22, this, "int", trackIndex, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_NumberOfExistingTracks(value) {
        result := ComCall(23, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_LastUsedUserSectorInImage(value) {
        result := ComCall(24, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} value 
     * @returns {HRESULT} 
     */
    get_ExpectedTableOfContents(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
