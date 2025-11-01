#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ILaunchUIContext extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAssociatedWindow", "SetTabGroupingPreference"]

    /**
     * 
     * @param {HWND} value 
     * @returns {HRESULT} 
     */
    SetAssociatedWindow(value) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(3, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetTabGroupingPreference(value) {
        result := ComCall(4, this, "uint", value, "HRESULT")
        return result
    }
}
