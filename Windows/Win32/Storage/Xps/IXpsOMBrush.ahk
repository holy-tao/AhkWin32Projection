#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMShareable.ahk" { IXpsOMShareable }

/**
 * Defines objects that are used to paint graphical objects. Classes that derive from IXpsOMBrush describe how the area is painted.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMBrush extends IXpsOMShareable {
    /**
     * The interface identifier for IXpsOMBrush
     * @type {Guid}
     */
    static IID := Guid("{56a3f80c-ea4c-4187-a57b-a2a473b2b42b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMBrush interfaces
    */
    struct Vtbl extends IXpsOMShareable.Vtbl {
        GetOpacity : IntPtr
        SetOpacity : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMBrush.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the opacity of the brush.
     * @remarks
     * <i>opacity</i> is expressed as a value between 0.0 and 1.0; 0.0 indicates that the brush is completely transparent, 0.5  that it is 50 percent opaque, and 1.0 that it is completely opaque.
     * @returns {Float} The opacity value of the brush.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsombrush-getopacity
     */
    GetOpacity() {
        result := ComCall(5, this, "float*", &opacity := 0, "HRESULT")
        return opacity
    }

    /**
     * Sets the opacity of the brush.
     * @remarks
     * <i>opacity</i> is expressed as a value between 0.0 and 1.0; 0.0 indicates that the brush is completely transparent, 0.5  that it is 50 percent opaque, and 1.0 that it is completely opaque.
     * 
     * If <i>opacity</i> is less than 0.0 or greater than 1.0, the method  returns an error.
     * @param {Float} opacity The opacity value of the brush.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The method succeeded.
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
     * <i>opacity</i> is not a valid value. See the Remarks section.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsombrush-setopacity
     */
    SetOpacity(opacity) {
        result := ComCall(6, this, "float", opacity, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsOMBrush.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOpacity := CallbackCreate(GetMethod(implObj, "GetOpacity"), flags, 2)
        this.vtbl.SetOpacity := CallbackCreate(GetMethod(implObj, "SetOpacity"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOpacity)
        CallbackFree(this.vtbl.SetOpacity)
    }
}
