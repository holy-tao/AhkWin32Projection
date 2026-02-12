#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandCurrentSlotIndexChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * An event that's raised when the current slot index changes.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcurrentslotindexchangedeventargs
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandCurrentSlotIndexChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandCurrentSlotIndexChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandCurrentSlotIndexChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the 0-based current slot index.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcurrentslotindexchangedeventargs.currentslotindex
     * @type {Integer} 
     */
    CurrentSlotIndex {
        get => this.get_CurrentSlotIndex()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentSlotIndex() {
        if (!this.HasProp("__IMobileBroadbandCurrentSlotIndexChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCurrentSlotIndexChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCurrentSlotIndexChangedEventArgs := IMobileBroadbandCurrentSlotIndexChangedEventArgs(outPtr)
        }

        return this.__IMobileBroadbandCurrentSlotIndexChangedEventArgs.get_CurrentSlotIndex()
    }

;@endregion Instance Methods
}
