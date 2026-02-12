#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISyndicationFeed.ahk
#Include .\ISyndicationNode.ahk
#Include .\ISyndicationFeedFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a feed. This class encapsulates the information in the *rss/channel** element in *RSS 2.0* or the **atom:feed** element in *Atom 1.0*.
 * @remarks
 * The following table maps SyndicationFeed properties to RSS and Atom feed elements.
 * 
 * | SyndicationFeed | RSS Channel | Atom Feed |
 * |---|---|---|
 * | [Authors](syndicationfeed_authors.md) | managingEditor | author |
 * | [Categories](syndicationfeed_categories.md) | category | category |
 * | [Contributors](syndicationfeed_contributors.md) | contributor |
 * | [Generator](syndicationfeed_generator.md) | generator | generator |
 * | [IconUri](syndicationfeed_iconuri.md) | icon |
 * | [Id](syndicationfeed_id.md) | id |
 * | [LastUpdatedTime](syndicationfeed_lastupdatedtime.md) | lastBuildDate | updated |
 * | [Rights](syndicationfeed_rights.md) | copyright | rights |
 * | [Subtitle](syndicationfeed_subtitle.md) | description | subtitle |
 * | [Title](syndicationfeed_title.md) | title | title |
 * | [Items](syndicationfeed_items.md) | item | entry |
 * | [Links](syndicationfeed_links.md) | link | link |
 * | [ImageUri](syndicationfeed_imageuri.md) | image | logo |
 * | [FirstUri](syndicationfeed_firsturi.md) | link with rel="first" |
 * | [LastUri](syndicationfeed_lasturi.md) | link with rel="last" |
 * | [NextUri](syndicationfeed_nexturi.md) | link with rel="next" |
 * | [PreviousUri](syndicationfeed_previousuri.md) | link with rel="previous" |
 * | [SourceFormat](syndicationfeed_sourceformat.md) |
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationFeed extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISyndicationFeed

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISyndicationFeed.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [SyndicationFeed](syndicationfeed.md) object with a **Title**, **Subtitle**, and **Uri**.
     * @param {HSTRING} title The **Title** of the syndication feed.
     * @param {HSTRING} subtitle The **Subtitle** of the syndication feed.
     * @param {Uri} uri_ The [Uri](../windows.foundation/uri.md) value.
     * @returns {SyndicationFeed} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.#ctor
     */
    static CreateSyndicationFeed(title, subtitle, uri_) {
        if (!SyndicationFeed.HasProp("__ISyndicationFeedFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationFeed")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationFeedFactory.IID)
            SyndicationFeed.__ISyndicationFeedFactory := ISyndicationFeedFactory(factoryPtr)
        }

        return SyndicationFeed.__ISyndicationFeedFactory.CreateSyndicationFeed(title, subtitle, uri_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the authors of an item. This property represents the collection of all the **atom:author** elements under **atom:entry**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.authors
     * @type {IVector<SyndicationPerson>} 
     */
    Authors {
        get => this.get_Authors()
    }

    /**
     * Gets a collection of categories of the feed. This property represents the collection of all the **atom:category** elements under **atom:feed**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.categories
     * @type {IVector<SyndicationCategory>} 
     */
    Categories {
        get => this.get_Categories()
    }

    /**
     * Gets a collection of the contributors of the feed. This property represents the collection of all the **atom:contributor** elements under **atom:feed**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.contributors
     * @type {IVector<SyndicationPerson>} 
     */
    Contributors {
        get => this.get_Contributors()
    }

    /**
     * Gets or sets the generator of the feed. This property represents the **atom:generator** element or the **generator** element in *RSS 2.0*.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.generator
     * @type {SyndicationGenerator} 
     */
    Generator {
        get => this.get_Generator()
        set => this.put_Generator(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) for the image for the feed. This property represents the **atom:icon** element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.iconuri
     * @type {Uri} 
     */
    IconUri {
        get => this.get_IconUri()
        set => this.put_IconUri(value)
    }

    /**
     * Gets or sets the identifier for the syndication feed.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets the collection of items in the feed. This property represents the collection of **atom:entry** elements or a collection of **item** elements in *RSS 2.0*.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.items
     * @type {IVector<SyndicationItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets or sets the time the feed was last modified. This property represents the *rss/channel/lastBuildDate** or **atom:updated** element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.lastupdatedtime
     * @type {DateTime} 
     */
    LastUpdatedTime {
        get => this.get_LastUpdatedTime()
        set => this.put_LastUpdatedTime(value)
    }

    /**
     * Gets the links associated with the feed. This property represents a collection of the **atom:link** elements under **atom:feed**. In *RSS 2.0*, this maps to the **link** element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.links
     * @type {IVector<SyndicationLink>} 
     */
    Links {
        get => this.get_Links()
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) of the logo for the feed. This property represents the **atom:logo** element or **image/uri** element in *RSS 2.0*.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.imageuri
     * @type {Uri} 
     */
    ImageUri {
        get => this.get_ImageUri()
        set => this.put_ImageUri(value)
    }

    /**
     * Gets or sets information about the rights for the feed. This property represents the **atom:rights** element or the **copyright** element in *RSS 2.0*.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.rights
     * @type {ISyndicationText} 
     */
    Rights {
        get => this.get_Rights()
        set => this.put_Rights(value)
    }

    /**
     * Gets or sets the subtitle of the feed. This property represents the **atom:subtitle** element or the **description** element in *RSS 2.0*.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.subtitle
     * @type {ISyndicationText} 
     */
    Subtitle {
        get => this.get_Subtitle()
        set => this.put_Subtitle(value)
    }

    /**
     * Gets or sets the title of the syndication feed.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.title
     * @type {ISyndicationText} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets the first Uniform Resource Identifier (URI) in a sequence. This property represents the **atom:link** element with attribute **rel=”first”**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.firsturi
     * @type {Uri} 
     */
    FirstUri {
        get => this.get_FirstUri()
    }

    /**
     * Gets the last Uniform Resource Identifier (URI) in the sequence. This property represents the **atom:link** element with attribute **rel=”last”**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.lasturi
     * @type {Uri} 
     */
    LastUri {
        get => this.get_LastUri()
    }

    /**
     * Gets the next Uniform Resource Identifier (URI) in the sequence. This property represents the **atom:link** element with attribute **rel="next"**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.nexturi
     * @type {Uri} 
     */
    NextUri {
        get => this.get_NextUri()
    }

    /**
     * Gets the previous Uniform Resource Identifier (URI) in the sequence. This property represents the **atom:link** element with attribute **rel="previous"**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.previousuri
     * @type {Uri} 
     */
    PreviousUri {
        get => this.get_PreviousUri()
    }

    /**
     * Gets the format of the source document. If the object is not loaded from a document, this property will return **SyndicationFormat_Atom10**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.sourceformat
     * @type {Integer} 
     */
    SourceFormat {
        get => this.get_SourceFormat()
    }

    /**
     * Gets or sets the local name of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
        set => this.put_NodeName(value)
    }

    /**
     * Gets or sets the namespace of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.nodenamespace
     * @type {HSTRING} 
     */
    NodeNamespace {
        get => this.get_NodeNamespace()
        set => this.put_NodeNamespace(value)
    }

    /**
     * Gets or sets the text content of the element. If the element contains only child elements, this property is NULL.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.nodevalue
     * @type {HSTRING} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets or sets the language of the element. This property represents the **xml:lang** attribute on the element. It may be inherited from an ancestor element. It must be valid according to XML 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets the base URI for the element. This property represents the **xml:base** attribute on the element. It may be inherited from an ancestor element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.baseuri
     * @type {Uri} 
     */
    BaseUri {
        get => this.get_BaseUri()
        set => this.put_BaseUri(value)
    }

    /**
     * Gets the list of custom attributes of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.attributeextensions
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.elementextensions
     * @type {IVector<ISyndicationNode>} 
     */
    ElementExtensions {
        get => this.get_ElementExtensions()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [SyndicationFeed](syndicationfeed.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationFeed")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<SyndicationPerson>} 
     */
    get_Authors() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_Authors()
    }

    /**
     * 
     * @returns {IVector<SyndicationCategory>} 
     */
    get_Categories() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_Categories()
    }

    /**
     * 
     * @returns {IVector<SyndicationPerson>} 
     */
    get_Contributors() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_Contributors()
    }

    /**
     * 
     * @returns {SyndicationGenerator} 
     */
    get_Generator() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_Generator()
    }

    /**
     * 
     * @param {SyndicationGenerator} value 
     * @returns {HRESULT} 
     */
    put_Generator(value) {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.put_Generator(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_IconUri() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_IconUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_IconUri(value) {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.put_IconUri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.put_Id(value)
    }

    /**
     * 
     * @returns {IVector<SyndicationItem>} 
     */
    get_Items() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_Items()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastUpdatedTime() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_LastUpdatedTime()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastUpdatedTime(value) {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.put_LastUpdatedTime(value)
    }

    /**
     * 
     * @returns {IVector<SyndicationLink>} 
     */
    get_Links() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_Links()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ImageUri() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_ImageUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ImageUri(value) {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.put_ImageUri(value)
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Rights() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_Rights()
    }

    /**
     * 
     * @param {ISyndicationText} value 
     * @returns {HRESULT} 
     */
    put_Rights(value) {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.put_Rights(value)
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Subtitle() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_Subtitle()
    }

    /**
     * 
     * @param {ISyndicationText} value 
     * @returns {HRESULT} 
     */
    put_Subtitle(value) {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.put_Subtitle(value)
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Title() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_Title()
    }

    /**
     * 
     * @param {ISyndicationText} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.put_Title(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_FirstUri() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_FirstUri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LastUri() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_LastUri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_NextUri() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_NextUri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_PreviousUri() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_PreviousUri()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceFormat() {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.get_SourceFormat()
    }

    /**
     * Initializes the object from the given feed string, which can be in either *RSS 2.0* or *Atom 1.0* format.
     * @param {HSTRING} feed The feed string, which can be in either *RSS 2.0* or *Atom 1.0* format.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.load
     */
    Load(feed) {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.Load(feed)
    }

    /**
     * Initializes the [SyndicationFeed](syndicationfeed.md) object from the given DOM object, which can contain XML content in either *RSS 2.0 * or *Atom 1.0* format.
     * @param {XmlDocument} feedDocument The DOM object which contains XML content in either *RSS 2.0* or *Atom 1.0* format.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.loadfromxml
     */
    LoadFromXml(feedDocument) {
        if (!this.HasProp("__ISyndicationFeed")) {
            if ((queryResult := this.QueryInterface(ISyndicationFeed.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationFeed := ISyndicationFeed(outPtr)
        }

        return this.__ISyndicationFeed.LoadFromXml(feedDocument)
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationfeed.getxmldocument
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
