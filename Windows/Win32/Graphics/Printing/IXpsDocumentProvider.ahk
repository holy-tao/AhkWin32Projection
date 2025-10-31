#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsDocumentProvider extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXpsPart"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppIXpsPart 
     * @returns {HRESULT} 
     */
    GetXpsPart(ppIXpsPart) {
        result := ComCall(3, this, "ptr*", ppIXpsPart, "HRESULT")
        return result
    }
}
