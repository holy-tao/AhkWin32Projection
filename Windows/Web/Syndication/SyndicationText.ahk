#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISyndicationText.ahk
#Include .\ISyndicationNode.ahk
#Include .\ISyndicationTextFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Implements the [ISyndicationText](isyndicationtext.md) interface that encapsulates elements in *RSS 2.0* or *Atom 1.0* that can have either text, HTML, or XHTML. In *Atom 1.0*, this object maps to an **atomTextConstruct** in the schema, which can be **atom:title**, **atom:subtitle**, **atom:rights**, or **atom:summary** elements.
 * @remarks
 * The following table maps SyndicationText properties to RSS and Atom feed elements.
 * 
 * | SyndicationText | RSS | Atom |
 * |---|---|---|
 * | [Text](syndicationtext_text.md) | (node value) | (node value) |
 * | [Type](syndicationtext_type.md) |---| type (attribute) |
 * | [Xml](syndicationtext_xml.md) |---| (xhtml node value) |
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationText extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISyndicationText

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISyndicationText.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [SyndicationText](syndicationtext.md) object with the specified **Text** property value.
     * @param {HSTRING} text The content of a text content construct like **atom:title**.
     * @returns {SyndicationText} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.#ctor
     */
    static CreateSyndicationText(text) {
        if (!SyndicationText.HasProp("__ISyndicationTextFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationText")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationTextFactory.IID)
            SyndicationText.__ISyndicationTextFactory := ISyndicationTextFactory(factoryPtr)
        }

        return SyndicationText.__ISyndicationTextFactory.CreateSyndicationText(text)
    }

    /**
     * Creates a new [SyndicationText](syndicationtext.md) object with the specified **Text** and **Type** property values.
     * @param {HSTRING} text The content of a text content construct like **atom:title**.
     * @param {Integer} type The type of the content. This value can be "text", "html", and "xhtml".
     * @returns {SyndicationText} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.#ctor
     */
    static CreateSyndicationTextEx(text, type) {
        if (!SyndicationText.HasProp("__ISyndicationTextFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationText")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationTextFactory.IID)
            SyndicationText.__ISyndicationTextFactory := ISyndicationTextFactory(factoryPtr)
        }

        return SyndicationText.__ISyndicationTextFactory.CreateSyndicationTextEx(text, type)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the content of a text content construct like **atom:title**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the type of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets the XML content.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.xml
     * @type {XmlDocument} 
     */
    Xml {
        get => this.get_Xml()
        set => this.put_Xml(value)
    }

    /**
     * Gets or sets the local name of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
        set => this.put_NodeName(value)
    }

    /**
     * Gets or sets the namespace of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.nodenamespace
     * @type {HSTRING} 
     */
    NodeNamespace {
        get => this.get_NodeNamespace()
        set => this.put_NodeNamespace(value)
    }

    /**
     * Gets or sets the text content of the element. If the element contains only child elements, this property is NULL.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.nodevalue
     * @type {HSTRING} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets or sets the language of the element. This property represents the **xml:lang** attribute on the element. It may be inherited from an ancestor element. It must be valid according to XML 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets the base URI for the element. This property represents the **xml:base** attribute on the element. It may be inherited from an ancestor element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.baseuri
     * @type {Uri} 
     */
    BaseUri {
        get => this.get_BaseUri()
        set => this.put_BaseUri(value)
    }

    /**
     * Gets the list of custom attributes of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.attributeextensions
     * @type {IVector<SyndicationAttribute>} 
     */
    AttributeExtensions {
        get => this.get_AttributeExtensions()
    }

    /**
     * Gets the list of child elements within the element.
     * @remarks
     * The following elements in the RSS 2.0 documents do not have public accessors;they can be accessed by searching the ElementExtensions collection on the [SyndicationFeed](syndicationfeed.md) object: 
     * + /rss/channel/docs
     * + /rss/channel/cloud
     * + /rss/channel/pubDate
     * + /rss/channel/webmaster
     * + /rss/channel/ttl
     * + /rss/channel/rating
     * + /rss/channel/textInput
     * + /rss/channel/skipDays
     * + /rss/channel/skipHours
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.elementextensions
     * @type {IVector<ISyndicationNode>} 
     */
    ElementExtensions {
        get => this.get_ElementExtensions()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [SyndicationText](syndicationtext.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationText")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ISyndicationText")) {
            if ((queryResult := this.QueryInterface(ISyndicationText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationText := ISyndicationText(outPtr)
        }

        return this.__ISyndicationText.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__ISyndicationText")) {
            if ((queryResult := this.QueryInterface(ISyndicationText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationText := ISyndicationText(outPtr)
        }

        return this.__ISyndicationText.put_Text(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        if (!this.HasProp("__ISyndicationText")) {
            if ((queryResult := this.QueryInterface(ISyndicationText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationText := ISyndicationText(outPtr)
        }

        return this.__ISyndicationText.get_Type()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__ISyndicationText")) {
            if ((queryResult := this.QueryInterface(ISyndicationText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationText := ISyndicationText(outPtr)
        }

        return this.__ISyndicationText.put_Type(value)
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    get_Xml() {
        if (!this.HasProp("__ISyndicationText")) {
            if ((queryResult := this.QueryInterface(ISyndicationText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationText := ISyndicationText(outPtr)
        }

        return this.__ISyndicationText.get_Xml()
    }

    /**
     * 
     * @param {XmlDocument} value 
     * @returns {HRESULT} 
     */
    put_Xml(value) {
        if (!this.HasProp("__ISyndicationText")) {
            if ((queryResult := this.QueryInterface(ISyndicationText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationText := ISyndicationText(outPtr)
        }

        return this.__ISyndicationText.put_Xml(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NodeName() {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.get_NodeName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_NodeName(value) {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.put_NodeName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NodeNamespace() {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.get_NodeNamespace()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_NodeNamespace(value) {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.put_NodeNamespace(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NodeValue() {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.get_NodeValue()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_NodeValue(value) {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.put_NodeValue(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.get_Language()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.put_Language(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_BaseUri() {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.get_BaseUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_BaseUri(value) {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.put_BaseUri(value)
    }

    /**
     * 
     * @returns {IVector<SyndicationAttribute>} 
     */
    get_AttributeExtensions() {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.get_AttributeExtensions()
    }

    /**
     * 
     * @returns {IVector<ISyndicationNode>} 
     */
    get_ElementExtensions() {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.get_ElementExtensions()
    }

    /**
     * Generates the DOM object that represents this element, all the attributes and child elements including foreign markups. The only formats accepted by this method are *Atom 1.0* and *RSS 2.0*.
     * @param {Integer} format The format of the data.
     * @returns {XmlDocument} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtext.getxmldocument
     */
    GetXmlDocument(format) {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.GetXmlDocument(format)
    }

;@endregion Instance Methods
}
