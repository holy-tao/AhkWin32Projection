#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION.ahk" { DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DIRECTMANIPULATION_MOTION_TYPES.ahk" { DIRECTMANIPULATION_MOTION_TYPES }

/**
 * Represents the auto-scroll animation behavior of content as it approaches the boundary of a given axis or axes.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationautoscrollbehavior
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationAutoScrollBehavior extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationAutoScrollBehavior
     * @type {Guid}
     */
    static IID := Guid("{6d5954d4-2003-4356-9b31-d051c9ff0af7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationAutoScrollBehavior interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetConfiguration : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationAutoScrollBehavior.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Performs the auto-scroll animation for the viewport this behavior is attached to.
     * @remarks
     * <b>SetConfiguration</b> takes effect immediately. If the content is not in inertia, and <b>DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_STOP</b> is specified for <i>scrollMotion</i>, then this method returns S_FALSE.
     * @param {DIRECTMANIPULATION_MOTION_TYPES} motionTypes A combination of <b>DIRECTMANIPULATION_MOTION_TRANSLATEX</b> and <b>DIRECTMANIPULATION_MOTION_TRANSLATEY</b> from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a>. <b>DIRECTMANIPULATION_MOTION_NONE</b> cannot be specified.
     * @param {DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION} scrollMotion One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_autoscroll_configuration">DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationautoscrollbehavior-setconfiguration
     */
    SetConfiguration(motionTypes, scrollMotion) {
        result := ComCall(3, this, DIRECTMANIPULATION_MOTION_TYPES, motionTypes, DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION, scrollMotion, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationAutoScrollBehavior.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetConfiguration := CallbackCreate(GetMethod(implObj, "SetConfiguration"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetConfiguration)
    }
}
