#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateInstaller3.ahk

/**
 * Provides methods to finalize updates that were previously staged or installed.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdateinstaller4
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateInstaller4 extends IUpdateInstaller3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateInstaller4
     * @type {Guid}
     */
    static IID => Guid("{ef8208ea-2304-492d-9109-23813b0958e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Commit"]

    /**
     * Finalizes updates that were previously staged or installed.
     * @remarks
     * The **Commit** API was made public in the 1809 SDK. Any app compiled with the wuapi.h header can use the **Commit** method on previous versions of Windows 10 as well.
     * 
     * **Commit** should only be called once. This call should happen just prior to commencing a reboot. Calling it multiple times prior to a reboot is not supported and may cause the update to fail.
     * 
     * Calling **Commit** is required prior to rebooting when a feature update is pending reboot. If **Commit** is not called in this circumstance the update won’t be finalized and installed during the reboot.
     * 
     * **Commit** is safe to call prior to reboot for any other types of updates as well.
     * @param {Integer} dwFlags Reserved for future use.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows 
     * 
     * error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller4-commit
     */
    Commit(dwFlags) {
        result := ComCall(32, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
