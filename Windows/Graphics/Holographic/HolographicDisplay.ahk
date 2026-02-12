#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicDisplay.ahk
#Include .\IHolographicDisplay2.ahk
#Include .\IHolographicDisplay3.ahk
#Include .\IHolographicDisplayStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides metadata for a display to which a holographic view must render each frame from that frame's pose.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdisplay
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicDisplay extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicDisplay

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicDisplay.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default display that represents the user's primary Mixed Reality headset.
     * @remarks
     * This will be null when [HolographicSpace.IsAvailable](holographicspace_isavailable.md) is false, representing a Desktop which does not have a headset attached.
     * @returns {HolographicDisplay} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdisplay.getdefault
     */
    static GetDefault() {
        if (!HolographicDisplay.HasProp("__IHolographicDisplayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Holographic.HolographicDisplay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicDisplayStatics.IID)
            HolographicDisplay.__IHolographicDisplayStatics := IHolographicDisplayStatics(factoryPtr)
        }

        return HolographicDisplay.__IHolographicDisplayStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a friendly name for this display that can be displayed to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdisplay.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the maximum viewport size that an app will ever be asked to render to for this display.
     * @remarks
     * An app can use this maximum size to pre-allocate secondary buffers for its own use during rendering.
     * 
     * Note that this maximum viewport size will exceed the physical resolution of the headset's screen for displays with lens distortion.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdisplay.maxviewportsize
     * @type {SIZE} 
     */
    MaxViewportSize {
        get => this.get_MaxViewportSize()
    }

    /**
     * Gets whether this display requires separate rendering for the left and right eyes.
     * @remarks
     * While actual Mixed Reality headsets are always stereo, an app will sometimes be asked to render to a mono HolographicDisplay, such as within the Mixed Reality emulator or during remoting to a desktop monitor.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdisplay.isstereo
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
    }

    /**
     * Gets whether this display is occluded, blocking the user's view of the physical world around them.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdisplay.isopaque
     * @type {Boolean} 
     */
    IsOpaque {
        get => this.get_IsOpaque()
    }

    /**
     * Gets the identifier of the graphics adapter to be used when displaying holographic content to this HolographicDisplay.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdisplay.adapterid
     * @type {HolographicAdapterId} 
     */
    AdapterId {
        get => this.get_AdapterId()
    }

    /**
     * Gets a spatial locator that can be used to create frames of reference relative to this display.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdisplay.spatiallocator
     * @type {SpatialLocator} 
     */
    SpatialLocator {
        get => this.get_SpatialLocator()
    }

    /**
     * Gets the refresh rate at which an app must present content to this holographic display.
     * @remarks
     * Note that this refresh rate may be lower than the display panel's maximum refresh rate. This can occur if the system is configured to operate at a lower refresh rate&mdash;for example, based on user preferences for Windows Mixed Reality.
     * 
     * To observe dynamic changes to frame duration&mdash;for example, when Mixed Reality Capture (MRC) is enabled&mdash;inspect the [HolographicFrame.Duration](/uwp/api/windows.graphics.holographic.holographicframe.duration) property.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdisplay.refreshrate
     * @type {Float} 
     */
    RefreshRate {
        get => this.get_RefreshRate()
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
    get_DisplayName() {
        if (!this.HasProp("__IHolographicDisplay")) {
            if ((queryResult := this.QueryInterface(IHolographicDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicDisplay := IHolographicDisplay(outPtr)
        }

        return this.__IHolographicDisplay.get_DisplayName()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MaxViewportSize() {
        if (!this.HasProp("__IHolographicDisplay")) {
            if ((queryResult := this.QueryInterface(IHolographicDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicDisplay := IHolographicDisplay(outPtr)
        }

        return this.__IHolographicDisplay.get_MaxViewportSize()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        if (!this.HasProp("__IHolographicDisplay")) {
            if ((queryResult := this.QueryInterface(IHolographicDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicDisplay := IHolographicDisplay(outPtr)
        }

        return this.__IHolographicDisplay.get_IsStereo()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOpaque() {
        if (!this.HasProp("__IHolographicDisplay")) {
            if ((queryResult := this.QueryInterface(IHolographicDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicDisplay := IHolographicDisplay(outPtr)
        }

        return this.__IHolographicDisplay.get_IsOpaque()
    }

    /**
     * 
     * @returns {HolographicAdapterId} 
     */
    get_AdapterId() {
        if (!this.HasProp("__IHolographicDisplay")) {
            if ((queryResult := this.QueryInterface(IHolographicDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicDisplay := IHolographicDisplay(outPtr)
        }

        return this.__IHolographicDisplay.get_AdapterId()
    }

    /**
     * 
     * @returns {SpatialLocator} 
     */
    get_SpatialLocator() {
        if (!this.HasProp("__IHolographicDisplay")) {
            if ((queryResult := this.QueryInterface(IHolographicDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicDisplay := IHolographicDisplay(outPtr)
        }

        return this.__IHolographicDisplay.get_SpatialLocator()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RefreshRate() {
        if (!this.HasProp("__IHolographicDisplay2")) {
            if ((queryResult := this.QueryInterface(IHolographicDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicDisplay2 := IHolographicDisplay2(outPtr)
        }

        return this.__IHolographicDisplay2.get_RefreshRate()
    }

    /**
     * Attempts to retrieve the view configuration for this [HolographicDisplay](holographicdisplay.md), which corresponds to the supplied [HolographicViewConfigurationKind](HolographicViewConfigurationKind.md).
     * @param {Integer} kind A [HolographicViewConfigurationKind](holographicviewconfigurationkind.md) indicating the kind of view configuration to be retrieved.
     * @returns {HolographicViewConfiguration} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdisplay.trygetviewconfiguration
     */
    TryGetViewConfiguration(kind) {
        if (!this.HasProp("__IHolographicDisplay3")) {
            if ((queryResult := this.QueryInterface(IHolographicDisplay3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicDisplay3 := IHolographicDisplay3(outPtr)
        }

        return this.__IHolographicDisplay3.TryGetViewConfiguration(kind)
    }

;@endregion Instance Methods
}
