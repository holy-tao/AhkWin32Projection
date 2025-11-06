#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Isolation
 * @version v4.0.30319
 */
class IIsolatedEnvironmentInterop extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHostHwndInterop"]

    /**
     * 
     * @param {HWND} containerHwnd 
     * @returns {HWND} 
     */
    GetHostHwndInterop(containerHwnd) {
        containerHwnd := containerHwnd is Win32Handle ? NumGet(containerHwnd, "ptr") : containerHwnd

        hostHwnd := HWND()
        result := ComCall(3, this, "ptr", containerHwnd, "ptr", hostHwnd, "HRESULT")
        return hostHwnd
    }
}
