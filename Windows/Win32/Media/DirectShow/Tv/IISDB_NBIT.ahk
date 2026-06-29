#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISectionList.ahk" { ISectionList }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGenericDescriptor.ahk" { IGenericDescriptor }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMpeg2Data.ahk" { IMpeg2Data }

/**
 * Implements methods that get information from an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT). The NBIT describes the programs included in a multiplexed transport stream for an ISDB broadcast.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdb_nbit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IISDB_NBIT extends IUnknown {
    /**
     * The interface identifier for IISDB_NBIT
     * @type {Guid}
     */
    static IID := Guid("{1b1863ef-08f1-40b7-a559-3b1eff8cafa6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IISDB_NBIT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                       : IntPtr
        GetVersionNumber                 : IntPtr
        GetOriginalNetworkId             : IntPtr
        GetCountOfRecords                : IntPtr
        GetRecordInformationId           : IntPtr
        GetRecordInformationType         : IntPtr
        GetRecordDescriptionBodyLocation : IntPtr
        GetRecordMessageSectionNumber    : IntPtr
        GetRecordUserDefined             : IntPtr
        GetRecordNumberOfKeys            : IntPtr
        GetRecordKeys                    : IntPtr
        GetRecordCountOfDescriptors      : IntPtr
        GetRecordDescriptorByIndex       : IntPtr
        GetRecordDescriptorByTag         : IntPtr
        GetVersionHash                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IISDB_NBIT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the object by using captured table section data from an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface 
     * of the <b>SectionList</b> object that contains the section data.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the MPEG-2 Sections and Tables
     * filter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * Gets the version number of a subtable within an Integrated Services Digital Broadcasting (ISDB) network broadcaster Information Table (NBIT).
     * @returns {Integer} Receives the version number.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets an identifier that identifies the broadcaster that originated the MPEG-2 transport stream from an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @returns {Integer} Receives the original network ID.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getoriginalnetworkid
     */
    GetOriginalNetworkId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *     Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number
     *     of records in the NBIT.
     * @returns {Integer} Receives the information_type field for the record.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordinformationid
     */
    GetRecordInformationId(dwRecordIndex) {
        result := ComCall(7, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets an information_type field from a record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number of records in the NBIT.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordinformationtype
     */
    GetRecordInformationType(dwRecordIndex) {
        result := ComCall(8, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Receives the value of the description_body_location field from a record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Index of a record containing descriptors in the NBIT.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorddescriptionbodylocation
     */
    GetRecordDescriptionBodyLocation(dwRecordIndex) {
        result := ComCall(9, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the section_number field from a record in Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *   Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number
     *   of records in the NBIT.
     * @returns {Integer} Gets the section_number field value from the NBIT record.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordmessagesectionnumber
     */
    GetRecordMessageSectionNumber(dwRecordIndex) {
        result := ComCall(10, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the user_defined field from an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Record containing the user-defined field, indexed from zero.
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords </a> method to get the number of records in the NBIT.
     * @returns {Integer} Receives the user_defined field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorduserdefined
     */
    GetRecordUserDefined(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Returns the number_of_keys field value for a section in an for an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number of records in the NBIT.
     * @returns {Integer} Receives the number_of_keys field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordnumberofkeys
     */
    GetRecordNumberOfKeys(dwRecordIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number_of_keys field from a record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero.
     *     Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number
     *     of records in the NBIT.
     * @returns {Pointer<Integer>} Gets the number_of_keys field from the NBIT record.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordkeys
     */
    GetRecordKeys(dwRecordIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "ptr*", &pbKeys := 0, "HRESULT")
        return pbKeys
    }

    /**
     * Returns the number of descriptors for a record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     * indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> 
     * method to get the number of records in the NBIT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(14, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Retrieves a descriptor for a specified record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT) based on the descriptor index.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> 
     *  method to get the number 
     * of records in the NBIT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero. 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecordcountofdescriptors">IISDB_NBIT::GetRecordCountOfDescriptors</a> method 
     * to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface implemented by the descriptor. The caller is responsible for freeing the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(15, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Gets a descriptor from a record in an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT) by using the standard tag for the descriptor.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getcountofrecords">IISDB_NBIT::GetCountOfRecords</a> method to get the number of records in the NBIT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Receives 
     * the start position in the descriptor list. This parameter is optional. 
     * If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, 
     * looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. 
     * Use this interface to retrieve the information 
     * in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * Returns a hash value for this instance of an Integrated Services Digital Broadcasting (ISDB) network broadcaster information table (NBIT).
     * @returns {Integer} Receives the hash value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_nbit-getversionhash
     */
    GetVersionHash() {
        result := ComCall(17, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }

    Query(iid) {
        if (IISDB_NBIT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetVersionNumber := CallbackCreate(GetMethod(implObj, "GetVersionNumber"), flags, 2)
        this.vtbl.GetOriginalNetworkId := CallbackCreate(GetMethod(implObj, "GetOriginalNetworkId"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordInformationId := CallbackCreate(GetMethod(implObj, "GetRecordInformationId"), flags, 3)
        this.vtbl.GetRecordInformationType := CallbackCreate(GetMethod(implObj, "GetRecordInformationType"), flags, 3)
        this.vtbl.GetRecordDescriptionBodyLocation := CallbackCreate(GetMethod(implObj, "GetRecordDescriptionBodyLocation"), flags, 3)
        this.vtbl.GetRecordMessageSectionNumber := CallbackCreate(GetMethod(implObj, "GetRecordMessageSectionNumber"), flags, 3)
        this.vtbl.GetRecordUserDefined := CallbackCreate(GetMethod(implObj, "GetRecordUserDefined"), flags, 3)
        this.vtbl.GetRecordNumberOfKeys := CallbackCreate(GetMethod(implObj, "GetRecordNumberOfKeys"), flags, 3)
        this.vtbl.GetRecordKeys := CallbackCreate(GetMethod(implObj, "GetRecordKeys"), flags, 3)
        this.vtbl.GetRecordCountOfDescriptors := CallbackCreate(GetMethod(implObj, "GetRecordCountOfDescriptors"), flags, 3)
        this.vtbl.GetRecordDescriptorByIndex := CallbackCreate(GetMethod(implObj, "GetRecordDescriptorByIndex"), flags, 4)
        this.vtbl.GetRecordDescriptorByTag := CallbackCreate(GetMethod(implObj, "GetRecordDescriptorByTag"), flags, 5)
        this.vtbl.GetVersionHash := CallbackCreate(GetMethod(implObj, "GetVersionHash"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetVersionNumber)
        CallbackFree(this.vtbl.GetOriginalNetworkId)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordInformationId)
        CallbackFree(this.vtbl.GetRecordInformationType)
        CallbackFree(this.vtbl.GetRecordDescriptionBodyLocation)
        CallbackFree(this.vtbl.GetRecordMessageSectionNumber)
        CallbackFree(this.vtbl.GetRecordUserDefined)
        CallbackFree(this.vtbl.GetRecordNumberOfKeys)
        CallbackFree(this.vtbl.GetRecordKeys)
        CallbackFree(this.vtbl.GetRecordCountOfDescriptors)
        CallbackFree(this.vtbl.GetRecordDescriptorByIndex)
        CallbackFree(this.vtbl.GetRecordDescriptorByTag)
        CallbackFree(this.vtbl.GetVersionHash)
    }
}
