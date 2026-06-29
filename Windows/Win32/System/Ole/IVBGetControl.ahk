#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import ".\ENUM_CONTROLS_WHICH_FLAGS.ahk" { ENUM_CONTROLS_WHICH_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to all the controls on a Visual Basic container.
 * @see https://learn.microsoft.com/windows/win32/api/vbinterf/nn-vbinterf-ivbgetcontrol
 * @namespace Windows.Win32.System.Ole
 */
export default struct IVBGetControl extends IUnknown {
    /**
     * The interface identifier for IVBGetControl
     * @type {Guid}
     */
    static IID := Guid("{40a050a0-3c31-101b-a82e-08002b2b2337}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBGetControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumControls : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBGetControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enumerates the controls on the form.
     * @remarks
     * When migrating a VBX control to an OLE control, 
     *     <b>EnumControls</b> replaces the Visual Basic 
     *     <b>VBGetControl</b>, which is no longer supported.
     * @param {Integer} dwOleContF Specifies the type of OLE objects to be enumerated. This parameter can be one of the following 
     *       values enumerated by the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olecontf">OLECONTF</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OLECONTF_EMBEDDINGS"></a><a id="olecontf_embeddings"></a><dl>
     * <dt><b>OLECONTF_EMBEDDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerates the embedded objects on the form. Include this flag to enumerate OLE controls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OLECONTF_LINKS"></a><a id="olecontf_links"></a><dl>
     * <dt><b>OLECONTF_LINKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerates the linked objects on the form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OLECONTF_OTHER"></a><a id="olecontf_other"></a><dl>
     * <dt><b>OLECONTF_OTHER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerates all pseudo OLE objects. Include this flag to enumerate VBX controls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OLECONTF_ONLYUSER"></a><a id="olecontf_onlyuser"></a><dl>
     * <dt><b>OLECONTF_ONLYUSER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerates only objects that the user is aware of.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OLECONTF_ONLYIFRUNNING"></a><a id="olecontf_onlyifrunning"></a><dl>
     * <dt><b>OLECONTF_ONLYIFRUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerates only the objects that are running on the form.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When enumerating OLE controls, it is recommended that you combine the flags 
     *       <b>OLECONTF_ONLYUSER</b>, <b>OLECONTF_ONLYIFRUNNING</b>, and 
     *       <b>OLECONTF_EMBEDDINGS</b>. To include both OLE controls and VBX controls, add the 
     *       <b>OLECONTF_OTHERS</b> flag to this list. To enumerate only VBX controls, remove the 
     *       <b>OLECONTF_EMBEDDINGS</b> flag and include the <b>OLECONTF_OTHERS</b> 
     *       flag.
     * @param {ENUM_CONTROLS_WHICH_FLAGS} dwWhich 
     * @returns {IEnumUnknown} Pointer to an enumeration of OLE objects.
     * @see https://learn.microsoft.com/windows/win32/api/vbinterf/nf-vbinterf-ivbgetcontrol-enumcontrols
     */
    EnumControls(dwOleContF, dwWhich) {
        result := ComCall(3, this, "uint", dwOleContF, ENUM_CONTROLS_WHICH_FLAGS, dwWhich, "ptr*", &ppenumUnk := 0, "HRESULT")
        return IEnumUnknown(ppenumUnk)
    }

    Query(iid) {
        if (IVBGetControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumControls := CallbackCreate(GetMethod(implObj, "EnumControls"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumControls)
    }
}
