#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INamedResource.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a single logical, named resource, such as a string resource named 'Header1'.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.namedresource
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class NamedResource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INamedResource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INamedResource.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a URI that can be used to refer to this named resource.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.namedresource.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets all possible candidate values for this named resource.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.namedresource.candidates
     * @type {IVectorView<ResourceCandidate>} 
     */
    Candidates {
        get => this.get_Candidates()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__INamedResource")) {
            if ((queryResult := this.QueryInterface(INamedResource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedResource := INamedResource(outPtr)
        }

        return this.__INamedResource.get_Uri()
    }

    /**
     * 
     * @returns {IVectorView<ResourceCandidate>} 
     */
    get_Candidates() {
        if (!this.HasProp("__INamedResource")) {
            if ((queryResult := this.QueryInterface(INamedResource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedResource := INamedResource(outPtr)
        }

        return this.__INamedResource.get_Candidates()
    }

    /**
     * Resolves this [NamedResource](namedresource.md) object against a supplied context and returns the most appropriate candidate.
     * @remarks
     * The resource management system for UWP apps supports the tailoring of resources for scale. Starting in Windows 8.1, different views owned by an app are able to display simultaneously on different display devices that may use different scales. In this way, scale is a per-view characteristic.
     * 
     * Since the Resolve method selects the best candidate for a [NamedResource](namedresource.md) in relation to a runtime context, and since the scale qualifier of a [ResourceContext](resourcecontext.md) depends on the associated view, the Resolve should always be called passing a [ResourceContext](resourcecontext.md) object obtained from the view in which the resource will be used.
     * 
     * See the [ResourceContext.GetForCurrentView](resourcecontext_getforcurrentview_1363600702.md) method.
     * @returns {ResourceCandidate} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.namedresource.resolve
     */
    Resolve() {
        if (!this.HasProp("__INamedResource")) {
            if ((queryResult := this.QueryInterface(INamedResource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedResource := INamedResource(outPtr)
        }

        return this.__INamedResource.Resolve()
    }

    /**
     * Resolves this [NamedResource](namedresource.md) object against the default context and returns the most appropriate candidate.
     * 
     * > [!NOTE]
     * > Resolve may be altered or unavailable for releases after Windows 8.1. Instead, use [Resolve(ResourceContext)](namedresource_resolve_302177783.md).
     * @param {ResourceContext} resourceContext_ 
     * @returns {ResourceCandidate} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.namedresource.resolve
     */
    ResolveForContext(resourceContext_) {
        if (!this.HasProp("__INamedResource")) {
            if ((queryResult := this.QueryInterface(INamedResource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedResource := INamedResource(outPtr)
        }

        return this.__INamedResource.ResolveForContext(resourceContext_)
    }

    /**
     * Resolves this [NamedResource](namedresource.md) object against a supplied context and returns a list of all possible candidates in preference order.
     * @remarks
     * The resource management system for UWP apps supports the tailoring of resources for scale. Starting in Windows 8.1, different views owned by an app are able to display simultaneously on different display devices that may use different scales. In this way, scale is a per-view characteristic.
     * 
     * Since the ResolveAll method returns all candidates for a [NamedResource](namedresource.md) in relation to a runtime context, and since the scale qualifier of a [ResourceContext](resourcecontext.md) depends on the associated view, the ResolveAll should always be called passing a [ResourceContext](resourcecontext.md) object obtained from the view in which the resource will be used.
     * 
     * See the [ResourceContext.GetForCurrentView](resourcecontext_getforcurrentview_1363600702.md) method.
     * @returns {IVectorView<ResourceCandidate>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.namedresource.resolveall
     */
    ResolveAll() {
        if (!this.HasProp("__INamedResource")) {
            if ((queryResult := this.QueryInterface(INamedResource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedResource := INamedResource(outPtr)
        }

        return this.__INamedResource.ResolveAll()
    }

    /**
     * Resolves this [NamedResource](namedresource.md) object against the default context and returns a list of all possible candidates in preference order.
     * 
     * > [!NOTE]
     * > ResolveAll may be altered or unavailable for releases after Windows 8.1. Instead, use [ResolveAll(ResourceContext)](namedresource_resolveall_1183893306.md).
     * @param {ResourceContext} resourceContext_ 
     * @returns {IVectorView<ResourceCandidate>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.namedresource.resolveall
     */
    ResolveAllForContext(resourceContext_) {
        if (!this.HasProp("__INamedResource")) {
            if ((queryResult := this.QueryInterface(INamedResource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedResource := INamedResource(outPtr)
        }

        return this.__INamedResource.ResolveAllForContext(resourceContext_)
    }

;@endregion Instance Methods
}
