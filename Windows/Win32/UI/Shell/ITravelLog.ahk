#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ITravelEntry.ahk" { ITravelEntry }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\WindowsAndMessaging\HMENU.ahk" { HMENU }

/**
 * Deprecated. Exposes methods that maintain and manipulate a record of travel in the browser.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-itravellog
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITravelLog extends IUnknown {
    /**
     * The interface identifier for ITravelLog
     * @type {Guid}
     */
    static IID := Guid("{66a9cb08-4802-11d2-a561-00a0c92dbfe8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITravelLog interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddEntry          : IntPtr
        UpdateEntry       : IntPtr
        UpdateExternal    : IntPtr
        Travel            : IntPtr
        GetTravelEntry    : IntPtr
        FindTravelEntry   : IntPtr
        GetToolTipText    : IntPtr
        InsertMenuEntries : IntPtr
        Clone             : IntPtr
        CountEntries      : IntPtr
        Revert            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITravelLog.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Deprecated. Adds a new entry for a pending navigation to the travel log.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> representing the nearest browser or frame within which the travel generating the log is taking place.
     * @param {BOOL} fIsLocalAnchor Type: <b>BOOL</b>
     * 
     * A value specifying whether the new entry is a local anchor.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-addentry
     */
    AddEntry(punk, fIsLocalAnchor) {
        result := ComCall(3, this, "ptr", punk, BOOL, fIsLocalAnchor, "HRESULT")
        return result
    }

    /**
     * Deprecated. Saves the browser state of the current entry in preparation for a pending navigation.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> that represents the nearest browser or frame within which the travel generating the log is taking place.
     * @param {BOOL} fIsLocalAnchor Type: <b>BOOL</b>
     * 
     * A value specifying whether the new entry is a local anchor.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-updateentry
     */
    UpdateEntry(punk, fIsLocalAnchor) {
        result := ComCall(4, this, "ptr", punk, BOOL, fIsLocalAnchor, "HRESULT")
        return result
    }

    /**
     * Deprecated. Updates an entry that originated out of the current procedure through IHlinkFrame.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> representing the nearest browser or frame within which the travel generating the log is taking place.
     * @param {IUnknown} punkHLBrowseContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of an <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa767949(v=vs.85)">IHlinkBrowseContext</a> retrieved through <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa767937(v=vs.85)">IHlinkFrame::GetBrowseContext</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-updateexternal
     */
    UpdateExternal(punk, punkHLBrowseContext) {
        result := ComCall(5, this, "ptr", punk, "ptr", punkHLBrowseContext, "HRESULT")
        return result
    }

    /**
     * Deprecated. Navigates to a travel entry in the travel log relative to the position of the current entry.
     * @remarks
     * Calling <b>ITravelLog::Travel</b> has the same result as calling <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-itravelentry-invoke">Invoke</a>.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> that represents the nearest browser or frame within which the travel generating the log is taking place.
     * @param {Integer} iOffset Type: <b>int</b>
     * 
     * The number of travel entries forward (a positive value) or backward (a negative value) to move in the travel log.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-travel
     */
    Travel(punk, iOffset) {
        result := ComCall(6, this, "ptr", punk, "int", iOffset, "HRESULT")
        return result
    }

    /**
     * Deprecated. Gets a travel entry in the travel log relative to the position of the current entry.
     * @remarks
     * <b>ITravelLog::GetTravelEntry</b> is often used to discover whether the <b>Back</b> and <b>Forward</b> buttons should be enabled in the browser window.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> representing the nearest browser or frame within which the travel generating the log is taking place.
     * @param {Integer} iOffset Type: <b>int</b>
     * 
     * The number of travel entries forward (a positive value) or backward (a negative value) to move in the travel log.
     * @returns {ITravelEntry} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravelentry">ITravelEntry</a>**</b>
     * 
     * The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravelentry">ITravelEntry</a> interface representing the travel entry at the offset specified in <i>iOffset</i>. This value is only valid if the method returns successfully.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-gettravelentry
     */
    GetTravelEntry(punk, iOffset) {
        result := ComCall(7, this, "ptr", punk, "int", iOffset, "ptr*", &ppte := 0, "HRESULT")
        return ITravelEntry(ppte)
    }

    /**
     * Deprecated. Determines whether a specific travel entry is present in the travel log.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> representing the nearest browser or frame within which the travel generating the log is taking place.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * A PIDL of the travel entry, typically obtained through <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-itravelentry-getpidl">GetPidl</a>.
     * @returns {ITravelEntry} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravelentry">ITravelEntry</a>**</b>
     * 
     * The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravelentry">ITravelEntry</a> interface representing the travel entry, if found.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-findtravelentry
     */
    FindTravelEntry(punk, pidl) {
        result := ComCall(8, this, "ptr", punk, ITEMIDLIST.Ptr, pidl, "ptr*", &ppte := 0, "HRESULT")
        return ITravelEntry(ppte)
    }

    /**
     * Deprecated. Gets tooltip text for a travel entry, which is used as a Unicode display string in the UI.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> representing the nearest browser or frame within which the travel generating the log is taking place.
     * @param {Integer} iOffset Type: <b>int</b>
     * 
     * The number of travel entries forward (a positive value) or backward (a negative value) to move in the travel log to arrive at the travel entry from which text should be retrieved.
     * @param {Integer} idsTemplate Type: <b>int</b>
     * 
     * Not used.
     * @param {PWSTR} pwzText Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer that receives the Unicode tooltip text string.
     * @param {Integer} cchText Type: <b>DWORD</b>
     * 
     * The number of characters in the buffer pointed to by <i>pwzText</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-gettooltiptext
     */
    GetToolTipText(punk, iOffset, idsTemplate, pwzText, cchText) {
        pwzText := pwzText is String ? StrPtr(pwzText) : pwzText

        result := ComCall(9, this, "ptr", punk, "int", iOffset, "int", idsTemplate, "ptr", pwzText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Deprecated. Inserts entries into the specified menu.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> representing the nearest browser or frame within which the travel generating the log is taking place.
     * @param {HMENU} _hmenu Type: <b>HMENU</b>
     * 
     * The handle of the menu.
     * @param {Integer} nPos Type: <b>int</b>
     * 
     * The position in the menu to insert the entries.
     * @param {Integer} idFirst Type: <b>int</b>
     * 
     * The ID of the first entry to be inserted.
     * @param {Integer} idLast Type: <b>int</b>
     * 
     * The ID of the last entry to be inserted. The difference between <i>idFirst</i> and <i>idLast</i> is the maximum number of entries that can be inserted into the menu.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The types of entries to add to the menu. Includes the following:
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-insertmenuentries
     */
    InsertMenuEntries(punk, _hmenu, nPos, idFirst, idLast, dwFlags) {
        result := ComCall(10, this, "ptr", punk, HMENU, _hmenu, "int", nPos, "int", idFirst, "int", idLast, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Deprecated. Duplicates the contents of the current travel log.
     * @returns {ITravelLog} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a>**</b>
     * 
     * The address of a pointer to the interface representing the cloned travel log.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-clone
     */
    Clone() {
        result := ComCall(11, this, "ptr*", &pptl := 0, "HRESULT")
        return ITravelLog(pptl)
    }

    /**
     * Deprecated. Generates the number of entries in the travel log.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> representing the nearest browser or frame within which the travel generating the log is taking place.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * The number of entries in the travel log.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-countentries
     */
    CountEntries(punk) {
        result := ComCall(12, this, "ptr", punk, UInt32)
        return result
    }

    /**
     * Deprecated. Reverts to the current entry, dropping the result of ITravelLog::AddEntry in the case of a failed navigation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravellog-revert
     */
    Revert() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITravelLog.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddEntry := CallbackCreate(GetMethod(implObj, "AddEntry"), flags, 3)
        this.vtbl.UpdateEntry := CallbackCreate(GetMethod(implObj, "UpdateEntry"), flags, 3)
        this.vtbl.UpdateExternal := CallbackCreate(GetMethod(implObj, "UpdateExternal"), flags, 3)
        this.vtbl.Travel := CallbackCreate(GetMethod(implObj, "Travel"), flags, 3)
        this.vtbl.GetTravelEntry := CallbackCreate(GetMethod(implObj, "GetTravelEntry"), flags, 4)
        this.vtbl.FindTravelEntry := CallbackCreate(GetMethod(implObj, "FindTravelEntry"), flags, 4)
        this.vtbl.GetToolTipText := CallbackCreate(GetMethod(implObj, "GetToolTipText"), flags, 6)
        this.vtbl.InsertMenuEntries := CallbackCreate(GetMethod(implObj, "InsertMenuEntries"), flags, 7)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.CountEntries := CallbackCreate(GetMethod(implObj, "CountEntries"), flags, 2)
        this.vtbl.Revert := CallbackCreate(GetMethod(implObj, "Revert"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddEntry)
        CallbackFree(this.vtbl.UpdateEntry)
        CallbackFree(this.vtbl.UpdateExternal)
        CallbackFree(this.vtbl.Travel)
        CallbackFree(this.vtbl.GetTravelEntry)
        CallbackFree(this.vtbl.FindTravelEntry)
        CallbackFree(this.vtbl.GetToolTipText)
        CallbackFree(this.vtbl.InsertMenuEntries)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.CountEntries)
        CallbackFree(this.vtbl.Revert)
    }
}
