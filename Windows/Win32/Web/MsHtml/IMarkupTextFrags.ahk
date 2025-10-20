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
     * 
     * @param {Pointer<Int32>} pcFrags 
     * @returns {HRESULT} 
     */
    GetTextFragCount(pcFrags) {
        result := ComCall(3, this, "int*", pcFrags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFrag 
     * @param {Pointer<BSTR>} pbstrFrag 
     * @param {Pointer<IMarkupPointer>} pPointerFrag 
     * @returns {HRESULT} 
     */
    GetTextFrag(iFrag, pbstrFrag, pPointerFrag) {
        result := ComCall(4, this, "int", iFrag, "ptr", pbstrFrag, "ptr", pPointerFrag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFrag 
     * @returns {HRESULT} 
     */
    RemoveTextFrag(iFrag) {
        result := ComCall(5, this, "int", iFrag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFrag 
     * @param {BSTR} bstrInsert 
     * @param {Pointer<IMarkupPointer>} pPointerInsert 
     * @returns {HRESULT} 
     */
    InsertTextFrag(iFrag, bstrInsert, pPointerInsert) {
        bstrInsert := bstrInsert is String ? BSTR.Alloc(bstrInsert).Value : bstrInsert

        result := ComCall(6, this, "int", iFrag, "ptr", bstrInsert, "ptr", pPointerInsert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pPointerFind 
     * @param {Pointer<Int32>} piFrag 
     * @param {Pointer<BOOL>} pfFragFound 
     * @returns {HRESULT} 
     */
    FindTextFragFromMarkupPointer(pPointerFind, piFrag, pfFragFound) {
        result := ComCall(7, this, "ptr", pPointerFind, "int*", piFrag, "ptr", pfFragFound, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
