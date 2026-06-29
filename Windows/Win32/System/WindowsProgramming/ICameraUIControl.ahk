#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICameraUIControlEventCallback.ahk" { ICameraUIControlEventCallback }
#Import ".\CameraUIControlLinearSelectionMode.ahk" { CameraUIControlLinearSelectionMode }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\CameraUIControlVideoFormat.ahk" { CameraUIControlVideoFormat }
#Import ".\CameraUIControlMode.ahk" { CameraUIControlMode }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\CameraUIControlCaptureMode.ahk" { CameraUIControlCaptureMode }
#Import ".\CameraUIControlViewType.ahk" { CameraUIControlViewType }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CameraUIControlPhotoFormat.ahk" { CameraUIControlPhotoFormat }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a user interface control for a camera device..
 * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nn-camerauicontrol-icamerauicontrol
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct ICameraUIControl extends IUnknown {
    /**
     * The interface identifier for ICameraUIControl
     * @type {Guid}
     */
    static IID := Guid("{b8733adf-3d68-4b8f-bb08-e28a0bed0376}")

    /**
     * The class identifier for CameraUIControl
     * @type {Guid}
     */
    static CLSID := Guid("{16d5a2be-b1c5-47b3-8eae-ccbcf452c7e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICameraUIControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Show               : IntPtr
        Close              : IntPtr
        Suspend            : IntPtr
        Resume             : IntPtr
        GetCurrentViewType : IntPtr
        GetActiveItem      : IntPtr
        GetSelectedItems   : IntPtr
        RemoveCapturedItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICameraUIControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Displays the user interface control for the camera.
     * @param {IUnknown} pWindow Pointer to the user interface window.
     * @param {CameraUIControlMode} _mode Specifies whether the user interface will be presented in a browseable or linear manner.
     * @param {CameraUIControlLinearSelectionMode} selectionMode Specifies the selection mode.
     * @param {CameraUIControlCaptureMode} captureMode Specifies whether the user interface that will be shown allows the user to capture a photo, capture a video, or either.
     * @param {CameraUIControlPhotoFormat} photoFormat Provides the format for capturing photos. The available formats include JPEG, PNG, and JPEG XR.
     * @param {CameraUIControlVideoFormat} videoFormat Provides the format for capturing videos. The available formats include MP4 and WMV.
     * @param {BOOL} bHasCloseButton TRUE if the user interface has a close button, otherwise, FALSE.
     * @param {ICameraUIControlEventCallback} pEventCallback Pointer to an event callback for the dialog. The callback is invoked if an item is captured or deleted, and when the dialog starts, or is closed or suspended.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-show
     */
    Show(pWindow, _mode, selectionMode, captureMode, photoFormat, videoFormat, bHasCloseButton, pEventCallback) {
        result := ComCall(3, this, "ptr", pWindow, CameraUIControlMode, _mode, CameraUIControlLinearSelectionMode, selectionMode, CameraUIControlCaptureMode, captureMode, CameraUIControlPhotoFormat, photoFormat, CameraUIControlVideoFormat, videoFormat, BOOL, bHasCloseButton, "ptr", pEventCallback, "HRESULT")
        return result
    }

    /**
     * Closes the user interface control.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Simulates suspend of the user interface control.
     * @returns {BOOL} TRUE if the suspend operation requires deferral; otherwise, FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-suspend
     */
    Suspend() {
        result := ComCall(5, this, BOOL.Ptr, &pbDeferralRequired := 0, "HRESULT")
        return pbDeferralRequired
    }

    /**
     * Simulates resume of the user interface control.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-resume
     */
    Resume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Gets the type of the current view.
     * @returns {CameraUIControlViewType} A value that indicates whether the UI presents single items or lists of items.
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-getcurrentviewtype
     */
    GetCurrentViewType() {
        result := ComCall(7, this, "int*", &pViewType := 0, "HRESULT")
        return pViewType
    }

    /**
     * Gets the active captured item.
     * @returns {BSTR} Path to the currently active captured item.
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-getactiveitem
     */
    GetActiveItem() {
        pbstrActiveItemPath := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrActiveItemPath, "HRESULT")
        return pbstrActiveItemPath
    }

    /**
     * Gets the selected items.
     * @returns {Pointer<SAFEARRAY>} An array of paths to captured items selected in the user interface.
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-getselecteditems
     */
    GetSelectedItems() {
        result := ComCall(9, this, "ptr*", &ppSelectedItemPaths := 0, "HRESULT")
        return ppSelectedItemPaths
    }

    /**
     * Removes the captured item.
     * @param {PWSTR} pszPath The path to the item to delete.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-removecaptureditem
     */
    RemoveCapturedItem(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICameraUIControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 9)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.Suspend := CallbackCreate(GetMethod(implObj, "Suspend"), flags, 2)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
        this.vtbl.GetCurrentViewType := CallbackCreate(GetMethod(implObj, "GetCurrentViewType"), flags, 2)
        this.vtbl.GetActiveItem := CallbackCreate(GetMethod(implObj, "GetActiveItem"), flags, 2)
        this.vtbl.GetSelectedItems := CallbackCreate(GetMethod(implObj, "GetSelectedItems"), flags, 2)
        this.vtbl.RemoveCapturedItem := CallbackCreate(GetMethod(implObj, "RemoveCapturedItem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Show)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.Suspend)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.GetCurrentViewType)
        CallbackFree(this.vtbl.GetActiveItem)
        CallbackFree(this.vtbl.GetSelectedItems)
        CallbackFree(this.vtbl.RemoveCapturedItem)
    }
}
