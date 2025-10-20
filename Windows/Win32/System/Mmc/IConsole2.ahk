#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConsole.ahk

/**
 * The IConsole2 interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsole2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsole2 extends IConsole{
    /**
     * The interface identifier for IConsole2
     * @type {Guid}
     */
    static IID => Guid("{103d842a-aa63-11d1-a7e1-00c04fd8d565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer} hItem 
     * @param {BOOL} bExpand 
     * @returns {HRESULT} 
     */
    Expand(hItem, bExpand) {
        result := ComCall(14, this, "ptr", hItem, "int", bExpand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsTaskpadViewPreferred() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszStatusText 
     * @returns {HRESULT} 
     */
    SetStatusText(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(16, this, "ptr", pszStatusText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
