#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IDCompositionTarget.ahk" { IDCompositionTarget }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionDevice2.ahk" { IDCompositionDevice2 }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * An application must use the IDCompositionDesktopDevice interface in order to use DirectComposition in a Win32 desktop application.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositiondesktopdevice
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionDesktopDevice extends IDCompositionDevice2 {
    /**
     * The interface identifier for IDCompositionDesktopDevice
     * @type {Guid}
     */
    static IID := Guid("{5f4633fe-1e08-4cb8-8c75-ce24333f5602}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionDesktopDevice interfaces
    */
    struct Vtbl extends IDCompositionDevice2.Vtbl {
        CreateTargetForHwnd     : IntPtr
        CreateSurfaceFromHandle : IntPtr
        CreateSurfaceFromHwnd   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionDesktopDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a composition target object that is bound to the window that is represented by the specified window handle.
     * @remarks
     * A DirectComposition visual tree must be bound to a window before anything can be displayed on screen. The window can be a top-level window or a child window. In either case, the window can be a layered window, but in all cases the window must belong to the calling process. If the window belongs to a different process, this method returns <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_ACCESS_DENIED</a>.
     * 
     * When DirectComposition content is composed to the window, the content is always composed on top of whatever is drawn directly to that window through the device context returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdc">GetDC</a> function, or by calls to DirectX Present methods. However, because window clipping rules apply to DirectComposition content, if the window has child windows, those child windows may clip the visual tree. The topmost parameter determines whether child windows clip the visual tree.
     * 
     * Conceptually, each window consists of four layers:
     * 
     * <ol>
     * <li>The contents drawn directly to the window handle (this is the bottommost layer).</li>
     * <li>An optional DirectComposition visual tree.</li>
     * <li>The contents of all child windows, if any.</li>
     * <li>Another optional DirectComposition visual tree (this is the topmost layer).</li>
     * </ol>
     * All four layers are clipped to the window’s visible region.
     * 
     * At most, only two composition targets can be created for each window in the system, one topmost and one not topmost. If a composition target is already bound to the specified window at the specified layer, this method fails. When a composition target object is destroyed, the layer it composed is available for use by a new composition target object.
     * @param {HWND} _hwnd The window to which the composition target object should be bound. This parameter must not be NULL.
     * @param {BOOL} topmost TRUE if the visual tree should be displayed on top of the children of the window specified by the hwnd parameter; otherwise, the visual tree is displayed behind the children.
     * @returns {IDCompositionTarget} The new composition target object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createtargetforhwnd
     */
    CreateTargetForHwnd(_hwnd, topmost) {
        result := ComCall(24, this, HWND, _hwnd, BOOL, topmost, "ptr*", &target := 0, "HRESULT")
        return IDCompositionTarget(target)
    }

    /**
     * Creates a new composition surface object that wraps an existing composition surface.
     * @param {HANDLE} _handle The handle of an existing composition surface that was created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-dcompositioncreatesurfacehandle">DCompositionCreateSurfaceHandle</a> function.
     * @returns {IUnknown} The new composition surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createsurfacefromhandle
     */
    CreateSurfaceFromHandle(_handle) {
        result := ComCall(25, this, HANDLE, _handle, "ptr*", &surface := 0, "HRESULT")
        return IUnknown(surface)
    }

    /**
     * Creates a wrapper object that represents the rasterization of a layered window, and that can be associated with a visual for composition.
     * @remarks
     * You can use the surface pointer in calls to the IDCompositionVisual::SetContent method to set the content of one or more visuals. After setting the content, the visuals compose the contents of the specified layered window as long as the window is layered. If the window is unlayered, the window content disappears from the output of the composition tree. If the window is later re-layered, the window content reappears as long as it is still associated with a visual. If the window is resized, the affected visuals are re-composed.
     * 
     * 
     * 
     * The contents of the window are not cached beyond the life of the window. That is, if the window is destroyed, the affected visuals stop composing the window.
     * 
     * 
     * 
     * If the window is moved off-screen or resized to zero, the system stops composing the content of those visuals. You should use the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a> function with the DWMWA_CLOAK flag to "cloak" the layered child window when you need to hide the original window while allowing the system to continue to compose the content of the visuals.
     * @param {HWND} _hwnd The handle of the layered window for which to create a wrapper. A layered window is created by specifying WS_EX_LAYERED when creating the window with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function or by setting WS_EX_LAYERED via <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowlonga">SetWindowLong</a> after the window has been created.
     * @returns {IUnknown} The new composition surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createsurfacefromhwnd
     */
    CreateSurfaceFromHwnd(_hwnd) {
        result := ComCall(26, this, HWND, _hwnd, "ptr*", &surface := 0, "HRESULT")
        return IUnknown(surface)
    }

    Query(iid) {
        if (IDCompositionDesktopDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTargetForHwnd := CallbackCreate(GetMethod(implObj, "CreateTargetForHwnd"), flags, 4)
        this.vtbl.CreateSurfaceFromHandle := CallbackCreate(GetMethod(implObj, "CreateSurfaceFromHandle"), flags, 3)
        this.vtbl.CreateSurfaceFromHwnd := CallbackCreate(GetMethod(implObj, "CreateSurfaceFromHwnd"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTargetForHwnd)
        CallbackFree(this.vtbl.CreateSurfaceFromHandle)
        CallbackFree(this.vtbl.CreateSurfaceFromHwnd)
    }
}
