#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfTextEditSink interface supports completion of an edit session that involves read/write access.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itftexteditsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfTextEditSink extends IUnknown{
    /**
     * The interface identifier for ITfTextEditSink
     * @type {Guid}
     */
    static IID => Guid("{8127d409-ccd3-4683-967a-b43d5b482bf7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @param {Integer} ecReadOnly 
     * @param {Pointer<ITfEditRecord>} pEditRecord 
     * @returns {HRESULT} 
     */
    OnEndEdit(pic, ecReadOnly, pEditRecord) {
        result := ComCall(3, this, "ptr", pic, "uint", ecReadOnly, "ptr", pEditRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
