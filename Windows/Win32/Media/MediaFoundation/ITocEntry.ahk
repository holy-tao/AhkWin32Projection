#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TOC_ENTRY_DESCRIPTOR.ahk" { TOC_ENTRY_DESCRIPTOR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITocEntry interface represents an individual entry in a table of contents. It provides methods for setting and retrieving descriptive information for the entry.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-itocentry
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ITocEntry extends IUnknown {
    /**
     * The interface identifier for ITocEntry
     * @type {Guid}
     */
    static IID := Guid("{f22f5e06-585c-4def-8523-6555cfbc0cb3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITocEntry interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetTitle           : IntPtr
        GetTitle           : IntPtr
        SetDescriptor      : IntPtr
        GetDescriptor      : IntPtr
        SetSubEntries      : IntPtr
        GetSubEntries      : IntPtr
        SetDescriptionData : IntPtr
        GetDescriptionData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITocEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetTitle method sets the title of the entry.
     * @param {PWSTR} pwszTitle Pointer to a NULL-terminated wide-character string that contains the title.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-settitle
     */
    SetTitle(pwszTitle) {
        pwszTitle := pwszTitle is String ? StrPtr(pwszTitle) : pwszTitle

        result := ComCall(3, this, "ptr", pwszTitle, "HRESULT")
        return result
    }

    /**
     * The GetTitle method retrieves the title, set by a previous call to SetTitle, of the entry.
     * @param {Pointer<Integer>} pwTitleSize If <i>pwszTitle</i> is <b>NULL</b>, this is an output parameter that receives the size, in wide characters, of the buffer required to receive the title. If <i>pwszTitle</i> is not <b>NULL</b>, this is an input parameter that specifies the size, in wide characters, of the caller-allocated buffer pointed to by <i>pwszTitle</i>.
     * @param {PWSTR} pwszTitle <b>NULL</b>, or a pointer to a caller-allocated buffer that, on successful completion, receives the title. The title  is null-terminated.
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
     * The method returns this error code if <i>pwszTitle</i> is not <b>NULL</b> and the title, including its NULL terminator, is larger than the size specified by <i>pwTitleSize</i>. In that case, <i>pwTitleSize</i> serves as an output parameter and receives the size of the required buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-gettitle
     */
    GetTitle(pwTitleSize, pwszTitle) {
        pwszTitle := pwszTitle is String ? StrPtr(pwszTitle) : pwszTitle

        pwTitleSizeMarshal := pwTitleSize is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, pwTitleSizeMarshal, pwTitleSize, "ptr", pwszTitle, "HRESULT")
        return result
    }

    /**
     * The SetDescriptor method associates a descriptor with the entry.
     * @param {Pointer<TOC_ENTRY_DESCRIPTOR>} pDescriptor Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/ns-wmcodecdsp-toc_entry_descriptor">TOC_ENTRY_DESCRIPTOR</a> structure that contains the descriptor.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-setdescriptor
     */
    SetDescriptor(pDescriptor) {
        result := ComCall(5, this, TOC_ENTRY_DESCRIPTOR.Ptr, pDescriptor, "HRESULT")
        return result
    }

    /**
     * The GetDescriptor method retrieves the descriptor, previously set by a call to SetDescriptor, of the entry.
     * @param {Pointer<TOC_ENTRY_DESCRIPTOR>} pDescriptor Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/ns-wmcodecdsp-toc_entry_descriptor">TOC_ENTRY_DESCRIPTOR</a> structure that receives the descriptor.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-getdescriptor
     */
    GetDescriptor(pDescriptor) {
        result := ComCall(6, this, TOC_ENTRY_DESCRIPTOR.Ptr, pDescriptor, "HRESULT")
        return result
    }

    /**
     * The SetSubEntries identifies a set of entries as being subentries of this entry.
     * @param {Integer} dwNumSubEntries The number of indices in the array pointed to by <i>pwSubEntryIndices</i>.
     * @param {Pointer<Integer>} pwSubEntryIndices Pointer to an array of <b>WORD</b>s. Each <b>WORD</b> in the array specifies the index of an entry that is to be considered a subentry of this entry.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-setsubentries
     */
    SetSubEntries(dwNumSubEntries, pwSubEntryIndices) {
        pwSubEntryIndicesMarshal := pwSubEntryIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "uint", dwNumSubEntries, pwSubEntryIndicesMarshal, pwSubEntryIndices, "HRESULT")
        return result
    }

    /**
     * The GetSubEntries method gets an array of subentry indices that were set by a previous call to SetSubEntries.
     * @param {Pointer<Integer>} pdwNumSubEntries If <i>pwSubEntryIndices</i> is <b>NULL</b>, this is an output parameter that receives the number of subentries associated with this entry. If <i>pwSubEntryIndices</i> is not <b>NULL</b>, this is an input parameter that specifies the number of <b>DWORD</b>s in the caller-allocated array pointed to by <i>pwSubEntryIndices</i>.
     * @param {Pointer<Integer>} pwSubEntryIndices <b>NULL</b>, or a pointer to a caller-allocated array of <b>DWORD</b>s that receives the subentry indices.
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
     * The method returns this error code if <i>pwSubEntryIndices</i> is not <b>NULL</b> and the number of subentries is larger than the number specified by <i>pdwNumSubEntries</i>. In that case, <i>pdwNumSubEntries</i> serves as an output parameter and receives the number of available subentry indices.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-getsubentries
     */
    GetSubEntries(pdwNumSubEntries, pwSubEntryIndices) {
        pdwNumSubEntriesMarshal := pdwNumSubEntries is VarRef ? "uint*" : "ptr"
        pwSubEntryIndicesMarshal := pwSubEntryIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, pdwNumSubEntriesMarshal, pdwNumSubEntries, pwSubEntryIndicesMarshal, pwSubEntryIndices, "HRESULT")
        return result
    }

    /**
     * The SetDescriptionData method associates a caller-supplied data block with the entry.
     * @remarks
     * You can use this method to associate any information of your choice with the entry. The nature of the information you store in the description data block is completely up to you. TOC Parser does not inspect or interpret the description data block.
     * 
     * You can associate only one description data block with a given entry at a given time. However, you might want to design different types of description data blocks and identify each type of block with a globally unique identifier (GUID). That way, you could associate description data of a certain type with some of your entries and description data of a different type with other entries. If you do not need to distinguish between different types of description data blocks, you can set <i>pguidType</i> to <b>NULL</b>.
     * @param {Integer} dwDescriptionDataSize The size, in bytes, of the data block.
     * @param {Pointer<Integer>} pbtDescriptionData Pointer to the first byte of the data block.
     * @param {Pointer<Guid>} pguidType Pointer to a <b>GUID</b> that identifies the type of data in the block. This parameter can be <b>NULL</b>. See Remarks.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-setdescriptiondata
     */
    SetDescriptionData(dwDescriptionDataSize, pbtDescriptionData, pguidType) {
        pbtDescriptionDataMarshal := pbtDescriptionData is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", dwDescriptionDataSize, pbtDescriptionDataMarshal, pbtDescriptionData, Guid.Ptr, pguidType, "HRESULT")
        return result
    }

    /**
     * The GetDescriptionData method gets a description data block that was previously associated with the entry by a call to SetDescriptionData.
     * @remarks
     * You can associate only one description data block with a given entry at a given time. However, you might want to design different types of description data blocks and identify each type of block with a globally unique identifier (GUID). That way, when you call <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nf-wmcodecdsp-itocentry-setdescriptiondata">SetDescriptionData</a>, you can mark the data block as being of a specific type. When you call <b>GetDescriptionData</b>, you can determine the type of the data block retrieved by inspecting the value returned in <i>pGuidType</i>.
     * @param {Pointer<Integer>} pdwDescriptionDataSize If <i>pbtDescriptionData</i> is <b>NULL</b>, this is an output parameter that receives the size, in bytes, of the description data block. If <i>pbtDescriptionData</i> is not <b>NULL</b>, this is an input parameter that specifies the size, in bytes, of the caller-allocated buffer pointed to by <i>pbtDescriptionData</i>.
     * @param {Pointer<Integer>} pbtDescriptionData NULL, or a pointer to a caller-allocated buffer that, on successful completion, receives the description data block.
     * @param {Pointer<Guid>} pGuidType Pointer to a variable that receives a globally unique identifier (GUID) that identifies the type of data in the description data block. See Remarks.
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
     * The method returns this error code if <i>pbtDescriptionData</i> is not <b>NULL</b> and the context block is larger than the size specified by <i>pdwDescriptionDataSize</i>. In that case, <i>pdwDescriptionDataSize</i> serves as an output parameter and receives the size, in bytes, of the required buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-getdescriptiondata
     */
    GetDescriptionData(pdwDescriptionDataSize, pbtDescriptionData, pGuidType) {
        pdwDescriptionDataSizeMarshal := pdwDescriptionDataSize is VarRef ? "uint*" : "ptr"
        pbtDescriptionDataMarshal := pbtDescriptionData is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pdwDescriptionDataSizeMarshal, pdwDescriptionDataSize, pbtDescriptionDataMarshal, pbtDescriptionData, Guid.Ptr, pGuidType, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITocEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTitle := CallbackCreate(GetMethod(implObj, "SetTitle"), flags, 2)
        this.vtbl.GetTitle := CallbackCreate(GetMethod(implObj, "GetTitle"), flags, 3)
        this.vtbl.SetDescriptor := CallbackCreate(GetMethod(implObj, "SetDescriptor"), flags, 2)
        this.vtbl.GetDescriptor := CallbackCreate(GetMethod(implObj, "GetDescriptor"), flags, 2)
        this.vtbl.SetSubEntries := CallbackCreate(GetMethod(implObj, "SetSubEntries"), flags, 3)
        this.vtbl.GetSubEntries := CallbackCreate(GetMethod(implObj, "GetSubEntries"), flags, 3)
        this.vtbl.SetDescriptionData := CallbackCreate(GetMethod(implObj, "SetDescriptionData"), flags, 4)
        this.vtbl.GetDescriptionData := CallbackCreate(GetMethod(implObj, "GetDescriptionData"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTitle)
        CallbackFree(this.vtbl.GetTitle)
        CallbackFree(this.vtbl.SetDescriptor)
        CallbackFree(this.vtbl.GetDescriptor)
        CallbackFree(this.vtbl.SetSubEntries)
        CallbackFree(this.vtbl.GetSubEntries)
        CallbackFree(this.vtbl.SetDescriptionData)
        CallbackFree(this.vtbl.GetDescriptionData)
    }
}
