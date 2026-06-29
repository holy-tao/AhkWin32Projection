#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TOC_DESCRIPTOR.ahk" { TOC_DESCRIPTOR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITocEntryList.ahk" { ITocEntryList }

/**
 * The IToc interface represents an individual table of contents. It provides methods for adding entries to, and removing entries from the table of contents.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-itoc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IToc extends IUnknown {
    /**
     * The interface identifier for IToc
     * @type {Guid}
     */
    static IID := Guid("{d6f05441-a919-423b-91a0-89d5b4a8ab77}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IToc interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDescriptor          : IntPtr
        GetDescriptor          : IntPtr
        SetDescription         : IntPtr
        GetDescription         : IntPtr
        SetContext             : IntPtr
        GetContext             : IntPtr
        GetEntryListCount      : IntPtr
        GetEntryListByIndex    : IntPtr
        AddEntryList           : IntPtr
        AddEntryListByIndex    : IntPtr
        RemoveEntryListByIndex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IToc.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetDescriptor method associates a descriptor with the table of contents.
     * @param {Pointer<TOC_DESCRIPTOR>} pDescriptor Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/ns-wmcodecdsp-toc_descriptor">TOC_DESCRIPTOR</a> structure that contains the descriptor.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-setdescriptor
     */
    SetDescriptor(pDescriptor) {
        result := ComCall(3, this, TOC_DESCRIPTOR.Ptr, pDescriptor, "HRESULT")
        return result
    }

    /**
     * The GetDescriptor method retrieves the descriptor, previously set by SetDescriptor, of the table of contents.
     * @param {Pointer<TOC_DESCRIPTOR>} pDescriptor Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/ns-wmcodecdsp-toc_descriptor">TOC_DESCRIPTOR</a> structure that receives the descriptor.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-getdescriptor
     */
    GetDescriptor(pDescriptor) {
        result := ComCall(4, this, TOC_DESCRIPTOR.Ptr, pDescriptor, "HRESULT")
        return result
    }

    /**
     * The SetDescription method associates a description with the table of contents.
     * @remarks
     * You can use this method to associate any description with the table of contents. TOC parser does not inspect or interpret the description.
     * @param {PWSTR} pwszDescription Pointer to a NULL-terminated, wide-character string that contains the description.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-setdescription
     */
    SetDescription(pwszDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(5, this, "ptr", pwszDescription, "HRESULT")
        return result
    }

    /**
     * The GetDescription method retrieves the description, set by a previous call to SetDescription, of the table of contents.
     * @param {Pointer<Integer>} pwDescriptionSize If <i>pwszDescription</i> is <b>NULL</b>, this is an output parameter that receives the size, in wide characters, of the buffer required to receive the description. If <i>pwszDescription</i> is not <b>NULL</b>, this is an input parameter that specifies the size, in wide characters, of the caller-allocated buffer pointed to by <i>pwszDescription</i>.
     * @param {PWSTR} pwszDescription <b>NULL</b>, or a pointer to a caller-allocated buffer that, on successful completion, receives the description. The description is null-terminated.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method returns this error code if <i>pwszDescription</i> is not <b>NULL</b> and the description, including its NULL terminator, is larger than the size specified by <i>pwDescriptionSize</i>. In that case, <i>pwDescriptionSize</i> serves as an output parameter and receives the size of the required buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-getdescription
     */
    GetDescription(pwDescriptionSize, pwszDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        pwDescriptionSizeMarshal := pwDescriptionSize is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, pwDescriptionSizeMarshal, pwDescriptionSize, "ptr", pwszDescription, "HRESULT")
        return result
    }

    /**
     * The SetContext method associates a caller-supplied context block with the table of contents.
     * @remarks
     * You can use this method to associate any information with the table of contents. The type of information you store in the context block is completely up to you. TOC Parser does not inspect or interpret the context block.
     * @param {Integer} dwContextSize The size, in bytes, of the context block.
     * @param {Pointer<Integer>} pbtContext Pointer to the first byte of the context block.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-setcontext
     */
    SetContext(dwContextSize, pbtContext) {
        pbtContextMarshal := pbtContext is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", dwContextSize, pbtContextMarshal, pbtContext, "HRESULT")
        return result
    }

    /**
     * The GetContext method retrieves a block of bytes that was previously associated with the table of contents by a call to SetContext.
     * @param {Pointer<Integer>} pdwContextSize If <i>pbtContext</i> is <b>NULL</b>, this is an output parameter that receives the size, in bytes, of the context block. If <i>pbtContext</i> is not <b>NULL</b>, this is an input parameter that specifies the size, in bytes, of the caller-allocated buffer pointed to by <i>pbtContext</i>.
     * @param {Pointer<Integer>} pbtContext NULL, or a pointer to a caller-allocated buffer that, on successful completion, receives the context block.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method returns this error code if <i>pbtContext</i> is not <b>NULL</b> and the context block is larger than the size specified by <i>bdwContextSize</i>. In that case, <i>pdwContextSize</i> serves as an output parameter and receives the size, in bytes, of the required buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-getcontext
     */
    GetContext(pdwContextSize, pbtContext) {
        pdwContextSizeMarshal := pdwContextSize is VarRef ? "uint*" : "ptr"
        pbtContextMarshal := pbtContext is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pdwContextSizeMarshal, pdwContextSize, pbtContextMarshal, pbtContext, "HRESULT")
        return result
    }

    /**
     * The GetEntryListCount method retrieves the number of entry lists in the table of contents.
     * @param {Pointer<Integer>} pwCount Pointer to a <b>WORD</b> that receives the number of entry lists.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-getentrylistcount
     */
    GetEntryListCount(pwCount) {
        pwCountMarshal := pwCount is VarRef ? "ushort*" : "ptr"

        result := ComCall(9, this, pwCountMarshal, pwCount, "HRESULT")
        return result
    }

    /**
     * The GetEntryListByIndex method retrieves an entry list, specified by an index, from the table of contents.
     * @param {Integer} wEntryListIndex The index of the entry list to retrieve.
     * @returns {ITocEntryList} Pointer to a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itocentrylist">ITocEntryList</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-getentrylistbyindex
     */
    GetEntryListByIndex(wEntryListIndex) {
        result := ComCall(10, this, "ushort", wEntryListIndex, "ptr*", &ppEntryList := 0, "HRESULT")
        return ITocEntryList(ppEntryList)
    }

    /**
     * The AddEntryList method adds an entry list to the table of contents and assigns an index to the entry list.
     * @param {ITocEntryList} pEntryList Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itocentrylist">ITocEntryList</a> interface that represents the entry list to be added.
     * @param {Pointer<Integer>} pwEntryListIndex Receives the index of the added entry list.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-addentrylist
     */
    AddEntryList(pEntryList, pwEntryListIndex) {
        pwEntryListIndexMarshal := pwEntryListIndex is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, "ptr", pEntryList, pwEntryListIndexMarshal, pwEntryListIndex, "HRESULT")
        return result
    }

    /**
     * The AddEntryListByIndex method adds an entry list to the table of contents and associates a caller-supplied index with the entry list.
     * @param {Integer} wEntryListIndex The index, specified by the caller, to be associated with the entry list.
     * @param {ITocEntryList} pEntryList Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itocentrylist">ITocEntryList</a> interface that represents the entry list to be added.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-addentrylistbyindex
     */
    AddEntryListByIndex(wEntryListIndex, pEntryList) {
        result := ComCall(12, this, "ushort", wEntryListIndex, "ptr", pEntryList, "HRESULT")
        return result
    }

    /**
     * The RemoveEntryListByIndex method removes an entry list, specified by an index, from the table of contents.
     * @param {Integer} wEntryListIndex The index of the entry list to be removed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table. 
     * 
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-removeentrylistbyindex
     */
    RemoveEntryListByIndex(wEntryListIndex) {
        result := ComCall(13, this, "ushort", wEntryListIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IToc.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDescriptor := CallbackCreate(GetMethod(implObj, "SetDescriptor"), flags, 2)
        this.vtbl.GetDescriptor := CallbackCreate(GetMethod(implObj, "GetDescriptor"), flags, 2)
        this.vtbl.SetDescription := CallbackCreate(GetMethod(implObj, "SetDescription"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 3)
        this.vtbl.SetContext := CallbackCreate(GetMethod(implObj, "SetContext"), flags, 3)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 3)
        this.vtbl.GetEntryListCount := CallbackCreate(GetMethod(implObj, "GetEntryListCount"), flags, 2)
        this.vtbl.GetEntryListByIndex := CallbackCreate(GetMethod(implObj, "GetEntryListByIndex"), flags, 3)
        this.vtbl.AddEntryList := CallbackCreate(GetMethod(implObj, "AddEntryList"), flags, 3)
        this.vtbl.AddEntryListByIndex := CallbackCreate(GetMethod(implObj, "AddEntryListByIndex"), flags, 3)
        this.vtbl.RemoveEntryListByIndex := CallbackCreate(GetMethod(implObj, "RemoveEntryListByIndex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDescriptor)
        CallbackFree(this.vtbl.GetDescriptor)
        CallbackFree(this.vtbl.SetDescription)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.SetContext)
        CallbackFree(this.vtbl.GetContext)
        CallbackFree(this.vtbl.GetEntryListCount)
        CallbackFree(this.vtbl.GetEntryListByIndex)
        CallbackFree(this.vtbl.AddEntryList)
        CallbackFree(this.vtbl.AddEntryListByIndex)
        CallbackFree(this.vtbl.RemoveEntryListByIndex)
    }
}
