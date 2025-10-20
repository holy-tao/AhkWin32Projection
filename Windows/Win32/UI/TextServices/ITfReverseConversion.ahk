#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Performs a reverse conversion of a specified string.
 * @remarks
 * 
  * A reverse conversion provides the keystroke sequences required to create the specified string.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfreverseconversion
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfReverseConversion extends IUnknown{
    /**
     * The interface identifier for ITfReverseConversion
     * @type {Guid}
     */
    static IID => Guid("{a415e162-157d-417d-8a8c-0ab26c7d2781}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} lpstr 
     * @param {Pointer<ITfReverseConversionList>} ppList 
     * @returns {HRESULT} 
     */
    DoReverseConversion(lpstr, ppList) {
        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        result := ComCall(3, this, "ptr", lpstr, "ptr", ppList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
