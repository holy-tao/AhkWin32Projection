#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositorinterop
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositorInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositorInterop
     * @type {Guid}
     */
    static IID => Guid("{25297d5c-3ad4-4c9c-b5cf-e36a38512330}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCompositionSurfaceForHandle", "CreateCompositionSurfaceForSwapChain", "CreateGraphicsDevice"]

    /**
     * 
     * @param {HANDLE} swapChain 
     * @param {Pointer<ICompositionSurface>} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositorinterop-createcompositionsurfaceforhandle
     */
    CreateCompositionSurfaceForHandle(swapChain, result) {
        swapChain := swapChain is Win32Handle ? NumGet(swapChain, "ptr") : swapChain

        result := ComCall(3, this, "ptr", swapChain, "ptr*", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} swapChain 
     * @param {Pointer<ICompositionSurface>} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositorinterop-createcompositionsurfaceforswapchain
     */
    CreateCompositionSurfaceForSwapChain(swapChain, result) {
        result := ComCall(4, this, "ptr", swapChain, "ptr*", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} renderingDevice 
     * @param {Pointer<CompositionGraphicsDevice>} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositorinterop-creategraphicsdevice
     */
    CreateGraphicsDevice(renderingDevice, result) {
        result := ComCall(5, this, "ptr", renderingDevice, "ptr", result, "HRESULT")
        return result
    }
}
