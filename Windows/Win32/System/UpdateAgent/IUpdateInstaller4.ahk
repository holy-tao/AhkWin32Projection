#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateInstaller3.ahk

/**
 * Provides methods to finalize updates that were previously staged or installed.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateinstaller4
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
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller4-commit
     */
    Commit(dwFlags) {
        result := ComCall(32, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
