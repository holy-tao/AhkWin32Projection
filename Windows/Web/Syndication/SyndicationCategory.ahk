#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISyndicationCategory.ahk
#Include .\ISyndicationNode.ahk
#Include .\ISyndicationCategoryFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the category of a feed or an item. This class encapsulates information in the *rss/channel/item/category** element in *RSS 2.0* or the **atom:category** element in *Atom 1.0*.
 * @remarks
 * The following table maps SyndicationCategory properties to RSS and Atom feed elements.
 * 
 * | SyndicationCategory | RSS | Atom |
 * |---|---|---|
 * | [Label](syndicationcategory_label.md) | label (attribute) |
 * | [Scheme](syndicationcategory_scheme.md) | domain (attribute) | scheme (attribute) |
 * | [Term](syndicationcategory_term.md) | (node value) | uri (attribute) |
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationCategory extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISyndicationCategory

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISyndicationCategory.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [SyndicationCategory](syndicationcategory.md) object with the specified **term** property.
     * @param {HSTRING} term A string that identifies the category. This parameter represents the required **term** attribute on **atom:category** or the text content of the **category** element in *RSS 2.0*.
     * @returns {SyndicationCategory} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.#ctor
     */
    static CreateSyndicationCategory(term) {
        if (!SyndicationCategory.HasProp("__ISyndicationCategoryFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationCategory")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationCategoryFactory.IID)
            SyndicationCategory.__ISyndicationCategoryFactory := ISyndicationCategoryFactory(factoryPtr)
        }

        return SyndicationCategory.__ISyndicationCategoryFactory.CreateSyndicationCategory(term)
    }

    /**
     * Creates [SyndicationCategory](syndicationcategory.md) object with the specified property values.
     * @param {HSTRING} term A string that identifies the category.
     * @param {HSTRING} scheme The scheme of the category.
     * @param {HSTRING} label A label for display in end-user applications.
     * @returns {SyndicationCategory} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.#ctor
     */
    static CreateSyndicationCategoryEx(term, scheme, label) {
        if (!SyndicationCategory.HasProp("__ISyndicationCategoryFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationCategory")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationCategoryFactory.IID)
            SyndicationCategory.__ISyndicationCategoryFactory := ISyndicationCategoryFactory(factoryPtr)
        }

        return SyndicationCategory.__ISyndicationCategoryFactory.CreateSyndicationCategoryEx(term, scheme, label)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the label for the category. This property represents the **label** attribute on **atom:category**. It provides a label for display in end-user applications.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets or sets the scheme of the category. This property represents the **scheme** attribute on **atom:category** or the **domain** attribute on the **category** element in *RSS 2.0*.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.scheme
     * @type {HSTRING} 
     */
    Scheme {
        get => this.get_Scheme()
        set => this.put_Scheme(value)
    }

    /**
     * Gets or sets a string that identifies the category. This property represents the required **term** attribute on **atom:category** or the text content of the **category** element in *RSS 2.0*.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.term
     * @type {HSTRING} 
     */
    Term {
        get => this.get_Term()
        set => this.put_Term(value)
    }

    /**
     * Gets or sets the local name of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
        set => this.put_NodeName(value)
    }

    /**
     * Gets or sets the namespace of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.nodenamespace
     * @type {HSTRING} 
     */
    NodeNamespace {
        get => this.get_NodeNamespace()
        set => this.put_NodeNamespace(value)
    }

    /**
     * Gets or sets the text content of the element. If the element contains only child elements, this property is NULL.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.nodevalue
     * @type {HSTRING} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets or sets the language of the element. This property represents the **xml:lang** attribute on the element. It may be inherited from an ancestor element. It must be valid according to XML 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets the base URI for the element. This property represents the **xml:base** attribute on the element. It may be inherited from an ancestor element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.baseuri
     * @type {Uri} 
     */
    BaseUri {
        get => this.get_BaseUri()
        set => this.put_BaseUri(value)
    }

    /**
     * Gets the list of custom attributes of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.attributeextensions
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.elementextensions
     * @type {IVector<ISyndicationNode>} 
     */
    ElementExtensions {
        get => this.get_ElementExtensions()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [SyndicationCategory](syndicationcategory.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationCategory")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        if (!this.HasProp("__ISyndicationCategory")) {
            if ((queryResult := this.QueryInterface(ISyndicationCategory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationCategory := ISyndicationCategory(outPtr)
        }

        return this.__ISyndicationCategory.get_Label()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__ISyndicationCategory")) {
            if ((queryResult := this.QueryInterface(ISyndicationCategory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationCategory := ISyndicationCategory(outPtr)
        }

        return this.__ISyndicationCategory.put_Label(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Scheme() {
        if (!this.HasProp("__ISyndicationCategory")) {
            if ((queryResult := this.QueryInterface(ISyndicationCategory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationCategory := ISyndicationCategory(outPtr)
        }

        return this.__ISyndicationCategory.get_Scheme()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Scheme(value) {
        if (!this.HasProp("__ISyndicationCategory")) {
            if ((queryResult := this.QueryInterface(ISyndicationCategory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationCategory := ISyndicationCategory(outPtr)
        }

        return this.__ISyndicationCategory.put_Scheme(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Term() {
        if (!this.HasProp("__ISyndicationCategory")) {
            if ((queryResult := this.QueryInterface(ISyndicationCategory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationCategory := ISyndicationCategory(outPtr)
        }

        return this.__ISyndicationCategory.get_Term()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Term(value) {
        if (!this.HasProp("__ISyndicationCategory")) {
            if ((queryResult := this.QueryInterface(ISyndicationCategory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationCategory := ISyndicationCategory(outPtr)
        }

        return this.__ISyndicationCategory.put_Term(value)
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationcategory.getxmldocument
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
