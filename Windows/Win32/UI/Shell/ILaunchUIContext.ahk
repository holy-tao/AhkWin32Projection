#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ILaunchUIContext extends IUnknown{
    /**
     * The interface identifier for ILaunchUIContext
     * @type {Guid}
     */
    static IID => Guid("{1791e8f6-21c7-4340-882a-a6a93e3fd73b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} value 
     * @returns {HRESULT} 
     */
    SetAssociatedWindow(value) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetTabGroupingPreference(value) {
        result := ComCall(4, this, "uint", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
