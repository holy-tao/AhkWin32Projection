#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) data content descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbdatacontentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbDataContentDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbDataContentDescriptor
     * @type {Guid}
     */
    static IID := Guid("{a428100a-e646-4bd6-aa14-6087bdc08cd5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbDataContentDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                : IntPtr
        GetLength             : IntPtr
        GetDataComponentId    : IntPtr
        GetEntryComponent     : IntPtr
        GetSelectorLength     : IntPtr
        GetSelectorBytes      : IntPtr
        GetCountOfRecords     : IntPtr
        GetRecordComponentRef : IntPtr
        GetLanguageCode       : IntPtr
        GetTextW              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbDataContentDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) data content descriptor.
     * @returns {Integer} Receives the tag value. For ISDB data content descriptors, this value is 0xC7.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) data content descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a data component identifier from an Integrated Services Digital Broadcasting (ISDB) data content descriptor. This identifier identifies a component in the descriptor and appears in the data component descriptor for the component.
     * @returns {Integer} Receives the data component identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getdatacomponentid
     */
    GetDataComponentId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the entry_component field from an Integrated Services Digital Broadcasting (ISDB) data content descriptor. This field indicates the first component stream that is referenced in the descriptor.
     * @returns {Integer} Returns the entry_component field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getentrycomponent
     */
    GetEntryComponent() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the selector part of an Integrated Services Digital Broadcasting (ISDB) data content descriptor, in bytes.
     * @returns {Integer} Receives the selector length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getselectorlength
     */
    GetSelectorLength() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the selector data from an Integrated Services Digital Broadcasting (ISDB) data content descriptor. The contents of the selector depend on the type of data transmitted in the data component.
     * @remarks
     * Table J-1 in Annex J, <i>SERVICE INFORMATION FOR DIGITAL
     * BROADCASTING SYSTEM
     * ARIB STANDARD
     * ARIB, STD-B10, Version 4.6</i> shows the contents of this descriptor for different component types.
     * @param {Integer} bBufLength Specifies the length of the buffer that receives the selector data.
     * @returns {Integer} Receives the selector data.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getselectorbytes
     */
    GetSelectorBytes(bBufLength) {
        result := ComCall(8, this, "char", bBufLength, "char*", &pbBuf := 0, "HRESULT")
        return pbBuf
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) data content descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the component_ref field from a specified component record in an Integrated Services Digital Broadcasting (ISDB) data content descriptor. This field contains the broadcaster-defined component tag that identifies a component stream.
     * @param {Integer} bRecordIndex Zero-based index of the component record containing the tag. To get the number of components, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords">IIsdbDataContentDescriptor::GetCountOfRecords</a>.
     * @returns {Integer} Receives the component tag.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getrecordcomponentref
     */
    GetRecordComponentRef(bRecordIndex) {
        result := ComCall(10, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from an Integrated Services Digital Broadcasting (ISDB) data content descriptor.
     * @returns {Integer} Pointer to the buffer that receives the language code. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(11, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets the text from an Integrated Services Digital Broadcasting (ISDB) data content descriptor that describes the contents of the descriptor, in Unicode text format.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the description text. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR.Owned()
        result := ComCall(12, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrText, "HRESULT")
        return pbstrText
    }

    Query(iid) {
        if (IIsdbDataContentDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetDataComponentId := CallbackCreate(GetMethod(implObj, "GetDataComponentId"), flags, 2)
        this.vtbl.GetEntryComponent := CallbackCreate(GetMethod(implObj, "GetEntryComponent"), flags, 2)
        this.vtbl.GetSelectorLength := CallbackCreate(GetMethod(implObj, "GetSelectorLength"), flags, 2)
        this.vtbl.GetSelectorBytes := CallbackCreate(GetMethod(implObj, "GetSelectorBytes"), flags, 3)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordComponentRef := CallbackCreate(GetMethod(implObj, "GetRecordComponentRef"), flags, 3)
        this.vtbl.GetLanguageCode := CallbackCreate(GetMethod(implObj, "GetLanguageCode"), flags, 2)
        this.vtbl.GetTextW := CallbackCreate(GetMethod(implObj, "GetTextW"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetDataComponentId)
        CallbackFree(this.vtbl.GetEntryComponent)
        CallbackFree(this.vtbl.GetSelectorLength)
        CallbackFree(this.vtbl.GetSelectorBytes)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordComponentRef)
        CallbackFree(this.vtbl.GetLanguageCode)
        CallbackFree(this.vtbl.GetTextW)
    }
}
