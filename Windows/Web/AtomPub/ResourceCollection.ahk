#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IResourceCollection.ahk
#Include ..\Syndication\ISyndicationNode.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates one or more collections within a workspace.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection
 * @namespace Windows.Web.AtomPub
 * @version WindowsRuntime 1.4
 */
class ResourceCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IResourceCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IResourceCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the **atom:title** element under the **app:collection** element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.title
     * @type {ISyndicationText} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) representing the **href** attribute of the **app:collection** element. This is the absolute Uniform Resource Identifier (URI) resolved against the **xml:base** attribute when it is present. If the **href** attribute is a relative Uniform Resource Identifier (URI) string and there is no **xml:base** attribute, this property will be Null.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the collection of **atom:category** elements within the **app:categories** element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.categories
     * @type {IVectorView<SyndicationCategory>} 
     */
    Categories {
        get => this.get_Categories()
    }

    /**
     * Gets or sets the collection of **app:accept** elements.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.accepts
     * @type {IVectorView<HSTRING>} 
     */
    Accepts {
        get => this.get_Accepts()
    }

    /**
     * Gets or sets the local name of the element. It must be valid according to XML 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.nodename
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
        set => this.put_NodeName(value)
    }

    /**
     * Gets or sets the namespace of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.nodenamespace
     * @type {HSTRING} 
     */
    NodeNamespace {
        get => this.get_NodeNamespace()
        set => this.put_NodeNamespace(value)
    }

    /**
     * Gets or sets the text content of the element. If the element contains only child elements, this attribute is NULL.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.nodevalue
     * @type {HSTRING} 
     */
    NodeValue {
        get => this.get_NodeValue()
        set => this.put_NodeValue(value)
    }

    /**
     * Gets or sets the language of the element. This property represents the **xml:lang** attribute on the element. It may be inherited from an ancestor element. It must be valid according to XML 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) for the element. This property represents the **xml:base** attribute on the element. It may be inherited from an ancestor element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.baseuri
     * @type {Uri} 
     */
    BaseUri {
        get => this.get_BaseUri()
        set => this.put_BaseUri(value)
    }

    /**
     * Gets the list of attributes of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.attributeextensions
     * @type {IVector<SyndicationAttribute>} 
     */
    AttributeExtensions {
        get => this.get_AttributeExtensions()
    }

    /**
     * Gets the list of child elements within the element.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.elementextensions
     * @type {IVector<ISyndicationNode>} 
     */
    ElementExtensions {
        get => this.get_ElementExtensions()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Title() {
        if (!this.HasProp("__IResourceCollection")) {
            if ((queryResult := this.QueryInterface(IResourceCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCollection := IResourceCollection(outPtr)
        }

        return this.__IResourceCollection.get_Title()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IResourceCollection")) {
            if ((queryResult := this.QueryInterface(IResourceCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCollection := IResourceCollection(outPtr)
        }

        return this.__IResourceCollection.get_Uri()
    }

    /**
     * 
     * @returns {IVectorView<SyndicationCategory>} 
     */
    get_Categories() {
        if (!this.HasProp("__IResourceCollection")) {
            if ((queryResult := this.QueryInterface(IResourceCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCollection := IResourceCollection(outPtr)
        }

        return this.__IResourceCollection.get_Categories()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Accepts() {
        if (!this.HasProp("__IResourceCollection")) {
            if ((queryResult := this.QueryInterface(IResourceCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCollection := IResourceCollection(outPtr)
        }

        return this.__IResourceCollection.get_Accepts()
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
     * Generates the DOM object that represents this element, and all the attributes and child elements including foreign markups.
     * @param {Integer} format The format of the element. The only formats accepted by this method are Atom 1.0 and RSS 2.0.
     * @returns {XmlDocument} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.resourcecollection.getxmldocument
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
