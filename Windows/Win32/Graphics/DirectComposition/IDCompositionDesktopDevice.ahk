#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTarget.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IDCompositionDevice2.ahk

/**
 * An application must use the IDCompositionDesktopDevice interface in order to use DirectComposition in a Win32 desktop application.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiondesktopdevice
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionDesktopDevice extends IDCompositionDevice2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionDesktopDevice
     * @type {Guid}
     */
    static IID => Guid("{5f4633fe-1e08-4cb8-8c75-ce24333f5602}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTargetForHwnd", "CreateSurfaceFromHandle", "CreateSurfaceFromHwnd"]

    /**
     * Creates a composition target object that is bound to the window that is represented by the specified window handle.
     * @param {HWND} hwnd The window to which the composition target object should be bound. This parameter must not be NULL.
     * @param {BOOL} topmost TRUE if the visual tree should be displayed on top of the children of the window specified by the hwnd parameter; otherwise, the visual tree is displayed behind the children.
     * @returns {IDCompositionTarget} The new composition target object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondesktopdevice-createtargetforhwnd
     */
    CreateTargetForHwnd(hwnd, topmost) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(24, this, "ptr", hwnd, "int", topmost, "ptr*", &target := 0, "HRESULT")
        return IDCompositionTarget(target)
    }

    /**
     * Creates a new composition surface object that wraps an existing composition surface.
     * @param {HANDLE} handle The handle of an existing composition surface that was created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-dcompositioncreatesurfacehandle">DCompositionCreateSurfaceHandle</a> function.
     * @returns {IUnknown} The new composition surface object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondesktopdevice-createsurfacefromhandle
     */
    CreateSurfaceFromHandle(handle) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(25, this, "ptr", handle, "ptr*", &surface := 0, "HRESULT")
        return IUnknown(surface)
    }

    /**
     * Creates a wrapper object that represents the rasterization of a layered window, and that can be associated with a visual for composition.
     * @param {HWND} hwnd The handle of the layered window for which to create a wrapper. A layered window is created by specifying WS_EX_LAYERED when creating the window with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function or by setting WS_EX_LAYERED via <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowlonga">SetWindowLong</a> after the window has been created.
     * @returns {IUnknown} The new composition surface object. This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondesktopdevice-createsurfacefromhwnd
     */
    CreateSurfaceFromHwnd(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(26, this, "ptr", hwnd, "ptr*", &surface := 0, "HRESULT")
        return IUnknown(surface)
    }
}
