#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISyndicationItem.ahk
#Include .\ISyndicationNode.ahk
#Include .\ISyndicationItemFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an item in the feed. This class encapsulates information in the *rss/channel/item** element in *RSS 2.0* or the **atom:entry** element in *Atom 1.0*.
 * @remarks
 * The following code demonstrates how to access the property values of a SyndicationItem object.
 * 
 * ```csharp
 * 
 * using Windows.Foundation;
 * using Windows.Web.Syndication;
 * 
 * private void DisplayCurrentItem()
 * {
 *     SyndicationItem item = currentFeed.Items[currentItemIndex];
 * 
 *     // Title
 *     FeedItemTitle.Text = item.Title != null ? item.Title.Text : "(no title)";
 * 
 *     // Display the main link
 *     string link = string.Empty;
 *     if (item.Links.Count > 0)
 *     {
 *     link = item.Links[0].Uri.AbsoluteUri;
 *     }
 *     FeedLink.Content = link;
 * 
 *     // Display the body as HTML
 *     string content = "(no content)";
 *     if (item.Content != null)
 *     {
 *         content = item.Content.Text;
 *     }
 *     else if (item.Summary != null)
 *     {
 *         content = item.Summary.Text;
 *     }
 *     FeedWebView.NavigateToString(content);
 * }
 * ```
 * 
 * For additional examples that demonstrate how this class is used to represent feed content, see [Quickstart: Accessing a web feed](/previous-versions/windows/apps/hh700374(v=win.10)).
 * 
 * The following table maps SyndicationItem properties to RSS and Atom feed elements.
 * 
 * | SyndicationItem | RSS Channel/Item | Atom entry | [AtomPub](../windows.web.atompub/windows_web_atompub.md) |
 * |---|---|---|---|
 * | [AttributeExtensions](syndicationitem_attributeextensions.md) (foreign markup) |---|---|---|
 * | [Authors](syndicationitem_authors.md) | author | authors |---|
 * | [BaseUri](syndicationitem_baseuri.md) |---|---|---|
 * | [Categories](syndicationitem_categories.md) | category | category |---|
 * | [CommentsUri](syndicationitem_commentsuri.md) | comments |---|---|
 * | [Content](syndicationitem_content.md) |---| content |---|
 * | [Contributors](syndicationitem_contributors.md) |---| contributor |---|
 * | [EditMediaUri](syndicationitem_editmediauri.md) |---| link with rel="edit-media" |---|
 * | [EditUri](syndicationitem_edituri.md) |---| link with rel="edit" |---|
 * | [ElementExtensions](syndicationitem_elementextensions.md) (foreign markup) |---|---|---|
 * | **Etag** |---|---| ETag header after [CreateResourceAsync](../windows.web.atompub/atompubclient_createresourceasync_823380555.md) |
 * | [Id](syndicationitem_id.md) | guid | id | Location header after [CreateResourceAsync](../windows.web.atompub/atompubclient_createresourceasync_823380555.md) |
 * | [ItemUri](syndicationitem_itemuri.md) |---|---|---|
 * | [Language](syndicationitem_language.md) | xml:lang | xml:lang |---|
 * | [LastUpdatedTime](syndicationitem_lastupdatedtime.md) |---| updated |---|
 * | [Links](syndicationitem_links.md) | link/enclosure | link |---|
 * | [NodeName](syndicationitem_nodename.md) |---|---|---|
 * | [NodeNamespace](syndicationitem_nodenamespace.md) |---|---|---|
 * | [NodeValue](syndicationitem_nodevalue.md) |---|---|---|
 * | [PublishedDate](syndicationitem_publisheddate.md) | pubDate | published |---|
 * | [Rights](syndicationitem_rights.md) |---| rights |---|
 * | [Source](syndicationitem_source.md) | source | source |---|
 * | [Summary](syndicationitem_summary.md) | description | summary |---|
 * | [Title](syndicationitem_title.md) | title | title |---|
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISyndicationItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISyndicationItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [SyndicationItem](syndicationitem.md) object with a title, content, and URI.
     * @param {HSTRING} title Title of the new item.
     * @param {SyndicationContent} content The content for this feed item.
     * @param {Uri} uri_ The URI associated with this item.
     * @returns {SyndicationItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.#ctor
     */
    static CreateSyndicationItem(title, content, uri_) {
        if (!SyndicationItem.HasProp("__ISyndicationItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationItemFactory.IID)
            SyndicationItem.__ISyndicationItemFactory := ISyndicationItemFactory(factoryPtr)
        }

        return SyndicationItem.__ISyndicationItemFactory.CreateSyndicationItem(title, content, uri_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the authors of an item. This property represents the collection of all the **atom:author** elements under **atom:entry**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.authors
     * @type {IVector<SyndicationPerson>} 
     */
    Authors {
        get => this.get_Authors()
    }

    /**
     * Gets a collection of categories of the feed. This property represents the collection of all the **atom:category** elements under **atom:feed**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.categories
     * @type {IVector<SyndicationCategory>} 
     */
    Categories {
        get => this.get_Categories()
    }

    /**
     * Gets a collection of the contributors of the feed. This property represents the collection of all the **atom:contributor** elements under **atom:feed**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.contributors
     * @type {IVector<SyndicationPerson>} 
     */
    Contributors {
        get => this.get_Contributors()
    }

    /**
     * Gets or sets the content of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.content
     * @type {SyndicationContent} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets or sets the identifier for the syndication feed.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets or sets the most recent time the item was modified. This property represents the **atom:updated** element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.lastupdatedtime
     * @type {DateTime} 
     */
    LastUpdatedTime {
        get => this.get_LastUpdatedTime()
        set => this.put_LastUpdatedTime(value)
    }

    /**
     * Gets the links contained in the item.
     * @remarks
     * This property represents the collection of all the **atom:link** elements under **atom:entry**. For *RSS 2.0*, this collection includes **link**, **enclosure**, and **comments** elements.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.links
     * @type {IVector<SyndicationLink>} 
     */
    Links {
        get => this.get_Links()
    }

    /**
     * Gets or sets the date the item was published.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.publisheddate
     * @type {DateTime} 
     */
    PublishedDate {
        get => this.get_PublishedDate()
        set => this.put_PublishedDate(value)
    }

    /**
     * Gets or sets information about the rights of an item. This property represents the **atom:rights** element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.rights
     * @type {ISyndicationText} 
     */
    Rights {
        get => this.get_Rights()
        set => this.put_Rights(value)
    }

    /**
     * Gets or sets the source feed of the item. This property represents the **atom:source** element or the **source** element in *RSS 2.0*.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.source
     * @type {SyndicationFeed} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets or sets a summary of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.summary
     * @type {ISyndicationText} 
     */
    Summary {
        get => this.get_Summary()
        set => this.put_Summary(value)
    }

    /**
     * Gets or sets the title of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.title
     * @type {ISyndicationText} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) of the comments for the item. This property represents the *rss/channel/item/comments** element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.commentsuri
     * @type {Uri} 
     */
    CommentsUri {
        get => this.get_CommentsUri()
        set => this.put_CommentsUri(value)
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of an editable resource.
     * @remarks
     * This property represents the **atom:link** element with the attribute **rel=”edit”**. It is the absolute Uniform Resource Identifier (URI) resolved against the **xml:base** attribute, if it is present. If the **href** attribute is a relative Uniform Resource Identifier (URI) string and there is no **xml:base** attribute, this property will be null since the relative Uniform Resource Identifier (URI) is not supported by the runtime Uniform Resource Identifier (URI) class.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.edituri
     * @type {Uri} 
     */
    EditUri {
        get => this.get_EditUri()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of an editable media resource.
     * @remarks
     * This property represents the **atom:link** element with the attribute **rel=”edit-media”**. It is the absolute Uniform Resource Identifier (URI) resolved against the **xml:base** attribute, if it is present. If the **href** attribute is a relative Uniform Resource Identifier (URI) string and there is no **xml:base** attribute, this property will be null since the relative Uniform Resource Identifier (URI) is not supported by the runtime Uniform Resource Identifier (URI) class.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.editmediauri
     * @type {Uri} 
     */
    EditMediaUri {
        get => this.get_EditMediaUri()
    }

    /**
     * Gets an ETag HTTP header.
     * @remarks
     * When an **AtomPub** endpoint returns a syndication entry, it may include an ETag HTTP header, which will be tied to the [SyndicationItem](syndicationitem.md) object and show up in this property. **AtomPubClient** will also use ETag when updating or deleting a resource for synchronization control.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.etag
     * @type {HSTRING} 
     */
    ETag {
        get => this.get_ETag()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of this item. **AtomPubClient** creates this property after new resource is created.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.itemuri
     * @type {Uri} 
     */
    ItemUri {
        get => this.get_ItemUri()
    }

    /**
     * Gets or sets the local name of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
        set => this.put_NodeName(value)
    }

    /**
     * Gets or sets the namespace of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.nodenamespace
     * @type {HSTRING} 
     */
    NodeNamespace {
        get => this.get_NodeNamespace()
        set => this.put_NodeNamespace(value)
    }

    /**
     * Gets or sets the text content of the element. If the element contains only child elements, this property is NULL.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.nodevalue
     * @type {HSTRING} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets or sets the language of the element. This property represents the **xml:lang** attribute on the element. It may be inherited from an ancestor element. It must be valid according to XML 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets the base URI for the element. This property represents the **xml:base** attribute on the element. It may be inherited from an ancestor element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.baseuri
     * @type {Uri} 
     */
    BaseUri {
        get => this.get_BaseUri()
        set => this.put_BaseUri(value)
    }

    /**
     * Gets the list of custom attributes of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.attributeextensions
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.elementextensions
     * @type {IVector<ISyndicationNode>} 
     */
    ElementExtensions {
        get => this.get_ElementExtensions()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [SyndicationItem](syndicationitem.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationItem")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<SyndicationPerson>} 
     */
    get_Authors() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_Authors()
    }

    /**
     * 
     * @returns {IVector<SyndicationCategory>} 
     */
    get_Categories() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_Categories()
    }

    /**
     * 
     * @returns {IVector<SyndicationPerson>} 
     */
    get_Contributors() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_Contributors()
    }

    /**
     * 
     * @returns {SyndicationContent} 
     */
    get_Content() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_Content()
    }

    /**
     * 
     * @param {SyndicationContent} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.put_Content(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.put_Id(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastUpdatedTime() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_LastUpdatedTime()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastUpdatedTime(value) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.put_LastUpdatedTime(value)
    }

    /**
     * 
     * @returns {IVector<SyndicationLink>} 
     */
    get_Links() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_Links()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_PublishedDate() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_PublishedDate()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_PublishedDate(value) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.put_PublishedDate(value)
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Rights() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_Rights()
    }

    /**
     * 
     * @param {ISyndicationText} value 
     * @returns {HRESULT} 
     */
    put_Rights(value) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.put_Rights(value)
    }

    /**
     * 
     * @returns {SyndicationFeed} 
     */
    get_Source() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_Source()
    }

    /**
     * 
     * @param {SyndicationFeed} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.put_Source(value)
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Summary() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_Summary()
    }

    /**
     * 
     * @param {ISyndicationText} value 
     * @returns {HRESULT} 
     */
    put_Summary(value) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.put_Summary(value)
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Title() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_Title()
    }

    /**
     * 
     * @param {ISyndicationText} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.put_Title(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_CommentsUri() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_CommentsUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_CommentsUri(value) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.put_CommentsUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_EditUri() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_EditUri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_EditMediaUri() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_EditMediaUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ETag() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_ETag()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ItemUri() {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.get_ItemUri()
    }

    /**
     * Initializes the object from the given feed string, which can be in either *RSS 2.0* or *Atom 1.0* format.
     * @param {HSTRING} item The feed string, which can be in either *RSS 2.0* or *Atom 1.0* format.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.load
     */
    Load(item) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.Load(item)
    }

    /**
     * Initializes the object from the given DOM object, which can contain XML content in either *RSS 2.0* or *Atom 1.0* format.
     * @param {XmlDocument} itemDocument The DOM object, which can contain XML content in either *RSS 2.0* or *Atom 1.0* format.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.loadfromxml
     */
    LoadFromXml(itemDocument) {
        if (!this.HasProp("__ISyndicationItem")) {
            if ((queryResult := this.QueryInterface(ISyndicationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationItem := ISyndicationItem(outPtr)
        }

        return this.__ISyndicationItem.LoadFromXml(itemDocument)
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationitem.getxmldocument
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
