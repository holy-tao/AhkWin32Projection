#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyTimeHelper.ahk
#Include .\IKeyTimeHelperStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides utility methods for working with [KeyTime](keytime.md) values. C# and Microsoft Visual Basic code should use members of [KeyTime](keytime.md) instead.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.keytimehelper
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class KeyTimeHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyTimeHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyTimeHelper.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Generates a new [KeyTime](keytime.md) with initial data based on the specified [TimeSpan](../windows.foundation/timespan.md).
     * @param {TimeSpan} timeSpan_ The [TimeSpan](../windows.foundation/timespan.md) data value to establish.
     * @returns {KeyTime} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.keytimehelper.fromtimespan
     */
    static FromTimeSpan(timeSpan_) {
        if (!KeyTimeHelper.HasProp("__IKeyTimeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.KeyTimeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyTimeHelperStatics.IID)
            KeyTimeHelper.__IKeyTimeHelperStatics := IKeyTimeHelperStatics(factoryPtr)
        }

        return KeyTimeHelper.__IKeyTimeHelperStatics.FromTimeSpan(timeSpan_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
