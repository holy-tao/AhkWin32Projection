#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIndexedResourceCandidate.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a single possible value for a given resource, and the qualifiers associated with that resource.
  * 
  * > [!IMPORTANT]
  * > You can't use this class in a UWP app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcecandidate
 * @namespace Windows.ApplicationModel.Resources.Management
 * @version WindowsRuntime 1.4
 */
class IndexedResourceCandidate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIndexedResourceCandidate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIndexedResourceCandidate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type property that determines whether the resource is a file or a string.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcecandidate.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the named resource [Uri](../windows.foundation/uri.md).
     * @remarks
     * *Uri* is an ms-resource: URI representing the named resource for the candidate, where the authority of the URI or the resource map is empty (for example, ms-resource:///Resources/String1 or ms-resource:///Files/images/logo.png).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcecandidate.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the list of metadata name value pairs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcecandidate.metadata
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Metadata {
        get => this.get_Metadata()
    }

    /**
     * Gets the list of [IndexedResourceQualifier](indexedresourcequalifier.md) s.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcecandidate.qualifiers
     * @type {IVectorView<IndexedResourceQualifier>} 
     */
    Qualifiers {
        get => this.get_Qualifiers()
    }

    /**
     * Gets the value of the candidate as a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcecandidate.valueasstring
     * @type {HSTRING} 
     */
    ValueAsString {
        get => this.get_ValueAsString()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IIndexedResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IIndexedResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexedResourceCandidate := IIndexedResourceCandidate(outPtr)
        }

        return this.__IIndexedResourceCandidate.get_Type()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IIndexedResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IIndexedResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexedResourceCandidate := IIndexedResourceCandidate(outPtr)
        }

        return this.__IIndexedResourceCandidate.get_Uri()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Metadata() {
        if (!this.HasProp("__IIndexedResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IIndexedResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexedResourceCandidate := IIndexedResourceCandidate(outPtr)
        }

        return this.__IIndexedResourceCandidate.get_Metadata()
    }

    /**
     * 
     * @returns {IVectorView<IndexedResourceQualifier>} 
     */
    get_Qualifiers() {
        if (!this.HasProp("__IIndexedResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IIndexedResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexedResourceCandidate := IIndexedResourceCandidate(outPtr)
        }

        return this.__IIndexedResourceCandidate.get_Qualifiers()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ValueAsString() {
        if (!this.HasProp("__IIndexedResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IIndexedResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexedResourceCandidate := IIndexedResourceCandidate(outPtr)
        }

        return this.__IIndexedResourceCandidate.get_ValueAsString()
    }

    /**
     * Returns the value of a qualifier, given its name.
     * @param {HSTRING} qualifierName The name of the qualifier.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcecandidate.getqualifiervalue
     */
    GetQualifierValue(qualifierName) {
        if (!this.HasProp("__IIndexedResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IIndexedResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexedResourceCandidate := IIndexedResourceCandidate(outPtr)
        }

        return this.__IIndexedResourceCandidate.GetQualifierValue(qualifierName)
    }

;@endregion Instance Methods
}
