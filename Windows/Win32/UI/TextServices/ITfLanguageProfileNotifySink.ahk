#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLanguageProfileNotifySink interface is implemented by an application to receive notifications when the language profile changes.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itflanguageprofilenotifysink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLanguageProfileNotifySink extends IUnknown{
    /**
     * The interface identifier for ITfLanguageProfileNotifySink
     * @type {Guid}
     */
    static IID => Guid("{43c9fe15-f494-4c17-9de2-b8a4ac350aa8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} langid 
     * @param {Pointer<BOOL>} pfAccept 
     * @returns {HRESULT} 
     */
    OnLanguageChange(langid, pfAccept) {
        result := ComCall(3, this, "ushort", langid, "ptr", pfAccept, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnLanguageChanged() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
