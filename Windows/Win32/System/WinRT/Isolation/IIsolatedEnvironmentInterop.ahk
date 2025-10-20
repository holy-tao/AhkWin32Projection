#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Isolation
 * @version v4.0.30319
 */
class IIsolatedEnvironmentInterop extends IUnknown{
    /**
     * The interface identifier for IIsolatedEnvironmentInterop
     * @type {Guid}
     */
    static IID => Guid("{85713c2e-8e62-46c5-8de2-c647e1d54636}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} containerHwnd 
     * @param {Pointer<HWND>} hostHwnd 
     * @returns {HRESULT} 
     */
    GetHostHwndInterop(containerHwnd, hostHwnd) {
        containerHwnd := containerHwnd is Win32Handle ? NumGet(containerHwnd, "ptr") : containerHwnd

        result := ComCall(3, this, "ptr", containerHwnd, "ptr", hostHwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
