#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsDocumentProvider extends IUnknown{
    /**
     * The interface identifier for IXpsDocumentProvider
     * @type {Guid}
     */
    static IID => Guid("{b8cf8530-5562-47c4-ab67-b1f69ecf961e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} ppIXpsPart 
     * @returns {HRESULT} 
     */
    GetXpsPart(ppIXpsPart) {
        result := ComCall(3, this, "ptr", ppIXpsPart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
