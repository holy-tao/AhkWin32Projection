#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandSlotManager.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MobileBroadbandSlotManager.ahk
#Include .\MobileBroadbandSlotInfoChangedEventArgs.ahk
#Include .\MobileBroadbandCurrentSlotIndexChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * A class that represents a mobile broadband slot manager.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotmanager
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandSlotManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandSlotManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandSlotManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of [MobileBroadbandSlotInfo](/uwp/api/windows.networking.networkoperators.mobilebroadbandslotinfo) objects for the modem.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotmanager.slotinfos
     * @type {IVectorView<MobileBroadbandSlotInfo>} 
     */
    SlotInfos {
        get => this.get_SlotInfos()
    }

    /**
     * Gets the current 0-based slot index.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotmanager.currentslotindex
     * @type {Integer} 
     */
    CurrentSlotIndex {
        get => this.get_CurrentSlotIndex()
    }

    /**
     * An event that's raised when a slot information is changed.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @type {TypedEventHandler<MobileBroadbandSlotManager, MobileBroadbandSlotInfoChangedEventArgs>}
    */
    OnSlotInfoChanged {
        get {
            if(!this.HasProp("__OnSlotInfoChanged")){
                this.__OnSlotInfoChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e3deb611-51ac-58c9-9e72-ebffdf149f69}"),
                    MobileBroadbandSlotManager,
                    MobileBroadbandSlotInfoChangedEventArgs
                )
                this.__OnSlotInfoChangedToken := this.add_SlotInfoChanged(this.__OnSlotInfoChanged.iface)
            }
            return this.__OnSlotInfoChanged
        }
    }

    /**
     * An event that's raised when the current slot index is changed.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @type {TypedEventHandler<MobileBroadbandSlotManager, MobileBroadbandCurrentSlotIndexChangedEventArgs>}
    */
    OnCurrentSlotIndexChanged {
        get {
            if(!this.HasProp("__OnCurrentSlotIndexChanged")){
                this.__OnCurrentSlotIndexChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{67a52e4e-a996-5861-976a-762d06687028}"),
                    MobileBroadbandSlotManager,
                    MobileBroadbandCurrentSlotIndexChangedEventArgs
                )
                this.__OnCurrentSlotIndexChangedToken := this.add_CurrentSlotIndexChanged(this.__OnCurrentSlotIndexChanged.iface)
            }
            return this.__OnCurrentSlotIndexChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSlotInfoChangedToken")) {
            this.remove_SlotInfoChanged(this.__OnSlotInfoChangedToken)
            this.__OnSlotInfoChanged.iface.Dispose()
        }

        if(this.HasProp("__OnCurrentSlotIndexChangedToken")) {
            this.remove_CurrentSlotIndexChanged(this.__OnCurrentSlotIndexChangedToken)
            this.__OnCurrentSlotIndexChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandSlotInfo>} 
     */
    get_SlotInfos() {
        if (!this.HasProp("__IMobileBroadbandSlotManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotManager := IMobileBroadbandSlotManager(outPtr)
        }

        return this.__IMobileBroadbandSlotManager.get_SlotInfos()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentSlotIndex() {
        if (!this.HasProp("__IMobileBroadbandSlotManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotManager := IMobileBroadbandSlotManager(outPtr)
        }

        return this.__IMobileBroadbandSlotManager.get_CurrentSlotIndex()
    }

    /**
     * Switches to the slot specified by the 0-based slot index.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {Integer} slotIndex The 0-based slot index to switch to.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotmanager.setcurrentslot
     */
    SetCurrentSlot(slotIndex) {
        if (!this.HasProp("__IMobileBroadbandSlotManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotManager := IMobileBroadbandSlotManager(outPtr)
        }

        return this.__IMobileBroadbandSlotManager.SetCurrentSlot(slotIndex)
    }

    /**
     * Asynchronously switches to the slot specified by the 0-based slot index.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {Integer} slotIndex The 0-based slot index to switch to.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotmanager.setcurrentslotasync
     */
    SetCurrentSlotAsync(slotIndex) {
        if (!this.HasProp("__IMobileBroadbandSlotManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotManager := IMobileBroadbandSlotManager(outPtr)
        }

        return this.__IMobileBroadbandSlotManager.SetCurrentSlotAsync(slotIndex)
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandSlotManager, MobileBroadbandSlotInfoChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SlotInfoChanged(handler) {
        if (!this.HasProp("__IMobileBroadbandSlotManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotManager := IMobileBroadbandSlotManager(outPtr)
        }

        return this.__IMobileBroadbandSlotManager.add_SlotInfoChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SlotInfoChanged(token) {
        if (!this.HasProp("__IMobileBroadbandSlotManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotManager := IMobileBroadbandSlotManager(outPtr)
        }

        return this.__IMobileBroadbandSlotManager.remove_SlotInfoChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandSlotManager, MobileBroadbandCurrentSlotIndexChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentSlotIndexChanged(handler) {
        if (!this.HasProp("__IMobileBroadbandSlotManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotManager := IMobileBroadbandSlotManager(outPtr)
        }

        return this.__IMobileBroadbandSlotManager.add_CurrentSlotIndexChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentSlotIndexChanged(token) {
        if (!this.HasProp("__IMobileBroadbandSlotManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSlotManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSlotManager := IMobileBroadbandSlotManager(outPtr)
        }

        return this.__IMobileBroadbandSlotManager.remove_CurrentSlotIndexChanged(token)
    }

;@endregion Instance Methods
}
