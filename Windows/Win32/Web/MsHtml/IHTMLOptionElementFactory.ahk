#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLOptionElement.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLOptionElementFactory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLOptionElementFactory
     * @type {Guid}
     */
    static IID => Guid("{3050f38c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLOptionElementFactory
     * @type {Guid}
     */
    static CLSID => Guid("{3050f38d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["create"]

    /**
     * 
     * @param {VARIANT} text 
     * @param {VARIANT} value 
     * @param {VARIANT} defaultselected 
     * @param {VARIANT} selected 
     * @returns {IHTMLOptionElement} 
     */
    create(text, value, defaultselected, selected) {
        result := ComCall(7, this, "ptr", text, "ptr", value, "ptr", defaultselected, "ptr", selected, "ptr*", &__MIDL__IHTMLOptionElementFactory0000 := 0, "HRESULT")
        return IHTMLOptionElement(__MIDL__IHTMLOptionElementFactory0000)
    }
}
