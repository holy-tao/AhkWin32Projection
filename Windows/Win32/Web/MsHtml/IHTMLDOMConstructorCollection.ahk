#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMConstructorCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMConstructorCollection
     * @type {Guid}
     */
    static IID => Guid("{3051049c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Attr", "get_BehaviorUrnsCollection", "get_BookmarkCollection", "get_CompatibleInfo", "get_CompatibleInfoCollection", "get_ControlRangeCollection", "get_CSSCurrentStyleDeclaration", "get_CSSRuleList", "get_CSSRuleStyleDeclaration", "get_CSSStyleDeclaration", "get_CSSStyleRule", "get_CSSStyleSheet", "get_DataTransfer", "get_DOMImplementation", "get_Element", "get_Event", "get_History", "get_HTCElementBehaviorDefaults", "get_HTMLAnchorElement", "get_HTMLAreaElement", "get_HTMLAreasCollection", "get_HTMLBaseElement", "get_HTMLBaseFontElement", "get_HTMLBGSoundElement", "get_HTMLBlockElement", "get_HTMLBodyElement", "get_HTMLBRElement", "get_HTMLButtonElement", "get_HTMLCollection", "get_HTMLCommentElement", "get_HTMLDDElement", "get_HTMLDivElement", "get_HTMLDocument", "get_HTMLDListElement", "get_HTMLDTElement", "get_HTMLEmbedElement", "get_HTMLFieldSetElement", "get_HTMLFontElement", "get_HTMLFormElement", "get_HTMLFrameElement", "get_HTMLFrameSetElement", "get_HTMLGenericElement", "get_HTMLHeadElement", "get_HTMLHeadingElement", "get_HTMLHRElement", "get_HTMLHtmlElement", "get_HTMLIFrameElement", "get_HTMLImageElement", "get_HTMLInputElement", "get_HTMLIsIndexElement", "get_HTMLLabelElement", "get_HTMLLegendElement", "get_HTMLLIElement", "get_HTMLLinkElement", "get_HTMLMapElement", "get_HTMLMarqueeElement", "get_HTMLMetaElement", "get_HTMLModelessDialog", "get_HTMLNamespaceInfo", "get_HTMLNamespaceInfoCollection", "get_HTMLNextIdElement", "get_HTMLNoShowElement", "get_HTMLObjectElement", "get_HTMLOListElement", "get_HTMLOptionElement", "get_HTMLParagraphElement", "get_HTMLParamElement", "get_HTMLPhraseElement", "get_HTMLPluginsCollection", "get_HTMLPopup", "get_HTMLScriptElement", "get_HTMLSelectElement", "get_HTMLSpanElement", "get_HTMLStyleElement", "get_HTMLTableCaptionElement", "get_HTMLTableCellElement", "get_HTMLTableColElement", "get_HTMLTableElement", "get_HTMLTableRowElement", "get_HTMLTableSectionElement", "get_HTMLTextAreaElement", "get_HTMLTextElement", "get_HTMLTitleElement", "get_HTMLUListElement", "get_HTMLUnknownElement", "get_Image", "get_Location", "get_NamedNodeMap", "get_Navigator", "get_NodeList", "get_Option", "get_Screen", "get_Selection", "get_StaticNodeList", "get_Storage", "get_StyleSheetList", "get_StyleSheetPage", "get_StyleSheetPageList", "get_Text", "get_TextRange", "get_TextRangeCollection", "get_TextRectangle", "get_TextRectangleList", "get_Window", "get_XDomainRequest", "get_XMLHttpRequest"]

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Attr(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_BehaviorUrnsCollection(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_BookmarkCollection(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_CompatibleInfo(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_CompatibleInfoCollection(p) {
        result := ComCall(11, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_ControlRangeCollection(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_CSSCurrentStyleDeclaration(p) {
        result := ComCall(13, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_CSSRuleList(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_CSSRuleStyleDeclaration(p) {
        result := ComCall(15, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_CSSStyleDeclaration(p) {
        result := ComCall(16, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_CSSStyleRule(p) {
        result := ComCall(17, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_CSSStyleSheet(p) {
        result := ComCall(18, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_DataTransfer(p) {
        result := ComCall(19, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_DOMImplementation(p) {
        result := ComCall(20, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Element(p) {
        result := ComCall(21, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Event(p) {
        result := ComCall(22, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_History(p) {
        result := ComCall(23, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTCElementBehaviorDefaults(p) {
        result := ComCall(24, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLAnchorElement(p) {
        result := ComCall(25, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLAreaElement(p) {
        result := ComCall(26, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLAreasCollection(p) {
        result := ComCall(27, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLBaseElement(p) {
        result := ComCall(28, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLBaseFontElement(p) {
        result := ComCall(29, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLBGSoundElement(p) {
        result := ComCall(30, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLBlockElement(p) {
        result := ComCall(31, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLBodyElement(p) {
        result := ComCall(32, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLBRElement(p) {
        result := ComCall(33, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLButtonElement(p) {
        result := ComCall(34, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLCollection(p) {
        result := ComCall(35, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLCommentElement(p) {
        result := ComCall(36, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLDDElement(p) {
        result := ComCall(37, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLDivElement(p) {
        result := ComCall(38, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLDocument(p) {
        result := ComCall(39, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLDListElement(p) {
        result := ComCall(40, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLDTElement(p) {
        result := ComCall(41, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLEmbedElement(p) {
        result := ComCall(42, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLFieldSetElement(p) {
        result := ComCall(43, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLFontElement(p) {
        result := ComCall(44, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLFormElement(p) {
        result := ComCall(45, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLFrameElement(p) {
        result := ComCall(46, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLFrameSetElement(p) {
        result := ComCall(47, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLGenericElement(p) {
        result := ComCall(48, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLHeadElement(p) {
        result := ComCall(49, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLHeadingElement(p) {
        result := ComCall(50, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLHRElement(p) {
        result := ComCall(51, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLHtmlElement(p) {
        result := ComCall(52, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLIFrameElement(p) {
        result := ComCall(53, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLImageElement(p) {
        result := ComCall(54, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLInputElement(p) {
        result := ComCall(55, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLIsIndexElement(p) {
        result := ComCall(56, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLLabelElement(p) {
        result := ComCall(57, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLLegendElement(p) {
        result := ComCall(58, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLLIElement(p) {
        result := ComCall(59, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLLinkElement(p) {
        result := ComCall(60, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLMapElement(p) {
        result := ComCall(61, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLMarqueeElement(p) {
        result := ComCall(62, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLMetaElement(p) {
        result := ComCall(63, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLModelessDialog(p) {
        result := ComCall(64, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLNamespaceInfo(p) {
        result := ComCall(65, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLNamespaceInfoCollection(p) {
        result := ComCall(66, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLNextIdElement(p) {
        result := ComCall(67, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLNoShowElement(p) {
        result := ComCall(68, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLObjectElement(p) {
        result := ComCall(69, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLOListElement(p) {
        result := ComCall(70, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLOptionElement(p) {
        result := ComCall(71, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLParagraphElement(p) {
        result := ComCall(72, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLParamElement(p) {
        result := ComCall(73, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLPhraseElement(p) {
        result := ComCall(74, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLPluginsCollection(p) {
        result := ComCall(75, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLPopup(p) {
        result := ComCall(76, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLScriptElement(p) {
        result := ComCall(77, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLSelectElement(p) {
        result := ComCall(78, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLSpanElement(p) {
        result := ComCall(79, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLStyleElement(p) {
        result := ComCall(80, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLTableCaptionElement(p) {
        result := ComCall(81, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLTableCellElement(p) {
        result := ComCall(82, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLTableColElement(p) {
        result := ComCall(83, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLTableElement(p) {
        result := ComCall(84, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLTableRowElement(p) {
        result := ComCall(85, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLTableSectionElement(p) {
        result := ComCall(86, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLTextAreaElement(p) {
        result := ComCall(87, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLTextElement(p) {
        result := ComCall(88, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLTitleElement(p) {
        result := ComCall(89, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLUListElement(p) {
        result := ComCall(90, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_HTMLUnknownElement(p) {
        result := ComCall(91, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Image(p) {
        result := ComCall(92, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Location(p) {
        result := ComCall(93, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_NamedNodeMap(p) {
        result := ComCall(94, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Navigator(p) {
        result := ComCall(95, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_NodeList(p) {
        result := ComCall(96, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Option(p) {
        result := ComCall(97, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Screen(p) {
        result := ComCall(98, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Selection(p) {
        result := ComCall(99, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_StaticNodeList(p) {
        result := ComCall(100, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Storage(p) {
        result := ComCall(101, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_StyleSheetList(p) {
        result := ComCall(102, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_StyleSheetPage(p) {
        result := ComCall(103, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_StyleSheetPageList(p) {
        result := ComCall(104, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Text(p) {
        result := ComCall(105, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_TextRange(p) {
        result := ComCall(106, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_TextRangeCollection(p) {
        result := ComCall(107, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_TextRectangle(p) {
        result := ComCall(108, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_TextRectangleList(p) {
        result := ComCall(109, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Window(p) {
        result := ComCall(110, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_XDomainRequest(p) {
        result := ComCall(111, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_XMLHttpRequest(p) {
        result := ComCall(112, this, "ptr*", p, "HRESULT")
        return result
    }
}
