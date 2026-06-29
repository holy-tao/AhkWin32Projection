#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpProperties extends IUnknown {
    /**
     * The interface identifier for ISpProperties
     * @type {Guid}
     */
    static IID := Guid("{5b4fb971-b115-4de1-ad97-e482e3bf6ee4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPropertyNum    : IntPtr
        GetPropertyNum    : IntPtr
        SetPropertyString : IntPtr
        GetPropertyString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} lValue 
     * @returns {HRESULT} 
     */
    SetPropertyNum(pName, lValue) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(3, this, "ptr", pName, "int", lValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<Integer>} plValue 
     * @returns {HRESULT} 
     */
    GetPropertyNum(pName, plValue) {
        pName := pName is String ? StrPtr(pName) : pName

        plValueMarshal := plValue is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pName, plValueMarshal, plValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pValue 
     * @returns {HRESULT} 
     */
    SetPropertyString(pName, pValue) {
        pName := pName is String ? StrPtr(pName) : pName
        pValue := pValue is String ? StrPtr(pValue) : pValue

        result := ComCall(5, this, "ptr", pName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @returns {PWSTR} 
     */
    GetPropertyString(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(6, this, "ptr", pName, PWSTR.Ptr, &ppCoMemValue := 0, "HRESULT")
        return ppCoMemValue
    }

    Query(iid) {
        if (ISpProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPropertyNum := CallbackCreate(GetMethod(implObj, "SetPropertyNum"), flags, 3)
        this.vtbl.GetPropertyNum := CallbackCreate(GetMethod(implObj, "GetPropertyNum"), flags, 3)
        this.vtbl.SetPropertyString := CallbackCreate(GetMethod(implObj, "SetPropertyString"), flags, 3)
        this.vtbl.GetPropertyString := CallbackCreate(GetMethod(implObj, "GetPropertyString"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPropertyNum)
        CallbackFree(this.vtbl.GetPropertyNum)
        CallbackFree(this.vtbl.SetPropertyString)
        CallbackFree(this.vtbl.GetPropertyString)
    }
}
