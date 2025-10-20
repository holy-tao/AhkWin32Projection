#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositorInterop extends IUnknown{
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
     * 
     * @param {HANDLE} swapChain 
     * @param {Pointer<ICompositionSurface>} result 
     * @returns {HRESULT} 
     */
    CreateCompositionSurfaceForHandle(swapChain, result) {
        swapChain := swapChain is Win32Handle ? NumGet(swapChain, "ptr") : swapChain

        result := ComCall(3, this, "ptr", swapChain, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} swapChain 
     * @param {Pointer<ICompositionSurface>} result 
     * @returns {HRESULT} 
     */
    CreateCompositionSurfaceForSwapChain(swapChain, result) {
        result := ComCall(4, this, "ptr", swapChain, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} renderingDevice 
     * @param {Pointer<CompositionGraphicsDevice>} result 
     * @returns {HRESULT} 
     */
    CreateGraphicsDevice(renderingDevice, result) {
        result := ComCall(5, this, "ptr", renderingDevice, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
