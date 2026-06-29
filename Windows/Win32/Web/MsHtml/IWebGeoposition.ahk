#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWebGeocoordinates.ahk" { IWebGeocoordinates }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IWebGeoposition extends IDispatch {
    /**
     * The interface identifier for IWebGeoposition
     * @type {Guid}
     */
    static IID := Guid("{305107cd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for WebGeoposition
     * @type {Guid}
     */
    static CLSID := Guid("{305107ce-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebGeoposition interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_coords    : IntPtr
        get_timestamp : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebGeoposition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IWebGeocoordinates} 
     */
    coords {
        get => this.get_coords()
    }

    /**
     * @type {Integer} 
     */
    timestamp {
        get => this.get_timestamp()
    }

    /**
     * 
     * @returns {IWebGeocoordinates} 
     */
    get_coords() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IWebGeocoordinates(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_timestamp() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IWebGeoposition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_coords := CallbackCreate(GetMethod(implObj, "get_coords"), flags, 2)
        this.vtbl.get_timestamp := CallbackCreate(GetMethod(implObj, "get_timestamp"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_coords)
        CallbackFree(this.vtbl.get_timestamp)
    }
}
