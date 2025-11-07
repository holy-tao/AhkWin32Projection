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
     * 
     * @param {HWND} hwnd 
     * @param {BOOL} topmost 
     * @returns {IDCompositionTarget} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createtargetforhwnd
     */
    CreateTargetForHwnd(hwnd, topmost) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(24, this, "ptr", hwnd, "int", topmost, "ptr*", &target := 0, "HRESULT")
        return IDCompositionTarget(target)
    }

    /**
     * 
     * @param {HANDLE} handle 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createsurfacefromhandle
     */
    CreateSurfaceFromHandle(handle) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(25, this, "ptr", handle, "ptr*", &surface := 0, "HRESULT")
        return IUnknown(surface)
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createsurfacefromhwnd
     */
    CreateSurfaceFromHwnd(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(26, this, "ptr", hwnd, "ptr*", &surface := 0, "HRESULT")
        return IUnknown(surface)
    }
}
