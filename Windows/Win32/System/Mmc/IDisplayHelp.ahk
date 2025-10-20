#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IDisplayHelp interface is introduced in MMC version 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-idisplayhelp
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IDisplayHelp extends IUnknown{
    /**
     * The interface identifier for IDisplayHelp
     * @type {Guid}
     */
    static IID => Guid("{cc593830-b926-11d1-8063-0000f875a9ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszHelpTopic 
     * @returns {HRESULT} 
     */
    ShowTopic(pszHelpTopic) {
        pszHelpTopic := pszHelpTopic is String ? StrPtr(pszHelpTopic) : pszHelpTopic

        result := ComCall(3, this, "ptr", pszHelpTopic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
