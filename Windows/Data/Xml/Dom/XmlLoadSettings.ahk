#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXmlLoadSettings.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains settings that are used during loading and parsing of XML documents. The default settings are chosen for the highest security. This class can be instantiated and is accepted by [LoadXml](/uwp/api/windows.data.xml.dom.xmldocument.loadxml), [LoadFromUriAsync](/uwp/api/windows.data.xml.dom.xmldocument.loadfromuriasync), and [LoadFromFileAsync](/uwp/api/windows.data.xml.dom.xmldocument.loadfromfileasync).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlloadsettings
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class XmlLoadSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXmlLoadSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXmlLoadSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the limits of the element depth of an XML document to be loaded into a DOM object.
     * @remarks
     * A zero (0) value means no limits on the element depth of an XML document. A non-zero value specifies the maximum depth.
     * 
     * An entity counts as one level of nesting. For example, if you have an entity that references an XML document that includes two nested XML elements, set the value to 3.
     * 
     * When the DOM object is cloned, the value of this property is propagated to the cloned object. When the size of an XML document exceeds the limit set by this property, a load error will result when the document is parsed.
     * 
     * This property helps to avoid denial of service attacks in which a document is submitted that has excessive element depth. Failure to limit the element depth leaves you open to the exploit where a relatively small XML document can cause denial of service. The **MaxElementDepth** property mitigates this threat. If you are concerned about denial of service, you should set this property to a value that allows you to load your documents yet limits depth to a reasonable level.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlloadsettings.maxelementdepth
     * @type {Integer} 
     */
    MaxElementDepth {
        get => this.get_MaxElementDepth()
        set => this.put_MaxElementDepth(value)
    }

    /**
     * Gets or sets a value that specifies whether to prohibit or allow the inclusion of a DTD in the XML DOM document.
     * @remarks
     * This property allows you to prohibit DTD use and can help prevent a denial of service attack in some situations. For example, an application might become unresponsive if a large number of entity references are included with the DTD and require resolution when the document XML is parsed and loaded.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlloadsettings.prohibitdtd
     * @type {Boolean} 
     */
    ProhibitDtd {
        get => this.get_ProhibitDtd()
        set => this.put_ProhibitDtd(value)
    }

    /**
     * Gets or sets a value that specifies whether external definitions, resolvable namespaces, external subsets of document type definitions (DTDs), and external entity references are to be resolved at the time the document is parsed.
     * @remarks
     * When this property is true, external definitions are resolved at parse time. This allows default attributes and data types to be defined on elements from the schema and allows use of the DTD as a file inclusion mechanism.
     * 
     * This setting is independent of whether validation is to be performed, as indicated by the value of the [ValidateOnParse](xmlloadsettings_validateonparse.md) property. If externals cannot be resolved during validation, a validation error occurs. When the value of **ResolveExternals** is false, externals are not resolved and validation is not performed.
     * 
     * A resolvable namespace is indicated by a namespace Universal Resource Identifier (URI) that begins with "x-schema:" as its prefix.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlloadsettings.resolveexternals
     * @type {Boolean} 
     */
    ResolveExternals {
        get => this.get_ResolveExternals()
        set => this.put_ResolveExternals(value)
    }

    /**
     * Gets or sets a value that specifies whether the XML parser should validate this document against the document type definition (DTD) on loading.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlloadsettings.validateonparse
     * @type {Boolean} 
     */
    ValidateOnParse {
        get => this.get_ValidateOnParse()
        set => this.put_ValidateOnParse(value)
    }

    /**
     * Specifies whether default handling preserves white space.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlloadsettings.elementcontentwhitespace
     * @type {Boolean} 
     */
    ElementContentWhiteSpace {
        get => this.get_ElementContentWhiteSpace()
        set => this.put_ElementContentWhiteSpace(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [XmlLoadSettings](xmlloadsettings.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Data.Xml.Dom.XmlLoadSettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxElementDepth() {
        if (!this.HasProp("__IXmlLoadSettings")) {
            if ((queryResult := this.QueryInterface(IXmlLoadSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlLoadSettings := IXmlLoadSettings(outPtr)
        }

        return this.__IXmlLoadSettings.get_MaxElementDepth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxElementDepth(value) {
        if (!this.HasProp("__IXmlLoadSettings")) {
            if ((queryResult := this.QueryInterface(IXmlLoadSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlLoadSettings := IXmlLoadSettings(outPtr)
        }

        return this.__IXmlLoadSettings.put_MaxElementDepth(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ProhibitDtd() {
        if (!this.HasProp("__IXmlLoadSettings")) {
            if ((queryResult := this.QueryInterface(IXmlLoadSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlLoadSettings := IXmlLoadSettings(outPtr)
        }

        return this.__IXmlLoadSettings.get_ProhibitDtd()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ProhibitDtd(value) {
        if (!this.HasProp("__IXmlLoadSettings")) {
            if ((queryResult := this.QueryInterface(IXmlLoadSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlLoadSettings := IXmlLoadSettings(outPtr)
        }

        return this.__IXmlLoadSettings.put_ProhibitDtd(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ResolveExternals() {
        if (!this.HasProp("__IXmlLoadSettings")) {
            if ((queryResult := this.QueryInterface(IXmlLoadSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlLoadSettings := IXmlLoadSettings(outPtr)
        }

        return this.__IXmlLoadSettings.get_ResolveExternals()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ResolveExternals(value) {
        if (!this.HasProp("__IXmlLoadSettings")) {
            if ((queryResult := this.QueryInterface(IXmlLoadSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlLoadSettings := IXmlLoadSettings(outPtr)
        }

        return this.__IXmlLoadSettings.put_ResolveExternals(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ValidateOnParse() {
        if (!this.HasProp("__IXmlLoadSettings")) {
            if ((queryResult := this.QueryInterface(IXmlLoadSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlLoadSettings := IXmlLoadSettings(outPtr)
        }

        return this.__IXmlLoadSettings.get_ValidateOnParse()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ValidateOnParse(value) {
        if (!this.HasProp("__IXmlLoadSettings")) {
            if ((queryResult := this.QueryInterface(IXmlLoadSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlLoadSettings := IXmlLoadSettings(outPtr)
        }

        return this.__IXmlLoadSettings.put_ValidateOnParse(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ElementContentWhiteSpace() {
        if (!this.HasProp("__IXmlLoadSettings")) {
            if ((queryResult := this.QueryInterface(IXmlLoadSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlLoadSettings := IXmlLoadSettings(outPtr)
        }

        return this.__IXmlLoadSettings.get_ElementContentWhiteSpace()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ElementContentWhiteSpace(value) {
        if (!this.HasProp("__IXmlLoadSettings")) {
            if ((queryResult := this.QueryInterface(IXmlLoadSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlLoadSettings := IXmlLoadSettings(outPtr)
        }

        return this.__IXmlLoadSettings.put_ElementContentWhiteSpace(value)
    }

;@endregion Instance Methods
}
