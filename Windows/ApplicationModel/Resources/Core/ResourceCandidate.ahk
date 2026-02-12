#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IResourceCandidate.ahk
#Include .\IResourceCandidate2.ahk
#Include .\IResourceCandidate3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a single possible value for a given [NamedResource](namedresource.md), the qualifiers associated with that resource, and how well those qualifiers match the context against which it was resolved.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidate
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceCandidate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IResourceCandidate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IResourceCandidate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the qualifiers associated with this [ResourceCandidate](resourcecandidate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidate.qualifiers
     * @type {IVectorView<ResourceQualifier>} 
     */
    Qualifiers {
        get => this.get_Qualifiers()
    }

    /**
     * Indicates whether this [ResourceCandidate](resourcecandidate.md) matched the [ResourceContext](resourcecontext.md) against which it was evaluated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidate.ismatch
     * @type {Boolean} 
     */
    IsMatch {
        get => this.get_IsMatch()
    }

    /**
     * Indicates whether this [ResourceCandidate](resourcecandidate.md) matched the [ResourceContext](resourcecontext.md) against which it was evaluated as a result of being a true match, a default fallback value, or a mixed match with default fallback (that is, a match in relation to some qualifiers but using default fallback values for other qualifiers).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidate.ismatchasdefault
     * @type {Boolean} 
     */
    IsMatchAsDefault {
        get => this.get_IsMatchAsDefault()
    }

    /**
     * Indicates whether this [ResourceCandidate](resourcecandidate.md) can be used as a default fallback value for any context.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidate.isdefault
     * @type {Boolean} 
     */
    IsDefault {
        get => this.get_IsDefault()
    }

    /**
     * Gets the value of this [ResourceCandidate](resourcecandidate.md), expressed as a string.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidate.valueasstring
     * @type {HSTRING} 
     */
    ValueAsString {
        get => this.get_ValueAsString()
    }

    /**
     * Gets the type of resource that is encapsulated in this [ResourceCandidate](resourcecandidate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidate.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<ResourceQualifier>} 
     */
    get_Qualifiers() {
        if (!this.HasProp("__IResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCandidate := IResourceCandidate(outPtr)
        }

        return this.__IResourceCandidate.get_Qualifiers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMatch() {
        if (!this.HasProp("__IResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCandidate := IResourceCandidate(outPtr)
        }

        return this.__IResourceCandidate.get_IsMatch()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMatchAsDefault() {
        if (!this.HasProp("__IResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCandidate := IResourceCandidate(outPtr)
        }

        return this.__IResourceCandidate.get_IsMatchAsDefault()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDefault() {
        if (!this.HasProp("__IResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCandidate := IResourceCandidate(outPtr)
        }

        return this.__IResourceCandidate.get_IsDefault()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ValueAsString() {
        if (!this.HasProp("__IResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCandidate := IResourceCandidate(outPtr)
        }

        return this.__IResourceCandidate.get_ValueAsString()
    }

    /**
     * Asynchronously returns a [StorageFile](../windows.storage/storagefile.md) that accesses the value of this [ResourceCandidate](resourcecandidate.md). This only works on certain types of [ResourceCandidate](resourcecandidate.md)s that are files.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidate.getvalueasfileasync
     */
    GetValueAsFileAsync() {
        if (!this.HasProp("__IResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCandidate := IResourceCandidate(outPtr)
        }

        return this.__IResourceCandidate.GetValueAsFileAsync()
    }

    /**
     * Returns the value of a qualifier, given its name.
     * @param {HSTRING} qualifierName The name of the qualifier.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidate.getqualifiervalue
     */
    GetQualifierValue(qualifierName) {
        if (!this.HasProp("__IResourceCandidate")) {
            if ((queryResult := this.QueryInterface(IResourceCandidate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCandidate := IResourceCandidate(outPtr)
        }

        return this.__IResourceCandidate.GetQualifierValue(qualifierName)
    }

    /**
     * Asynchronously returns an [IRandomAccessStream](/previous-versions/hh438400(v=vs.85)) that accesses the value of this [ResourceCandidate](resourcecandidate.md).
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidate.getvalueasstreamasync
     */
    GetValueAsStreamAsync() {
        if (!this.HasProp("__IResourceCandidate2")) {
            if ((queryResult := this.QueryInterface(IResourceCandidate2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCandidate2 := IResourceCandidate2(outPtr)
        }

        return this.__IResourceCandidate2.GetValueAsStreamAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IResourceCandidate3")) {
            if ((queryResult := this.QueryInterface(IResourceCandidate3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceCandidate3 := IResourceCandidate3(outPtr)
        }

        return this.__IResourceCandidate3.get_Kind()
    }

;@endregion Instance Methods
}
