#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISyndicationLink.ahk
#Include .\ISyndicationNode.ahk
#Include .\ISyndicationLinkFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a link within a syndication feed or item. This class encapsulates information in the *rss/channel/link** or //*rss/channel/item/link** element in *RSS 2.0* or the **atom:link** element in *Atom 1.0*.
 * @remarks
 * The following table maps SyndicationLink properties to RSS and Atom feed elements.
 * 
 * | SyndicationLink | RSS | Atom |
 * |---|---|---|
 * | [Length](syndicationlink_length.md) | length (attribute) |
 * | [MediaType](syndicationlink_mediatype.md) | type (attribute) |
 * | [Relationship](syndicationlink_relationship.md) | rel (attribute) |
 * | [Title](syndicationlink_title.md) | title (attribute) |
 * | [Uri](syndicationlink_uri.md) | (node value) | href (attribute) |
 * | [ResourceLanguage](syndicationlink_resourcelanguage.md) | hreflang (attribute) |
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationLink extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISyndicationLink

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISyndicationLink.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [SyndicationLink](syndicationlink.md) with a **Uri**.
     * @param {Uri} uri_ The [Uri](../windows.foundation/uri.md) value.
     * @returns {SyndicationLink} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.#ctor
     */
    static CreateSyndicationLink(uri_) {
        if (!SyndicationLink.HasProp("__ISyndicationLinkFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationLinkFactory.IID)
            SyndicationLink.__ISyndicationLinkFactory := ISyndicationLinkFactory(factoryPtr)
        }

        return SyndicationLink.__ISyndicationLinkFactory.CreateSyndicationLink(uri_)
    }

    /**
     * Creates a new [SyndicationLink](syndicationlink.md) object with a **Uri**, **Relationship**, **Title**, **MediaType**, and **Length**.
     * @param {Uri} uri_ The [Uri](../windows.foundation/uri.md) value.
     * @param {HSTRING} relationship The relationship type.
     * @param {HSTRING} title The title of the syndication link.
     * @param {HSTRING} mediaType_ The MediaType of the syndication link.
     * @param {Integer} length The length, in bytes, of the syndication link.
     * @returns {SyndicationLink} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.#ctor
     */
    static CreateSyndicationLinkEx(uri_, relationship, title, mediaType_, length) {
        if (!SyndicationLink.HasProp("__ISyndicationLinkFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationLinkFactory.IID)
            SyndicationLink.__ISyndicationLinkFactory := ISyndicationLinkFactory(factoryPtr)
        }

        return SyndicationLink.__ISyndicationLinkFactory.CreateSyndicationLinkEx(uri_, relationship, title, mediaType_, length)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the length of the linked resource, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
    }

    /**
     * Gets or sets the media type of the linked resource. The string must have the pattern ".+/.+".
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.mediatype
     * @type {HSTRING} 
     */
    MediaType {
        get => this.get_MediaType()
        set => this.put_MediaType(value)
    }

    /**
     * Gets or sets the relationship type of the link.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.relationship
     * @type {HSTRING} 
     */
    Relationship {
        get => this.get_Relationship()
        set => this.put_Relationship(value)
    }

    /**
     * Gets or sets the title of the syndication link.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the URI of the linked resource.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets or sets the language of the resource pointed to by the **Uri** property. This property represents the **hreflang** attribute on **atom:link**. It must adhere to the pattern defined by .
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.resourcelanguage
     * @type {HSTRING} 
     */
    ResourceLanguage {
        get => this.get_ResourceLanguage()
        set => this.put_ResourceLanguage(value)
    }

    /**
     * Gets or sets the local name of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
        set => this.put_NodeName(value)
    }

    /**
     * Gets or sets the namespace of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.nodenamespace
     * @type {HSTRING} 
     */
    NodeNamespace {
        get => this.get_NodeNamespace()
        set => this.put_NodeNamespace(value)
    }

    /**
     * Gets or sets the text content of the element. If the element contains only child elements, this property is NULL.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.nodevalue
     * @type {HSTRING} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets or sets the language of the element. This property represents the **xml:lang** attribute on the element. It may be inherited from an ancestor element. It must be valid according to XML 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets the base URI for the element. This property represents the **xml:base** attribute on the element. It may be inherited from an ancestor element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.baseuri
     * @type {Uri} 
     */
    BaseUri {
        get => this.get_BaseUri()
        set => this.put_BaseUri(value)
    }

    /**
     * Gets the list of custom attributes of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.attributeextensions
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.elementextensions
     * @type {IVector<ISyndicationNode>} 
     */
    ElementExtensions {
        get => this.get_ElementExtensions()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [SyndicationLink](syndicationlink.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationLink")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.get_Length()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Length(value) {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.put_Length(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MediaType() {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.get_MediaType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MediaType(value) {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.put_MediaType(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Relationship() {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.get_Relationship()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Relationship(value) {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.put_Relationship(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.put_Title(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.get_Uri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.put_Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResourceLanguage() {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.get_ResourceLanguage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ResourceLanguage(value) {
        if (!this.HasProp("__ISyndicationLink")) {
            if ((queryResult := this.QueryInterface(ISyndicationLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationLink := ISyndicationLink(outPtr)
        }

        return this.__ISyndicationLink.put_ResourceLanguage(value)
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationlink.getxmldocument
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
