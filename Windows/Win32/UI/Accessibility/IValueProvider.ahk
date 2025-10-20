#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that have an intrinsic value that does not span a range, and that can be represented as a string.
 * @remarks
 * 
  * The value of the control may or may not be editable depending on the control and its settings.
  *         
  * 
  * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingvalue">Value</a> control pattern.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-ivalueprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IValueProvider extends IUnknown{
    /**
     * The interface identifier for IValueProvider
     * @type {Guid}
     */
    static IID => Guid("{c7935180-6fb3-4201-b174-7df73adbf64a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} val 
     * @returns {HRESULT} 
     */
    SetValue(val) {
        val := val is String ? StrPtr(val) : val

        result := ComCall(3, this, "ptr", val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRetVal 
     * @returns {HRESULT} 
     */
    get_Value(pRetVal) {
        result := ComCall(4, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     */
    get_IsReadOnly(pRetVal) {
        result := ComCall(5, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
