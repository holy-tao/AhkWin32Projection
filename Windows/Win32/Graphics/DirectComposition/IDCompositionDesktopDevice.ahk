#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTarget.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IDCompositionDevice2.ahk

/**
 * An application must use the IDCompositionDesktopDevice interface in order to use DirectComposition in a Win32 desktop application.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositiondesktopdevice
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
     * @param {HWND} _hwnd 
     * @param {BOOL} topmost TRUE if the visual tree should be displayed on top of the children of the window specified by the hwnd parameter; otherwise, the visual tree is displayed behind the children.
     * @returns {IDCompositionTarget} The new composition target object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createtargetforhwnd
     */
    CreateTargetForHwnd(_hwnd, topmost) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(24, this, "ptr", _hwnd, "int", topmost, "ptr*", &target := 0, "HRESULT")
        return IDCompositionTarget(target)
    }

    /**
     * Creates a new composition surface object that wraps an existing composition surface.
     * @param {HANDLE} _handle 
     * @returns {IUnknown} The new composition surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createsurfacefromhandle
     */
    CreateSurfaceFromHandle(_handle) {
        _handle := _handle is Win32Handle ? NumGet(_handle, "ptr") : _handle

        result := ComCall(25, this, "ptr", _handle, "ptr*", &surface := 0, "HRESULT")
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
     * @param {HWND} _hwnd 
     * @returns {IUnknown} The new composition surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createsurfacefromhwnd
     */
    CreateSurfaceFromHwnd(_hwnd) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(26, this, "ptr", _hwnd, "ptr*", &surface := 0, "HRESULT")
        return IUnknown(surface)
    }
}
