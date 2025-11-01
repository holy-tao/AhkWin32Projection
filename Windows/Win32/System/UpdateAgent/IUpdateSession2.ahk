#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateSession.ahk

/**
 * Represents a session in which the caller can perform operations that involve updates. For example, this interface represents sessions in which the caller performs a search, download, installation, or uninstallation operation.
 * @remarks
 * 
  * You can create an instance of this interface by using the UpdateSession coclass. Use the Microsoft.Update.Session program identifier to create the object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatesession2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateSession2 extends IUpdateSession{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateSession2
     * @type {Guid}
     */
    static IID => Guid("{91caf7b0-eb23-49ed-9937-c52d817f46f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserLocale", "put_UserLocale"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale
     */
    get_UserLocale(retval) {
        retvalMarshal := retval is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession2-put_userlocale
     */
    put_UserLocale(lcid) {
        result := ComCall(16, this, "uint", lcid, "HRESULT")
        return result
    }
}
