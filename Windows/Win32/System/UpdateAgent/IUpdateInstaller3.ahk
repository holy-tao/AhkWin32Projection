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
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_AttemptCloseAppsIfNecessary(retval) {
        result := ComCall(30, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_AttemptCloseAppsIfNecessary(value) {
        result := ComCall(31, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
