#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ConnectedAnimationConfiguration.ahk
#Include .\IDirectConnectedAnimationConfiguration.ahk
#Include .\IDirectConnectedAnimationConfigurationFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * An object that configures the connected animation to play a quick linear animation between source and destination.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.directconnectedanimationconfiguration
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DirectConnectedAnimationConfiguration extends ConnectedAnimationConfiguration {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDirectConnectedAnimationConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDirectConnectedAnimationConfiguration.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DirectConnectedAnimationConfiguration} 
     */
    static CreateInstance() {
        if (!DirectConnectedAnimationConfiguration.HasProp("__IDirectConnectedAnimationConfigurationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DirectConnectedAnimationConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDirectConnectedAnimationConfigurationFactory.IID)
            DirectConnectedAnimationConfiguration.__IDirectConnectedAnimationConfigurationFactory := IDirectConnectedAnimationConfigurationFactory(factoryPtr)
        }

        return DirectConnectedAnimationConfiguration.__IDirectConnectedAnimationConfigurationFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
