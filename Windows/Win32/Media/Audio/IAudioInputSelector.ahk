#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioInputSelector interface provides access to a hardware multiplexer control (input selector).
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iaudioinputselector
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioInputSelector extends IUnknown {
    /**
     * The interface identifier for IAudioInputSelector
     * @type {Guid}
     */
    static IID := Guid("{4f03dc02-5e6e-4653-8f72-a030c123d598}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioInputSelector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSelection : IntPtr
        SetSelection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioInputSelector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetSelection method gets the local ID of the part that is connected to the selector input that is currently selected.
     * @remarks
     * A local ID is a number that uniquely identifies a part among all parts in a device topology. To obtain a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart</a> interface of a part from its local ID, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-idevicetopology-getpartbyid">IDeviceTopology::GetPartById</a> method.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the local ID of the part that directly links to the currently selected selector input.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioinputselector-getselection
     */
    GetSelection() {
        result := ComCall(3, this, "uint*", &pnIdSelected := 0, "HRESULT")
        return pnIdSelected
    }

    /**
     * The SetSelection method selects one of the inputs of the input selector.
     * @remarks
     * A local ID is a number that uniquely identifies a part among all parts in a device topology. To obtain the local ID of a part, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-ipart-getlocalid">IPart::GetLocalId</a> method on the part object.
     * 
     * For a code example that calls the <b>SetSelection</b> method, see the implementation of the SelectCaptureDevice function in <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
     * @param {Integer} nIdSelect The new selector input. The caller should set this parameter to the local ID of a part that has a direct link to one of the selector inputs.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetSelection</b> call changes the state of the input-selector control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>nIdSelect</i> is not the local ID of a part at a selector input.
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
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioinputselector-setselection
     */
    SetSelection(nIdSelect, pguidEventContext) {
        result := ComCall(4, this, "uint", nIdSelect, Guid.Ptr, pguidEventContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioInputSelector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSelection := CallbackCreate(GetMethod(implObj, "GetSelection"), flags, 2)
        this.vtbl.SetSelection := CallbackCreate(GetMethod(implObj, "SetSelection"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSelection)
        CallbackFree(this.vtbl.SetSelection)
    }
}
