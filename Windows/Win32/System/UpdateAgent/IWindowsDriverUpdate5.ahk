#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWindowsDriverUpdate4.ahk

/**
 * Contains the properties and methods that are available only from a Windows driver update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwindowsdriverupdate5
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWindowsDriverUpdate5 extends IWindowsDriverUpdate4{
    /**
     * The interface identifier for IWindowsDriverUpdate5
     * @type {Guid}
     */
    static IID => Guid("{70cf5c82-8642-42bb-9dbc-0cfd263c6c4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 67

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_AutoSelection(retval) {
        result := ComCall(67, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_AutoDownload(retval) {
        result := ComCall(68, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
