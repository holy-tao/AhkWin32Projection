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
 * Images created with this interface can be written to persistent storage for later use, or can be provided directly to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2rawcd">IDiscFormat2RawCD</a> interface for writing to CD media.
 * 
 * DVD media does not support this type of writing.
 * 
 * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nn-imapi2-irawcdimagecreator
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
     * @type {Integer} 
     */
    ResultingImageType {
        get => this.get_ResultingImageType()
        set => this.put_ResultingImageType(value)
    }

    /**
     * @type {Integer} 
     */
    StartOfLeadout {
        get => this.get_StartOfLeadout()
    }

    /**
     * @type {Integer} 
     */
    StartOfLeadoutLimit {
        get => this.get_StartOfLeadoutLimit()
        set => this.put_StartOfLeadoutLimit(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DisableGaplessAudio {
        get => this.get_DisableGaplessAudio()
        set => this.put_DisableGaplessAudio(value)
    }

    /**
     * @type {BSTR} 
     */
    MediaCatalogNumber {
        get => this.get_MediaCatalogNumber()
        set => this.put_MediaCatalogNumber(value)
    }

    /**
     * @type {Integer} 
     */
    StartingTrackNumber {
        get => this.get_StartingTrackNumber()
        set => this.put_StartingTrackNumber(value)
    }

    /**
     * @type {Integer} 
     */
    NumberOfExistingTracks {
        get => this.get_NumberOfExistingTracks()
    }

    /**
     * @type {Integer} 
     */
    LastUsedUserSectorInImage {
        get => this.get_LastUsedUserSectorInImage()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ExpectedTableOfContents {
        get => this.get_ExpectedTableOfContents()
    }

    /**
     * Creates the final IStream object based on the current settings.
     * @remarks
     * <b>IRawCDImageCreator::CreateResultImage</b> can only be called once, and will result in the object becoming read-only. All properties associated with this object can  be read but not modified.  The resulting <b>IStream</b> object will be a disc image which starts at MSF 95:00:00, to allow writing of a single image to media with multiple starting addresses.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {IStream} Pointer to the finalized IStream object.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-createresultimage
     */
    CreateResultImage() {
        result := ComCall(7, this, "ptr*", &resultStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(resultStream)
    }

    /**
     * Accepts the provided IStream object and saves the interface pointer as the next track in the image.
     * @remarks
     * Any additional tracks must be compatible with all existing tracks.  See the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_cd_sector_type">IMAPI_CD_SECTOR_TYPE</a> enumeration for  information on limitations.
     * 
     * The data stream must be at least 4 seconds (300 sectors) long.  Data stream may not cause final sector to exceed LBA 398,099 (MSF 88:29:74), as leadout would then exceed the MSF 89:59:74 maximum.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {Integer} dataType A  value, defined by  <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_cd_sector_type">IMAPI_CD_SECTOR_TYPE</a>, that indicates the type of data. <b>IMAPI_CD_SECTOR_AUDIO</b> is the only value  supported by the <b>IRawCDImageCreator::AddTrack</b>  method.
     * @param {IStream} data Pointer to the provided <b>IStream</b> object.
     * @returns {Integer} A <b>LONG</b> value within a 1 to 99 range that will be associated with the new track.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-addtrack
     */
    AddTrack(dataType, data) {
        result := ComCall(8, this, "int", dataType, "ptr", data, "int*", &trackIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return trackIndex
    }

    /**
     * Accepts the provided IStream object and saves the associated pointer to be used as data for the pre-gap for track 1.
     * @remarks
     * This method can only be called prior to adding any tracks to the image.  The <i>data</i> stream must be at least 2 seconds (or 150 sectors) long.
     * 
     * The  <i>data</i> stream should not result final sector exceeding LBA 397,799 (MSF 88:25:74), as the minimal-sized track plus leadout would then exceed the MSF 89:59:74 maximum.  Additionally, it is recommended that the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_cd_sector_type">IMAPI_CD_SECTOR_TYPE</a>  value for the first track is implicitly defined as "Audio". The resulting audio can then only be heard by playing the first track and "rewinding" back to the start of the audio disc.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {IStream} data Pointer to the provided <b>IStream</b> object.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-addspecialpregap
     */
    AddSpecialPregap(data) {
        result := ComCall(9, this, "ptr", data, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Allows the addition of custom R-W subcode, provided by the IStream. The provided object must have a size equal to the number of sectors in the raw disc image * 96 bytes when the final image is created.
     * @remarks
     * May be added anytime prior to calling <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-irawcdimagecreator-createresultimage">IRawCDImageCreator::CreateResultImage</a>.  If <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-irawcdimagecreator-put_resultingimagetype">IRawCDImageCreator::put_ResultingImageType</a> is  set to return PQ only, then this call will fail as no RW subcode will be used in the resulting image.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {IStream} subcode The subcode data (with 96 bytes per sector), where the 2 most significant bits must always be zero (as they are the P/Q bits).
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-addsubcoderwgenerator
     */
    AddSubcodeRWGenerator(subcode) {
        result := ComCall(10, this, "ptr", subcode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the value that defines the type of image file that will be generated.
     * @remarks
     * If the value set via <a href="https://docs.microsoft.com/windows/win32/api/imapi2/nf-imapi2-irawcdimagecreator-addsubcoderwgenerator">IRawCDImageCreator::AddSubcodeRWGenerator</a> is not <b>NULL</b>, then the <b>PQ_ONLY</b> type defined by <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_format2_raw_cd_data_sector_type">IMAPI_FORMAT2_RAW_CD_DATA_SECTOR_TYPE</a> is not a valid choice, as subcode would not be generated by the resulting image.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {Integer} value An <a href="https://docs.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_raw_cd_data_sector_type">IMAPI_FORMAT2_RAW_CD_DATA_SECTOR_TYPE</a> enumeration that defines the type of image file.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-put_resultingimagetype
     */
    put_ResultingImageType(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the value that specifies the type of image file that will be generated.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Integer} Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_raw_cd_data_sector_type">IMAPI_FORMAT2_RAW_CD_DATA_SECTOR_TYPE</a> enumeration that defines the current type set for the  image file.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-get_resultingimagetype
     */
    get_ResultingImageType() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves the value that defines the LBA for the start of the Leadout. This method can be utilized to determine if the image can be written to a piece of media by comparing it against the LastPossibleStartOfLeadout for the media.
     * @remarks
     * Use of this method requires that at least 1 track has been added to the image.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Integer} Pointer to a <b>LONG</b> value that represents the LBA for the start of the Leadout.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-get_startofleadout
     */
    get_StartOfLeadout() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the StartOfLeadoutLimit property value.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {Integer} value Pointer to a <b>LONG</b> value that represents the current  <i>StartOfLeadoutLimit</i>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-put_startofleadoutlimit
     */
    put_StartOfLeadoutLimit(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the current StartOfLeadoutLimit property value. This value specifies if the resulting image is required to fit on a piece of media with a StartOfLeadout greater than or equal to the LBA.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Integer} Pointer to a <b>LONG</b> value that represents the current  <i>StartOfLeadoutLimit</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-get_startofleadoutlimit
     */
    get_StartOfLeadoutLimit() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the value that specifies if &quot;Gapless Audio&quot; recording is disabled. This property defaults to a value of VARIANT_FALSE, which disables the use of &quot;gapless&quot; recording between consecutive audio tracks.
     * @remarks
     * When disabled, by default, the audio tracks will have the standard 2-second (150 sector) silent gap between tracks.  When enabled, the last 2  seconds of audio data from the previous audio track are encoded in the pregap area of the next audio track, enabling seamless transitions between tracks.
     * 
     * It is recommended that this property value is only set before the process of adding tracks to the image has begun as any changes afterwards could result in adverse effects to other image properties.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {VARIANT_BOOL} value A <b>VARIANT_BOOL</b> value that specifies if "Gapless Audio" is disabled. Setting a value of <b>VARIANT_FALSE</b> disables "Gapless Audio", while <b>VARIANT_TRUE</b> enables it.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-put_disablegaplessaudio
     */
    put_DisableGaplessAudio(value) {
        result := ComCall(16, this, "short", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the current value that specifies if &quot;Gapless Audio&quot; recording is disabled. This property defaults to a value of VARIANT_FALSE, which disables the use of &quot;gapless&quot; recording between consecutive audio tracks.
     * @remarks
     * When disabled, by default, the audio tracks will have the standard 2-second (150 sector) silent gap between tracks.  When enabled, the last 2  seconds of audio data from the previous audio track are encoded in the pregap area of the next audio track, enabling seamless transitions between tracks.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {VARIANT_BOOL} A <b>VARIANT_BOOL</b> value that specifies if "Gapless Audio" is disabled. A value of <b>VARIANT_FALSE</b> indicates that "Gapless Audio" is disabled; <b>VARIANT_TRUE</b> indicates that it is enabled.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-get_disablegaplessaudio
     */
    get_DisableGaplessAudio() {
        result := ComCall(17, this, "short*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves the Media Catalog Number (MCN) for the entire audio disc.
     * @remarks
     * The returned MCN is formatted as a 13-digit decimal number and must also be provided in the same form.  Additionally, the provided MCN value must have a valid checksum digit (least significant digit), or it will be rejected.  For improved compatibility with scripting, leading zeros may be excluded. For example, "0123456789012" can be expressed as "123456789012".
     * 
     * Please refer to the MMC specification for details regarding the MCN value.  
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {BSTR} value A <b>BSTR</b> value that represents the MCN to associate with the audio disc.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-put_mediacatalognumber
     */
    put_MediaCatalogNumber(value) {
        if(value is String) {
            pin := BSTR.Alloc(value)
            value := pin.Value
        }

        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the Media Catalog Number (MCN) for the entire audio disc.
     * @remarks
     * The MCN returned by this method is formatted as a 13-digit decimal number and must also be provided by  the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-irawcdimagecreator-put_mediacatalognumber">IRawCDImageCreator::put_MediaCatalogNumber</a> method  in the same form.  Additionally, the provided a MCN value provided via <b>IRawCDImageCreator::put_MediaCatalogNumber</b>   must have a valid checksum digit (least significant digit), or it will be rejected.  For improved compatibility with scripting, leading zeros may be excluded. For example, "0123456789012" can be expressed as "123456789012".
     * 
     * Please refer to the MMC specification for details regarding the MCN value.  
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {BSTR} Pointer to a <b>BSTR</b> value that represents the current MCN associated with the audio disc.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-get_mediacatalognumber
     */
    get_MediaCatalogNumber() {
        value := BSTR()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the starting track number.
     * @remarks
     * This property value can only be set before the addition of tracks.  If this property is set to a value other than 1, all tracks added to the image must be audio tracks.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {Integer} value A <b>LONG</b> value that represents the starting track number.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-put_startingtracknumber
     */
    put_StartingTrackNumber(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the starting track number.
     * @remarks
     * If this property holds a  value other than 1, all tracks added to the image must be audio tracks.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Integer} Pointer to a <b>LONG</b> value that represents the starting track number.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-get_startingtracknumber
     */
    get_StartingTrackNumber() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves an indexed property, which takes a LONG value with a range of 1 to 99 as the index to determine which track the user is querying. The returned object is then queried/set for the particular per-track property of interest.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {Integer} trackIndex A <b>LONG</b> value within a 1 to 99 range that is used to specify which track is  queried.
     * @returns {IRawCDImageTrackInfo} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-irawcdimagetrackinfo">IRawCDImageTrackInfo</a> object that contains information about the track associated with the specified <i>trackInfo</i> index value.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-get_trackinfo
     */
    get_TrackInfo(trackIndex) {
        result := ComCall(22, this, "int", trackIndex, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawCDImageTrackInfo(value)
    }

    /**
     * Retrieves the number of existing audio tracks on the media. (IRawCDImageCreator.get_NumberOfExistingTracks)
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Integer} Pointer to a <b>LONG</b> value that indicates the number of audio tracks that currently exist on the media.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-get_numberofexistingtracks
     */
    get_NumberOfExistingTracks() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves the number of total used sectors on the current media, including any overhead between existing tracks.
     * @remarks
     * This value represents the LBA of the last sector with data that is considered part of a track, and does not include the overhead of the leadin, leadout, or the two-seconds between MSF 00:00:00 and MSF 00:02:00.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Integer} Pointer to a <b>LONG</b> value that indicates the number of total used sectors on the media.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-get_lastusedusersectorinimage
     */
    get_LastUsedUserSectorInImage() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the SCSI-form table of contents for the resulting disc.
     * @remarks
     * This method can only be called after at least one track has been added to the image.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {Pointer<SAFEARRAY>} The SCSI-form table of contents for the resulting disc. Accuracy of this value depends on <b>IRawCDImageCreator::get_ExpectedTableOfContents</b> being called after all image properties have been set.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-irawcdimagecreator-get_expectedtableofcontents
     */
    get_ExpectedTableOfContents() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
