#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardReader.ahk
#Include .\ISmartCardReaderStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SmartCardReader.ahk
#Include .\CardAddedEventArgs.ahk
#Include .\CardRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents info about a smart card reader.
  * 
  * The [Smart cards sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/SmartCard) application shows how to use **Windows.Devices.SmartCards** APIs to work with smart cards and smart card readers programmatically. The [Near field communication (NFC) sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/Nfc) application also shows how to communicate with a smart card.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreader
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardReader.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns an Advanced Query Syntax (AQS) string representing a set of a specific type of smart card readers connected to the device. This string is passed to the [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) method to enumerate the given set of smart card readers.
     * @remarks
     * For info about AQS, see [Using Advanced Query Syntax Programmatically](https://msdn.microsoft.com/library/76e33903-d063-48c0-9afe-912c3daa8237).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreader.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!SmartCardReader.HasProp("__ISmartCardReaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardReaderStatics.IID)
            SmartCardReader.__ISmartCardReaderStatics := ISmartCardReaderStatics(factoryPtr)
        }

        return SmartCardReader.__ISmartCardReaderStatics.GetDeviceSelector()
    }

    /**
     * Returns an Advanced Query Syntax (AQS) string representing all smart card readers connected to the device. This string is passed to the [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) method to enumerate the given set of smart card readers.
     * @remarks
     * For info about AQS, see [Using Advanced Query Syntax Programmatically](https://msdn.microsoft.com/library/76e33903-d063-48c0-9afe-912c3daa8237).
     * @param {Integer} kind 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreader.getdeviceselector
     */
    static GetDeviceSelectorWithKind(kind) {
        if (!SmartCardReader.HasProp("__ISmartCardReaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardReaderStatics.IID)
            SmartCardReader.__ISmartCardReaderStatics := ISmartCardReaderStatics(factoryPtr)
        }

        return SmartCardReader.__ISmartCardReaderStatics.GetDeviceSelectorWithKind(kind)
    }

    /**
     * Returns a smart card reader that matches the specified device ID.
     * @param {HSTRING} deviceId The smart card reader's device ID.
     * @returns {IAsyncOperation<SmartCardReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreader.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!SmartCardReader.HasProp("__ISmartCardReaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardReaderStatics.IID)
            SmartCardReader.__ISmartCardReaderStatics := ISmartCardReaderStatics(factoryPtr)
        }

        return SmartCardReader.__ISmartCardReaderStatics.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the smart card reader's device ID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreader.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the smart card reader's device name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreader.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the smart card reader's type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreader.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Occurs when a smart card is inserted into the smart card reader or tapped on an NFC reader.
     * @type {TypedEventHandler<SmartCardReader, CardAddedEventArgs>}
    */
    OnCardAdded {
        get {
            if(!this.HasProp("__OnCardAdded")){
                this.__OnCardAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d36f2db9-5674-5f74-9f69-3cdc4559999f}"),
                    SmartCardReader,
                    CardAddedEventArgs
                )
                this.__OnCardAddedToken := this.add_CardAdded(this.__OnCardAdded.iface)
            }
            return this.__OnCardAdded
        }
    }

    /**
     * Occurs when a smart card is taken out of the smart card reader.
     * @type {TypedEventHandler<SmartCardReader, CardRemovedEventArgs>}
    */
    OnCardRemoved {
        get {
            if(!this.HasProp("__OnCardRemoved")){
                this.__OnCardRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{69da07c6-b266-5a1c-937c-d82b4a8232c6}"),
                    SmartCardReader,
                    CardRemovedEventArgs
                )
                this.__OnCardRemovedToken := this.add_CardRemoved(this.__OnCardRemoved.iface)
            }
            return this.__OnCardRemoved
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCardAddedToken")) {
            this.remove_CardAdded(this.__OnCardAddedToken)
            this.__OnCardAdded.iface.Dispose()
        }

        if(this.HasProp("__OnCardRemovedToken")) {
            this.remove_CardRemoved(this.__OnCardRemovedToken)
            this.__OnCardRemoved.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ISmartCardReader")) {
            if ((queryResult := this.QueryInterface(ISmartCardReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardReader := ISmartCardReader(outPtr)
        }

        return this.__ISmartCardReader.get_DeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ISmartCardReader")) {
            if ((queryResult := this.QueryInterface(ISmartCardReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardReader := ISmartCardReader(outPtr)
        }

        return this.__ISmartCardReader.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__ISmartCardReader")) {
            if ((queryResult := this.QueryInterface(ISmartCardReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardReader := ISmartCardReader(outPtr)
        }

        return this.__ISmartCardReader.get_Kind()
    }

    /**
     * Returns the smart card reader's status.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreader.getstatusasync
     */
    GetStatusAsync() {
        if (!this.HasProp("__ISmartCardReader")) {
            if ((queryResult := this.QueryInterface(ISmartCardReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardReader := ISmartCardReader(outPtr)
        }

        return this.__ISmartCardReader.GetStatusAsync()
    }

    /**
     * Returns a list of info about all smart cards that are connected to the smart card reader.
     * @returns {IAsyncOperation<IVectorView<SmartCard>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreader.findallcardsasync
     */
    FindAllCardsAsync() {
        if (!this.HasProp("__ISmartCardReader")) {
            if ((queryResult := this.QueryInterface(ISmartCardReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardReader := ISmartCardReader(outPtr)
        }

        return this.__ISmartCardReader.FindAllCardsAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<SmartCardReader, CardAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CardAdded(handler) {
        if (!this.HasProp("__ISmartCardReader")) {
            if ((queryResult := this.QueryInterface(ISmartCardReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardReader := ISmartCardReader(outPtr)
        }

        return this.__ISmartCardReader.add_CardAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CardAdded(token) {
        if (!this.HasProp("__ISmartCardReader")) {
            if ((queryResult := this.QueryInterface(ISmartCardReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardReader := ISmartCardReader(outPtr)
        }

        return this.__ISmartCardReader.remove_CardAdded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SmartCardReader, CardRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CardRemoved(handler) {
        if (!this.HasProp("__ISmartCardReader")) {
            if ((queryResult := this.QueryInterface(ISmartCardReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardReader := ISmartCardReader(outPtr)
        }

        return this.__ISmartCardReader.add_CardRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CardRemoved(token) {
        if (!this.HasProp("__ISmartCardReader")) {
            if ((queryResult := this.QueryInterface(ISmartCardReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardReader := ISmartCardReader(outPtr)
        }

        return this.__ISmartCardReader.remove_CardRemoved(token)
    }

;@endregion Instance Methods
}
