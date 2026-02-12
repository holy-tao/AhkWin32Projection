#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISyndicationPerson.ahk
#Include .\ISyndicationNode.ahk
#Include .\ISyndicationPersonFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an author or contributor of syndication content.
 * @remarks
 * The following table maps SyndicationPerson properties to RSS and Atom feed elements.
 * 
 * | SyndicationPerson | RSS | Atom |
 * |---|---|---|
 * | [Email](syndicationperson_email.md) | (node value) | email |
 * | [Name](syndicationperson_name.md) |---| name |
 * | [Uri](syndicationperson_uri.md) |---| uri |
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationPerson extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISyndicationPerson

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISyndicationPerson.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [SyndicationPerson](syndicationperson.md) object with the specified **Name** property value.
     * @param {HSTRING} name The name of the [SyndicationPerson](syndicationperson.md). This parameter represents the **atom:name** element.
     * @returns {SyndicationPerson} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.#ctor
     */
    static CreateSyndicationPerson(name) {
        if (!SyndicationPerson.HasProp("__ISyndicationPersonFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationPerson")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationPersonFactory.IID)
            SyndicationPerson.__ISyndicationPersonFactory := ISyndicationPersonFactory(factoryPtr)
        }

        return SyndicationPerson.__ISyndicationPersonFactory.CreateSyndicationPerson(name)
    }

    /**
     * Creates a [SyndicationPerson](syndicationperson.md) object with the specified **Name**, **Email**, and **Uri** property values.
     * @param {HSTRING} name The name of the [SyndicationPerson](syndicationperson.md). This parameter represents the **atom:name** element.
     * @param {HSTRING} email_ Gets or sets the email address of the person. This property represents the **atom:email** element.
     * @param {Uri} uri_ Gets or sets the Uniform Resource Identifier (URI) of the person. This property represents the **atom:uri** element. It is the absolute URI resolved against the **xml:base** attribute, if it is present. If the **href** attribute is a relative URI string and there is no **xml:base** attribute, this property is NULL because relative URI is not supported by the runtime URI class.
     * @returns {SyndicationPerson} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.#ctor
     */
    static CreateSyndicationPersonEx(name, email_, uri_) {
        if (!SyndicationPerson.HasProp("__ISyndicationPersonFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationPerson")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationPersonFactory.IID)
            SyndicationPerson.__ISyndicationPersonFactory := ISyndicationPersonFactory(factoryPtr)
        }

        return SyndicationPerson.__ISyndicationPersonFactory.CreateSyndicationPersonEx(name, email_, uri_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the email address of the person.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.email
     * @type {HSTRING} 
     */
    Email {
        get => this.get_Email()
        set => this.put_Email(value)
    }

    /**
     * Gets the name of the syndication person.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) of the person. This property represents the **atom:uri** element. It is the absolute Uniform Resource Identifier (URI) resolved against the **xml:base** attribute, if it is present. If the **href** attribute is a relative Uniform Resource Identifier (URI) string and there is no **xml:base** attribute, this property is NULL because the relative Uniform Resource Identifier (URI) is not supported by the runtime Uniform Resource Identifier (URI) class.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets or sets the local name of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
        set => this.put_NodeName(value)
    }

    /**
     * Gets or sets the namespace of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.nodenamespace
     * @type {HSTRING} 
     */
    NodeNamespace {
        get => this.get_NodeNamespace()
        set => this.put_NodeNamespace(value)
    }

    /**
     * Gets or sets the text content of the element. If the element contains only child elements, this property is NULL.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.nodevalue
     * @type {HSTRING} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets or sets the language of the element. This property represents the **xml:lang** attribute on the element. It may be inherited from an ancestor element. It must be valid according to XML 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets the base URI for the element. This property represents the **xml:base** attribute on the element. It may be inherited from an ancestor element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.baseuri
     * @type {Uri} 
     */
    BaseUri {
        get => this.get_BaseUri()
        set => this.put_BaseUri(value)
    }

    /**
     * Gets the list of custom attributes of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.attributeextensions
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.elementextensions
     * @type {IVector<ISyndicationNode>} 
     */
    ElementExtensions {
        get => this.get_ElementExtensions()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [SyndicationPerson](syndicationperson.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationPerson")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Email() {
        if (!this.HasProp("__ISyndicationPerson")) {
            if ((queryResult := this.QueryInterface(ISyndicationPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationPerson := ISyndicationPerson(outPtr)
        }

        return this.__ISyndicationPerson.get_Email()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Email(value) {
        if (!this.HasProp("__ISyndicationPerson")) {
            if ((queryResult := this.QueryInterface(ISyndicationPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationPerson := ISyndicationPerson(outPtr)
        }

        return this.__ISyndicationPerson.put_Email(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ISyndicationPerson")) {
            if ((queryResult := this.QueryInterface(ISyndicationPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationPerson := ISyndicationPerson(outPtr)
        }

        return this.__ISyndicationPerson.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__ISyndicationPerson")) {
            if ((queryResult := this.QueryInterface(ISyndicationPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationPerson := ISyndicationPerson(outPtr)
        }

        return this.__ISyndicationPerson.put_Name(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__ISyndicationPerson")) {
            if ((queryResult := this.QueryInterface(ISyndicationPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationPerson := ISyndicationPerson(outPtr)
        }

        return this.__ISyndicationPerson.get_Uri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        if (!this.HasProp("__ISyndicationPerson")) {
            if ((queryResult := this.QueryInterface(ISyndicationPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationPerson := ISyndicationPerson(outPtr)
        }

        return this.__ISyndicationPerson.put_Uri(value)
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationperson.getxmldocument
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
