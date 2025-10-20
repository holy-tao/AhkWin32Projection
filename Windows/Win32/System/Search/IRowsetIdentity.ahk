#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetIdentity extends IUnknown{
    /**
     * The interface identifier for IRowsetIdentity
     * @type {Guid}
     */
    static IID => Guid("{0c733a09-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} hThisRow 
     * @param {Pointer} hThatRow 
     * @returns {HRESULT} 
     */
    IsSameRow(hThisRow, hThatRow) {
        result := ComCall(3, this, "ptr", hThisRow, "ptr", hThatRow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
