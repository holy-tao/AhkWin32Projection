#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMConstructorCollection extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMConstructorCollection
     * @type {Guid}
     */
    static IID := Guid("{3051049c-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMConstructorCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Attr                        : IntPtr
        get_BehaviorUrnsCollection      : IntPtr
        get_BookmarkCollection          : IntPtr
        get_CompatibleInfo              : IntPtr
        get_CompatibleInfoCollection    : IntPtr
        get_ControlRangeCollection      : IntPtr
        get_CSSCurrentStyleDeclaration  : IntPtr
        get_CSSRuleList                 : IntPtr
        get_CSSRuleStyleDeclaration     : IntPtr
        get_CSSStyleDeclaration         : IntPtr
        get_CSSStyleRule                : IntPtr
        get_CSSStyleSheet               : IntPtr
        get_DataTransfer                : IntPtr
        get_DOMImplementation           : IntPtr
        get_Element                     : IntPtr
        get_Event                       : IntPtr
        get_History                     : IntPtr
        get_HTCElementBehaviorDefaults  : IntPtr
        get_HTMLAnchorElement           : IntPtr
        get_HTMLAreaElement             : IntPtr
        get_HTMLAreasCollection         : IntPtr
        get_HTMLBaseElement             : IntPtr
        get_HTMLBaseFontElement         : IntPtr
        get_HTMLBGSoundElement          : IntPtr
        get_HTMLBlockElement            : IntPtr
        get_HTMLBodyElement             : IntPtr
        get_HTMLBRElement               : IntPtr
        get_HTMLButtonElement           : IntPtr
        get_HTMLCollection              : IntPtr
        get_HTMLCommentElement          : IntPtr
        get_HTMLDDElement               : IntPtr
        get_HTMLDivElement              : IntPtr
        get_HTMLDocument                : IntPtr
        get_HTMLDListElement            : IntPtr
        get_HTMLDTElement               : IntPtr
        get_HTMLEmbedElement            : IntPtr
        get_HTMLFieldSetElement         : IntPtr
        get_HTMLFontElement             : IntPtr
        get_HTMLFormElement             : IntPtr
        get_HTMLFrameElement            : IntPtr
        get_HTMLFrameSetElement         : IntPtr
        get_HTMLGenericElement          : IntPtr
        get_HTMLHeadElement             : IntPtr
        get_HTMLHeadingElement          : IntPtr
        get_HTMLHRElement               : IntPtr
        get_HTMLHtmlElement             : IntPtr
        get_HTMLIFrameElement           : IntPtr
        get_HTMLImageElement            : IntPtr
        get_HTMLInputElement            : IntPtr
        get_HTMLIsIndexElement          : IntPtr
        get_HTMLLabelElement            : IntPtr
        get_HTMLLegendElement           : IntPtr
        get_HTMLLIElement               : IntPtr
        get_HTMLLinkElement             : IntPtr
        get_HTMLMapElement              : IntPtr
        get_HTMLMarqueeElement          : IntPtr
        get_HTMLMetaElement             : IntPtr
        get_HTMLModelessDialog          : IntPtr
        get_HTMLNamespaceInfo           : IntPtr
        get_HTMLNamespaceInfoCollection : IntPtr
        get_HTMLNextIdElement           : IntPtr
        get_HTMLNoShowElement           : IntPtr
        get_HTMLObjectElement           : IntPtr
        get_HTMLOListElement            : IntPtr
        get_HTMLOptionElement           : IntPtr
        get_HTMLParagraphElement        : IntPtr
        get_HTMLParamElement            : IntPtr
        get_HTMLPhraseElement           : IntPtr
        get_HTMLPluginsCollection       : IntPtr
        get_HTMLPopup                   : IntPtr
        get_HTMLScriptElement           : IntPtr
        get_HTMLSelectElement           : IntPtr
        get_HTMLSpanElement             : IntPtr
        get_HTMLStyleElement            : IntPtr
        get_HTMLTableCaptionElement     : IntPtr
        get_HTMLTableCellElement        : IntPtr
        get_HTMLTableColElement         : IntPtr
        get_HTMLTableElement            : IntPtr
        get_HTMLTableRowElement         : IntPtr
        get_HTMLTableSectionElement     : IntPtr
        get_HTMLTextAreaElement         : IntPtr
        get_HTMLTextElement             : IntPtr
        get_HTMLTitleElement            : IntPtr
        get_HTMLUListElement            : IntPtr
        get_HTMLUnknownElement          : IntPtr
        get_Image                       : IntPtr
        get_Location                    : IntPtr
        get_NamedNodeMap                : IntPtr
        get_Navigator                   : IntPtr
        get_NodeList                    : IntPtr
        get_Option                      : IntPtr
        get_Screen                      : IntPtr
        get_Selection                   : IntPtr
        get_StaticNodeList              : IntPtr
        get_Storage                     : IntPtr
        get_StyleSheetList              : IntPtr
        get_StyleSheetPage              : IntPtr
        get_StyleSheetPageList          : IntPtr
        get_Text                        : IntPtr
        get_TextRange                   : IntPtr
        get_TextRangeCollection         : IntPtr
        get_TextRectangle               : IntPtr
        get_TextRectangleList           : IntPtr
        get_Window                      : IntPtr
        get_XDomainRequest              : IntPtr
        get_XMLHttpRequest              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMConstructorCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IHTMLDOMConstructorCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Attr := CallbackCreate(GetMethod(implObj, "get_Attr"), flags, 2)
        this.vtbl.get_BehaviorUrnsCollection := CallbackCreate(GetMethod(implObj, "get_BehaviorUrnsCollection"), flags, 2)
        this.vtbl.get_BookmarkCollection := CallbackCreate(GetMethod(implObj, "get_BookmarkCollection"), flags, 2)
        this.vtbl.get_CompatibleInfo := CallbackCreate(GetMethod(implObj, "get_CompatibleInfo"), flags, 2)
        this.vtbl.get_CompatibleInfoCollection := CallbackCreate(GetMethod(implObj, "get_CompatibleInfoCollection"), flags, 2)
        this.vtbl.get_ControlRangeCollection := CallbackCreate(GetMethod(implObj, "get_ControlRangeCollection"), flags, 2)
        this.vtbl.get_CSSCurrentStyleDeclaration := CallbackCreate(GetMethod(implObj, "get_CSSCurrentStyleDeclaration"), flags, 2)
        this.vtbl.get_CSSRuleList := CallbackCreate(GetMethod(implObj, "get_CSSRuleList"), flags, 2)
        this.vtbl.get_CSSRuleStyleDeclaration := CallbackCreate(GetMethod(implObj, "get_CSSRuleStyleDeclaration"), flags, 2)
        this.vtbl.get_CSSStyleDeclaration := CallbackCreate(GetMethod(implObj, "get_CSSStyleDeclaration"), flags, 2)
        this.vtbl.get_CSSStyleRule := CallbackCreate(GetMethod(implObj, "get_CSSStyleRule"), flags, 2)
        this.vtbl.get_CSSStyleSheet := CallbackCreate(GetMethod(implObj, "get_CSSStyleSheet"), flags, 2)
        this.vtbl.get_DataTransfer := CallbackCreate(GetMethod(implObj, "get_DataTransfer"), flags, 2)
        this.vtbl.get_DOMImplementation := CallbackCreate(GetMethod(implObj, "get_DOMImplementation"), flags, 2)
        this.vtbl.get_Element := CallbackCreate(GetMethod(implObj, "get_Element"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
        this.vtbl.get_History := CallbackCreate(GetMethod(implObj, "get_History"), flags, 2)
        this.vtbl.get_HTCElementBehaviorDefaults := CallbackCreate(GetMethod(implObj, "get_HTCElementBehaviorDefaults"), flags, 2)
        this.vtbl.get_HTMLAnchorElement := CallbackCreate(GetMethod(implObj, "get_HTMLAnchorElement"), flags, 2)
        this.vtbl.get_HTMLAreaElement := CallbackCreate(GetMethod(implObj, "get_HTMLAreaElement"), flags, 2)
        this.vtbl.get_HTMLAreasCollection := CallbackCreate(GetMethod(implObj, "get_HTMLAreasCollection"), flags, 2)
        this.vtbl.get_HTMLBaseElement := CallbackCreate(GetMethod(implObj, "get_HTMLBaseElement"), flags, 2)
        this.vtbl.get_HTMLBaseFontElement := CallbackCreate(GetMethod(implObj, "get_HTMLBaseFontElement"), flags, 2)
        this.vtbl.get_HTMLBGSoundElement := CallbackCreate(GetMethod(implObj, "get_HTMLBGSoundElement"), flags, 2)
        this.vtbl.get_HTMLBlockElement := CallbackCreate(GetMethod(implObj, "get_HTMLBlockElement"), flags, 2)
        this.vtbl.get_HTMLBodyElement := CallbackCreate(GetMethod(implObj, "get_HTMLBodyElement"), flags, 2)
        this.vtbl.get_HTMLBRElement := CallbackCreate(GetMethod(implObj, "get_HTMLBRElement"), flags, 2)
        this.vtbl.get_HTMLButtonElement := CallbackCreate(GetMethod(implObj, "get_HTMLButtonElement"), flags, 2)
        this.vtbl.get_HTMLCollection := CallbackCreate(GetMethod(implObj, "get_HTMLCollection"), flags, 2)
        this.vtbl.get_HTMLCommentElement := CallbackCreate(GetMethod(implObj, "get_HTMLCommentElement"), flags, 2)
        this.vtbl.get_HTMLDDElement := CallbackCreate(GetMethod(implObj, "get_HTMLDDElement"), flags, 2)
        this.vtbl.get_HTMLDivElement := CallbackCreate(GetMethod(implObj, "get_HTMLDivElement"), flags, 2)
        this.vtbl.get_HTMLDocument := CallbackCreate(GetMethod(implObj, "get_HTMLDocument"), flags, 2)
        this.vtbl.get_HTMLDListElement := CallbackCreate(GetMethod(implObj, "get_HTMLDListElement"), flags, 2)
        this.vtbl.get_HTMLDTElement := CallbackCreate(GetMethod(implObj, "get_HTMLDTElement"), flags, 2)
        this.vtbl.get_HTMLEmbedElement := CallbackCreate(GetMethod(implObj, "get_HTMLEmbedElement"), flags, 2)
        this.vtbl.get_HTMLFieldSetElement := CallbackCreate(GetMethod(implObj, "get_HTMLFieldSetElement"), flags, 2)
        this.vtbl.get_HTMLFontElement := CallbackCreate(GetMethod(implObj, "get_HTMLFontElement"), flags, 2)
        this.vtbl.get_HTMLFormElement := CallbackCreate(GetMethod(implObj, "get_HTMLFormElement"), flags, 2)
        this.vtbl.get_HTMLFrameElement := CallbackCreate(GetMethod(implObj, "get_HTMLFrameElement"), flags, 2)
        this.vtbl.get_HTMLFrameSetElement := CallbackCreate(GetMethod(implObj, "get_HTMLFrameSetElement"), flags, 2)
        this.vtbl.get_HTMLGenericElement := CallbackCreate(GetMethod(implObj, "get_HTMLGenericElement"), flags, 2)
        this.vtbl.get_HTMLHeadElement := CallbackCreate(GetMethod(implObj, "get_HTMLHeadElement"), flags, 2)
        this.vtbl.get_HTMLHeadingElement := CallbackCreate(GetMethod(implObj, "get_HTMLHeadingElement"), flags, 2)
        this.vtbl.get_HTMLHRElement := CallbackCreate(GetMethod(implObj, "get_HTMLHRElement"), flags, 2)
        this.vtbl.get_HTMLHtmlElement := CallbackCreate(GetMethod(implObj, "get_HTMLHtmlElement"), flags, 2)
        this.vtbl.get_HTMLIFrameElement := CallbackCreate(GetMethod(implObj, "get_HTMLIFrameElement"), flags, 2)
        this.vtbl.get_HTMLImageElement := CallbackCreate(GetMethod(implObj, "get_HTMLImageElement"), flags, 2)
        this.vtbl.get_HTMLInputElement := CallbackCreate(GetMethod(implObj, "get_HTMLInputElement"), flags, 2)
        this.vtbl.get_HTMLIsIndexElement := CallbackCreate(GetMethod(implObj, "get_HTMLIsIndexElement"), flags, 2)
        this.vtbl.get_HTMLLabelElement := CallbackCreate(GetMethod(implObj, "get_HTMLLabelElement"), flags, 2)
        this.vtbl.get_HTMLLegendElement := CallbackCreate(GetMethod(implObj, "get_HTMLLegendElement"), flags, 2)
        this.vtbl.get_HTMLLIElement := CallbackCreate(GetMethod(implObj, "get_HTMLLIElement"), flags, 2)
        this.vtbl.get_HTMLLinkElement := CallbackCreate(GetMethod(implObj, "get_HTMLLinkElement"), flags, 2)
        this.vtbl.get_HTMLMapElement := CallbackCreate(GetMethod(implObj, "get_HTMLMapElement"), flags, 2)
        this.vtbl.get_HTMLMarqueeElement := CallbackCreate(GetMethod(implObj, "get_HTMLMarqueeElement"), flags, 2)
        this.vtbl.get_HTMLMetaElement := CallbackCreate(GetMethod(implObj, "get_HTMLMetaElement"), flags, 2)
        this.vtbl.get_HTMLModelessDialog := CallbackCreate(GetMethod(implObj, "get_HTMLModelessDialog"), flags, 2)
        this.vtbl.get_HTMLNamespaceInfo := CallbackCreate(GetMethod(implObj, "get_HTMLNamespaceInfo"), flags, 2)
        this.vtbl.get_HTMLNamespaceInfoCollection := CallbackCreate(GetMethod(implObj, "get_HTMLNamespaceInfoCollection"), flags, 2)
        this.vtbl.get_HTMLNextIdElement := CallbackCreate(GetMethod(implObj, "get_HTMLNextIdElement"), flags, 2)
        this.vtbl.get_HTMLNoShowElement := CallbackCreate(GetMethod(implObj, "get_HTMLNoShowElement"), flags, 2)
        this.vtbl.get_HTMLObjectElement := CallbackCreate(GetMethod(implObj, "get_HTMLObjectElement"), flags, 2)
        this.vtbl.get_HTMLOListElement := CallbackCreate(GetMethod(implObj, "get_HTMLOListElement"), flags, 2)
        this.vtbl.get_HTMLOptionElement := CallbackCreate(GetMethod(implObj, "get_HTMLOptionElement"), flags, 2)
        this.vtbl.get_HTMLParagraphElement := CallbackCreate(GetMethod(implObj, "get_HTMLParagraphElement"), flags, 2)
        this.vtbl.get_HTMLParamElement := CallbackCreate(GetMethod(implObj, "get_HTMLParamElement"), flags, 2)
        this.vtbl.get_HTMLPhraseElement := CallbackCreate(GetMethod(implObj, "get_HTMLPhraseElement"), flags, 2)
        this.vtbl.get_HTMLPluginsCollection := CallbackCreate(GetMethod(implObj, "get_HTMLPluginsCollection"), flags, 2)
        this.vtbl.get_HTMLPopup := CallbackCreate(GetMethod(implObj, "get_HTMLPopup"), flags, 2)
        this.vtbl.get_HTMLScriptElement := CallbackCreate(GetMethod(implObj, "get_HTMLScriptElement"), flags, 2)
        this.vtbl.get_HTMLSelectElement := CallbackCreate(GetMethod(implObj, "get_HTMLSelectElement"), flags, 2)
        this.vtbl.get_HTMLSpanElement := CallbackCreate(GetMethod(implObj, "get_HTMLSpanElement"), flags, 2)
        this.vtbl.get_HTMLStyleElement := CallbackCreate(GetMethod(implObj, "get_HTMLStyleElement"), flags, 2)
        this.vtbl.get_HTMLTableCaptionElement := CallbackCreate(GetMethod(implObj, "get_HTMLTableCaptionElement"), flags, 2)
        this.vtbl.get_HTMLTableCellElement := CallbackCreate(GetMethod(implObj, "get_HTMLTableCellElement"), flags, 2)
        this.vtbl.get_HTMLTableColElement := CallbackCreate(GetMethod(implObj, "get_HTMLTableColElement"), flags, 2)
        this.vtbl.get_HTMLTableElement := CallbackCreate(GetMethod(implObj, "get_HTMLTableElement"), flags, 2)
        this.vtbl.get_HTMLTableRowElement := CallbackCreate(GetMethod(implObj, "get_HTMLTableRowElement"), flags, 2)
        this.vtbl.get_HTMLTableSectionElement := CallbackCreate(GetMethod(implObj, "get_HTMLTableSectionElement"), flags, 2)
        this.vtbl.get_HTMLTextAreaElement := CallbackCreate(GetMethod(implObj, "get_HTMLTextAreaElement"), flags, 2)
        this.vtbl.get_HTMLTextElement := CallbackCreate(GetMethod(implObj, "get_HTMLTextElement"), flags, 2)
        this.vtbl.get_HTMLTitleElement := CallbackCreate(GetMethod(implObj, "get_HTMLTitleElement"), flags, 2)
        this.vtbl.get_HTMLUListElement := CallbackCreate(GetMethod(implObj, "get_HTMLUListElement"), flags, 2)
        this.vtbl.get_HTMLUnknownElement := CallbackCreate(GetMethod(implObj, "get_HTMLUnknownElement"), flags, 2)
        this.vtbl.get_Image := CallbackCreate(GetMethod(implObj, "get_Image"), flags, 2)
        this.vtbl.get_Location := CallbackCreate(GetMethod(implObj, "get_Location"), flags, 2)
        this.vtbl.get_NamedNodeMap := CallbackCreate(GetMethod(implObj, "get_NamedNodeMap"), flags, 2)
        this.vtbl.get_Navigator := CallbackCreate(GetMethod(implObj, "get_Navigator"), flags, 2)
        this.vtbl.get_NodeList := CallbackCreate(GetMethod(implObj, "get_NodeList"), flags, 2)
        this.vtbl.get_Option := CallbackCreate(GetMethod(implObj, "get_Option"), flags, 2)
        this.vtbl.get_Screen := CallbackCreate(GetMethod(implObj, "get_Screen"), flags, 2)
        this.vtbl.get_Selection := CallbackCreate(GetMethod(implObj, "get_Selection"), flags, 2)
        this.vtbl.get_StaticNodeList := CallbackCreate(GetMethod(implObj, "get_StaticNodeList"), flags, 2)
        this.vtbl.get_Storage := CallbackCreate(GetMethod(implObj, "get_Storage"), flags, 2)
        this.vtbl.get_StyleSheetList := CallbackCreate(GetMethod(implObj, "get_StyleSheetList"), flags, 2)
        this.vtbl.get_StyleSheetPage := CallbackCreate(GetMethod(implObj, "get_StyleSheetPage"), flags, 2)
        this.vtbl.get_StyleSheetPageList := CallbackCreate(GetMethod(implObj, "get_StyleSheetPageList"), flags, 2)
        this.vtbl.get_Text := CallbackCreate(GetMethod(implObj, "get_Text"), flags, 2)
        this.vtbl.get_TextRange := CallbackCreate(GetMethod(implObj, "get_TextRange"), flags, 2)
        this.vtbl.get_TextRangeCollection := CallbackCreate(GetMethod(implObj, "get_TextRangeCollection"), flags, 2)
        this.vtbl.get_TextRectangle := CallbackCreate(GetMethod(implObj, "get_TextRectangle"), flags, 2)
        this.vtbl.get_TextRectangleList := CallbackCreate(GetMethod(implObj, "get_TextRectangleList"), flags, 2)
        this.vtbl.get_Window := CallbackCreate(GetMethod(implObj, "get_Window"), flags, 2)
        this.vtbl.get_XDomainRequest := CallbackCreate(GetMethod(implObj, "get_XDomainRequest"), flags, 2)
        this.vtbl.get_XMLHttpRequest := CallbackCreate(GetMethod(implObj, "get_XMLHttpRequest"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Attr)
        CallbackFree(this.vtbl.get_BehaviorUrnsCollection)
        CallbackFree(this.vtbl.get_BookmarkCollection)
        CallbackFree(this.vtbl.get_CompatibleInfo)
        CallbackFree(this.vtbl.get_CompatibleInfoCollection)
        CallbackFree(this.vtbl.get_ControlRangeCollection)
        CallbackFree(this.vtbl.get_CSSCurrentStyleDeclaration)
        CallbackFree(this.vtbl.get_CSSRuleList)
        CallbackFree(this.vtbl.get_CSSRuleStyleDeclaration)
        CallbackFree(this.vtbl.get_CSSStyleDeclaration)
        CallbackFree(this.vtbl.get_CSSStyleRule)
        CallbackFree(this.vtbl.get_CSSStyleSheet)
        CallbackFree(this.vtbl.get_DataTransfer)
        CallbackFree(this.vtbl.get_DOMImplementation)
        CallbackFree(this.vtbl.get_Element)
        CallbackFree(this.vtbl.get_Event)
        CallbackFree(this.vtbl.get_History)
        CallbackFree(this.vtbl.get_HTCElementBehaviorDefaults)
        CallbackFree(this.vtbl.get_HTMLAnchorElement)
        CallbackFree(this.vtbl.get_HTMLAreaElement)
        CallbackFree(this.vtbl.get_HTMLAreasCollection)
        CallbackFree(this.vtbl.get_HTMLBaseElement)
        CallbackFree(this.vtbl.get_HTMLBaseFontElement)
        CallbackFree(this.vtbl.get_HTMLBGSoundElement)
        CallbackFree(this.vtbl.get_HTMLBlockElement)
        CallbackFree(this.vtbl.get_HTMLBodyElement)
        CallbackFree(this.vtbl.get_HTMLBRElement)
        CallbackFree(this.vtbl.get_HTMLButtonElement)
        CallbackFree(this.vtbl.get_HTMLCollection)
        CallbackFree(this.vtbl.get_HTMLCommentElement)
        CallbackFree(this.vtbl.get_HTMLDDElement)
        CallbackFree(this.vtbl.get_HTMLDivElement)
        CallbackFree(this.vtbl.get_HTMLDocument)
        CallbackFree(this.vtbl.get_HTMLDListElement)
        CallbackFree(this.vtbl.get_HTMLDTElement)
        CallbackFree(this.vtbl.get_HTMLEmbedElement)
        CallbackFree(this.vtbl.get_HTMLFieldSetElement)
        CallbackFree(this.vtbl.get_HTMLFontElement)
        CallbackFree(this.vtbl.get_HTMLFormElement)
        CallbackFree(this.vtbl.get_HTMLFrameElement)
        CallbackFree(this.vtbl.get_HTMLFrameSetElement)
        CallbackFree(this.vtbl.get_HTMLGenericElement)
        CallbackFree(this.vtbl.get_HTMLHeadElement)
        CallbackFree(this.vtbl.get_HTMLHeadingElement)
        CallbackFree(this.vtbl.get_HTMLHRElement)
        CallbackFree(this.vtbl.get_HTMLHtmlElement)
        CallbackFree(this.vtbl.get_HTMLIFrameElement)
        CallbackFree(this.vtbl.get_HTMLImageElement)
        CallbackFree(this.vtbl.get_HTMLInputElement)
        CallbackFree(this.vtbl.get_HTMLIsIndexElement)
        CallbackFree(this.vtbl.get_HTMLLabelElement)
        CallbackFree(this.vtbl.get_HTMLLegendElement)
        CallbackFree(this.vtbl.get_HTMLLIElement)
        CallbackFree(this.vtbl.get_HTMLLinkElement)
        CallbackFree(this.vtbl.get_HTMLMapElement)
        CallbackFree(this.vtbl.get_HTMLMarqueeElement)
        CallbackFree(this.vtbl.get_HTMLMetaElement)
        CallbackFree(this.vtbl.get_HTMLModelessDialog)
        CallbackFree(this.vtbl.get_HTMLNamespaceInfo)
        CallbackFree(this.vtbl.get_HTMLNamespaceInfoCollection)
        CallbackFree(this.vtbl.get_HTMLNextIdElement)
        CallbackFree(this.vtbl.get_HTMLNoShowElement)
        CallbackFree(this.vtbl.get_HTMLObjectElement)
        CallbackFree(this.vtbl.get_HTMLOListElement)
        CallbackFree(this.vtbl.get_HTMLOptionElement)
        CallbackFree(this.vtbl.get_HTMLParagraphElement)
        CallbackFree(this.vtbl.get_HTMLParamElement)
        CallbackFree(this.vtbl.get_HTMLPhraseElement)
        CallbackFree(this.vtbl.get_HTMLPluginsCollection)
        CallbackFree(this.vtbl.get_HTMLPopup)
        CallbackFree(this.vtbl.get_HTMLScriptElement)
        CallbackFree(this.vtbl.get_HTMLSelectElement)
        CallbackFree(this.vtbl.get_HTMLSpanElement)
        CallbackFree(this.vtbl.get_HTMLStyleElement)
        CallbackFree(this.vtbl.get_HTMLTableCaptionElement)
        CallbackFree(this.vtbl.get_HTMLTableCellElement)
        CallbackFree(this.vtbl.get_HTMLTableColElement)
        CallbackFree(this.vtbl.get_HTMLTableElement)
        CallbackFree(this.vtbl.get_HTMLTableRowElement)
        CallbackFree(this.vtbl.get_HTMLTableSectionElement)
        CallbackFree(this.vtbl.get_HTMLTextAreaElement)
        CallbackFree(this.vtbl.get_HTMLTextElement)
        CallbackFree(this.vtbl.get_HTMLTitleElement)
        CallbackFree(this.vtbl.get_HTMLUListElement)
        CallbackFree(this.vtbl.get_HTMLUnknownElement)
        CallbackFree(this.vtbl.get_Image)
        CallbackFree(this.vtbl.get_Location)
        CallbackFree(this.vtbl.get_NamedNodeMap)
        CallbackFree(this.vtbl.get_Navigator)
        CallbackFree(this.vtbl.get_NodeList)
        CallbackFree(this.vtbl.get_Option)
        CallbackFree(this.vtbl.get_Screen)
        CallbackFree(this.vtbl.get_Selection)
        CallbackFree(this.vtbl.get_StaticNodeList)
        CallbackFree(this.vtbl.get_Storage)
        CallbackFree(this.vtbl.get_StyleSheetList)
        CallbackFree(this.vtbl.get_StyleSheetPage)
        CallbackFree(this.vtbl.get_StyleSheetPageList)
        CallbackFree(this.vtbl.get_Text)
        CallbackFree(this.vtbl.get_TextRange)
        CallbackFree(this.vtbl.get_TextRangeCollection)
        CallbackFree(this.vtbl.get_TextRectangle)
        CallbackFree(this.vtbl.get_TextRectangleList)
        CallbackFree(this.vtbl.get_Window)
        CallbackFree(this.vtbl.get_XDomainRequest)
        CallbackFree(this.vtbl.get_XMLHttpRequest)
    }
}
