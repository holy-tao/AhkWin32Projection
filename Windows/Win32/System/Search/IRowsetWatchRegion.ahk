#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DBROWWATCHCHANGE.ahk" { DBROWWATCHCHANGE }
#Import ".\IRowsetWatchAll.ahk" { IRowsetWatchAll }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetWatchRegion extends IRowsetWatchAll {
    /**
     * The interface identifier for IRowsetWatchRegion
     * @type {Guid}
     */
    static IID := Guid("{0c733a45-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetWatchRegion interfaces
    */
    struct Vtbl extends IRowsetWatchAll.Vtbl {
        CreateWatchRegion  : IntPtr
        ChangeWatchMode    : IntPtr
        DeleteWatchRegion  : IntPtr
        GetWatchRegionInfo : IntPtr
        Refresh            : IntPtr
        ShrinkWatchRegion  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetWatchRegion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwWatchMode 
     * @returns {Pointer} 
     */
    CreateWatchRegion(dwWatchMode) {
        result := ComCall(6, this, "uint", dwWatchMode, "ptr*", &phRegion := 0, "HRESULT")
        return phRegion
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @param {Integer} dwWatchMode 
     * @returns {HRESULT} 
     */
    ChangeWatchMode(hRegion, dwWatchMode) {
        result := ComCall(7, this, "ptr", hRegion, "uint", dwWatchMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @returns {HRESULT} 
     */
    DeleteWatchRegion(hRegion) {
        result := ComCall(8, this, "ptr", hRegion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @param {Pointer<Integer>} pdwWatchMode 
     * @param {Pointer<Pointer>} phChapter 
     * @param {Pointer<Pointer>} pcbBookmark 
     * @param {Pointer<Pointer<Integer>>} ppBookmark 
     * @param {Pointer<Pointer>} pcRows 
     * @returns {HRESULT} 
     */
    GetWatchRegionInfo(hRegion, pdwWatchMode, phChapter, pcbBookmark, ppBookmark, pcRows) {
        pdwWatchModeMarshal := pdwWatchMode is VarRef ? "uint*" : "ptr"
        phChapterMarshal := phChapter is VarRef ? "ptr*" : "ptr"
        pcbBookmarkMarshal := pcbBookmark is VarRef ? "ptr*" : "ptr"
        ppBookmarkMarshal := ppBookmark is VarRef ? "ptr*" : "ptr"
        pcRowsMarshal := pcRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", hRegion, pdwWatchModeMarshal, pdwWatchMode, phChapterMarshal, phChapter, pcbBookmarkMarshal, pcbBookmark, ppBookmarkMarshal, ppBookmark, pcRowsMarshal, pcRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcChangesObtained 
     * @returns {Pointer<DBROWWATCHCHANGE>} 
     */
    Refresh(pcChangesObtained) {
        pcChangesObtainedMarshal := pcChangesObtained is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, pcChangesObtainedMarshal, pcChangesObtained, "ptr*", &prgChanges := 0, "HRESULT")
        return prgChanges
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @param {Pointer} hChapter 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    ShrinkWatchRegion(hRegion, hChapter, cbBookmark, pBookmark, cRows) {
        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, "ptr", hRegion, "ptr", hChapter, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, "ptr", cRows, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetWatchRegion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateWatchRegion := CallbackCreate(GetMethod(implObj, "CreateWatchRegion"), flags, 3)
        this.vtbl.ChangeWatchMode := CallbackCreate(GetMethod(implObj, "ChangeWatchMode"), flags, 3)
        this.vtbl.DeleteWatchRegion := CallbackCreate(GetMethod(implObj, "DeleteWatchRegion"), flags, 2)
        this.vtbl.GetWatchRegionInfo := CallbackCreate(GetMethod(implObj, "GetWatchRegionInfo"), flags, 7)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 3)
        this.vtbl.ShrinkWatchRegion := CallbackCreate(GetMethod(implObj, "ShrinkWatchRegion"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateWatchRegion)
        CallbackFree(this.vtbl.ChangeWatchMode)
        CallbackFree(this.vtbl.DeleteWatchRegion)
        CallbackFree(this.vtbl.GetWatchRegionInfo)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.ShrinkWatchRegion)
    }
}
