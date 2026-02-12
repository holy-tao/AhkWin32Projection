#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IResourceContext.ahk
#Include .\IResourceContextStatics2.ahk
#Include .\IResourceContextStatics4.ahk
#Include .\IResourceContextStatics3.ahk
#Include .\IResourceContextStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates all of the factors ([ResourceQualifier](resourcequalifier.md)s) that might affect resource selection.
 * @remarks
 * Resources can be sensitive to scale, and different views owned by an app are able to display simultaneously on different display devices, which might use different scales. For that reason, a ResourceContext is generally associated with a specific view, and should be obtained using [GetForCurrentView](resourcecontext_getforcurrentview_1363600702.md). (A view-independent **ResourceContext** can be obtained using [GetForViewIndependentUse](resourcecontext_getforviewindependentuse_386169056.md), but note that scale-dependent functionality will fail if invoked on a **ResourceContext** that is not associated with a view.)
 * 
 * Do not create an instance of ResourceContext using the constructor, as it is deprecated and subject to removal in a future release.
 * 
 * Except where otherwise noted, methods of this class can be called on any thread.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IResourceContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IResourceContext.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a default [ResourceContext](resourcecontext.md) associated with the current view for the currently running application.
     * @remarks
     * This method fails if it is called in a windowless thread.
     * @returns {ResourceContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.getforcurrentview
     */
    static GetForCurrentView() {
        if (!ResourceContext.HasProp("__IResourceContextStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceContextStatics2.IID)
            ResourceContext.__IResourceContextStatics2 := IResourceContextStatics2(factoryPtr)
        }

        return ResourceContext.__IResourceContextStatics2.GetForCurrentView()
    }

    /**
     * Applies a single qualifier value override to default contexts of all views for the current app.
     * @remarks
     * This method fails with an exception if *key* or *value* are invalid.
     * @param {HSTRING} key The name of the qualifier to override.
     * @param {HSTRING} value The override value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.setglobalqualifiervalue
     */
    static SetGlobalQualifierValue(key, value) {
        if (!ResourceContext.HasProp("__IResourceContextStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceContextStatics2.IID)
            ResourceContext.__IResourceContextStatics2 := IResourceContextStatics2(factoryPtr)
        }

        return ResourceContext.__IResourceContextStatics2.SetGlobalQualifierValue(key, value)
    }

    /**
     * Removes any qualifier overrides from default contexts of all views across the app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.resetglobalqualifiervalues
     */
    static ResetGlobalQualifierValues() {
        if (!ResourceContext.HasProp("__IResourceContextStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceContextStatics2.IID)
            ResourceContext.__IResourceContextStatics2 := IResourceContextStatics2(factoryPtr)
        }

        return ResourceContext.__IResourceContextStatics2.ResetGlobalQualifierValues()
    }

    /**
     * Removes qualifier overrides for the specified qualifiers from default contexts of all views across the app.
     * @remarks
     * This method fails with an exception if any of the qualifier names specified are invalid.
     * @param {IIterable<HSTRING>} qualifierNames The names of the qualifiers to be reset.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.resetglobalqualifiervalues
     */
    static ResetGlobalQualifierValuesForSpecifiedQualifiers(qualifierNames) {
        if (!ResourceContext.HasProp("__IResourceContextStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceContextStatics2.IID)
            ResourceContext.__IResourceContextStatics2 := IResourceContextStatics2(factoryPtr)
        }

        return ResourceContext.__IResourceContextStatics2.ResetGlobalQualifierValuesForSpecifiedQualifiers(qualifierNames)
    }

    /**
     * Gets a default [ResourceContext](resourcecontext.md) not associated with any view.
     * @remarks
     * By default, no scale qualifier value is set in the [ResourceContext](resourcecontext.md) returned by this method. Unless and until a scale qualifier value is set programmatically, the returned [ResourceContext](resourcecontext.md) does not support any operations that involve the scale qualifier, including reading the scale qualifier value or resolving resource candidates that are qualified for scale.
     * 
     * This method fails if it is called in a windowless thread.
     * @returns {ResourceContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.getforviewindependentuse
     */
    static GetForViewIndependentUse() {
        if (!ResourceContext.HasProp("__IResourceContextStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceContextStatics2.IID)
            ResourceContext.__IResourceContextStatics2 := IResourceContextStatics2(factoryPtr)
        }

        return ResourceContext.__IResourceContextStatics2.GetForViewIndependentUse()
    }

    /**
     * Gets a default [ResourceContext](resourcecontext.md) associated with the specified [UIContext](../windows.ui/uicontext.md) for the currently running application.
     * @remarks
     * This method fails if it is called in a windowless thread.
     * @param {UIContext} context_ The UI context for which to get the [ResourceContext](resourcecontext.md).
     * @returns {ResourceContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.getforuicontext
     */
    static GetForUIContext(context_) {
        if (!ResourceContext.HasProp("__IResourceContextStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceContextStatics4.IID)
            ResourceContext.__IResourceContextStatics4 := IResourceContextStatics4(factoryPtr)
        }

        return ResourceContext.__IResourceContextStatics4.GetForUIContext(context_)
    }

    /**
     * Applies a single qualifier value override to default contexts of all views for the current app, and specifies the persistence of the override.
     * @remarks
     * This method fails with an exception if *key* or *value* are invalid.
     * @param {HSTRING} key The name of the qualifier to override.
     * @param {HSTRING} value The override value to set.
     * @param {Integer} persistence The persistence of the override value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.setglobalqualifiervalue
     */
    static SetGlobalQualifierValueWithPersistence(key, value, persistence) {
        if (!ResourceContext.HasProp("__IResourceContextStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceContextStatics3.IID)
            ResourceContext.__IResourceContextStatics3 := IResourceContextStatics3(factoryPtr)
        }

        return ResourceContext.__IResourceContextStatics3.SetGlobalQualifierValueWithPersistence(key, value, persistence)
    }

    /**
     * Creates a new [ResourceContext](resourcecontext.md) that matches a supplied set of qualifiers.
     * 
     * > [!NOTE]
     * > CreateMatchingContext may be altered or unavailable for releases after Windows 8.1. Instead, use [ResourceContext.GetForCurrentView.OverrideToMatch](resourcecontext_overridetomatch_438819547.md).
     * @param {IIterable<ResourceQualifier>} result_ The list of qualifiers to be matched.
     * @returns {ResourceContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.creatematchingcontext
     */
    static CreateMatchingContext(result_) {
        if (!ResourceContext.HasProp("__IResourceContextStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceContextStatics.IID)
            ResourceContext.__IResourceContextStatics := IResourceContextStatics(factoryPtr)
        }

        return ResourceContext.__IResourceContextStatics.CreateMatchingContext(result_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a writable, observable map of all supported qualifiers, indexed by name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.qualifiervalues
     * @type {IObservableMap<HSTRING, HSTRING>} 
     */
    QualifierValues {
        get => this.get_QualifierValues()
    }

    /**
     * Gets or sets the language qualifier for this context.
     * @remarks
     * The language qualifier is a list of valid [BCP-47](https://tools.ietf.org/html/bcp47) tags. The default value for the language qualifier is drawn from the app-specific language setting and the user language profile.
     * 
     * The language qualifier value is represented as a string containing a semicolon-delimited list. The Languages property wraps it in a container for convenience.
     * 
     * > [!NOTE]
     * > This property yields the same values as the language list exposed by [Windows.Globalization.ApplicationLanguages.Languages](../windows.globalization/applicationlanguages_languages.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.languages
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
        set => this.put_Languages(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a cloned [ResourceContext](resourcecontext.md) object.
     * 
     * > [!NOTE]
     * > ResourceContext constructor may be altered or unavailable for releases after Windows 8.1. Instead, use [GetForCurrentView](resourcecontext_getforcurrentview_1363600702.md) and [Clone](resourcecontext_clone_766852569.md).
     * @remarks
     * In general, resources can be sensitive to scale. For that reason, a [ResourceContext](resourcecontext.md) is generally associated with a specific view, and should be obtained using [GetForCurrentView](resourcecontext_getforcurrentview_1363600702.md). (A view-independent [ResourceContext](resourcecontext.md) can also be obtained using [GetForViewIndependentUse](resourcecontext_getforviewindependentuse_386169056.md).) If a [ResourceContext](resourcecontext.md) is obtained using this constructor, it will be have scale associated with an arbitrary view. Do not make any assumptions in your app regarding this behavior.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceContext")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IObservableMap<HSTRING, HSTRING>} 
     */
    get_QualifierValues() {
        if (!this.HasProp("__IResourceContext")) {
            if ((queryResult := this.QueryInterface(IResourceContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceContext := IResourceContext(outPtr)
        }

        return this.__IResourceContext.get_QualifierValues()
    }

    /**
     * Resets the overridden values for all qualifiers on the given [ResourceContext](resourcecontext.md) instance.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.reset
     */
    Reset() {
        if (!this.HasProp("__IResourceContext")) {
            if ((queryResult := this.QueryInterface(IResourceContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceContext := IResourceContext(outPtr)
        }

        return this.__IResourceContext.Reset()
    }

    /**
     * Resets the overridden values for the specified qualifiers on the given [ResourceContext](resourcecontext.md) instance.
     * @param {IIterable<HSTRING>} qualifierNames The names of the qualifiers to be reset.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.reset
     */
    ResetQualifierValues(qualifierNames) {
        if (!this.HasProp("__IResourceContext")) {
            if ((queryResult := this.QueryInterface(IResourceContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceContext := IResourceContext(outPtr)
        }

        return this.__IResourceContext.ResetQualifierValues(qualifierNames)
    }

    /**
     * Overrides the qualifier values supplied by this context to match a specified list of resolved [ResourceQualifier](resourcequalifier.md)s. Typically the resolved [ResourceQualifier](resourcequalifier.md)s are associated with a resource that was looked up earlier.
     * @param {IIterable<ResourceQualifier>} result_ The [ResourceQualifier](resourcequalifier.md)s to be applied to the context.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.overridetomatch
     */
    OverrideToMatch(result_) {
        if (!this.HasProp("__IResourceContext")) {
            if ((queryResult := this.QueryInterface(IResourceContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceContext := IResourceContext(outPtr)
        }

        return this.__IResourceContext.OverrideToMatch(result_)
    }

    /**
     * Creates a clone of this [ResourceContext](resourcecontext.md), with identical qualifiers.
     * @remarks
     * By default, a cloned context has the same qualifier values as the default context from which it was derived. If a qualifier value in the default context changes, the changes are reflected in the cloned context as well. However, if a qualifier value is programmatically overridden on the cloned context, the linkage to the default context for that qualifier is removed— changes to that qualifier value in the cloned context do not affect the default context, and vice versa. This linkage can be restored using the [Reset](/uwp/api/windows.applicationmodel.resources.core.resourcecontext.reset) method.
     * @returns {ResourceContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontext.clone
     */
    Clone() {
        if (!this.HasProp("__IResourceContext")) {
            if ((queryResult := this.QueryInterface(IResourceContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceContext := IResourceContext(outPtr)
        }

        return this.__IResourceContext.Clone()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Languages() {
        if (!this.HasProp("__IResourceContext")) {
            if ((queryResult := this.QueryInterface(IResourceContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceContext := IResourceContext(outPtr)
        }

        return this.__IResourceContext.get_Languages()
    }

    /**
     * 
     * @param {IVectorView<HSTRING>} languages 
     * @returns {HRESULT} 
     */
    put_Languages(languages) {
        if (!this.HasProp("__IResourceContext")) {
            if ((queryResult := this.QueryInterface(IResourceContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceContext := IResourceContext(outPtr)
        }

        return this.__IResourceContext.put_Languages(languages)
    }

;@endregion Instance Methods
}
