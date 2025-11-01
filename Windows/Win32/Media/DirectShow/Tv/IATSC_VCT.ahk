#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nn-atscpsipparser-iatsc_vct
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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {ISectionList} pSectionList 
     * @param {IMpeg2Data} pMPEGData 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getversionnumber
     */
    GetVersionNumber(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-gettransportstreamid
     */
    GetTransportStreamId(pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getprotocolversion
     */
    GetProtocolVersion(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountofrecords
     */
    GetCountOfRecords(pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<PWSTR>} pwsName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordname
     */
    GetRecordName(dwRecordIndex, pwsName) {
        result := ComCall(8, this, "uint", dwRecordIndex, "ptr", pwsName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordmajorchannelnumber
     */
    GetRecordMajorChannelNumber(dwRecordIndex, pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(9, this, "uint", dwRecordIndex, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordminorchannelnumber
     */
    GetRecordMinorChannelNumber(dwRecordIndex, pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(10, this, "uint", dwRecordIndex, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordmodulationmode
     */
    GetRecordModulationMode(dwRecordIndex, pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, "uint", dwRecordIndex, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordcarrierfrequency
     */
    GetRecordCarrierFrequency(dwRecordIndex, pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", dwRecordIndex, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordtransportstreamid
     */
    GetRecordTransportStreamId(dwRecordIndex, pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(13, this, "uint", dwRecordIndex, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordprogramnumber
     */
    GetRecordProgramNumber(dwRecordIndex, pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(14, this, "uint", dwRecordIndex, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordetmlocation
     */
    GetRecordEtmLocation(dwRecordIndex, pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, "uint", dwRecordIndex, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<BOOL>} pfVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordisaccesscontrolledbitset
     */
    GetRecordIsAccessControlledBitSet(dwRecordIndex, pfVal) {
        result := ComCall(16, this, "uint", dwRecordIndex, "ptr", pfVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<BOOL>} pfVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordishiddenbitset
     */
    GetRecordIsHiddenBitSet(dwRecordIndex, pfVal) {
        result := ComCall(17, this, "uint", dwRecordIndex, "ptr", pfVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<BOOL>} pfVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordispathselectbitset
     */
    GetRecordIsPathSelectBitSet(dwRecordIndex, pfVal) {
        result := ComCall(18, this, "uint", dwRecordIndex, "ptr", pfVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<BOOL>} pfVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordisoutofbandbitset
     */
    GetRecordIsOutOfBandBitSet(dwRecordIndex, pfVal) {
        result := ComCall(19, this, "uint", dwRecordIndex, "ptr", pfVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<BOOL>} pfVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordishideguidebitset
     */
    GetRecordIsHideGuideBitSet(dwRecordIndex, pfVal) {
        result := ComCall(20, this, "uint", dwRecordIndex, "ptr", pfVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordservicetype
     */
    GetRecordServiceType(dwRecordIndex, pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(21, this, "uint", dwRecordIndex, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordsourceid
     */
    GetRecordSourceId(dwRecordIndex, pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(22, this, "uint", dwRecordIndex, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex, pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "uint", dwRecordIndex, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwIndex 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex, ppDescriptor) {
        result := ComCall(24, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", ppDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie, ppDescriptor) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", ppDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors(pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex, ppDescriptor) {
        result := ComCall(27, this, "uint", dwIndex, "ptr*", ppDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_vct-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie, ppDescriptor) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", ppDescriptor, "HRESULT")
        return result
    }
}
