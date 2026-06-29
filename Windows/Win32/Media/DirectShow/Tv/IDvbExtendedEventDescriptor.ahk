#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) extended event descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbextendedeventdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbExtendedEventDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbExtendedEventDescriptor
     * @type {Guid}
     */
    static IID := Guid("{c9b22eca-85f4-499f-b1db-efa93a91ee57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbExtendedEventDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                  : IntPtr
        GetLength               : IntPtr
        GetDescriptorNumber     : IntPtr
        GetLastDescriptorNumber : IntPtr
        GetLanguageCode         : IntPtr
        GetCountOfRecords       : IntPtr
        GetRecordItemW          : IntPtr
        GetConcatenatedItemW    : IntPtr
        GetTextW                : IntPtr
        GetConcatenatedTextW    : IntPtr
        GetRecordItemRawBytes   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbExtendedEventDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Receives the identifier tag. For DVB  extended event descriptors, this value is "0x4E".
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Receives the event descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the descriptor number from a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Receives the descriptor number.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getdescriptornumber
     */
    GetDescriptorNumber() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of the last descriptor associated with this descriptor from a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Receives the last descriptor number.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getlastdescriptornumber
     */
    GetLastDescriptorNumber() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Pointer to the buffer that receives the language code. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(7, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets the number of item records in a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Receives the number of item records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the item and descriptor from a Digital Videl Broadcast (DVB) extended event descriptor, in Unicode string format.
     * @param {Integer} bRecordIndex Specifies the item record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getcountofrecords">IDvbExtendedEventDescriptor::GetCountOfRecords</a> method to get the number of records in the extended event descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @param {Pointer<BSTR>} pbstrDesc Pointer to a buffer that receives the item description. The caller is responsible for freeing this memory.
     * @param {Pointer<BSTR>} pbstrItem Pointer to a buffer that receives the item text. The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getrecorditemw
     */
    GetRecordItemW(bRecordIndex, convMode, pbstrDesc, pbstrItem) {
        result := ComCall(9, this, "char", bRecordIndex, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrDesc, BSTR.Ptr, pbstrItem, "HRESULT")
        return result
    }

    /**
     * Concatenates the bytes from the item in the current Digital Video Broadcast (DVB) extended event descriptor with the bytes from the item in the next DVB extended event descriptor and returns the concatenated data as a Unicode string.
     * @param {IDvbExtendedEventDescriptor} pFollowingDescriptor Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvbextendedeventdescriptor">IDvbExtendedEventDescriptor</a> interface for the next DVB extended event descriptor associated with the current one.
     * @param {DVB_STRCONV_MODE} convMode 
     * @param {Pointer<BSTR>} pbstrDesc Pointer to a buffer that receives the concatenated item descriptor. The caller is responsible for freeing this memory.
     * @param {Pointer<BSTR>} pbstrItem Pointer to a buffer that receives the concatenated item string. The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getconcatenateditemw
     */
    GetConcatenatedItemW(pFollowingDescriptor, convMode, pbstrDesc, pbstrItem) {
        result := ComCall(10, this, "ptr", pFollowingDescriptor, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrDesc, BSTR.Ptr, pbstrItem, "HRESULT")
        return result
    }

    /**
     * Gets the text describing an itemfrom a Digital Video Broadcast (DVB) extended event descriptor, in string format.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the event description. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR.Owned()
        result := ComCall(11, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrText, "HRESULT")
        return pbstrText
    }

    /**
     * Gets the concatenation of the text description in the current item with the text description in the next item (both in Unicode format) of a Digital Video Broadcast (DVB) extended event descriptor.
     * @param {IDvbExtendedEventDescriptor} FollowingDescriptor Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvbextendedeventdescriptor">IDvbExtendedEventDescriptor</a> interface for the next extended event descriptor that is associated with the current event descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to the buffer that receives the concatenated item text. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getconcatenatedtextw
     */
    GetConcatenatedTextW(FollowingDescriptor, convMode) {
        pbstrText := BSTR.Owned()
        result := ComCall(12, this, "ptr", FollowingDescriptor, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrText, "HRESULT")
        return pbstrText
    }

    /**
     * Gets the raw data from the current item in a Digital Video Broadcast (DVB) extended event descriptor.
     * @param {Integer} bRecordIndex Specifies the item record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getcountofrecords">IDvbExtendedEventDescriptor::GetCountOfRecords</a> method to get the number of records in the extended event descriptor.
     * @param {Pointer<Pointer<Integer>>} ppbRawItem Pointer to a buffer that gets the item data. The caller is responsible for freeing this memory.
     * @param {Pointer<Integer>} pbItemLength Receives the number of bytes in the item description.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getrecorditemrawbytes
     */
    GetRecordItemRawBytes(bRecordIndex, ppbRawItem, pbItemLength) {
        ppbRawItemMarshal := ppbRawItem is VarRef ? "ptr*" : "ptr"
        pbItemLengthMarshal := pbItemLength is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "char", bRecordIndex, ppbRawItemMarshal, ppbRawItem, pbItemLengthMarshal, pbItemLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDvbExtendedEventDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetDescriptorNumber := CallbackCreate(GetMethod(implObj, "GetDescriptorNumber"), flags, 2)
        this.vtbl.GetLastDescriptorNumber := CallbackCreate(GetMethod(implObj, "GetLastDescriptorNumber"), flags, 2)
        this.vtbl.GetLanguageCode := CallbackCreate(GetMethod(implObj, "GetLanguageCode"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordItemW := CallbackCreate(GetMethod(implObj, "GetRecordItemW"), flags, 5)
        this.vtbl.GetConcatenatedItemW := CallbackCreate(GetMethod(implObj, "GetConcatenatedItemW"), flags, 5)
        this.vtbl.GetTextW := CallbackCreate(GetMethod(implObj, "GetTextW"), flags, 3)
        this.vtbl.GetConcatenatedTextW := CallbackCreate(GetMethod(implObj, "GetConcatenatedTextW"), flags, 4)
        this.vtbl.GetRecordItemRawBytes := CallbackCreate(GetMethod(implObj, "GetRecordItemRawBytes"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetDescriptorNumber)
        CallbackFree(this.vtbl.GetLastDescriptorNumber)
        CallbackFree(this.vtbl.GetLanguageCode)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordItemW)
        CallbackFree(this.vtbl.GetConcatenatedItemW)
        CallbackFree(this.vtbl.GetTextW)
        CallbackFree(this.vtbl.GetConcatenatedTextW)
        CallbackFree(this.vtbl.GetRecordItemRawBytes)
    }
}
