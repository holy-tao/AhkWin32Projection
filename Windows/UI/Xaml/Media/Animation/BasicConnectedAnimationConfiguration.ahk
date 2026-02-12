#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ConnectedAnimationConfiguration.ahk
#Include .\IBasicConnectedAnimationConfiguration.ahk
#Include .\IBasicConnectedAnimationConfigurationFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * An object that configures the connected animation as a linear transition from the source to the destination.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.basicconnectedanimationconfiguration
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class BasicConnectedAnimationConfiguration extends ConnectedAnimationConfiguration {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBasicConnectedAnimationConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBasicConnectedAnimationConfiguration.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {BasicConnectedAnimationConfiguration} 
     */
    static CreateInstance() {
        if (!BasicConnectedAnimationConfiguration.HasProp("__IBasicConnectedAnimationConfigurationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.BasicConnectedAnimationConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBasicConnectedAnimationConfigurationFactory.IID)
            BasicConnectedAnimationConfiguration.__IBasicConnectedAnimationConfigurationFactory := IBasicConnectedAnimationConfigurationFactory(factoryPtr)
        }

        return BasicConnectedAnimationConfiguration.__IBasicConnectedAnimationConfigurationFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
