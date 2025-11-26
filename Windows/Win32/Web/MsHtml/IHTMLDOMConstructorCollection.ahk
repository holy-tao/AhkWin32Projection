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
     * @type {IDispatch} 
     */
    Attr {
        get => this.get_Attr()
    }

    /**
     * @type {IDispatch} 
     */
    BehaviorUrnsCollection {
        get => this.get_BehaviorUrnsCollection()
    }

    /**
     * @type {IDispatch} 
     */
    BookmarkCollection {
        get => this.get_BookmarkCollection()
    }

    /**
     * @type {IDispatch} 
     */
    CompatibleInfo {
        get => this.get_CompatibleInfo()
    }

    /**
     * @type {IDispatch} 
     */
    CompatibleInfoCollection {
        get => this.get_CompatibleInfoCollection()
    }

    /**
     * @type {IDispatch} 
     */
    ControlRangeCollection {
        get => this.get_ControlRangeCollection()
    }

    /**
     * @type {IDispatch} 
     */
    CSSCurrentStyleDeclaration {
        get => this.get_CSSCurrentStyleDeclaration()
    }

    /**
     * @type {IDispatch} 
     */
    CSSRuleList {
        get => this.get_CSSRuleList()
    }

    /**
     * @type {IDispatch} 
     */
    CSSRuleStyleDeclaration {
        get => this.get_CSSRuleStyleDeclaration()
    }

    /**
     * @type {IDispatch} 
     */
    CSSStyleDeclaration {
        get => this.get_CSSStyleDeclaration()
    }

    /**
     * @type {IDispatch} 
     */
    CSSStyleRule {
        get => this.get_CSSStyleRule()
    }

    /**
     * @type {IDispatch} 
     */
    CSSStyleSheet {
        get => this.get_CSSStyleSheet()
    }

    /**
     * @type {IDispatch} 
     */
    DataTransfer {
        get => this.get_DataTransfer()
    }

    /**
     * @type {IDispatch} 
     */
    DOMImplementation {
        get => this.get_DOMImplementation()
    }

    /**
     * @type {IDispatch} 
     */
    Element {
        get => this.get_Element()
    }

    /**
     * @type {IDispatch} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {IDispatch} 
     */
    History {
        get => this.get_History()
    }

    /**
     * @type {IDispatch} 
     */
    HTCElementBehaviorDefaults {
        get => this.get_HTCElementBehaviorDefaults()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLAnchorElement {
        get => this.get_HTMLAnchorElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLAreaElement {
        get => this.get_HTMLAreaElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLAreasCollection {
        get => this.get_HTMLAreasCollection()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLBaseElement {
        get => this.get_HTMLBaseElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLBaseFontElement {
        get => this.get_HTMLBaseFontElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLBGSoundElement {
        get => this.get_HTMLBGSoundElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLBlockElement {
        get => this.get_HTMLBlockElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLBodyElement {
        get => this.get_HTMLBodyElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLBRElement {
        get => this.get_HTMLBRElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLButtonElement {
        get => this.get_HTMLButtonElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLCollection {
        get => this.get_HTMLCollection()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLCommentElement {
        get => this.get_HTMLCommentElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLDDElement {
        get => this.get_HTMLDDElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLDivElement {
        get => this.get_HTMLDivElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLDocument {
        get => this.get_HTMLDocument()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLDListElement {
        get => this.get_HTMLDListElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLDTElement {
        get => this.get_HTMLDTElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLEmbedElement {
        get => this.get_HTMLEmbedElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLFieldSetElement {
        get => this.get_HTMLFieldSetElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLFontElement {
        get => this.get_HTMLFontElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLFormElement {
        get => this.get_HTMLFormElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLFrameElement {
        get => this.get_HTMLFrameElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLFrameSetElement {
        get => this.get_HTMLFrameSetElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLGenericElement {
        get => this.get_HTMLGenericElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLHeadElement {
        get => this.get_HTMLHeadElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLHeadingElement {
        get => this.get_HTMLHeadingElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLHRElement {
        get => this.get_HTMLHRElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLHtmlElement {
        get => this.get_HTMLHtmlElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLIFrameElement {
        get => this.get_HTMLIFrameElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLImageElement {
        get => this.get_HTMLImageElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLInputElement {
        get => this.get_HTMLInputElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLIsIndexElement {
        get => this.get_HTMLIsIndexElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLLabelElement {
        get => this.get_HTMLLabelElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLLegendElement {
        get => this.get_HTMLLegendElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLLIElement {
        get => this.get_HTMLLIElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLLinkElement {
        get => this.get_HTMLLinkElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLMapElement {
        get => this.get_HTMLMapElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLMarqueeElement {
        get => this.get_HTMLMarqueeElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLMetaElement {
        get => this.get_HTMLMetaElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLModelessDialog {
        get => this.get_HTMLModelessDialog()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLNamespaceInfo {
        get => this.get_HTMLNamespaceInfo()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLNamespaceInfoCollection {
        get => this.get_HTMLNamespaceInfoCollection()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLNextIdElement {
        get => this.get_HTMLNextIdElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLNoShowElement {
        get => this.get_HTMLNoShowElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLObjectElement {
        get => this.get_HTMLObjectElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLOListElement {
        get => this.get_HTMLOListElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLOptionElement {
        get => this.get_HTMLOptionElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLParagraphElement {
        get => this.get_HTMLParagraphElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLParamElement {
        get => this.get_HTMLParamElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLPhraseElement {
        get => this.get_HTMLPhraseElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLPluginsCollection {
        get => this.get_HTMLPluginsCollection()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLPopup {
        get => this.get_HTMLPopup()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLScriptElement {
        get => this.get_HTMLScriptElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLSelectElement {
        get => this.get_HTMLSelectElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLSpanElement {
        get => this.get_HTMLSpanElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLStyleElement {
        get => this.get_HTMLStyleElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLTableCaptionElement {
        get => this.get_HTMLTableCaptionElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLTableCellElement {
        get => this.get_HTMLTableCellElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLTableColElement {
        get => this.get_HTMLTableColElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLTableElement {
        get => this.get_HTMLTableElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLTableRowElement {
        get => this.get_HTMLTableRowElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLTableSectionElement {
        get => this.get_HTMLTableSectionElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLTextAreaElement {
        get => this.get_HTMLTextAreaElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLTextElement {
        get => this.get_HTMLTextElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLTitleElement {
        get => this.get_HTMLTitleElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLUListElement {
        get => this.get_HTMLUListElement()
    }

    /**
     * @type {IDispatch} 
     */
    HTMLUnknownElement {
        get => this.get_HTMLUnknownElement()
    }

    /**
     * @type {IDispatch} 
     */
    Image {
        get => this.get_Image()
    }

    /**
     * @type {IDispatch} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * @type {IDispatch} 
     */
    NamedNodeMap {
        get => this.get_NamedNodeMap()
    }

    /**
     * @type {IDispatch} 
     */
    Navigator {
        get => this.get_Navigator()
    }

    /**
     * @type {IDispatch} 
     */
    NodeList {
        get => this.get_NodeList()
    }

    /**
     * @type {IDispatch} 
     */
    Option {
        get => this.get_Option()
    }

    /**
     * @type {IDispatch} 
     */
    Screen {
        get => this.get_Screen()
    }

    /**
     * @type {IDispatch} 
     */
    Selection {
        get => this.get_Selection()
    }

    /**
     * @type {IDispatch} 
     */
    StaticNodeList {
        get => this.get_StaticNodeList()
    }

    /**
     * @type {IDispatch} 
     */
    Storage {
        get => this.get_Storage()
    }

    /**
     * @type {IDispatch} 
     */
    StyleSheetList {
        get => this.get_StyleSheetList()
    }

    /**
     * @type {IDispatch} 
     */
    StyleSheetPage {
        get => this.get_StyleSheetPage()
    }

    /**
     * @type {IDispatch} 
     */
    StyleSheetPageList {
        get => this.get_StyleSheetPageList()
    }

    /**
     * @type {IDispatch} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * @type {IDispatch} 
     */
    TextRange {
        get => this.get_TextRange()
    }

    /**
     * @type {IDispatch} 
     */
    TextRangeCollection {
        get => this.get_TextRangeCollection()
    }

    /**
     * @type {IDispatch} 
     */
    TextRectangle {
        get => this.get_TextRectangle()
    }

    /**
     * @type {IDispatch} 
     */
    TextRectangleList {
        get => this.get_TextRectangleList()
    }

    /**
     * @type {IDispatch} 
     */
    Window {
        get => this.get_Window()
    }

    /**
     * @type {IDispatch} 
     */
    XDomainRequest {
        get => this.get_XDomainRequest()
    }

    /**
     * @type {IDispatch} 
     */
    XMLHttpRequest {
        get => this.get_XMLHttpRequest()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Attr() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_BehaviorUrnsCollection() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_BookmarkCollection() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_CompatibleInfo() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_CompatibleInfoCollection() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_ControlRangeCollection() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_CSSCurrentStyleDeclaration() {
        result := ComCall(13, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_CSSRuleList() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_CSSRuleStyleDeclaration() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_CSSStyleDeclaration() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_CSSStyleRule() {
        result := ComCall(17, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_CSSStyleSheet() {
        result := ComCall(18, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_DataTransfer() {
        result := ComCall(19, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_DOMImplementation() {
        result := ComCall(20, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Element() {
        result := ComCall(21, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Event() {
        result := ComCall(22, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_History() {
        result := ComCall(23, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTCElementBehaviorDefaults() {
        result := ComCall(24, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLAnchorElement() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLAreaElement() {
        result := ComCall(26, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLAreasCollection() {
        result := ComCall(27, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLBaseElement() {
        result := ComCall(28, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLBaseFontElement() {
        result := ComCall(29, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLBGSoundElement() {
        result := ComCall(30, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLBlockElement() {
        result := ComCall(31, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLBodyElement() {
        result := ComCall(32, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLBRElement() {
        result := ComCall(33, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLButtonElement() {
        result := ComCall(34, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLCollection() {
        result := ComCall(35, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLCommentElement() {
        result := ComCall(36, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLDDElement() {
        result := ComCall(37, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLDivElement() {
        result := ComCall(38, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLDocument() {
        result := ComCall(39, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLDListElement() {
        result := ComCall(40, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLDTElement() {
        result := ComCall(41, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLEmbedElement() {
        result := ComCall(42, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLFieldSetElement() {
        result := ComCall(43, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLFontElement() {
        result := ComCall(44, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLFormElement() {
        result := ComCall(45, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLFrameElement() {
        result := ComCall(46, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLFrameSetElement() {
        result := ComCall(47, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLGenericElement() {
        result := ComCall(48, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLHeadElement() {
        result := ComCall(49, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLHeadingElement() {
        result := ComCall(50, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLHRElement() {
        result := ComCall(51, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLHtmlElement() {
        result := ComCall(52, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLIFrameElement() {
        result := ComCall(53, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLImageElement() {
        result := ComCall(54, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLInputElement() {
        result := ComCall(55, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLIsIndexElement() {
        result := ComCall(56, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLLabelElement() {
        result := ComCall(57, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLLegendElement() {
        result := ComCall(58, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLLIElement() {
        result := ComCall(59, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLLinkElement() {
        result := ComCall(60, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLMapElement() {
        result := ComCall(61, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLMarqueeElement() {
        result := ComCall(62, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLMetaElement() {
        result := ComCall(63, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLModelessDialog() {
        result := ComCall(64, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLNamespaceInfo() {
        result := ComCall(65, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLNamespaceInfoCollection() {
        result := ComCall(66, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLNextIdElement() {
        result := ComCall(67, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLNoShowElement() {
        result := ComCall(68, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLObjectElement() {
        result := ComCall(69, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLOListElement() {
        result := ComCall(70, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLOptionElement() {
        result := ComCall(71, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLParagraphElement() {
        result := ComCall(72, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLParamElement() {
        result := ComCall(73, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLPhraseElement() {
        result := ComCall(74, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLPluginsCollection() {
        result := ComCall(75, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLPopup() {
        result := ComCall(76, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLScriptElement() {
        result := ComCall(77, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLSelectElement() {
        result := ComCall(78, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLSpanElement() {
        result := ComCall(79, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLStyleElement() {
        result := ComCall(80, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLTableCaptionElement() {
        result := ComCall(81, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLTableCellElement() {
        result := ComCall(82, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLTableColElement() {
        result := ComCall(83, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLTableElement() {
        result := ComCall(84, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLTableRowElement() {
        result := ComCall(85, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLTableSectionElement() {
        result := ComCall(86, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLTextAreaElement() {
        result := ComCall(87, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLTextElement() {
        result := ComCall(88, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLTitleElement() {
        result := ComCall(89, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLUListElement() {
        result := ComCall(90, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_HTMLUnknownElement() {
        result := ComCall(91, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Image() {
        result := ComCall(92, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Location() {
        result := ComCall(93, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_NamedNodeMap() {
        result := ComCall(94, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Navigator() {
        result := ComCall(95, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_NodeList() {
        result := ComCall(96, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Option() {
        result := ComCall(97, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Screen() {
        result := ComCall(98, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Selection() {
        result := ComCall(99, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_StaticNodeList() {
        result := ComCall(100, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Storage() {
        result := ComCall(101, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_StyleSheetList() {
        result := ComCall(102, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_StyleSheetPage() {
        result := ComCall(103, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_StyleSheetPageList() {
        result := ComCall(104, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Text() {
        result := ComCall(105, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_TextRange() {
        result := ComCall(106, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_TextRangeCollection() {
        result := ComCall(107, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_TextRectangle() {
        result := ComCall(108, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_TextRectangleList() {
        result := ComCall(109, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Window() {
        result := ComCall(110, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_XDomainRequest() {
        result := ComCall(111, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_XMLHttpRequest() {
        result := ComCall(112, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }
}
