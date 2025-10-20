#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfComposition interface is implemented by the TSF manager and is used by a text service to obtain data about and terminate a composition. An instance of this interface is provided by the ITfContextComposition::StartComposition method.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcomposition
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfComposition extends IUnknown{
    /**
     * The interface identifier for ITfComposition
     * @type {Guid}
     */
    static IID => Guid("{20168d64-5a8f-4a5a-b7bd-cfa29f4d0fd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITfRange>} ppRange 
     * @returns {HRESULT} 
     */
    GetRange(ppRange) {
        result := ComCall(3, this, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ecWrite 
     * @param {Pointer<ITfRange>} pNewStart 
     * @returns {HRESULT} 
     */
    ShiftStart(ecWrite, pNewStart) {
        result := ComCall(4, this, "uint", ecWrite, "ptr", pNewStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ecWrite 
     * @param {Pointer<ITfRange>} pNewEnd 
     * @returns {HRESULT} 
     */
    ShiftEnd(ecWrite, pNewEnd) {
        result := ComCall(5, this, "uint", ecWrite, "ptr", pNewEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ecWrite 
     * @returns {HRESULT} 
     */
    EndComposition(ecWrite) {
        result := ComCall(6, this, "uint", ecWrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
