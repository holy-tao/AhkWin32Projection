#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IToc.ahk" { IToc }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITocCollection represents a collection of tables of contents. It provides methods for adding, retrieving, and removing, tables of contents from the collection.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-itoccollection
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ITocCollection extends IUnknown {
    /**
     * The interface identifier for ITocCollection
     * @type {Guid}
     */
    static IID := Guid("{23fee831-ae96-42df-b170-25a04847a3ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITocCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEntryCount      : IntPtr
        GetEntryByIndex    : IntPtr
        AddEntry           : IntPtr
        AddEntryByIndex    : IntPtr
        RemoveEntryByIndex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITocCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetEntryCount method retrieves the number of tables of contents in the collection.
     * @remarks
     * In the context of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoccollection">ITocCollection</a> interface, the word <i>entry</i> refers to an individual table of contents. That meaning of the word <i>entry</i> is in contrast to its meaning in the context of other interfaces in the TOC Parser technology. For example, in the context of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoc">IToc</a> interface, the word <i>entry</i> refers to a block of information, in a table of contents, that represents a section of a video file.
     * @param {Pointer<Integer>} pdwEntryCount Pointer to a <b>DWORD</b> that receives the number of tables of contents.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoccollection-getentrycount
     */
    GetEntryCount(pdwEntryCount) {
        pdwEntryCountMarshal := pdwEntryCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwEntryCountMarshal, pdwEntryCount, "HRESULT")
        return result
    }

    /**
     * The GetEntryByIndex method retrieves a table of contents, specified by an index, from the collection.
     * @remarks
     * In the context of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoccollection">ITocCollection</a> interface, the word <i>entry</i> refers to an individual table of contents. That meaning of the word <i>entry</i> is in contrast to its meaning in the context of other interfaces in the TOC Parser technology. For example, in the context of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoc">IToc</a> interface, the word <i>entry</i> refers to a block of information, in a table of contents, that represents a section of a video file.
     * @param {Integer} dwEntryIndex Specifies the index of the table of contents to retrieve.
     * @returns {IToc} Pointer to a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoc">IToc</a> interface that represents the table of contents.
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoccollection-getentrybyindex
     */
    GetEntryByIndex(dwEntryIndex) {
        result := ComCall(4, this, "uint", dwEntryIndex, "ptr*", &ppToc := 0, "HRESULT")
        return IToc(ppToc)
    }

    /**
     * The AddEntry method adds an individual table of contents to the collection and assigns an index to the added table of contents.
     * @remarks
     * In the context of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoccollection">ITocCollection</a> interface, the word <i>entry</i> refers to an individual table of contents. That meaning of the word <i>entry</i> is in contrast to its meaning in the context of other interfaces in the TOC Parser technology. For example, in the context of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoc">IToc</a> interface, the word <i>entry</i> refers to a block of information, in a table of contents, that represents a section of a video file.
     * @param {IToc} pToc Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoc">IToc</a> interface that represents the table of contents to be added.
     * @param {Pointer<Integer>} pdwEntryIndex Pointer to a <b>DWORD</b> that receives the index of the added table of contents.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoccollection-addentry
     */
    AddEntry(pToc, pdwEntryIndex) {
        pdwEntryIndexMarshal := pdwEntryIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pToc, pdwEntryIndexMarshal, pdwEntryIndex, "HRESULT")
        return result
    }

    /**
     * The AddEntryByIndex adds an individual table of contents to the collection and associates a caller-supplied index with the table of contents.
     * @remarks
     * In the context of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoccollection">ITocCollection</a> interface, the word <i>entry</i> refers to an individual table of contents. That meaning of the word <i>entry</i> is in contrast to its meaning in the context of other interfaces in the TOC Parser technology. For example, in the context of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoc">IToc</a> interface, the word <i>entry</i> refers to a block of information, in a table of contents, that represents a section of a video file.
     * @param {Integer} dwEntryIndex The index, specified by the caller, to be associated with the table of contents.
     * @param {IToc} pToc Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoc">IToc</a> interface that represents the table of contents to be added.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoccollection-addentrybyindex
     */
    AddEntryByIndex(dwEntryIndex, pToc) {
        result := ComCall(6, this, "uint", dwEntryIndex, "ptr", pToc, "HRESULT")
        return result
    }

    /**
     * The RemoveEntryByIndex method removes a table of contents, specified by an index, from the collection.
     * @remarks
     * In the context of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoccollection">ITocCollection</a> interface, the word <i>entry</i> refers to an individual table of contents. That meaning of the word <i>entry</i> is in contrast to its meaning in the context of other interfaces in the TOC Parser technology. For example, in the context of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoc">IToc</a> interface, the word <i>entry</i> refers to a block of information, in a table of contents, that represents a section of a video file.
     * @param {Integer} dwEntryIndex Specifies the index of the table of contents to be removed.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoccollection-removeentrybyindex
     */
    RemoveEntryByIndex(dwEntryIndex) {
        result := ComCall(7, this, "uint", dwEntryIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITocCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEntryCount := CallbackCreate(GetMethod(implObj, "GetEntryCount"), flags, 2)
        this.vtbl.GetEntryByIndex := CallbackCreate(GetMethod(implObj, "GetEntryByIndex"), flags, 3)
        this.vtbl.AddEntry := CallbackCreate(GetMethod(implObj, "AddEntry"), flags, 3)
        this.vtbl.AddEntryByIndex := CallbackCreate(GetMethod(implObj, "AddEntryByIndex"), flags, 3)
        this.vtbl.RemoveEntryByIndex := CallbackCreate(GetMethod(implObj, "RemoveEntryByIndex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEntryCount)
        CallbackFree(this.vtbl.GetEntryByIndex)
        CallbackFree(this.vtbl.AddEntry)
        CallbackFree(this.vtbl.AddEntryByIndex)
        CallbackFree(this.vtbl.RemoveEntryByIndex)
    }
}
