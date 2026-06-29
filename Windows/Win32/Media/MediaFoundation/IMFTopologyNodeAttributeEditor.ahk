#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFTOPONODE_ATTRIBUTE_UPDATE.ahk" { MFTOPONODE_ATTRIBUTE_UPDATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Updates the attributes of one or more nodes in the Media Session's current topology.
 * @remarks
 * Currently the only attribute that can be updated is the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-toponode-mediastop-attribute">MF_TOPONODE_MEDIASTOP</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imftopologynodeattributeeditor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTopologyNodeAttributeEditor extends IUnknown {
    /**
     * The interface identifier for IMFTopologyNodeAttributeEditor
     * @type {Guid}
     */
    static IID := Guid("{676aa6dd-238a-410d-bb99-65668d01605a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTopologyNodeAttributeEditor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UpdateNodeAttributes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTopologyNodeAttributeEditor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Updates the attributes of one or more nodes in the current topology.
     * @remarks
     * Currently the only attribute that can be updated is the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-toponode-mediastop-attribute">MF_TOPONODE_MEDIASTOP</a> attribute. The method ignores any other attributes.
     * @param {Integer} TopoId Reserved.
     * @param {Integer} cUpdates The number of elements in the <i>pUpdates</i> array.
     * @param {Pointer<MFTOPONODE_ATTRIBUTE_UPDATE>} pUpdates Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mftoponode_attribute_update">MFTOPONODE_ATTRIBUTE_UPDATE</a> structures. Each element of the array updates one attribute on a node.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynodeattributeeditor-updatenodeattributes
     */
    UpdateNodeAttributes(TopoId, cUpdates, pUpdates) {
        result := ComCall(3, this, "uint", TopoId, "uint", cUpdates, MFTOPONODE_ATTRIBUTE_UPDATE.Ptr, pUpdates, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFTopologyNodeAttributeEditor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdateNodeAttributes := CallbackCreate(GetMethod(implObj, "UpdateNodeAttributes"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdateNodeAttributes)
    }
}
