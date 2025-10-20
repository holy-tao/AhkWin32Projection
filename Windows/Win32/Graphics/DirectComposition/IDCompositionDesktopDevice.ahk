#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IDCompositionTarget>} target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createtargetforhwnd
     */
    CreateTargetForHwnd(hwnd, topmost, target) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(24, this, "ptr", hwnd, "int", topmost, "ptr*", target, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} handle 
     * @param {Pointer<IUnknown>} surface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createsurfacefromhandle
     */
    CreateSurfaceFromHandle(handle, surface) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(25, this, "ptr", handle, "ptr*", surface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IUnknown>} surface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondesktopdevice-createsurfacefromhwnd
     */
    CreateSurfaceFromHwnd(hwnd, surface) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(26, this, "ptr", hwnd, "ptr*", surface, "HRESULT")
        return result
    }
}
