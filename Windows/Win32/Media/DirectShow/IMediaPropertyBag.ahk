#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\StructuredStorage\IPropertyBag.ahk" { IPropertyBag }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IMediaPropertyBag interface is exposed by the Media Property Bag object.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-imediapropertybag
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMediaPropertyBag extends IPropertyBag {
    /**
     * The interface identifier for IMediaPropertyBag
     * @type {Guid}
     */
    static IID := Guid("{6025a880-c0d5-11d0-bd4e-00a0c911ce86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaPropertyBag interfaces
    */
    struct Vtbl extends IPropertyBag.Vtbl {
        EnumProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaPropertyBag.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The EnumProperty method retrieves a property/value pair.
     * @remarks
     * The name is always a string. Set the variant type of the <i>pvarPropertyName</i> parameter to VT_EMPTY or VT_BSTR before calling this method.
     * 
     * The value can be a string (for INFO chunks) or an array of bytes (for DISP chunks). Set the variant type of the <i>pvarPropertyName</i> parameter to VT_EMPTY, VT_BSTR, or (VT_ARRAY | VT_UI1).
     * @param {Integer} iProperty Index value of the pair.
     * @param {Pointer<VARIANT>} pvarPropertyName Pointer to a <b>VARIANT</b> that receives the property's name.
     * @param {Pointer<VARIANT>} pvarPropertyValue Pointer to a <b>VARIANT</b> that receives the property's value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediapropertybag-enumproperty
     */
    EnumProperty(iProperty, pvarPropertyName, pvarPropertyValue) {
        result := ComCall(5, this, "uint", iProperty, VARIANT.Ptr, pvarPropertyName, VARIANT.Ptr, pvarPropertyValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMediaPropertyBag.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumProperty := CallbackCreate(GetMethod(implObj, "EnumProperty"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumProperty)
    }
}
