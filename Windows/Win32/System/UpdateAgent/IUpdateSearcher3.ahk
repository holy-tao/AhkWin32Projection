#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateSearcher2.ahk

/**
 * Searches for updates on a server.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatesearcher3
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateSearcher3 extends IUpdateSearcher2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateSearcher3
     * @type {Guid}
     */
    static IID => Guid("{04c6895d-eaf2-4034-97f3-311de9be413a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SearchScope", "put_SearchScope"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_SearchScope(retval) {
        result := ComCall(27, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SearchScope(value) {
        result := ComCall(28, this, "int", value, "HRESULT")
        return result
    }
}
