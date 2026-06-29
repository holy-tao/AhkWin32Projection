#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION.ahk" { DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DIRECTMANIPULATION_DRAG_DROP_STATUS.ahk" { DIRECTMANIPULATION_DRAG_DROP_STATUS }

/**
 * Represents behaviors for drag and drop interactions, which are triggered by cross-slide or press-and-hold gestures.
 * @remarks
 * If <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration">AddConfiguration</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeconfiguration">RemoveConfiguration</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration">ActivateConfiguration</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setmanualgesture">SetManualGesture</a> has been called successfully on a viewport, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-addbehavior">AddBehavior</a> fails for the remaining lifetime of the viewport. 
 * 
 * Once the behavior is added to the viewport, calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration">AddConfiguration</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeconfiguration">RemoveConfiguration</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration">ActivateConfiguration</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setmanualgesture">SetManualGesture</a> will fail until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-removebehavior">RemoveBehavior</a> is called.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationdragdropbehavior
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationDragDropBehavior extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationDragDropBehavior
     * @type {Guid}
     */
    static IID := Guid("{814b5af5-c2c8-4270-a9b7-a198ce8d02fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationDragDropBehavior interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetConfiguration : IntPtr
        GetStatus        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationDragDropBehavior.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the configuration of the drag-drop interaction for the viewport this behavior is attached to.
     * @remarks
     * The configuration of the behavior can be set before or after it has been added to a viewport. If a configuration change is made while an interaction is occurring, the new configuration takes effect on the next interaction.
     * 
     *  
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration">IDirectManipulationViewport::ActivateConfiguration</a> should not be called prior to calling <b>IDirectManipulationDragDropBehavior::SetConfiguration</b>. This will result in  unexpected behavior.
     * @param {DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION} configuration Combination  of values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_drag_drop_configuration">DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION</a>.
     * 
     * For the configuration to be valid, <i>configuration</i> must contain exactly one of the following three values:
     * <ul>
     * <li><b>DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_ONLY</b></li>
     * <li><b>DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_DRAG</b></li>
     * <li><b>DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HOLD_DRAG</b></li>
     * </ul>
     * 
     * 
     * If <b>DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_ONLY</b> or  <b>DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_DRAG</b> is specified, one of <b>DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_VERTICAL</b> or <b>DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HORIZONTAL</b> is required.
     * 
     * 
     * If <b>DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HOLD_DRAG</b> is specified, both <b>DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_VERTICAL</b> and <b>DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HORIZONTAL</b> are required.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationdragdropbehavior-setconfiguration
     */
    SetConfiguration(configuration) {
        result := ComCall(3, this, DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION, configuration, "HRESULT")
        return result
    }

    /**
     * Gets the status of the drag-drop interaction for the viewport this behavior is attached to.
     * @remarks
     * This method returns the drag-drop status at the time of the call and not at the time when the return value is read.
     * @returns {DIRECTMANIPULATION_DRAG_DROP_STATUS} One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_drag_drop_status">DIRECTMANIPULATION_DRAG_DROP_STATUS</a>.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationdragdropbehavior-getstatus
     */
    GetStatus() {
        result := ComCall(4, this, "int*", &_status := 0, "HRESULT")
        return _status
    }

    Query(iid) {
        if (IDirectManipulationDragDropBehavior.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetConfiguration := CallbackCreate(GetMethod(implObj, "SetConfiguration"), flags, 2)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetConfiguration)
        CallbackFree(this.vtbl.GetStatus)
    }
}
