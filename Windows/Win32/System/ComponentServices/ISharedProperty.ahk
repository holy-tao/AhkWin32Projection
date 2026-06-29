#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Exposes property methods that you can use to set or retrieve the value of a shared property.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-isharedproperty
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ISharedProperty extends IDispatch {
    /**
     * The interface identifier for ISharedProperty
     * @type {Guid}
     */
    static IID := Guid("{2a005c01-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The class identifier for SharedProperty
     * @type {Guid}
     */
    static CLSID := Guid("{2a005c05-a5de-11cf-9e66-00aa00a3f464}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISharedProperty interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Value : IntPtr
        put_Value : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISharedProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Retrieves the value of a shared property.
     * @returns {VARIANT} The value of this shared property.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedproperty-get_value
     */
    get_Value() {
        pVal := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Sets the value of a shared property.
     * @param {VARIANT} _val The new value that is to be set for this shared property.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_ARRAYISLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument passed in the parameter contains an array that is locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument passed in the parameter is not a valid Variant type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedproperty-put_value
     */
    put_Value(_val) {
        result := ComCall(8, this, VARIANT, _val, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISharedProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
    }
}
