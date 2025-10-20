#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentHelper64 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentHelper64
     * @type {Guid}
     */
    static IID => Guid("{c4c7363c-20fd-47f9-bd82-4855e0150871}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "Attach", "Detach", "AddUnicodeText", "AddDBCSText", "SetDebugDocumentHost", "AddDeferredText", "DefineScriptBlock", "SetDefaultTextAttr", "SetTextAttributes", "SetLongName", "SetShortName", "SetDocumentAttr", "GetDebugApplicationNode", "GetScriptBlockInfo", "CreateDebugDocumentContext", "BringDocumentToTop", "BringDocumentContextToTop"]

    /**
     * 
     * @param {IDebugApplication64} pda 
     * @param {PWSTR} pszShortName 
     * @param {PWSTR} pszLongName 
     * @param {Integer} docAttr 
     * @returns {HRESULT} 
     */
    Init(pda, pszShortName, pszLongName, docAttr) {
        pszShortName := pszShortName is String ? StrPtr(pszShortName) : pszShortName
        pszLongName := pszLongName is String ? StrPtr(pszLongName) : pszLongName

        result := ComCall(3, this, "ptr", pda, "ptr", pszShortName, "ptr", pszLongName, "uint", docAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentHelper64} pddhParent 
     * @returns {HRESULT} 
     */
    Attach(pddhParent) {
        result := ComCall(4, this, "ptr", pddhParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Detach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    AddUnicodeText(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(6, this, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszText 
     * @returns {HRESULT} 
     */
    AddDBCSText(pszText) {
        result := ComCall(7, this, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentHost} pddh 
     * @returns {HRESULT} 
     */
    SetDebugDocumentHost(pddh) {
        result := ComCall(8, this, "ptr", pddh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cChars 
     * @param {Integer} dwTextStartCookie 
     * @returns {HRESULT} 
     */
    AddDeferredText(cChars, dwTextStartCookie) {
        result := ComCall(9, this, "uint", cChars, "uint", dwTextStartCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCharOffset 
     * @param {Integer} cChars 
     * @param {IActiveScript} pas 
     * @param {BOOL} fScriptlet 
     * @param {Pointer<Integer>} pdwSourceContext 
     * @returns {HRESULT} 
     */
    DefineScriptBlock(ulCharOffset, cChars, pas, fScriptlet, pdwSourceContext) {
        result := ComCall(10, this, "uint", ulCharOffset, "uint", cChars, "ptr", pas, "int", fScriptlet, "uint*", pdwSourceContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} staTextAttr 
     * @returns {HRESULT} 
     */
    SetDefaultTextAttr(staTextAttr) {
        result := ComCall(11, this, "ushort", staTextAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCharOffset 
     * @param {Integer} cChars 
     * @param {Pointer<Integer>} pstaTextAttr 
     * @returns {HRESULT} 
     */
    SetTextAttributes(ulCharOffset, cChars, pstaTextAttr) {
        result := ComCall(12, this, "uint", ulCharOffset, "uint", cChars, "ushort*", pstaTextAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszLongName 
     * @returns {HRESULT} 
     */
    SetLongName(pszLongName) {
        pszLongName := pszLongName is String ? StrPtr(pszLongName) : pszLongName

        result := ComCall(13, this, "ptr", pszLongName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszShortName 
     * @returns {HRESULT} 
     */
    SetShortName(pszShortName) {
        pszShortName := pszShortName is String ? StrPtr(pszShortName) : pszShortName

        result := ComCall(14, this, "ptr", pszShortName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pszAttributes 
     * @returns {HRESULT} 
     */
    SetDocumentAttr(pszAttributes) {
        result := ComCall(15, this, "uint", pszAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplicationNode>} ppdan 
     * @returns {HRESULT} 
     */
    GetDebugApplicationNode(ppdan) {
        result := ComCall(16, this, "ptr*", ppdan, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceContext 
     * @param {Pointer<IActiveScript>} ppasd 
     * @param {Pointer<Integer>} piCharPos 
     * @param {Pointer<Integer>} pcChars 
     * @returns {HRESULT} 
     */
    GetScriptBlockInfo(dwSourceContext, ppasd, piCharPos, pcChars) {
        result := ComCall(17, this, "uint", dwSourceContext, "ptr*", ppasd, "uint*", piCharPos, "uint*", pcChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iCharPos 
     * @param {Integer} cChars 
     * @param {Pointer<IDebugDocumentContext>} ppddc 
     * @returns {HRESULT} 
     */
    CreateDebugDocumentContext(iCharPos, cChars, ppddc) {
        result := ComCall(18, this, "uint", iCharPos, "uint", cChars, "ptr*", ppddc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BringDocumentToTop() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentContext} pddc 
     * @returns {HRESULT} 
     */
    BringDocumentContextToTop(pddc) {
        result := ComCall(20, this, "ptr", pddc, "HRESULT")
        return result
    }
}
