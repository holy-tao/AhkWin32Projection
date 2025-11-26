#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Exposes property methods that you can use to set or retrieve the value of a shared property.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isharedproperty
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISharedProperty extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISharedProperty
     * @type {Guid}
     */
    static IID => Guid("{2a005c01-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The class identifier for SharedProperty
     * @type {Guid}
     */
    static CLSID => Guid("{2a005c05-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value"]

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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isharedproperty-get_value
     */
    get_Value() {
        pVal := VARIANT()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Sets the value of a shared property.
     * @param {VARIANT} val The new value that is to be set for this shared property.
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isharedproperty-put_value
     */
    put_Value(val) {
        result := ComCall(8, this, "ptr", val, "HRESULT")
        return result
    }
}
