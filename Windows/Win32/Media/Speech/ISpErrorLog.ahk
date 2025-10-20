#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpErrorLog extends IUnknown{
    /**
     * The interface identifier for ISpErrorLog
     * @type {Guid}
     */
    static IID => Guid("{f4711347-e608-11d2-a086-00c04f8ef9b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lLineNumber 
     * @param {HRESULT} hr 
     * @param {PWSTR} pszDescription 
     * @param {PWSTR} pszHelpFile 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     */
    AddError(lLineNumber, hr, pszDescription, pszHelpFile, dwHelpContext) {
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription
        pszHelpFile := pszHelpFile is String ? StrPtr(pszHelpFile) : pszHelpFile

        result := ComCall(3, this, "int", lLineNumber, "int", hr, "ptr", pszDescription, "ptr", pszHelpFile, "uint", dwHelpContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
