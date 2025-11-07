#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLSelectionObject2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLSelectionObject2
     * @type {Guid}
     */
    static IID => Guid("{3050f7ec-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["createRangeCollection", "get_typeDetail"]

    /**
     * 
     * @returns {IDispatch} 
     */
    createRangeCollection() {
        result := ComCall(7, this, "ptr*", &rangeCollection := 0, "HRESULT")
        return IDispatch(rangeCollection)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_typeDetail() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }
}
