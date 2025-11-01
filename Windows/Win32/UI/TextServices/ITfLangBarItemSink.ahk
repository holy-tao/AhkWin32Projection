#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLangBarItemSink interface is implemented by the language bar and used by a language bar item provider to notify the language bar of changes to a language bar item.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbaritemsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItemSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfLangBarItemSink
     * @type {Guid}
     */
    static IID => Guid("{57dbe1a0-de25-11d2-afdd-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUpdate"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemsink-onupdate
     */
    OnUpdate(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
