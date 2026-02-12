#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk
#Include ..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This interface exposes methods used to enumerate and manipulate property values.
 * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nn-propsys-ipropertystore
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
     * @remarks
     * <b>IPropertyStore</b> provides an abstraction over an array of property keys via the <c>IPropertyStore::GetCount</c> and <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-getat">IPropertyStore::GetAt</a> methods. The property keys in this array represent the properties that are currently stored by the <b>IPropertyStore</b>.
     * 
     * When <c>GetCount</c> succeeds, the value pointed to by cProps is a count of property keys in the array. The caller can expect calls to <b>IPropertyStore::GetAt</b> to succeed for values of iProp less than cProps.
     * 
     * In the case of failures such as E_OUTOFMEMORY, you should set cProps to zero. It is preferable that errors are discovered during creation or initialization of the property store.
     * @returns {Integer} A pointer to a value that indicates the property count.
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertystore-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &cProps := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cProps
    }

    /**
     * Gets a property key from the property array of an item.
     * @remarks
     * None
     * @param {Integer} iProp The index of the property key in the array of PROPERTYKEY structures. This is a zero-based index.
     * @returns {PROPERTYKEY} TBD
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertystore-getat
     */
    GetAt(iProp) {
        pkey := PROPERTYKEY()
        result := ComCall(4, this, "uint", iProp, "ptr", pkey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pkey
    }

    /**
     * This method retrieves the data for a specific property.
     * @remarks
     * If the PROPERTYKEY referenced in key is not present in the property store, this method returns S_OK and the <a href="https://docs.microsoft.com/previous-versions/aa912007(v=msdn.10)">vt </a> member of the structure that is pointed to by pv is set to VT_EMPTY.
     * @param {Pointer<PROPERTYKEY>} key TBD
     * @returns {PROPVARIANT} After the <c>IPropertyStore::GetValue</c> method returns successfully, this parameter points to a <a href="https://docs.microsoft.com/previous-versions/aa912007(v=msdn.10)">PROPVARIANT </a> structure that contains data about the property.
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertystore-getvalue
     */
    GetValue(key) {
        pv := PROPVARIANT()
        result := ComCall(5, this, "ptr", key, "ptr", pv, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pv
    }

    /**
     * This method sets a property value or replaces or removes an existing value.
     * @remarks
     * <c>IPropertyStore::SetValue</code> affects the current property store instance only. A property handler implements <code>IPropertyStore::SetValue</c> by accumulating property changes in an in-memory data structure. Property changes are written to the stream only when <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-commit">IPropertyStore::Commit</a> is called.
     * 
     * If <b>IPropertyStore::Commit</b> is called on a read-only property store, the property handler determines this and returns STG_E_ACCESSDENIED.
     * 
     * If a value was added or removed as a result of <c>SetValue</code>, subsequent enumerations by <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-getcount">IPropertyStore::GetCount</a> and <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-getat">IPropertyStore::GetAt</a> reflect that change and subsequent calls to <code>IPropertyStore::SetValue</c> reflect the changed value.
     * 
     * <b>Adding a New Property</b>
     * 
     * If the property value that was pointed to by key does not exist in the store, <c>IPropertyStore::SetValue</c> adds the value to the store.
     * 
     * <b>Replacing an Existing Property Value</b>
     * 
     * If the property value that was pointed to by key already exists in the store, the stored value is replaced.
     * 
     * <b>Removing an Existing Property</b>
     * 
     * To remove a value from the property store, set the vt member of the structure that is pointed to by pv to VT_EMPTY. If that value is not present, do nothing and the method returns S_OK.
     * @param {Pointer<PROPERTYKEY>} key TBD
     * @param {Pointer<PROPVARIANT>} propvar TBD
     * @returns {HRESULT} The <c>IPropertyStore::SetValue</c> method can return any one of the following:
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
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertystore-setvalue
     */
    SetValue(key, propvar) {
        result := ComCall(6, this, "ptr", key, "ptr", propvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * After a change has been made, this method saves the changes.
     * @remarks
     * Before the <c>Commit</code> method returns, it releases the file stream or path that was initialized to be used by the method. Therefore, no <b>IPropertyStore</b> methods succeed after <code>Commit</c> returns. At that point, they return E_FAIL.
     * 
     * Property handlers must ensure that property changes result in a valid destination file, even if the <c>Commit</c> process terminates abnormally, or encounters any errors.
     * @returns {HRESULT} The <c>IPropertyStore::Commit</c> method returns any one of the following:
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
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertystore-commit
     */
    Commit() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
