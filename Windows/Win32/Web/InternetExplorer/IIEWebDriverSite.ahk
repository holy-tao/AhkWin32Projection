#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IIEWebDriverSite extends IDispatch {
    /**
     * The interface identifier for IIEWebDriverSite
     * @type {Guid}
     */
    static IID := Guid("{ffb84444-453d-4fbc-9f9d-8db5c471ec75}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIEWebDriverSite interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        WindowOperation    : IntPtr
        DetachWebdriver    : IntPtr
        GetCapabilityValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIEWebDriverSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} operationCode 
     * @param {Integer} _hWnd 
     * @returns {HRESULT} 
     */
    WindowOperation(operationCode, _hWnd) {
        result := ComCall(7, this, "uint", operationCode, "uint", _hWnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkWD 
     * @returns {HRESULT} 
     */
    DetachWebdriver(pUnkWD) {
        result := ComCall(8, this, "ptr", pUnkWD, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkWD 
     * @param {PWSTR} capName 
     * @returns {VARIANT} 
     */
    GetCapabilityValue(pUnkWD, capName) {
        capName := capName is String ? StrPtr(capName) : capName

        capValue := VARIANT()
        result := ComCall(9, this, "ptr", pUnkWD, "ptr", capName, VARIANT.Ptr, capValue, "HRESULT")
        return capValue
    }

    Query(iid) {
        if (IIEWebDriverSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WindowOperation := CallbackCreate(GetMethod(implObj, "WindowOperation"), flags, 3)
        this.vtbl.DetachWebdriver := CallbackCreate(GetMethod(implObj, "DetachWebdriver"), flags, 2)
        this.vtbl.GetCapabilityValue := CallbackCreate(GetMethod(implObj, "GetCapabilityValue"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WindowOperation)
        CallbackFree(this.vtbl.DetachWebdriver)
        CallbackFree(this.vtbl.GetCapabilityValue)
    }
}
