#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISwapChainBackgroundPanelNative extends IUnknown{
    /**
     * The interface identifier for ISwapChainBackgroundPanelNative
     * @type {Guid}
     */
    static IID => Guid("{43bebd4e-add5-4035-8f85-5608d08e9dc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDXGISwapChain>} swapChain 
     * @returns {HRESULT} 
     */
    SetSwapChain(swapChain) {
        result := ComCall(3, this, "ptr", swapChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
