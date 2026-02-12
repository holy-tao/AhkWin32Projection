#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IGenericDescriptor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nn-atscpsipparser-iatsc_vct
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IATSC_VCT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IATSC_VCT
     * @type {Guid}
     */
    static IID => Guid("{26879a18-32f9-46c6-91f0-fb6479270e8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetTransportStreamId", "GetProtocolVersion", "GetCountOfRecords", "GetRecordName", "GetRecordMajorChannelNumber", "GetRecordMinorChannelNumber", "GetRecordModulationMode", "GetRecordCarrierFrequency", "GetRecordTransportStreamId", "GetRecordProgramNumber", "GetRecordEtmLocation", "GetRecordIsAccessControlledBitSet", "GetRecordIsHiddenBitSet", "GetRecordIsPathSelectBitSet", "GetRecordIsOutOfBandBitSet", "GetRecordIsHideGuideBitSet", "GetRecordServiceType", "GetRecordSourceId", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag", "GetCountOfTableDescriptors", "GetTableDescriptorByIndex", "GetTableDescriptorByTag"]

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface of the <b>SectionList</b> object that contains the section data.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the MPEG-2 Sections and Tables filter.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the version_number field.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the transport_stream_id field. This value should match the value that appears in the program association table (PAT).
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-gettransportstreamid
     */
    GetTransportStreamId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the protocol_version field.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getprotocolversion
     */
    GetProtocolVersion() {
        result := ComCall(6, this, "char*", &pbVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method returns the short_name field.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {PWSTR} Receives a pointer to a wide-character string. The method allocates the buffer for the string. The caller must release the buffer by calling the <b>CoTaskMemFree</b> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordname
     */
    GetRecordName(dwRecordIndex) {
        result := ComCall(8, this, "uint", dwRecordIndex, "ptr*", &pwsName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pwsName
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {Integer} Receives the major channel number.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordmajorchannelnumber
     */
    GetRecordMajorChannelNumber(dwRecordIndex) {
        result := ComCall(9, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {Integer} Receives the minor channel number.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordminorchannelnumber
     */
    GetRecordMinorChannelNumber(dwRecordIndex) {
        result := ComCall(10, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {Integer} Receives the modulation_mode field.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordmodulationmode
     */
    GetRecordModulationMode(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {Integer} Receives the carrier frequency, in Hz.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordcarrierfrequency
     */
    GetRecordCarrierFrequency(dwRecordIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {Integer} Receives the channel_TSID field. This value represents the TSID associated with the transport stream that carries the MPEG-2 program for this virtual channel.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordtransportstreamid
     */
    GetRecordTransportStreamId(dwRecordIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {Integer} Receives the program_number field.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordprogramnumber
     */
    GetRecordProgramNumber(dwRecordIndex) {
        result := ComCall(14, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {Integer} Receives the ETM_location field.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordetmlocation
     */
    GetRecordEtmLocation(dwRecordIndex) {
        result := ComCall(15, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {BOOL} Receives a Boolean value. The value is <b>TRUE</b> if the access_controlled bit is set, indicating that this virtual channel might be access controlled. Otherwise, the value is <b>FALSE</b>, indicating that access is not restricted.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordisaccesscontrolledbitset
     */
    GetRecordIsAccessControlledBitSet(dwRecordIndex) {
        result := ComCall(16, this, "uint", dwRecordIndex, "int*", &pfVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {BOOL} Receives a Boolean value. The value is <b>TRUE</b> if the hidden bit is set. Otherwise, the value is <b>FALSE</b>. Hidden channels are not accessed by the user; for example, they might be used for test signals.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordishiddenbitset
     */
    GetRecordIsHiddenBitSet(dwRecordIndex) {
        result := ComCall(17, this, "uint", dwRecordIndex, "int*", &pfVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This bit applies only to cable VCTs. If the VCT is a terrestrial VCT, the method returns MPEG2_E_NOT_PRESENT.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {BOOL} Receives a Boolean value. The value is <b>TRUE</b> if the path_select bit is set, or <b>FALSE</b> otherwise. The path_select bit indicates which physical input cable carries the transport stream.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordispathselectbitset
     */
    GetRecordIsPathSelectBitSet(dwRecordIndex) {
        result := ComCall(18, this, "uint", dwRecordIndex, "int*", &pfVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This bit applies only to cable VCTs. If the VCT is a terrestrial VCT, the method returns MPEG2_E_NOT_PRESENT.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {BOOL} Receives a Boolean value. The value is <b>TRUE</b> if the out_of_band bit is set, indicating that this channel is carried on an out-of-band physical transmission channel. Otherwise, the value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordisoutofbandbitset
     */
    GetRecordIsOutOfBandBitSet(dwRecordIndex) {
        result := ComCall(19, this, "uint", dwRecordIndex, "int*", &pfVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * If the hidden bit is set, the hide_guide bit may be set to 0, indicating that this virtual channel should appear in electronic program guide (EPG) displays. If the hidden bit is 0, the hide_guide bit is ignored.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {BOOL} Receives a Boolean value. The value is <b>TRUE</b> if the hide_guide bit is set, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordishideguidebitset
     */
    GetRecordIsHideGuideBitSet(dwRecordIndex) {
        result := ComCall(20, this, "uint", dwRecordIndex, "int*", &pfVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {Integer} Receives the service_type field.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordservicetype
     */
    GetRecordServiceType(dwRecordIndex) {
        result := ComCall(21, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {Integer} Receives the source_id field.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordsourceid
     */
    GetRecordSourceId(dwRecordIndex) {
        result := ComCall(22, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(23, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordcountofdescriptors">IATSC_VCT::GetRecordCountOfDescriptors</a> method to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(24, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * If the value of <i>pdwCookie</i> is not <b>NULL</b>, the method returns either MPEG2_S_NO_MORE_DATA_AVAILABLE or MPEG2_S_MORE_DATA_AVAILABLE to indicate whether the record contains additional tags that match the search criteria.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords">IATSC_VCT::GetCountOfRecords</a> method to get the number of records in the VCT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position in the descriptor list. This parameter is optional. If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in *<i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Pointer<Integer>} pdwVal Receives the number of descriptors.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors(pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, pdwValMarshal, pdwVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountoftabledescriptors">IATSC_VCT::GetCountOfTableDescriptors</a> method to get the number of table descriptors in the VCT.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex) {
        result := ComCall(27, this, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * If the value of <i>pdwCookie</i> is not <b>NULL</b>, the method returns either MPEG2_S_NO_MORE_DATA_AVAILABLE or MPEG2_S_MORE_DATA_AVAILABLE to indicate whether the MGT contains additional tags that match the search criteria.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position in the descriptor list. This parameter is optional. If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in *<i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/atscpsipparser/nf-atscpsipparser-iatsc_vct-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGenericDescriptor(ppDescriptor)
    }
}
