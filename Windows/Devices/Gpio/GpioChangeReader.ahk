#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGpioChangeReader.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IGpioChangeReaderFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a shared circular buffer between kernel mode and user mode into which high-resolution timestamps are placed when a general-purpose I/O (GPIO) pin changes value.
 * @remarks
 * Kernel mode places a timestamp into the buffer when a pin changes value, and user mode removes items from the buffer. An overflow occurs when there is no longer sufficient room in the buffer to place additional timestamps. Upon overflow, further events are not recorded, and the [IsOverflowed](gpiochangereader_isoverflowed.md) property will return true.
 * 
 * This class is not thread-safe. Calling functions of this class concurrently from multiple threads will have unpredictable results.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioChangeReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGpioChangeReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGpioChangeReader.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new GpioChangeReader associated with the specified pin. Only a single GpioChangeReader may be associated with a pin at any given time.
     * @remarks
     * The following exceptions can be thrown by this method:
     * 
     * * E_POINTER - The pin passed in is null.
     * * HRESULT_FROM_WIN32(ERROR_SHARING_VIOLATION) - The pin is already associated with a change reader. That change reader must be disposed before the pin can be associated with a new change reader.
     * * E_ACCESSDENIED - The pin is not opened in Exclusive mode.
     * @param {GpioPin} pin The pin on which to read changes. The pin must have been opened in Exclusive mode, and cannot be associated with another change reader.
     * @returns {GpioChangeReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.#ctor
     */
    static Create(pin) {
        if (!GpioChangeReader.HasProp("__IGpioChangeReaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Gpio.GpioChangeReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGpioChangeReaderFactory.IID)
            GpioChangeReader.__IGpioChangeReaderFactory := IGpioChangeReaderFactory(factoryPtr)
        }

        return GpioChangeReader.__IGpioChangeReaderFactory.Create(pin)
    }

    /**
     * Creates a new GpioChangeReader associated with the specified pin and with the specified minimum capacity for change records. Only a single GpioChangeReader may be associated with a pin at any given time.
     * @remarks
     * The following exceptions can be thrown by this method:
     * 
     * * E_POINTER - The pin passed in is null.
     * * HRESULT_FROM_WIN32(ERROR_SHARING_VIOLATION) - The pin is already associated with a change reader. That change reader must be disposed before the pin can be associated with a new change reader.
     * * E_ACCESSDENIED - The pin is not opened in Exclusive mode.
     * @param {GpioPin} pin The pin on which to read changes. The pin must have been opened in Exclusive mode, and cannot be associated with another change reader.
     * @param {Integer} minCapacity The minimum number of change records that the reader must be able to hold.
     * @returns {GpioChangeReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.#ctor
     */
    static CreateWithCapacity(pin, minCapacity) {
        if (!GpioChangeReader.HasProp("__IGpioChangeReaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Gpio.GpioChangeReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGpioChangeReaderFactory.IID)
            GpioChangeReader.__IGpioChangeReaderFactory := IGpioChangeReaderFactory(factoryPtr)
        }

        return GpioChangeReader.__IGpioChangeReaderFactory.CreateWithCapacity(pin, minCapacity)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the maximum number of change records that the GpioChangeReader can store at one time.
     * @remarks
     * When this maximum number of records is met, further changes will not be recorded and the [IsOverflowed](gpiochangereader_isoverflowed.md) property will return true.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.capacity
     * @type {Integer} 
     */
    Capacity {
        get => this.get_Capacity()
    }

    /**
     * Gets the number of records currently in the change reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Gets whether there are currently zero change records in the reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.isempty
     * @type {Boolean} 
     */
    IsEmpty {
        get => this.get_IsEmpty()
    }

    /**
     * Gets whether an attempt to place a change record into the reader's buffer has failed due to the buffer being full.
     * @remarks
     * Removing an item from the buffer will cause IsOverflowed to reset to false.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.isoverflowed
     * @type {Boolean} 
     */
    IsOverflowed {
        get => this.get_IsOverflowed()
    }

    /**
     * Gets or sets the polarity of transitions that will be recorded. The polarity may only be changed when pin change recording is not started.
     * @remarks
     * Listening to a single edge (Falling or Rising) can be considerably more efficient than listening to both edges.
     * 
     * The following exceptions can be thrown when setting the polarity:
     * 
     * * E_INVALIDARG - value is not a valid [GpioChangePolarity](gpiochangepolarity.md) value.
     * * HRESULT_FROM_WIN32(ERROR_BAD_COMMAND) - change recording is currently active. Polarity can only be set before calling [Start()](gpiochangereader_start_1587696324.md) or after calling [Stop()](gpiochangereader_stop_1201535524.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.polarity
     * @type {Integer} 
     */
    Polarity {
        get => this.get_Polarity()
        set => this.put_Polarity(value)
    }

    /**
     * Gets whether pin change recording is currently active.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.isstarted
     * @type {Boolean} 
     */
    IsStarted {
        get => this.get_IsStarted()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Capacity() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.get_Capacity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.get_Length()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEmpty() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.get_IsEmpty()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverflowed() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.get_IsOverflowed()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Polarity(value) {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.put_Polarity(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Polarity() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.get_Polarity()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStarted() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.get_IsStarted()
    }

    /**
     * Starts recording changes in pin polarity. This method may only be called when change recording is not already active.
     * @remarks
     * Calling Start() may enable or reconfigure interrupts for the pin.
     * 
     * The following exceptions can be thrown by this method:
     * 
     * * HRESULT_FROM_WIN32(ERROR_BAD_COMMAND) - change reading is not currently active.
     * * HRESULT_FROM_WIN32(ERROR_INVALID_HANDLE) - the change reader or the associated pin has been disposed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.start
     */
    Start() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.Start()
    }

    /**
     * Stop recording changes in pin polarity. This method may only be called when change recording is currently active.
     * @remarks
     * Calling Stop() may disable or reconfigure interrupts for the pin.
     * 
     * The following exceptions can be thrown by this method:
     * 
     * * HRESULT_FROM_WIN32(ERROR_BAD_COMMAND) - change reading has already been started.
     * * HRESULT_FROM_WIN32(ERROR_INVALID_HANDLE) - the change reader or the associated pin has been disposed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.stop
     */
    Stop() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.Stop()
    }

    /**
     * Discards all change records from the reader's buffer.
     * @remarks
     * This will also reset an active overflow condition, causing the [IsOverflowed](gpiochangereader_isoverflowed.md) property to return false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.clear
     */
    Clear() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.Clear()
    }

    /**
     * Retrieves and removes the earliest inserted change record from the reader's buffer.
     * @remarks
     * This will also reset an active overflow condition, causing the [IsOverflowed](gpiochangereader_isoverflowed.md) property to return false.
     * 
     * The following exception can be thrown by this method:
     * 
     * * HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS) - the reader's buffer is empty.
     * @returns {GpioChangeRecord} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.getnextitem
     */
    GetNextItem() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.GetNextItem()
    }

    /**
     * Retrieves the earlier inserted change record from the reader's buffer, without removing it.
     * @remarks
     * The following exception can be thrown by this method:
     * 
     * * HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS) - the reader's buffer is empty.
     * @returns {GpioChangeRecord} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.peeknextitem
     */
    PeekNextItem() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.PeekNextItem()
    }

    /**
     * Removes and returns all items current in the reader's buffer.
     * @remarks
     * This will also reset an active overflow condition, causing the [IsOverflowed](gpiochangereader_isoverflowed.md) property to return false.
     * @returns {IVector<GpioChangeRecord>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.getallitems
     */
    GetAllItems() {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.GetAllItems()
    }

    /**
     * Waits for the buffer to fill with at least *count* number of items, at which point the async action will complete. This action is cancelable.
     * @remarks
     * If the pin or change reader is closed while a wait is in progress, the async operation will be cancelled.
     * 
     * The following exceptions can be thrown by this method:
     * 
     * * E_INVALIDARG - *count* is 0, or *count* is greater than the buffer's capacity.
     * * HRESULT_FROM_WIN32(ERROR_INVALID_HANDLE) - The change reader was disposed of the associated pin was closed.
     * * HRESULT_FROM_WIN32(ERROR_OPERATION_ABORTED) - the async operation was canceled.
     * @param {Integer} count The number of items with which the buffer must fill before the async operation completes.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.waitforitemsasync
     */
    WaitForItemsAsync(count) {
        if (!this.HasProp("__IGpioChangeReader")) {
            if ((queryResult := this.QueryInterface(IGpioChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeReader := IGpioChangeReader(outPtr)
        }

        return this.__IGpioChangeReader.WaitForItemsAsync(count)
    }

    /**
     * Closes the change reader, releasing the associated memory buffer and disassociating the reader from its pin.
     * @remarks
     * Calling this method will also cancel any pending [WaitForItemsAsync()](gpiochangereader_waitforitemsasync_799637968.md) actions.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangereader.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
