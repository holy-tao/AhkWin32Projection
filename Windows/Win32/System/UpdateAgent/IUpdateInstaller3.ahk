#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateInstaller2.ahk

/**
 * Installs or uninstalls updates on a computer.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateinstaller3
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateInstaller3 extends IUpdateInstaller2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateInstaller3
     * @type {Guid}
     */
    static IID => Guid("{16d11c35-099a-48d0-8338-5fae64047f8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AttemptCloseAppsIfNecessary", "put_AttemptCloseAppsIfNecessary"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller3-get_attemptcloseappsifnecessary
     */
    get_AttemptCloseAppsIfNecessary() {
        result := ComCall(30, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller3-put_attemptcloseappsifnecessary
     */
    put_AttemptCloseAppsIfNecessary(value) {
        result := ComCall(31, this, "short", value, "HRESULT")
        return result
    }
}
