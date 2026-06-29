#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IMapMIMEToCLSID extends IUnknown {
    /**
     * The interface identifier for IMapMIMEToCLSID
     * @type {Guid}
     */
    static IID := Guid("{d9e89500-30fa-11d0-b724-00aa006c1a01}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMapMIMEToCLSID interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnableDefaultMappings : IntPtr
        MapMIMEToCLSID        : IntPtr
        SetMapping            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMapMIMEToCLSID.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     */
    EnableDefaultMappings(bEnable) {
        result := ComCall(3, this, BOOL, bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMIMEType 
     * @param {Pointer<Guid>} pCLSID 
     * @returns {HRESULT} 
     */
    MapMIMEToCLSID(pszMIMEType, pCLSID) {
        pszMIMEType := pszMIMEType is String ? StrPtr(pszMIMEType) : pszMIMEType

        result := ComCall(4, this, "ptr", pszMIMEType, Guid.Ptr, pCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMIMEType 
     * @param {Integer} dwMapMode 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    SetMapping(pszMIMEType, dwMapMode, clsid) {
        pszMIMEType := pszMIMEType is String ? StrPtr(pszMIMEType) : pszMIMEType

        result := ComCall(5, this, "ptr", pszMIMEType, "uint", dwMapMode, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMapMIMEToCLSID.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableDefaultMappings := CallbackCreate(GetMethod(implObj, "EnableDefaultMappings"), flags, 2)
        this.vtbl.MapMIMEToCLSID := CallbackCreate(GetMethod(implObj, "MapMIMEToCLSID"), flags, 3)
        this.vtbl.SetMapping := CallbackCreate(GetMethod(implObj, "SetMapping"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableDefaultMappings)
        CallbackFree(this.vtbl.MapMIMEToCLSID)
        CallbackFree(this.vtbl.SetMapping)
    }
}
