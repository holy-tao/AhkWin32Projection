#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITocEntry.ahk" { ITocEntry }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITocEntryList interface represents a list of entries in a table of contents. It provides methods for adding entries to, and removing entries from the list.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-itocentrylist
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ITocEntryList extends IUnknown {
    /**
     * The interface identifier for ITocEntryList
     * @type {Guid}
     */
    static IID := Guid("{3a8cccbd-0efd-43a3-b838-f38a552ba237}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITocEntryList interfaces
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
            this.vtbl := ITocEntryList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetEntryCount method retrieves the number of entries in the list.
     * @param {Pointer<Integer>} pdwEntryCount Pointer to a <b>DWORD</b> that receives the number of entries.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentrylist-getentrycount
     */
    GetEntryCount(pdwEntryCount) {
        pdwEntryCountMarshal := pdwEntryCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwEntryCountMarshal, pdwEntryCount, "HRESULT")
        return result
    }

    /**
     * The GetEntryByIndex method retrieves an entry, specified by an index, from the list.
     * @param {Integer} dwEntryIndex The index of the entry to retrieve.
     * @returns {ITocEntry} Pointer to a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itocentry">ITocEntry</a> interface that represents the entry.
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentrylist-getentrybyindex
     */
    GetEntryByIndex(dwEntryIndex) {
        result := ComCall(4, this, "uint", dwEntryIndex, "ptr*", &ppEntry := 0, "HRESULT")
        return ITocEntry(ppEntry)
    }

    /**
     * The AddEntry method adds an individual entry to the list and assigns an index to the entry.
     * @param {ITocEntry} pEntry Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itocentry">ITocEntry</a> interface that represents the entry to be added.
     * @param {Pointer<Integer>} pdwEntryIndex Pointer to a <b>DWORD</b> that receives the index of the added entry.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentrylist-addentry
     */
    AddEntry(pEntry, pdwEntryIndex) {
        pdwEntryIndexMarshal := pdwEntryIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pEntry, pdwEntryIndexMarshal, pdwEntryIndex, "HRESULT")
        return result
    }

    /**
     * The AddEntryByIndex method adds an individual entry to the list and associates a caller-supplied index with the entry.
     * @param {Integer} dwEntryIndex The index of the entry to be added.
     * @param {ITocEntry} pEntry Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itocentry">ITocEntry</a> interface that represents the entry to be added.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentrylist-addentrybyindex
     */
    AddEntryByIndex(dwEntryIndex, pEntry) {
        result := ComCall(6, this, "uint", dwEntryIndex, "ptr", pEntry, "HRESULT")
        return result
    }

    /**
     * The RemoveEntryByIndex method removes an entry, specified by an index, from the list.
     * @param {Integer} dwEntryIndex The index of the entry to be removed.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentrylist-removeentrybyindex
     */
    RemoveEntryByIndex(dwEntryIndex) {
        result := ComCall(7, this, "uint", dwEntryIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITocEntryList.IID.Equals(iid)) {
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
