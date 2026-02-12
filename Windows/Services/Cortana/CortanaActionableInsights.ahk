#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICortanaActionableInsights.ahk
#Include .\ICortanaActionableInsightsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Derives contextual insights from images or text that let the user learn more about the content, or perform an action based on it.
 * @remarks
 * The CortanaActionableInsights class requires the following be added to the Package.appxmanifest:
 * 
 * - To \<Package\>
 *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
 *   - `IgnorableNamespaces="rescap"`
 * - Under \<Capabilities\>
 *   - `<rescap:capability name="cortanaSurface"/>`
 * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights
 * @namespace Windows.Services.Cortana
 * @version WindowsRuntime 1.4
 */
class CortanaActionableInsights extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICortanaActionableInsights

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICortanaActionableInsights.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a [CortanaActionableInsights](cortanaactionableinsights.md) object for the current user.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @returns {CortanaActionableInsights} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights.getdefault
     */
    static GetDefault() {
        if (!CortanaActionableInsights.HasProp("__ICortanaActionableInsightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Cortana.CortanaActionableInsights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICortanaActionableInsightsStatics.IID)
            CortanaActionableInsights.__ICortanaActionableInsightsStatics := ICortanaActionableInsightsStatics(factoryPtr)
        }

        return CortanaActionableInsights.__ICortanaActionableInsightsStatics.GetDefault()
    }

    /**
     * Retrieves a [CortanaActionableInsights](cortanaactionableinsights.md) object for the specified user.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @param {User} user_ The user.
     * @returns {CortanaActionableInsights} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights.getforuser
     */
    static GetForUser(user_) {
        if (!CortanaActionableInsights.HasProp("__ICortanaActionableInsightsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Cortana.CortanaActionableInsights")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICortanaActionableInsightsStatics.IID)
            CortanaActionableInsights.__ICortanaActionableInsightsStatics := ICortanaActionableInsightsStatics(factoryPtr)
        }

        return CortanaActionableInsights.__ICortanaActionableInsightsStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the user associated with the current [CortanaActionableInsights](cortanaactionableinsights.md) object.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__ICortanaActionableInsights")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsights.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsights := ICortanaActionableInsights(outPtr)
        }

        return this.__ICortanaActionableInsights.get_User()
    }

    /**
     * Asynchronously retrieves whether insights can be generated on the user's current system.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights.isavailableasync
     */
    IsAvailableAsync() {
        if (!this.HasProp("__ICortanaActionableInsights")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsights.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsights := ICortanaActionableInsights(outPtr)
        }

        return this.__ICortanaActionableInsights.IsAvailableAsync()
    }

    /**
     * Asynchronously retrieves and displays insights based on the specified image content and options.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @param {IRandomAccessStreamReference} imageStream_ The image that defines the scope of the insights returned.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights.showinsightsforimageasync
     */
    ShowInsightsForImageAsync(imageStream_) {
        if (!this.HasProp("__ICortanaActionableInsights")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsights.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsights := ICortanaActionableInsights(outPtr)
        }

        return this.__ICortanaActionableInsights.ShowInsightsForImageAsync(imageStream_)
    }

    /**
     * Asynchronously retrieves and displays insights based on the specified image content.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @param {IRandomAccessStreamReference} imageStream_ The image that defines the scope of the insights returned.
     * @param {CortanaActionableInsightsOptions} options 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights.showinsightsforimageasync
     */
    ShowInsightsForImageWithOptionsAsync(imageStream_, options) {
        if (!this.HasProp("__ICortanaActionableInsights")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsights.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsights := ICortanaActionableInsights(outPtr)
        }

        return this.__ICortanaActionableInsights.ShowInsightsForImageWithOptionsAsync(imageStream_, options)
    }

    /**
     * Asynchronously retrieves and displays insights based on the specified text content and options.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @param {HSTRING} text The text that defines the scope of the insights returned.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights.showinsightsfortextasync
     */
    ShowInsightsForTextAsync(text) {
        if (!this.HasProp("__ICortanaActionableInsights")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsights.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsights := ICortanaActionableInsights(outPtr)
        }

        return this.__ICortanaActionableInsights.ShowInsightsForTextAsync(text)
    }

    /**
     * Asynchronously retrieves and displays insights based on the specified text content.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @param {HSTRING} text The text that defines the scope of the insights returned.
     * @param {CortanaActionableInsightsOptions} options 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights.showinsightsfortextasync
     */
    ShowInsightsForTextWithOptionsAsync(text, options) {
        if (!this.HasProp("__ICortanaActionableInsights")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsights.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsights := ICortanaActionableInsights(outPtr)
        }

        return this.__ICortanaActionableInsights.ShowInsightsForTextWithOptionsAsync(text, options)
    }

    /**
     * Asynchronously retrieves and displays insights based on the specified text and image content and options.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @param {DataPackage} datapackage_ The text and image content that defines the scope of the insights returned.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights.showinsightsasync
     */
    ShowInsightsAsync(datapackage_) {
        if (!this.HasProp("__ICortanaActionableInsights")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsights.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsights := ICortanaActionableInsights(outPtr)
        }

        return this.__ICortanaActionableInsights.ShowInsightsAsync(datapackage_)
    }

    /**
     * Asynchronously retrieves and displays insights based on the specified text and image content.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @param {DataPackage} datapackage_ The text and image content that defines the scope of the insights returned.
     * @param {CortanaActionableInsightsOptions} options 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsights.showinsightsasync
     */
    ShowInsightsWithOptionsAsync(datapackage_, options) {
        if (!this.HasProp("__ICortanaActionableInsights")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsights.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsights := ICortanaActionableInsights(outPtr)
        }

        return this.__ICortanaActionableInsights.ShowInsightsWithOptionsAsync(datapackage_, options)
    }

;@endregion Instance Methods
}
