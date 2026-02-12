#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IResourceQualifier.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines the qualifiers associated with a [ResourceCandidate](resourcecandidate.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifier
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceQualifier extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IResourceQualifier

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IResourceQualifier.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The name of the qualifier.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifier.qualifiername
     * @type {HSTRING} 
     */
    QualifierName {
        get => this.get_QualifierName()
    }

    /**
     * The value of the qualifier.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifier.qualifiervalue
     * @type {HSTRING} 
     */
    QualifierValue {
        get => this.get_QualifierValue()
    }

    /**
     * Indicates whether this qualifier should be considered as a default match when no match is found.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifier.isdefault
     * @type {Boolean} 
     */
    IsDefault {
        get => this.get_IsDefault()
    }

    /**
     * Indicates whether a given qualifier for a given candidate matched the context when a named resource is resolved to a candidate for some given context.
     * @remarks
     * If a [ResourceQualifier](resourcequalifier.md) is obtained in a scenario that does not involve resolving a named resource for some context, the value is `false`. (For example, when all candidates are enumerated for a named resource and their qualifiers are inspected.)
     * 
     * After resolving a named resource for some context, IsMatch is `true` if the qualifier matches the context on a non-default basis (that is, the qualifier value is not designated as the default value for that qualifier). The score is non-zero, and [IsDefault](resourcequalifier_isdefault.md) is `false`.
     * 
     * After resolving a named resource for some context, IsMatch is `false` if the qualifier does not match the context on a non-default basis. (The qualifier value may or may not be the default value for that qualifier. The score may or may not be zero, according to whether the qualifier is the default value.)
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifier.ismatch
     * @type {Boolean} 
     */
    IsMatch {
        get => this.get_IsMatch()
    }

    /**
     * A score that indicates how well the qualifier matched the context against which it was resolved.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifier.score
     * @type {Float} 
     */
    Score {
        get => this.get_Score()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QualifierName() {
        if (!this.HasProp("__IResourceQualifier")) {
            if ((queryResult := this.QueryInterface(IResourceQualifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceQualifier := IResourceQualifier(outPtr)
        }

        return this.__IResourceQualifier.get_QualifierName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QualifierValue() {
        if (!this.HasProp("__IResourceQualifier")) {
            if ((queryResult := this.QueryInterface(IResourceQualifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceQualifier := IResourceQualifier(outPtr)
        }

        return this.__IResourceQualifier.get_QualifierValue()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDefault() {
        if (!this.HasProp("__IResourceQualifier")) {
            if ((queryResult := this.QueryInterface(IResourceQualifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceQualifier := IResourceQualifier(outPtr)
        }

        return this.__IResourceQualifier.get_IsDefault()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMatch() {
        if (!this.HasProp("__IResourceQualifier")) {
            if ((queryResult := this.QueryInterface(IResourceQualifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceQualifier := IResourceQualifier(outPtr)
        }

        return this.__IResourceQualifier.get_IsMatch()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Score() {
        if (!this.HasProp("__IResourceQualifier")) {
            if ((queryResult := this.QueryInterface(IResourceQualifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceQualifier := IResourceQualifier(outPtr)
        }

        return this.__IResourceQualifier.get_Score()
    }

;@endregion Instance Methods
}
