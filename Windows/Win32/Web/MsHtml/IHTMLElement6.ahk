#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLDOMAttribute2.ahk
#Include .\IHTMLElementCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElement6 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElement6
     * @type {Guid}
     */
    static IID => Guid("{305106f8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getAttributeNS", "setAttributeNS", "removeAttributeNS", "getAttributeNodeNS", "setAttributeNodeNS", "hasAttributeNS", "getAttribute", "setAttribute", "removeAttribute", "getAttributeNode", "setAttributeNode", "removeAttributeNode", "hasAttribute", "getElementsByTagNameNS", "get_tagName", "get_nodeName", "getElementsByClassName", "msMatchesSelector", "put_onabort", "get_onabort", "put_oncanplay", "get_oncanplay", "put_oncanplaythrough", "get_oncanplaythrough", "put_onchange", "get_onchange", "put_ondurationchange", "get_ondurationchange", "put_onemptied", "get_onemptied", "put_onended", "get_onended", "put_onerror", "get_onerror", "put_oninput", "get_oninput", "put_onload", "get_onload", "put_onloadeddata", "get_onloadeddata", "put_onloadedmetadata", "get_onloadedmetadata", "put_onloadstart", "get_onloadstart", "put_onpause", "get_onpause", "put_onplay", "get_onplay", "put_onplaying", "get_onplaying", "put_onprogress", "get_onprogress", "put_onratechange", "get_onratechange", "put_onreset", "get_onreset", "put_onseeked", "get_onseeked", "put_onseeking", "get_onseeking", "put_onselect", "get_onselect", "put_onstalled", "get_onstalled", "put_onsubmit", "get_onsubmit", "put_onsuspend", "get_onsuspend", "put_ontimeupdate", "get_ontimeupdate", "put_onvolumechange", "get_onvolumechange", "put_onwaiting", "get_onwaiting", "hasAttributes"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} strAttributeName 
     * @returns {VARIANT} 
     */
    getAttributeNS(pvarNS, strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        AttributeValue := VARIANT()
        result := ComCall(7, this, "ptr", pvarNS, "ptr", strAttributeName, "ptr", AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} strAttributeName 
     * @param {Pointer<VARIANT>} pvarAttributeValue 
     * @returns {HRESULT} 
     */
    setAttributeNS(pvarNS, strAttributeName, pvarAttributeValue) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(8, this, "ptr", pvarNS, "ptr", strAttributeName, "ptr", pvarAttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} strAttributeName 
     * @returns {HRESULT} 
     */
    removeAttributeNS(pvarNS, strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(9, this, "ptr", pvarNS, "ptr", strAttributeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrname 
     * @returns {IHTMLDOMAttribute2} 
     */
    getAttributeNodeNS(pvarNS, bstrname) {
        bstrname := bstrname is String ? BSTR.Alloc(bstrname).Value : bstrname

        result := ComCall(10, this, "ptr", pvarNS, "ptr", bstrname, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pattr 
     * @returns {IHTMLDOMAttribute2} 
     */
    setAttributeNodeNS(pattr) {
        result := ComCall(11, this, "ptr", pattr, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} name 
     * @returns {VARIANT_BOOL} 
     */
    hasAttributeNS(pvarNS, name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(12, this, "ptr", pvarNS, "ptr", name, "short*", &pfHasAttribute := 0, "HRESULT")
        return pfHasAttribute
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @returns {VARIANT} 
     */
    getAttribute(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        AttributeValue := VARIANT()
        result := ComCall(13, this, "ptr", strAttributeName, "ptr", AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {Pointer<VARIANT>} pvarAttributeValue 
     * @returns {HRESULT} 
     */
    setAttribute(strAttributeName, pvarAttributeValue) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(14, this, "ptr", strAttributeName, "ptr", pvarAttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @returns {HRESULT} 
     */
    removeAttribute(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(15, this, "ptr", strAttributeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @returns {IHTMLDOMAttribute2} 
     */
    getAttributeNode(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(16, this, "ptr", strAttributeName, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pattr 
     * @returns {IHTMLDOMAttribute2} 
     */
    setAttributeNode(pattr) {
        result := ComCall(17, this, "ptr", pattr, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pattr 
     * @returns {IHTMLDOMAttribute2} 
     */
    removeAttributeNode(pattr) {
        result := ComCall(18, this, "ptr", pattr, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT_BOOL} 
     */
    hasAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(19, this, "ptr", name, "short*", &pfHasAttribute := 0, "HRESULT")
        return pfHasAttribute
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varNS 
     * @param {BSTR} bstrLocalName 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByTagNameNS(varNS, bstrLocalName) {
        bstrLocalName := bstrLocalName is String ? BSTR.Alloc(bstrLocalName).Value : bstrLocalName

        result := ComCall(20, this, "ptr", varNS, "ptr", bstrLocalName, "ptr*", &pelColl := 0, "HRESULT")
        return IHTMLElementCollection(pelColl)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tagName() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nodeName() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByClassName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "ptr*", &pel := 0, "HRESULT")
        return IHTMLElementCollection(pel)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {VARIANT_BOOL} 
     */
    msMatchesSelector(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(24, this, "ptr", v, "short*", &pfMatches := 0, "HRESULT")
        return pfMatches
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onabort(v) {
        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onabort() {
        p := VARIANT()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplay(v) {
        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncanplay() {
        p := VARIANT()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplaythrough(v) {
        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncanplaythrough() {
        p := VARIANT()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchange(v) {
        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchange() {
        p := VARIANT()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondurationchange(v) {
        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondurationchange() {
        p := VARIANT()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onemptied(v) {
        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onemptied() {
        p := VARIANT()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onended(v) {
        result := ComCall(37, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onended() {
        p := VARIANT()
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(39, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(40, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oninput(v) {
        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oninput() {
        p := VARIANT()
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(43, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadeddata(v) {
        result := ComCall(45, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadeddata() {
        p := VARIANT()
        result := ComCall(46, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadedmetadata(v) {
        result := ComCall(47, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadedmetadata() {
        p := VARIANT()
        result := ComCall(48, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadstart(v) {
        result := ComCall(49, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadstart() {
        p := VARIANT()
        result := ComCall(50, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpause(v) {
        result := ComCall(51, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpause() {
        p := VARIANT()
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplay(v) {
        result := ComCall(53, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onplay() {
        p := VARIANT()
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplaying(v) {
        result := ComCall(55, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onplaying() {
        p := VARIANT()
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onprogress(v) {
        result := ComCall(57, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onprogress() {
        p := VARIANT()
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onratechange(v) {
        result := ComCall(59, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onratechange() {
        p := VARIANT()
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreset(v) {
        result := ComCall(61, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreset() {
        p := VARIANT()
        result := ComCall(62, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeked(v) {
        result := ComCall(63, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onseeked() {
        p := VARIANT()
        result := ComCall(64, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeking(v) {
        result := ComCall(65, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onseeking() {
        p := VARIANT()
        result := ComCall(66, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselect(v) {
        result := ComCall(67, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselect() {
        p := VARIANT()
        result := ComCall(68, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstalled(v) {
        result := ComCall(69, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstalled() {
        p := VARIANT()
        result := ComCall(70, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsubmit(v) {
        result := ComCall(71, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsubmit() {
        p := VARIANT()
        result := ComCall(72, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsuspend(v) {
        result := ComCall(73, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsuspend() {
        p := VARIANT()
        result := ComCall(74, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ontimeupdate(v) {
        result := ComCall(75, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ontimeupdate() {
        p := VARIANT()
        result := ComCall(76, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onvolumechange(v) {
        result := ComCall(77, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onvolumechange() {
        p := VARIANT()
        result := ComCall(78, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onwaiting(v) {
        result := ComCall(79, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onwaiting() {
        p := VARIANT()
        result := ComCall(80, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasAttributes() {
        result := ComCall(81, this, "short*", &pfHasAttributes := 0, "HRESULT")
        return pfHasAttributes
    }
}
