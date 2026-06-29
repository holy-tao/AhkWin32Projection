#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ISectionList.ahk" { ISectionList }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGenericDescriptor.ahk" { IGenericDescriptor }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMpeg2Data.ahk" { IMpeg2Data }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nn-mpeg2psiparser-icat
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ICAT extends IUnknown {
    /**
     * The interface identifier for ICAT
     * @type {Guid}
     */
    static IID := Guid("{7c6995fb-2a31-4bd7-953e-b1ad7fb7d31c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICAT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                 : IntPtr
        GetVersionNumber           : IntPtr
        GetCountOfTableDescriptors : IntPtr
        GetTableDescriptorByIndex  : IntPtr
        GetTableDescriptorByTag    : IntPtr
        RegisterForNextTable       : IntPtr
        GetNextTable               : IntPtr
        RegisterForWhenCurrent     : IntPtr
        ConvertNextToCurrent       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICAT.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-icat-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the version_number field.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-icat-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-icat-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors() {
        result := ComCall(5, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-icat-getcountoftabledescriptors">ICAT::GetCountOfTableDescriptors</a> method to get the number of table descriptors in the CAT.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-icat-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex) {
        result := ComCall(6, this, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * If the value of <i>pdwCookie</i> is not <b>NULL</b>, the method returns either MPEG2_S_NO_MORE_DATA_AVAILABLE or MPEG2_S_MORE_DATA_AVAILABLE to indicate whether the MGT contains additional tags that match the search criteria.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position in the descriptor list. This parameter is optional. If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-icat-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method applies only to <i>current</i> tables. Otherwise, the method returns E_ACCESSDENIED.
     * @param {HANDLE} hNextTableAvailable Handle to an event created by the caller. The object signals the event when the <i>next</i> table arrives. When the event is signaled, call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-icat-getnexttable">ICAT::GetNextTable</a> method to retrieve the table.
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This table is already a <i>next</i> table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument; <i>hNextTableAvailable</i> cannot be <b>NULL</b>.
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
     * The method has already been called.
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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-icat-registerfornexttable
     */
    RegisterForNextTable(hNextTableAvailable) {
        result := ComCall(8, this, HANDLE, hNextTableAvailable, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method applies only to current tables. Otherwise, the method returns E_ACCESSDENIED.
     * @param {Integer} dwTimeout Specifies a time-out value, in milliseconds. If the filter does not receive the data within the time-out period, the method fails.
     * @returns {ICAT} Receives a pointer to the <b>ICAT</b> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-icat-getnexttable
     */
    GetNextTable(dwTimeout) {
        result := ComCall(9, this, "uint", dwTimeout, "ptr*", &ppCAT := 0, "HRESULT")
        return ICAT(ppCAT)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method applies only to <i>next</i> tables. Otherwise, the method returns E_ACCESSDENIED.
     * @param {HANDLE} hNextTableIsCurrent Handle to an event created by the caller. The object signals the event when the table becomes current.
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This table is already a <i>current</i> table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument; <i>hNextTableIsCurrent</i> cannot be <b>NULL</b>.
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
     * The method has already been called.
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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-icat-registerforwhencurrent
     */
    RegisterForWhenCurrent(hNextTableIsCurrent) {
        result := ComCall(10, this, HANDLE, hNextTableIsCurrent, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method applies only to <i>next</i> tables that have become current. Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-icat-registerforwhencurrent">ICAT::RegisterForWhenCurrent</a> and wait for the event to be signaled.
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This table is already current.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>RegisterForWhenCurrent</b> method was not called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_MALFORMED_TABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new <i>current</i> table is malformed.
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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-icat-convertnexttocurrent
     */
    ConvertNextToCurrent() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICAT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetVersionNumber := CallbackCreate(GetMethod(implObj, "GetVersionNumber"), flags, 2)
        this.vtbl.GetCountOfTableDescriptors := CallbackCreate(GetMethod(implObj, "GetCountOfTableDescriptors"), flags, 2)
        this.vtbl.GetTableDescriptorByIndex := CallbackCreate(GetMethod(implObj, "GetTableDescriptorByIndex"), flags, 3)
        this.vtbl.GetTableDescriptorByTag := CallbackCreate(GetMethod(implObj, "GetTableDescriptorByTag"), flags, 4)
        this.vtbl.RegisterForNextTable := CallbackCreate(GetMethod(implObj, "RegisterForNextTable"), flags, 2)
        this.vtbl.GetNextTable := CallbackCreate(GetMethod(implObj, "GetNextTable"), flags, 3)
        this.vtbl.RegisterForWhenCurrent := CallbackCreate(GetMethod(implObj, "RegisterForWhenCurrent"), flags, 2)
        this.vtbl.ConvertNextToCurrent := CallbackCreate(GetMethod(implObj, "ConvertNextToCurrent"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetVersionNumber)
        CallbackFree(this.vtbl.GetCountOfTableDescriptors)
        CallbackFree(this.vtbl.GetTableDescriptorByIndex)
        CallbackFree(this.vtbl.GetTableDescriptorByTag)
        CallbackFree(this.vtbl.RegisterForNextTable)
        CallbackFree(this.vtbl.GetNextTable)
        CallbackFree(this.vtbl.RegisterForWhenCurrent)
        CallbackFree(this.vtbl.ConvertNextToCurrent)
    }
}
