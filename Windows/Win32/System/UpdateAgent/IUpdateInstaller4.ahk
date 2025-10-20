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
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Commit(dwFlags) {
        result := ComCall(32, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
