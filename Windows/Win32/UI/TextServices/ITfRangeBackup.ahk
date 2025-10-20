#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfRangeBackup interface is implemented by the TSF manager and is used by a text service to create a backup copy of the data contained in a range object.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfrangebackup
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfRangeBackup extends IUnknown{
    /**
     * The interface identifier for ITfRangeBackup
     * @type {Guid}
     */
    static IID => Guid("{463a506d-6992-49d2-9b88-93d55e70bb16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} pRange 
     * @returns {HRESULT} 
     */
    Restore(ec, pRange) {
        result := ComCall(3, this, "uint", ec, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
