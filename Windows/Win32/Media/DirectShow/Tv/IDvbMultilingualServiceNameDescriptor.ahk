#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) multilingual service name descriptor. A multilingual service name descriptor provides the names of the service provider and service in text form in one or more languages.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbmultilingualservicenamedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbMultilingualServiceNameDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbMultilingualServiceNameDescriptor
     * @type {Guid}
     */
    static IID := Guid("{2d80433b-b32c-47ef-987f-e78ebb773e34}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbMultilingualServiceNameDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                        : IntPtr
        GetLength                     : IntPtr
        GetCountOfRecords             : IntPtr
        GetRecordLangId               : IntPtr
        GetRecordServiceProviderNameW : IntPtr
        GetRecordServiceNameW         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbMultilingualServiceNameDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag identifying a Digital Video Broadcast (DVB) multilingual service name descriptor.
     * @returns {Integer} Receives the service list descriptor tag. Typically, this value is 0x5D for multilingual service name descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the descriptor_length field value from a from a Digital Video Broadcast (DVB) multilingual service name descriptor.
     * @returns {Integer} Receives the descriptor_length field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of service records in a Digital Video Broadcast (DVB) multilingual service name descriptor.
     * @returns {Integer} Receives the number of service records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) multilingual service name descriptor. The language code identifies the language used for text in the descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getcountofrecords">IDvbMultilingualServiceNameDescriptor::GetCountOfRecords</a> method to get the number of records in the multilingual service name descriptor.
     * @returns {Integer} Pointer to a buffer that receives the language code. For a list of language codes, refer to <a href="http://www.sil.org/ISO639-3/codes.asp">this document</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getrecordlangid
     */
    GetRecordLangId(bRecordIndex) {
        result := ComCall(6, this, "char", bRecordIndex, "uint*", &ulVal := 0, "HRESULT")
        return ulVal
    }

    /**
     * Gets the service provider name in string format from a Digital Video Broadcast (DVB) multilingual service name descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getcountofrecords">IDvbMultilingualServiceNameDescriptor::GetCountOfRecords</a> method to get the number of records in the logical channel descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a memory block that receives the service provider name string. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getrecordserviceprovidernamew
     */
    GetRecordServiceProviderNameW(bRecordIndex, convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(7, this, "char", bRecordIndex, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the service name in string format from a Digital Video Broadcast (DVB) multilingual service name descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getcountofrecords">IDvbMultilingualServiceNameDescriptor::GetCountOfRecords</a> method to get the number of records in the logical channel descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the service name string. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbmultilingualservicenamedescriptor-getrecordservicenamew
     */
    GetRecordServiceNameW(bRecordIndex, convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(8, this, "char", bRecordIndex, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    Query(iid) {
        if (IDvbMultilingualServiceNameDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordLangId := CallbackCreate(GetMethod(implObj, "GetRecordLangId"), flags, 3)
        this.vtbl.GetRecordServiceProviderNameW := CallbackCreate(GetMethod(implObj, "GetRecordServiceProviderNameW"), flags, 4)
        this.vtbl.GetRecordServiceNameW := CallbackCreate(GetMethod(implObj, "GetRecordServiceNameW"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordLangId)
        CallbackFree(this.vtbl.GetRecordServiceProviderNameW)
        CallbackFree(this.vtbl.GetRecordServiceNameW)
    }
}
