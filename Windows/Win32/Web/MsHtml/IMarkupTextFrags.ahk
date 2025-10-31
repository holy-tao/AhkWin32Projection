#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupTextFrags extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMarkupTextFrags
     * @type {Guid}
     */
    static IID => Guid("{3050f5fa-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTextFragCount", "GetTextFrag", "RemoveTextFrag", "InsertTextFrag", "FindTextFragFromMarkupPointer"]

    /**
     * 
     * @param {Pointer<Integer>} pcFrags 
     * @returns {HRESULT} 
     */
    GetTextFragCount(pcFrags) {
        result := ComCall(3, this, "int*", pcFrags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFrag 
     * @param {Pointer<BSTR>} pbstrFrag 
     * @param {IMarkupPointer} pPointerFrag 
     * @returns {HRESULT} 
     */
    GetTextFrag(iFrag, pbstrFrag, pPointerFrag) {
        result := ComCall(4, this, "int", iFrag, "ptr", pbstrFrag, "ptr", pPointerFrag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFrag 
     * @returns {HRESULT} 
     */
    RemoveTextFrag(iFrag) {
        result := ComCall(5, this, "int", iFrag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFrag 
     * @param {BSTR} bstrInsert 
     * @param {IMarkupPointer} pPointerInsert 
     * @returns {HRESULT} 
     */
    InsertTextFrag(iFrag, bstrInsert, pPointerInsert) {
        bstrInsert := bstrInsert is String ? BSTR.Alloc(bstrInsert).Value : bstrInsert

        result := ComCall(6, this, "int", iFrag, "ptr", bstrInsert, "ptr", pPointerInsert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerFind 
     * @param {Pointer<Integer>} piFrag 
     * @param {Pointer<BOOL>} pfFragFound 
     * @returns {HRESULT} 
     */
    FindTextFragFromMarkupPointer(pPointerFind, piFrag, pfFragFound) {
        result := ComCall(7, this, "ptr", pPointerFind, "int*", piFrag, "ptr", pfFragFound, "HRESULT")
        return result
    }
}
