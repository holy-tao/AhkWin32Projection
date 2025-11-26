#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITocEntry interface represents an individual entry in a table of contents. It provides methods for setting and retrieving descriptive information for the entry.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-itocentry
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ITocEntry extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITocEntry
     * @type {Guid}
     */
    static IID => Guid("{f22f5e06-585c-4def-8523-6555cfbc0cb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTitle", "GetTitle", "SetDescriptor", "GetDescriptor", "SetSubEntries", "GetSubEntries", "SetDescriptionData", "GetDescriptionData"]

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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentry-settitle
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentry-gettitle
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentry-setdescriptor
     */
    SetDescriptor(pDescriptor) {
        result := ComCall(5, this, "ptr", pDescriptor, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentry-getdescriptor
     */
    GetDescriptor(pDescriptor) {
        result := ComCall(6, this, "ptr", pDescriptor, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentry-setsubentries
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentry-getsubentries
     */
    GetSubEntries(pdwNumSubEntries, pwSubEntryIndices) {
        pdwNumSubEntriesMarshal := pdwNumSubEntries is VarRef ? "uint*" : "ptr"
        pwSubEntryIndicesMarshal := pwSubEntryIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, pdwNumSubEntriesMarshal, pdwNumSubEntries, pwSubEntryIndicesMarshal, pwSubEntryIndices, "HRESULT")
        return result
    }

    /**
     * The SetDescriptionData method associates a caller-supplied data block with the entry.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentry-setdescriptiondata
     */
    SetDescriptionData(dwDescriptionDataSize, pbtDescriptionData, pguidType) {
        pbtDescriptionDataMarshal := pbtDescriptionData is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", dwDescriptionDataSize, pbtDescriptionDataMarshal, pbtDescriptionData, "ptr", pguidType, "HRESULT")
        return result
    }

    /**
     * The GetDescriptionData method gets a description data block that was previously associated with the entry by a call to SetDescriptionData.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentry-getdescriptiondata
     */
    GetDescriptionData(pdwDescriptionDataSize, pbtDescriptionData, pGuidType) {
        pdwDescriptionDataSizeMarshal := pdwDescriptionDataSize is VarRef ? "uint*" : "ptr"
        pbtDescriptionDataMarshal := pbtDescriptionData is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pdwDescriptionDataSizeMarshal, pdwDescriptionDataSize, pbtDescriptionDataMarshal, pbtDescriptionData, "ptr", pGuidType, "HRESULT")
        return result
    }
}
