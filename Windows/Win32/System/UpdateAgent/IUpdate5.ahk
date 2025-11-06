#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdate4.ahk

/**
 * Contains the properties and methods that are available to an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdate5
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdate5 extends IUpdate4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdate5
     * @type {Guid}
     */
    static IID => Guid("{c1c2f21a-d2f4-4902-b5c6-8a081c19a890}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 58

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutoSelection", "get_AutoDownload"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate5-get_autoselection
     */
    get_AutoSelection() {
        result := ComCall(58, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate5-get_autodownload
     */
    get_AutoDownload() {
        result := ComCall(59, this, "int*", &retval := 0, "HRESULT")
        return retval
    }
}
