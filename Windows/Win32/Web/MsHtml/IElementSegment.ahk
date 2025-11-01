#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISegment.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementSegment extends ISegment{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementSegment
     * @type {Guid}
     */
    static IID => Guid("{3050f68f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetElement", "SetPrimary", "IsPrimary"]

    /**
     * 
     * @param {Pointer<IHTMLElement>} ppIElement 
     * @returns {HRESULT} 
     */
    GetElement(ppIElement) {
        result := ComCall(4, this, "ptr*", ppIElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fPrimary 
     * @returns {HRESULT} 
     */
    SetPrimary(fPrimary) {
        result := ComCall(5, this, "int", fPrimary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfPrimary 
     * @returns {HRESULT} 
     */
    IsPrimary(pfPrimary) {
        result := ComCall(6, this, "ptr", pfPrimary, "HRESULT")
        return result
    }
}
