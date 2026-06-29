#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later. The IAttributeSet interface sets key/value pairs on an object, where the key is a GUID and the value is any binary data.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAttributeSet)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/dsattrib/nn-dsattrib-iattributeset
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IAttributeSet extends IUnknown {
    /**
     * The interface identifier for IAttributeSet
     * @type {Guid}
     */
    static IID := Guid("{583ec3cc-4960-4857-982b-41a33ea0a006}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAttributeSet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAttrib : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAttributeSet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Guid} _guidAttribute <b>GUID</b> that identifies the attribute.
     * @param {Pointer<Integer>} pbAttribute Pointer to a buffer that contains the attribute value.
     * @param {Integer} dwAttributeLength Size of the <i>pbAttribute</i> buffer, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>__HRESULT_FROM_WIN32(ERROR_DUPLICATE_TAG)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attribute with this <b>GUID</b> already exists on this object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dsattrib/nf-dsattrib-iattributeset-setattrib
     */
    SetAttrib(_guidAttribute, pbAttribute, dwAttributeLength) {
        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, Guid, _guidAttribute, pbAttributeMarshal, pbAttribute, "uint", dwAttributeLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAttributeSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAttrib := CallbackCreate(GetMethod(implObj, "SetAttrib"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAttrib)
    }
}
