#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk
#Include ..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This interface exposes methods used to enumerate and manipulate property values.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertystore
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyStore
     * @type {Guid}
     */
    static IID => Guid("{886d8eeb-8cf2-4446-8d02-cdba1dbdcf99}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "GetValue", "SetValue", "Commit"]

    /**
     * This method returns a count of the number of properties that are attached to the file.
     * @returns {Integer} A pointer to a value that indicates the property count.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertystore-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &cProps := 0, "HRESULT")
        return cProps
    }

    /**
     * Gets a property key from the property array of an item.
     * @param {Integer} iProp The index of the property key in the array of PROPERTYKEY structures. This is a zero-based index.
     * @returns {PROPERTYKEY} TBD
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertystore-getat
     */
    GetAt(iProp) {
        pkey := PROPERTYKEY()
        result := ComCall(4, this, "uint", iProp, "ptr", pkey, "HRESULT")
        return pkey
    }

    /**
     * This method retrieves the data for a specific property.
     * @param {Pointer<PROPERTYKEY>} key TBD
     * @returns {PROPVARIANT} After the <c>IPropertyStore::GetValue</c> method returns successfully, this parameter points to a <a href="https://docs.microsoft.com/previous-versions/aa912007(v=msdn.10)">PROPVARIANT </a> structure that contains data about the property.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertystore-getvalue
     */
    GetValue(key) {
        pv := PROPVARIANT()
        result := ComCall(5, this, "ptr", key, "ptr", pv, "HRESULT")
        return pv
    }

    /**
     * This method sets a property value or replaces or removes an existing value.
     * @param {Pointer<PROPERTYKEY>} key TBD
     * @param {Pointer<PROPVARIANT>} propvar TBD
     * @returns {HRESULT} The <code>IPropertyStore::SetValue</code> method can return any one of the following:
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
     * The property change was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>INPLACE_S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value was set but truncated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is an error code. The property store was read-only so the method was not able to set the value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertystore-setvalue
     */
    SetValue(key, propvar) {
        result := ComCall(6, this, "ptr", key, "ptr", propvar, "HRESULT")
        return result
    }

    /**
     * After a change has been made, this method saves the changes.
     * @returns {HRESULT} The <code>IPropertyStore::Commit</code> method returns any one of the following:
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
     * All of the property changes were successfully written to the stream or path. This includes the case where no changes were pending when the method was called and nothing was written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream or file is read-only; the method was not able to set the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some or all of the changes could not be written to the file. Another, more explanatory error can be used in place of E_FAIL.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertystore-commit
     */
    Commit() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
