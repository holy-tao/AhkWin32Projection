#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that determines whether a property can be edited in the UI by the user.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Property handlers implement this interface to disable a user's ability to edit specific properties. These properties are typically editable in the UI, but are not supported for writing by the property handler. For example, the property System.Author is typically editable. If a property handler author created a file type that exposed <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-author">System.Author</a> for reading, but could not support writing this property back, the handler author could return S_FALSE from <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystorecapabilities-ispropertywritable">IPropertyStoreCapabilities::IsPropertyWritable</a> for System.Author.
 * 
 * The Shell user interfaces that allow property editing, such as the <b>Details Pane</b> and <b>Details Tab</b> of the Properties dialog, call this method as part of determining whether to allow editing of a specific property. This allows the Shell property editing UI to disable controls rather than showing errors when the property handler fails to set or commit the property value.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertystorecapabilities
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyStoreCapabilities extends IUnknown {
    /**
     * The interface identifier for IPropertyStoreCapabilities
     * @type {Guid}
     */
    static IID := Guid("{c8e2d566-186e-4d49-bf41-6909ead56acc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyStoreCapabilities interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsPropertyWritable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyStoreCapabilities.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries whether the property handler allows a specific property to be edited in the UI by the user.
     * @remarks
     * The Shell disables the editing of controls by the user as appropriate through this method. A handler that does not support <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecapabilities">IPropertyStoreCapabilities</a> is assumed to support writing of any property.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that represents the property being queried.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
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
     * The property can be edited and stored by the handler.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property cannot be edited.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystorecapabilities-ispropertywritable
     */
    IsPropertyWritable(key) {
        result := ComCall(3, this, PROPERTYKEY.Ptr, key, Int32)
        return result
    }

    Query(iid) {
        if (IPropertyStoreCapabilities.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsPropertyWritable := CallbackCreate(GetMethod(implObj, "IsPropertyWritable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsPropertyWritable)
    }
}
