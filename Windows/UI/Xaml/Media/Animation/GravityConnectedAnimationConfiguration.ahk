#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ConnectedAnimationConfiguration.ahk
#Include .\IGravityConnectedAnimationConfiguration.ahk
#Include .\IGravityConnectedAnimationConfiguration2.ahk
#Include .\IGravityConnectedAnimationConfigurationFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * An object that configures the connected animation to play using the gravity configuration.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.gravityconnectedanimationconfiguration
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class GravityConnectedAnimationConfiguration extends ConnectedAnimationConfiguration {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGravityConnectedAnimationConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGravityConnectedAnimationConfiguration.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {GravityConnectedAnimationConfiguration} 
     */
    static CreateInstance() {
        if (!GravityConnectedAnimationConfiguration.HasProp("__IGravityConnectedAnimationConfigurationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.GravityConnectedAnimationConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGravityConnectedAnimationConfigurationFactory.IID)
            GravityConnectedAnimationConfiguration.__IGravityConnectedAnimationConfigurationFactory := IGravityConnectedAnimationConfigurationFactory(factoryPtr)
        }

        return GravityConnectedAnimationConfiguration.__IGravityConnectedAnimationConfigurationFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether a shadow effect is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.gravityconnectedanimationconfiguration.isshadowenabled
     * @type {Boolean} 
     */
    IsShadowEnabled {
        get => this.get_IsShadowEnabled()
        set => this.put_IsShadowEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsShadowEnabled() {
        if (!this.HasProp("__IGravityConnectedAnimationConfiguration2")) {
            if ((queryResult := this.QueryInterface(IGravityConnectedAnimationConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGravityConnectedAnimationConfiguration2 := IGravityConnectedAnimationConfiguration2(outPtr)
        }

        return this.__IGravityConnectedAnimationConfiguration2.get_IsShadowEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsShadowEnabled(value) {
        if (!this.HasProp("__IGravityConnectedAnimationConfiguration2")) {
            if ((queryResult := this.QueryInterface(IGravityConnectedAnimationConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGravityConnectedAnimationConfiguration2 := IGravityConnectedAnimationConfiguration2(outPtr)
        }

        return this.__IGravityConnectedAnimationConfiguration2.put_IsShadowEnabled(value)
    }

;@endregion Instance Methods
}
