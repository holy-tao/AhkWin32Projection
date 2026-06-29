#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IWebGeolocation extends IDispatch {
    /**
     * The interface identifier for IWebGeolocation
     * @type {Guid}
     */
    static IID := Guid("{305107c5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for WebGeolocation
     * @type {Guid}
     */
    static CLSID := Guid("{305107c6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebGeolocation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getCurrentPosition : IntPtr
        watchPosition      : IntPtr
        clearWatch         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebGeolocation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDispatch} successCallback 
     * @param {IDispatch} errorCallback 
     * @param {IDispatch} options 
     * @returns {HRESULT} 
     */
    getCurrentPosition(successCallback, errorCallback, options) {
        result := ComCall(7, this, "ptr", successCallback, "ptr", errorCallback, "ptr", options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} successCallback 
     * @param {IDispatch} errorCallback 
     * @param {IDispatch} options 
     * @returns {Integer} 
     */
    watchPosition(successCallback, errorCallback, options) {
        result := ComCall(8, this, "ptr", successCallback, "ptr", errorCallback, "ptr", options, "int*", &watchId := 0, "HRESULT")
        return watchId
    }

    /**
     * 
     * @param {Integer} watchId 
     * @returns {HRESULT} 
     */
    clearWatch(watchId) {
        result := ComCall(9, this, "int", watchId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebGeolocation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getCurrentPosition := CallbackCreate(GetMethod(implObj, "getCurrentPosition"), flags, 4)
        this.vtbl.watchPosition := CallbackCreate(GetMethod(implObj, "watchPosition"), flags, 5)
        this.vtbl.clearWatch := CallbackCreate(GetMethod(implObj, "clearWatch"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getCurrentPosition)
        CallbackFree(this.vtbl.watchPosition)
        CallbackFree(this.vtbl.clearWatch)
    }
}
