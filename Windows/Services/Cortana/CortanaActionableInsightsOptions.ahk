#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICortanaActionableInsightsOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies options for refining the insights retrieved through the [CortanaActionableInsights](cortanaactionableinsights.md) methods.
 * @remarks
 * The CortanaActionableInsightsOptions properties are used to identify the contextual metadata for the specified text and image content.
 * 
 * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
 * 
 * - To \<Package\>
 *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
 *   - `IgnorableNamespaces="rescap"`
 * - Under \<Capabilities\>
 *   - `<rescap:capability name="cortanaSurface"/>`
 * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsightsoptions
 * @namespace Windows.Services.Cortana
 * @version WindowsRuntime 1.4
 */
class CortanaActionableInsightsOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICortanaActionableInsightsOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICortanaActionableInsightsOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A URI that identifies where the specified text or image content originated.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsightsoptions.contentsourceweblink
     * @type {Uri} 
     */
    ContentSourceWebLink {
        get => this.get_ContentSourceWebLink()
        set => this.put_ContentSourceWebLink(value)
    }

    /**
     * Text from the surrounding context of the content supplied to [CortanaActionableInsights](cortanaactionableinsights.md) for showing insights.
     * @remarks
     * If the setter is called with a string exceeding the maximum length, an exception is thrown.
     * 
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanaactionableinsightsoptions.surroundingtext
     * @type {HSTRING} 
     */
    SurroundingText {
        get => this.get_SurroundingText()
        set => this.put_SurroundingText(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [CortanaActionableInsightsOptions](cortanaactionableinsightsoptions.md) object.
     * @remarks
     * The [CortanaActionableInsights](cortanaactionableinsights.md) class requires the following be added to the Package.appxmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaSurface"/>`
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Services.Cortana.CortanaActionableInsightsOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentSourceWebLink() {
        if (!this.HasProp("__ICortanaActionableInsightsOptions")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsightsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsightsOptions := ICortanaActionableInsightsOptions(outPtr)
        }

        return this.__ICortanaActionableInsightsOptions.get_ContentSourceWebLink()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ContentSourceWebLink(value) {
        if (!this.HasProp("__ICortanaActionableInsightsOptions")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsightsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsightsOptions := ICortanaActionableInsightsOptions(outPtr)
        }

        return this.__ICortanaActionableInsightsOptions.put_ContentSourceWebLink(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SurroundingText() {
        if (!this.HasProp("__ICortanaActionableInsightsOptions")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsightsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsightsOptions := ICortanaActionableInsightsOptions(outPtr)
        }

        return this.__ICortanaActionableInsightsOptions.get_SurroundingText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SurroundingText(value) {
        if (!this.HasProp("__ICortanaActionableInsightsOptions")) {
            if ((queryResult := this.QueryInterface(ICortanaActionableInsightsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaActionableInsightsOptions := ICortanaActionableInsightsOptions(outPtr)
        }

        return this.__ICortanaActionableInsightsOptions.put_SurroundingText(value)
    }

;@endregion Instance Methods
}
