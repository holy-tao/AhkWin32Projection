#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct IDispLatLongReport extends IDispatch {
    /**
     * The interface identifier for IDispLatLongReport
     * @type {Guid}
     */
    static IID := Guid("{8ae32723-389b-4a11-9957-5bdd48fc9617}")

    /**
     * The class identifier for DispLatLongReport
     * @type {Guid}
     */
    static CLSID := Guid("{7a7c3277-8f84-4636-95b2-ebb5507ff77e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDispLatLongReport interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Latitude      : IntPtr
        get_Longitude     : IntPtr
        get_ErrorRadius   : IntPtr
        get_Altitude      : IntPtr
        get_AltitudeError : IntPtr
        get_Timestamp     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDispLatLongReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    Latitude {
        get => this.get_Latitude()
    }

    /**
     * @type {Float} 
     */
    Longitude {
        get => this.get_Longitude()
    }

    /**
     * @type {Float} 
     */
    ErrorRadius {
        get => this.get_ErrorRadius()
    }

    /**
     * @type {Float} 
     */
    Altitude {
        get => this.get_Altitude()
    }

    /**
     * @type {Float} 
     */
    AltitudeError {
        get => this.get_AltitudeError()
    }

    /**
     * @type {Float} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Latitude() {
        result := ComCall(7, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Longitude() {
        result := ComCall(8, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ErrorRadius() {
        result := ComCall(9, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Altitude() {
        result := ComCall(10, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AltitudeError() {
        result := ComCall(11, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Timestamp() {
        result := ComCall(12, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IDispLatLongReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Latitude := CallbackCreate(GetMethod(implObj, "get_Latitude"), flags, 2)
        this.vtbl.get_Longitude := CallbackCreate(GetMethod(implObj, "get_Longitude"), flags, 2)
        this.vtbl.get_ErrorRadius := CallbackCreate(GetMethod(implObj, "get_ErrorRadius"), flags, 2)
        this.vtbl.get_Altitude := CallbackCreate(GetMethod(implObj, "get_Altitude"), flags, 2)
        this.vtbl.get_AltitudeError := CallbackCreate(GetMethod(implObj, "get_AltitudeError"), flags, 2)
        this.vtbl.get_Timestamp := CallbackCreate(GetMethod(implObj, "get_Timestamp"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Latitude)
        CallbackFree(this.vtbl.get_Longitude)
        CallbackFree(this.vtbl.get_ErrorRadius)
        CallbackFree(this.vtbl.get_Altitude)
        CallbackFree(this.vtbl.get_AltitudeError)
        CallbackFree(this.vtbl.get_Timestamp)
    }
}
