#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISyndicationAttribute.ahk
#Include .\ISyndicationAttributeFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a custom attribute not defined in the specification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationattribute
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationAttribute extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISyndicationAttribute

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISyndicationAttribute.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new[ SyndicationAttribute](syndicationattribute.md) object with the specified **Name**, **Namespace**, and **Value** property values.
     * @param {HSTRING} attributeName The name of the attribute.
     * @param {HSTRING} attributeNamespace The namespace of the attribute.
     * @param {HSTRING} attributeValue The value of the attribute.
     * @returns {SyndicationAttribute} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationattribute.#ctor
     */
    static CreateSyndicationAttribute(attributeName, attributeNamespace, attributeValue) {
        if (!SyndicationAttribute.HasProp("__ISyndicationAttributeFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationAttribute")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationAttributeFactory.IID)
            SyndicationAttribute.__ISyndicationAttributeFactory := ISyndicationAttributeFactory(factoryPtr)
        }

        return SyndicationAttribute.__ISyndicationAttributeFactory.CreateSyndicationAttribute(attributeName, attributeNamespace, attributeValue)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the syndication attribute.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationattribute.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets the namespace of the attribute.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationattribute.namespace
     * @type {HSTRING} 
     */
    Namespace {
        get => this.get_Namespace()
        set => this.put_Namespace(value)
    }

    /**
     * Gets or sets the value of the attribute.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationattribute.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [SyndicationAttribute](syndicationattribute.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationAttribute")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ISyndicationAttribute")) {
            if ((queryResult := this.QueryInterface(ISyndicationAttribute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationAttribute := ISyndicationAttribute(outPtr)
        }

        return this.__ISyndicationAttribute.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__ISyndicationAttribute")) {
            if ((queryResult := this.QueryInterface(ISyndicationAttribute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationAttribute := ISyndicationAttribute(outPtr)
        }

        return this.__ISyndicationAttribute.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Namespace() {
        if (!this.HasProp("__ISyndicationAttribute")) {
            if ((queryResult := this.QueryInterface(ISyndicationAttribute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationAttribute := ISyndicationAttribute(outPtr)
        }

        return this.__ISyndicationAttribute.get_Namespace()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Namespace(value) {
        if (!this.HasProp("__ISyndicationAttribute")) {
            if ((queryResult := this.QueryInterface(ISyndicationAttribute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationAttribute := ISyndicationAttribute(outPtr)
        }

        return this.__ISyndicationAttribute.put_Namespace(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__ISyndicationAttribute")) {
            if ((queryResult := this.QueryInterface(ISyndicationAttribute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationAttribute := ISyndicationAttribute(outPtr)
        }

        return this.__ISyndicationAttribute.get_Value()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__ISyndicationAttribute")) {
            if ((queryResult := this.QueryInterface(ISyndicationAttribute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationAttribute := ISyndicationAttribute(outPtr)
        }

        return this.__ISyndicationAttribute.put_Value(value)
    }

;@endregion Instance Methods
}
