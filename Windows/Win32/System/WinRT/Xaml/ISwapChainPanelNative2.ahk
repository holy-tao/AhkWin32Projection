#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISwapChainPanelNative.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISwapChainPanelNative2 extends ISwapChainPanelNative{
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
     * 
     * @param {HANDLE} swapChainHandle 
     * @returns {HRESULT} 
     */
    SetSwapChainHandle(swapChainHandle) {
        swapChainHandle := swapChainHandle is Win32Handle ? NumGet(swapChainHandle, "ptr") : swapChainHandle

        result := ComCall(4, this, "ptr", swapChainHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
