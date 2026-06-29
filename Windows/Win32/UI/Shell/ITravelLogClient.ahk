#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WINDOWDATA.ahk" { WINDOWDATA }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITravelLogClient extends IUnknown {
    /**
     * The interface identifier for ITravelLogClient
     * @type {Guid}
     */
    static IID := Guid("{241c033e-e659-43da-aa4d-4086dbc4758d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITravelLogClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindWindowByIndex   : IntPtr
        GetWindowData       : IntPtr
        LoadHistoryPosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITravelLogClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwID 
     * @returns {IUnknown} 
     */
    FindWindowByIndex(dwID) {
        result := ComCall(3, this, "uint", dwID, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {IStream} pStream 
     * @returns {WINDOWDATA} 
     */
    GetWindowData(pStream) {
        pWinData := WINDOWDATA()
        result := ComCall(4, this, "ptr", pStream, WINDOWDATA.Ptr, pWinData, "HRESULT")
        return pWinData
    }

    /**
     * 
     * @param {PWSTR} pszUrlLocation 
     * @param {Integer} dwPosition 
     * @returns {HRESULT} 
     */
    LoadHistoryPosition(pszUrlLocation, dwPosition) {
        pszUrlLocation := pszUrlLocation is String ? StrPtr(pszUrlLocation) : pszUrlLocation

        result := ComCall(5, this, "ptr", pszUrlLocation, "uint", dwPosition, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITravelLogClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindWindowByIndex := CallbackCreate(GetMethod(implObj, "FindWindowByIndex"), flags, 3)
        this.vtbl.GetWindowData := CallbackCreate(GetMethod(implObj, "GetWindowData"), flags, 3)
        this.vtbl.LoadHistoryPosition := CallbackCreate(GetMethod(implObj, "LoadHistoryPosition"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindWindowByIndex)
        CallbackFree(this.vtbl.GetWindowData)
        CallbackFree(this.vtbl.LoadHistoryPosition)
    }
}
