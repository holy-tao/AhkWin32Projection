#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWindowsDriverUpdate3.ahk

/**
 * Contains the properties and methods that are available only from a Windows driver update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwindowsdriverupdate4
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWindowsDriverUpdate4 extends IWindowsDriverUpdate3{
    /**
     * The interface identifier for IWindowsDriverUpdate4
     * @type {Guid}
     */
    static IID => Guid("{004c6a2b-0c19-4c69-9f5c-a269b2560db9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 65

    /**
     * 
     * @param {Pointer<IWindowsDriverUpdateEntryCollection>} retval 
     * @returns {HRESULT} 
     */
    get_WindowsDriverUpdateEntries(retval) {
        result := ComCall(65, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_PerUser(retval) {
        result := ComCall(66, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
