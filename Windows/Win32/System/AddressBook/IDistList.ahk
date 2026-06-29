#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPropTagArray.ahk" { SPropTagArray }
#Import ".\IMAPIProp.ahk" { IMAPIProp }
#Import ".\FlagList.ahk" { FlagList }
#Import ".\ADRLIST.ahk" { ADRLIST }
#Import ".\SBinaryArray.ahk" { SBinaryArray }
#Import ".\IMAPIContainer.ahk" { IMAPIContainer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMAPIProgress.ahk" { IMAPIProgress }

/**
 * Do not use. This interface is used to provide access to distribution lists in modifiable address book containers. The interface provides methods to create, copy, and delete distribution lists, in addition to performing name resolution.
 * @see https://learn.microsoft.com/windows/win32/api/wabdefs/nn-wabdefs-idistlist
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct IDistList extends IMAPIContainer {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDistList interfaces
    */
    struct Vtbl extends IMAPIContainer.Vtbl {
        CreateEntry   : IntPtr
        CopyEntries   : IntPtr
        DeleteEntries : IntPtr
        ResolveNames  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDistList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Integer} lpEntryID 
     * @param {Integer} ulCreateFlags 
     * @returns {IMAPIProp} 
     */
    CreateEntry(cbEntryID, lpEntryID, ulCreateFlags) {
        result := ComCall(19, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulCreateFlags, "ptr*", &lppMAPIPropEntry := 0, "HRESULT")
        return IMAPIProp(lppMAPIPropEntry)
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpEntries 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    CopyEntries(lpEntries, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(20, this, SBinaryArray.Ptr, lpEntries, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpEntries 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    DeleteEntries(lpEntries, ulFlags) {
        result := ComCall(21, this, SBinaryArray.Ptr, lpEntries, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Integer} ulFlags 
     * @param {Pointer<ADRLIST>} lpAdrList 
     * @returns {FlagList} 
     */
    ResolveNames(lpPropTagArray, ulFlags, lpAdrList) {
        lpFlagList := FlagList()
        result := ComCall(22, this, SPropTagArray.Ptr, lpPropTagArray, "uint", ulFlags, ADRLIST.Ptr, lpAdrList, FlagList.Ptr, lpFlagList, "HRESULT")
        return lpFlagList
    }

    Query(iid) {
        if (IDistList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateEntry := CallbackCreate(GetMethod(implObj, "CreateEntry"), flags, 5)
        this.vtbl.CopyEntries := CallbackCreate(GetMethod(implObj, "CopyEntries"), flags, 5)
        this.vtbl.DeleteEntries := CallbackCreate(GetMethod(implObj, "DeleteEntries"), flags, 3)
        this.vtbl.ResolveNames := CallbackCreate(GetMethod(implObj, "ResolveNames"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateEntry)
        CallbackFree(this.vtbl.CopyEntries)
        CallbackFree(this.vtbl.DeleteEntries)
        CallbackFree(this.vtbl.ResolveNames)
    }
}
