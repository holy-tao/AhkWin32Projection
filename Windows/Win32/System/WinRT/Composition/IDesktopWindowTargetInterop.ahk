#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class IDesktopWindowTargetInterop extends IUnknown{
    /**
     * The interface identifier for IDesktopWindowTargetInterop
     * @type {Guid}
     */
    static IID => Guid("{35dbf59e-e3f9-45b0-81e7-fe75f4145dc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<HWND>} value 
     * @returns {HRESULT} 
     */
    get_Hwnd(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
