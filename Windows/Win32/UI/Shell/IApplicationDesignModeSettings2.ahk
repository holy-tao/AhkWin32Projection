#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\APPLICATION_VIEW_MIN_WIDTH.ahk" { APPLICATION_VIEW_MIN_WIDTH }
#Import ".\APPLICATION_VIEW_ORIENTATION.ahk" { APPLICATION_VIEW_ORIENTATION }
#Import ".\NATIVE_DISPLAY_ORIENTATION.ahk" { NATIVE_DISPLAY_ORIENTATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IApplicationDesignModeSettings.ahk" { IApplicationDesignModeSettings }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\ADJACENT_DISPLAY_EDGES.ahk" { ADJACENT_DISPLAY_EDGES }

/**
 * Enables development tool applications to dynamically control system and user states, such as native display resolution, device scale factor, and application view layout, reported to Windows Store apps for the purpose of testing Windows Store apps running in design mode for a wide range of form factors without the need for the actual hardware. Also enables testing of changes in normally user-controlled state to test Windows Store apps under a variety of scenarios.
 * @remarks
 * This interface is acquired by cocreating CLSID_ApplicationDesignModeSettings. It is an extension of the original <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iapplicationdesignmodesettings">IApplicationDesignModeSettings</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iapplicationdesignmodesettings2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IApplicationDesignModeSettings2 extends IApplicationDesignModeSettings {
    /**
     * The interface identifier for IApplicationDesignModeSettings2
     * @type {Guid}
     */
    static IID := Guid("{490514e1-675a-4d6e-a58d-e54901b4ca2f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IApplicationDesignModeSettings2 interfaces
    */
    struct Vtbl extends IApplicationDesignModeSettings.Vtbl {
        SetNativeDisplayOrientation   : IntPtr
        SetApplicationViewOrientation : IntPtr
        SetAdjacentDisplayEdges       : IntPtr
        SetIsOnLockScreen             : IntPtr
        SetApplicationViewMinWidth    : IntPtr
        GetApplicationSizeBounds      : IntPtr
        GetApplicationViewOrientation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IApplicationDesignModeSettings2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the orientation of the emulated display for the design mode window.
     * @param {NATIVE_DISPLAY_ORIENTATION} nativeDisplayOrientation Type: <b>NATIVE_DISPLAY_ORIENTATION</b>
     * 
     * The native orientation of the display to emulate.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-setnativedisplayorientation
     */
    SetNativeDisplayOrientation(nativeDisplayOrientation) {
        result := ComCall(9, this, NATIVE_DISPLAY_ORIENTATION, nativeDisplayOrientation, "HRESULT")
        return result
    }

    /**
     * Sets the window orientation used for the design mode window.
     * @param {APPLICATION_VIEW_ORIENTATION} viewOrientation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_orientation">APPLICATION_VIEW_ORIENTATION</a></b>
     * 
     * The orientation of the design mode window to use. Either <b>AVO_LANDSCAPE</b> or <b>AVO_PORTRAIT</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-setapplicationvieworientation
     */
    SetApplicationViewOrientation(viewOrientation) {
        result := ComCall(10, this, APPLICATION_VIEW_ORIENTATION, viewOrientation, "HRESULT")
        return result
    }

    /**
     * Sets whether the application window will be adjacent to the edge of the emulated display.
     * @param {ADJACENT_DISPLAY_EDGES} adjacentDisplayEdges Type: <b>ADJACENT_DISPLAY_EDGES</b>
     * 
     * The edge which should be adjacent.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-setadjacentdisplayedges
     */
    SetAdjacentDisplayEdges(adjacentDisplayEdges) {
        result := ComCall(11, this, ADJACENT_DISPLAY_EDGES, adjacentDisplayEdges, "HRESULT")
        return result
    }

    /**
     * This method determines whether or not the application, in design mode, can display information on the Windows 8 lock screen.
     * @param {BOOL} isOnLockScreen Type: <b>BOOL</b>
     * 
     * When set to <b>TRUE</b>, the application will display information on the lock screen. When set to <b>FALSE</b>, information will not be displayed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-setisonlockscreen
     */
    SetIsOnLockScreen(isOnLockScreen) {
        result := ComCall(12, this, BOOL, isOnLockScreen, "HRESULT")
        return result
    }

    /**
     * Sets the desired minimum width of the application design mode window.
     * @param {APPLICATION_VIEW_MIN_WIDTH} viewMinWidth Type: <b>APPLICATION_VIEW_MIN_WIDTH</b>
     * 
     * The minimum width value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-setapplicationviewminwidth
     */
    SetApplicationViewMinWidth(viewMinWidth) {
        result := ComCall(13, this, APPLICATION_VIEW_MIN_WIDTH, viewMinWidth, "HRESULT")
        return result
    }

    /**
     * This methods retrieves the size bounds supported by the application.
     * @param {Pointer<SIZE>} minApplicationSizePixels Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a>*</b>
     * 
     * When this method returns successfully, receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that defines the minimum possible window size.
     * @param {Pointer<SIZE>} maxApplicationSizePixels Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a>*</b>
     * 
     * When this method returns successfully, receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that defines the maximum possible window size.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-getapplicationsizebounds
     */
    GetApplicationSizeBounds(minApplicationSizePixels, maxApplicationSizePixels) {
        result := ComCall(14, this, SIZE.Ptr, minApplicationSizePixels, SIZE.Ptr, maxApplicationSizePixels, "HRESULT")
        return result
    }

    /**
     * Gets the orientation of the application design mode window.
     * @param {SIZE} applicationSizePixels Type: <b>SIZE</b>
     * 
     * The application window size.
     * @returns {APPLICATION_VIEW_ORIENTATION} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_orientation">APPLICATION_VIEW_ORIENTATION</a>*</b>
     * 
     * When this method returns successfully, receives a pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_orientation">APPLICATION_VIEW_ORIENTATION</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-getapplicationvieworientation
     */
    GetApplicationViewOrientation(applicationSizePixels) {
        result := ComCall(15, this, SIZE, applicationSizePixels, "int*", &viewOrientation := 0, "HRESULT")
        return viewOrientation
    }

    Query(iid) {
        if (IApplicationDesignModeSettings2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetNativeDisplayOrientation := CallbackCreate(GetMethod(implObj, "SetNativeDisplayOrientation"), flags, 2)
        this.vtbl.SetApplicationViewOrientation := CallbackCreate(GetMethod(implObj, "SetApplicationViewOrientation"), flags, 2)
        this.vtbl.SetAdjacentDisplayEdges := CallbackCreate(GetMethod(implObj, "SetAdjacentDisplayEdges"), flags, 2)
        this.vtbl.SetIsOnLockScreen := CallbackCreate(GetMethod(implObj, "SetIsOnLockScreen"), flags, 2)
        this.vtbl.SetApplicationViewMinWidth := CallbackCreate(GetMethod(implObj, "SetApplicationViewMinWidth"), flags, 2)
        this.vtbl.GetApplicationSizeBounds := CallbackCreate(GetMethod(implObj, "GetApplicationSizeBounds"), flags, 3)
        this.vtbl.GetApplicationViewOrientation := CallbackCreate(GetMethod(implObj, "GetApplicationViewOrientation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetNativeDisplayOrientation)
        CallbackFree(this.vtbl.SetApplicationViewOrientation)
        CallbackFree(this.vtbl.SetAdjacentDisplayEdges)
        CallbackFree(this.vtbl.SetIsOnLockScreen)
        CallbackFree(this.vtbl.SetApplicationViewMinWidth)
        CallbackFree(this.vtbl.GetApplicationSizeBounds)
        CallbackFree(this.vtbl.GetApplicationViewOrientation)
    }
}
