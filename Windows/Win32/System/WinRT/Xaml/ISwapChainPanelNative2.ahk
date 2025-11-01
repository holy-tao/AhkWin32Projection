#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISwapChainPanelNative.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-iswapchainpanelnative2
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISwapChainPanelNative2 extends ISwapChainPanelNative{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwapChainPanelNative2
     * @type {Guid}
     */
    static IID => Guid("{d5a2f60c-37b2-44a2-937b-8d8eb9726821}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSwapChainHandle"]

    /**
     * 
     * @param {HANDLE} swapChainHandle 
     * @returns {HRESULT} 
     */
    SetSwapChainHandle(swapChainHandle) {
        swapChainHandle := swapChainHandle is Win32Handle ? NumGet(swapChainHandle, "ptr") : swapChainHandle

        result := ComCall(4, this, "ptr", swapChainHandle, "HRESULT")
        return result
    }
}
