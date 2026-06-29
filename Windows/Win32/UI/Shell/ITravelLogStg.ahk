#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITravelLogEntry.ahk" { ITravelLogEntry }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TLENUMF.ahk" { TLENUMF }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumTravelLogEntry.ahk" { IEnumTravelLogEntry }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITravelLogStg extends IUnknown {
    /**
     * The interface identifier for ITravelLogStg
     * @type {Guid}
     */
    static IID := Guid("{7ebfdd80-ad18-11d3-a4c5-00c04f72d6b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITravelLogStg interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateEntry      : IntPtr
        TravelTo         : IntPtr
        EnumEntries      : IntPtr
        FindEntries      : IntPtr
        GetCount         : IntPtr
        RemoveEntry      : IntPtr
        GetRelativeEntry : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITravelLogStg.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @param {PWSTR} pszTitle 
     * @param {ITravelLogEntry} ptleRelativeTo 
     * @param {BOOL} fPrepend 
     * @returns {ITravelLogEntry} 
     */
    CreateEntry(pszUrl, pszTitle, ptleRelativeTo, fPrepend) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(3, this, "ptr", pszUrl, "ptr", pszTitle, "ptr", ptleRelativeTo, BOOL, fPrepend, "ptr*", &pptle := 0, "HRESULT")
        return ITravelLogEntry(pptle)
    }

    /**
     * 
     * @param {ITravelLogEntry} ptle 
     * @returns {HRESULT} 
     */
    TravelTo(ptle) {
        result := ComCall(4, this, "ptr", ptle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {TLENUMF} flags 
     * @returns {IEnumTravelLogEntry} 
     */
    EnumEntries(flags) {
        result := ComCall(5, this, TLENUMF, flags, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumTravelLogEntry(ppenum)
    }

    /**
     * 
     * @param {TLENUMF} flags 
     * @param {PWSTR} pszUrl 
     * @returns {IEnumTravelLogEntry} 
     */
    FindEntries(flags, pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(6, this, TLENUMF, flags, "ptr", pszUrl, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumTravelLogEntry(ppenum)
    }

    /**
     * 
     * @param {TLENUMF} flags 
     * @returns {Integer} 
     */
    GetCount(flags) {
        result := ComCall(7, this, TLENUMF, flags, "uint*", &pcEntries := 0, "HRESULT")
        return pcEntries
    }

    /**
     * 
     * @param {ITravelLogEntry} ptle 
     * @returns {HRESULT} 
     */
    RemoveEntry(ptle) {
        result := ComCall(8, this, "ptr", ptle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iOffset 
     * @returns {ITravelLogEntry} 
     */
    GetRelativeEntry(iOffset) {
        result := ComCall(9, this, "int", iOffset, "ptr*", &ptle := 0, "HRESULT")
        return ITravelLogEntry(ptle)
    }

    Query(iid) {
        if (ITravelLogStg.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateEntry := CallbackCreate(GetMethod(implObj, "CreateEntry"), flags, 6)
        this.vtbl.TravelTo := CallbackCreate(GetMethod(implObj, "TravelTo"), flags, 2)
        this.vtbl.EnumEntries := CallbackCreate(GetMethod(implObj, "EnumEntries"), flags, 3)
        this.vtbl.FindEntries := CallbackCreate(GetMethod(implObj, "FindEntries"), flags, 4)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 3)
        this.vtbl.RemoveEntry := CallbackCreate(GetMethod(implObj, "RemoveEntry"), flags, 2)
        this.vtbl.GetRelativeEntry := CallbackCreate(GetMethod(implObj, "GetRelativeEntry"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateEntry)
        CallbackFree(this.vtbl.TravelTo)
        CallbackFree(this.vtbl.EnumEntries)
        CallbackFree(this.vtbl.FindEntries)
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.RemoveEntry)
        CallbackFree(this.vtbl.GetRelativeEntry)
    }
}
