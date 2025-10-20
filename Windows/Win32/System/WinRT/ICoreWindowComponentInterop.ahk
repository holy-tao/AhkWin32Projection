#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICoreWindowComponentInterop extends IUnknown{
    /**
     * The interface identifier for ICoreWindowComponentInterop
     * @type {Guid}
     */
    static IID => Guid("{0576ab31-a310-4c40-ba31-fd37e0298dfa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} hostViewInstanceId 
     * @param {HWND} hwndHost 
     * @param {Pointer<IUnknown>} inputSourceVisual 
     * @returns {HRESULT} 
     */
    ConfigureComponentInput(hostViewInstanceId, hwndHost, inputSourceVisual) {
        hwndHost := hwndHost is Win32Handle ? NumGet(hwndHost, "ptr") : hwndHost

        result := ComCall(3, this, "uint", hostViewInstanceId, "ptr", hwndHost, "ptr", inputSourceVisual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} componentViewInstanceId 
     * @returns {HRESULT} 
     */
    GetViewInstanceId(componentViewInstanceId) {
        result := ComCall(4, this, "uint*", componentViewInstanceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
