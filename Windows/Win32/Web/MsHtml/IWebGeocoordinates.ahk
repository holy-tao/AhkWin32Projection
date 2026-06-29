#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IWebGeocoordinates extends IDispatch {
    /**
     * The interface identifier for IWebGeocoordinates
     * @type {Guid}
     */
    static IID := Guid("{305107c7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for WebGeocoordinates
     * @type {Guid}
     */
    static CLSID := Guid("{305107c8-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebGeocoordinates interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_latitude         : IntPtr
        get_longitude        : IntPtr
        get_altitude         : IntPtr
        get_accuracy         : IntPtr
        get_altitudeAccuracy : IntPtr
        get_heading          : IntPtr
        get_speed            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebGeocoordinates.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    latitude {
        get => this.get_latitude()
    }

    /**
     * @type {Float} 
     */
    longitude {
        get => this.get_longitude()
    }

    /**
     * @type {VARIANT} 
     */
    altitude {
        get => this.get_altitude()
    }

    /**
     * @type {Float} 
     */
    accuracy {
        get => this.get_accuracy()
    }

    /**
     * @type {VARIANT} 
     */
    altitudeAccuracy {
        get => this.get_altitudeAccuracy()
    }

    /**
     * @type {VARIANT} 
     */
    heading {
        get => this.get_heading()
    }

    /**
     * @type {VARIANT} 
     */
    speed {
        get => this.get_speed()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_latitude() {
        result := ComCall(7, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_longitude() {
        result := ComCall(8, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_altitude() {
        p := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_accuracy() {
        result := ComCall(10, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_altitudeAccuracy() {
        p := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_heading() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_speed() {
        p := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IWebGeocoordinates.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_latitude := CallbackCreate(GetMethod(implObj, "get_latitude"), flags, 2)
        this.vtbl.get_longitude := CallbackCreate(GetMethod(implObj, "get_longitude"), flags, 2)
        this.vtbl.get_altitude := CallbackCreate(GetMethod(implObj, "get_altitude"), flags, 2)
        this.vtbl.get_accuracy := CallbackCreate(GetMethod(implObj, "get_accuracy"), flags, 2)
        this.vtbl.get_altitudeAccuracy := CallbackCreate(GetMethod(implObj, "get_altitudeAccuracy"), flags, 2)
        this.vtbl.get_heading := CallbackCreate(GetMethod(implObj, "get_heading"), flags, 2)
        this.vtbl.get_speed := CallbackCreate(GetMethod(implObj, "get_speed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_latitude)
        CallbackFree(this.vtbl.get_longitude)
        CallbackFree(this.vtbl.get_altitude)
        CallbackFree(this.vtbl.get_accuracy)
        CallbackFree(this.vtbl.get_altitudeAccuracy)
        CallbackFree(this.vtbl.get_heading)
        CallbackFree(this.vtbl.get_speed)
    }
}
