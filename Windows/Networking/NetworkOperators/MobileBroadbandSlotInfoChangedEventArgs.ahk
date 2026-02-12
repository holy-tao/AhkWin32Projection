#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandSlotInfoChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * An event that's raised when the slot info changes.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotinfochangedeventargs
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandSlotInfoChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandSlotInfoChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandSlotInfoChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [MobileBroadbandSlotInfo](/uwp/api/windows.networking.networkoperators.mobilebroadbandslotinfo) object representing the SIM slot information.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotinfochangedeventargs.slotinfo
     * @type {MobileBroadbandSlotInfo} 
     */
    SlotInfo {
        get => this.get_SlotInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MobileBroadbandSlotInfo} 
     */
    get_SlotInfo() {
        if (!this.HasProp("__IMobileBroadbandSlotInfoChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotInfoChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotInfoChangedEventArgs := IMobileBroadbandSlotInfoChangedEventArgs(outPtr)
        }

        return this.__IMobileBroadbandSlotInfoChangedEventArgs.get_SlotInfo()
    }

;@endregion Instance Methods
}
