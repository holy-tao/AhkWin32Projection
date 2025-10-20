#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITravelLogEntry extends IUnknown{
    /**
     * The interface identifier for ITravelLogEntry
     * @type {Guid}
     */
    static IID => Guid("{7ebfdd87-ad18-11d3-a4c5-00c04f72d6b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTitle 
     * @returns {HRESULT} 
     */
    GetTitle(ppszTitle) {
        result := ComCall(3, this, "ptr", ppszTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszURL 
     * @returns {HRESULT} 
     */
    GetURL(ppszURL) {
        result := ComCall(4, this, "ptr", ppszURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
