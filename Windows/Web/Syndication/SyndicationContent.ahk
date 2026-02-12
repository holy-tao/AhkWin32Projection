#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISyndicationText.ahk
#Include .\ISyndicationNode.ahk
#Include .\ISyndicationContent.ahk
#Include .\ISyndicationContentFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents feed content including Text, HTML, XHTML, URL, and XML. This object encapsulates the **atom:content** element in *Atom 1.0* and can contain a link to external content.
 * @remarks
 * The following table maps SyndicationContent properties to RSS and Atom feed elements.
 * 
 * | SyndicationContent | RSS | Atom |
 * |---|---|---|
 * | [SourceUri](syndicationcontent_sourceuri.md) | src (attribute) |
 * | [Text](syndicationcontent_text.md) | (node value) | (node value) |
 * | [Type](syndicationcontent_type.md) | type (attribute) |
 * | [Xml](syndicationcontent_xml.md) | (xhtml node value) |
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationContent extends IInspectable {
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
     * Creates a new [SyndicationContent](syndicationcontent.md) object with the specified **Text** and **Type** property values.
     * @param {HSTRING} text The text of the content.
     * @param {Integer} type The type of the content.
     * @returns {SyndicationContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.#ctor
     */
    static CreateSyndicationContent(text, type) {
        if (!SyndicationContent.HasProp("__ISyndicationContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationContentFactory.IID)
            SyndicationContent.__ISyndicationContentFactory := ISyndicationContentFactory(factoryPtr)
        }

        return SyndicationContent.__ISyndicationContentFactory.CreateSyndicationContent(text, type)
    }

    /**
     * Creates a new [SyndicationContent](syndicationcontent.md) object with the specified **Uri** property value.
     * @param {Uri} sourceUri The [Uri](../windows.foundation/uri.md) value.
     * @returns {SyndicationContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.#ctor
     */
    static CreateSyndicationContentWithSourceUri(sourceUri) {
        if (!SyndicationContent.HasProp("__ISyndicationContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationContentFactory.IID)
            SyndicationContent.__ISyndicationContentFactory := ISyndicationContentFactory(factoryPtr)
        }

        return SyndicationContent.__ISyndicationContentFactory.CreateSyndicationContentWithSourceUri(sourceUri)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the syndication content.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the type of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets the XML content.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.xml
     * @type {XmlDocument} 
     */
    Xml {
        get => this.get_Xml()
        set => this.put_Xml(value)
    }

    /**
     * Gets or sets the local name of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
        set => this.put_NodeName(value)
    }

    /**
     * Gets or sets the namespace of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.nodenamespace
     * @type {HSTRING} 
     */
    NodeNamespace {
        get => this.get_NodeNamespace()
        set => this.put_NodeNamespace(value)
    }

    /**
     * Gets or sets the text content of the element. If the element contains only child elements, this property is NULL.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.nodevalue
     * @type {HSTRING} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets or sets the language of the element. This property represents the **xml:lang** attribute on the element. It may be inherited from an ancestor element. It must be valid according to XML 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets the base URI for the element. This property represents the **xml:base** attribute on the element. It may be inherited from an ancestor element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.baseuri
     * @type {Uri} 
     */
    BaseUri {
        get => this.get_BaseUri()
        set => this.put_BaseUri(value)
    }

    /**
     * Gets the list of custom attributes of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.attributeextensions
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.elementextensions
     * @type {IVector<ISyndicationNode>} 
     */
    ElementExtensions {
        get => this.get_ElementExtensions()
    }

    /**
     * Gets or sets the URI to the content. This property represents the **src** attribute on **atom:content**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.sourceuri
     * @type {Uri} 
     */
    SourceUri {
        get => this.get_SourceUri()
        set => this.put_SourceUri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [SyndicationContent](syndicationcontent.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationContent")
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcontent.getxmldocument
     */
    GetXmlDocument(format) {
        if (!this.HasProp("__ISyndicationNode")) {
            if ((queryResult := this.QueryInterface(ISyndicationNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationNode := ISyndicationNode(outPtr)
        }

        return this.__ISyndicationNode.GetXmlDocument(format)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SourceUri() {
        if (!this.HasProp("__ISyndicationContent")) {
            if ((queryResult := this.QueryInterface(ISyndicationContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationContent := ISyndicationContent(outPtr)
        }

        return this.__ISyndicationContent.get_SourceUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_SourceUri(value) {
        if (!this.HasProp("__ISyndicationContent")) {
            if ((queryResult := this.QueryInterface(ISyndicationContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationContent := ISyndicationContent(outPtr)
        }

        return this.__ISyndicationContent.put_SourceUri(value)
    }

;@endregion Instance Methods
}
