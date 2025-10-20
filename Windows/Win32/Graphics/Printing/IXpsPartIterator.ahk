#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsPartIterator extends IUnknown{
    /**
     * The interface identifier for IXpsPartIterator
     * @type {Guid}
     */
    static IID => Guid("{0021d3cd-af6f-42ab-9999-14bc82a62d2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reset() {
        ComCall(3, this)
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pUri 
     * @param {Pointer<IUnknown>} ppXpsPart 
     * @returns {HRESULT} 
     */
    Current(pUri, ppXpsPart) {
        result := ComCall(4, this, "ptr", pUri, "ptr", ppXpsPart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsDone() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Next() {
        ComCall(6, this)
        return result
    }
}
