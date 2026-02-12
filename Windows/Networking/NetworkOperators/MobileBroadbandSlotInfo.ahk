#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandSlotInfo.ahk
#Include .\IMobileBroadbandSlotInfo2.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that represents mobile broadband SIM slot information.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotinfo
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandSlotInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandSlotInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandSlotInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the 0-based slot index. **MobileBroadbandSlotInfo.Index** matches the [SlotIndex](esim_slotindex.md) property of the corresponding [ESim](esim.md) object.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotinfo.index
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
    }

    /**
     * Gets a [MobileBroadbandSlotState](/uwp/api/windows.networking.networkoperators.mobilebroadbandslotstate) object representing the SIM slot state.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotinfo.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the Integrated Circuit Card Identifier (ICCID) for an eSim (in either the active or inactive slot, for Dual Sim Single Active devices).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotinfo.iccid
     * @type {HSTRING} 
     */
    IccId {
        get => this.get_IccId()
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
    get_Index() {
        if (!this.HasProp("__IMobileBroadbandSlotInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotInfo := IMobileBroadbandSlotInfo(outPtr)
        }

        return this.__IMobileBroadbandSlotInfo.get_Index()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IMobileBroadbandSlotInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotInfo := IMobileBroadbandSlotInfo(outPtr)
        }

        return this.__IMobileBroadbandSlotInfo.get_State()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IccId() {
        if (!this.HasProp("__IMobileBroadbandSlotInfo2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotInfo2 := IMobileBroadbandSlotInfo2(outPtr)
        }

        return this.__IMobileBroadbandSlotInfo2.get_IccId()
    }

;@endregion Instance Methods
}
