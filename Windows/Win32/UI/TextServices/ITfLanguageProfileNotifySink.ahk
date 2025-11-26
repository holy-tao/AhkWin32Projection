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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnLanguageChange", "OnLanguageChanged"]

    /**
     * ITfLanguageProfileNotifySink::OnLanguageChange method
     * @param {Integer} langid Contains a <b>LANGID</b> value the identifies the new language profile.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives a flag that permits or prevents the language profile change. Receives zero to prevent the language profile change or nonzero to permit the language profile change.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itflanguageprofilenotifysink-onlanguagechange
     */
    OnLanguageChange(langid) {
        result := ComCall(3, this, "ushort", langid, "int*", &pfAccept := 0, "HRESULT")
        return pfAccept
    }

    /**
     * ITfLanguageProfileNotifySink::OnLanguageChanged method
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itflanguageprofilenotifysink-onlanguagechanged
     */
    OnLanguageChanged() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
