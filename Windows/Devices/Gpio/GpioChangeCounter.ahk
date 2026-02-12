#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGpioChangeCounter.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IGpioChangeCounterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Counts changes of a specified polarity on a general-purpose I/O (GPIO) pin.
 * @remarks
 * When the pin is an input, interrupts are used to detect pin changes. Interrupts for the pin are enabled for the specified polarity, and the count is incremented when an interrupt occurs.
 * 
 * When the pin is an output, the count will increment whenever the specified transition occurs on the pin. For example, if the pin is configured as an output and counting is enabled for rising edges, writing a 0 and then a 1 will cause the count to be incremented.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangecounter
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioChangeCounter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGpioChangeCounter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGpioChangeCounter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new GpioChangeCounter associated with the specified pin. Only a single GpioChangeCounter may be associated with a pin at any given time.
     * @remarks
     * The following exceptions can be thrown by this method:
     * 
     * * E_POINTER - The pin passed in is null.
     * * HRESULT_FROM_WIN32(ERROR_SHARING_VIOLATION) - The pin is already associated with a change counter. That change counter must be disposed before the pin can be associated with a new change counter.
     * * E_ACCESSDENIED - The pin is not opened in Exclusive mode.
     * @param {GpioPin} pin The pin on which to count changes. This pin must have been opened in Exclusive mode, and cannot be associated with another GpioChangeCounter.
     * @returns {GpioChangeCounter} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangecounter.#ctor
     */
    static Create(pin) {
        if (!GpioChangeCounter.HasProp("__IGpioChangeCounterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Gpio.GpioChangeCounter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGpioChangeCounterFactory.IID)
            GpioChangeCounter.__IGpioChangeCounterFactory := IGpioChangeCounterFactory(factoryPtr)
        }

        return GpioChangeCounter.__IGpioChangeCounterFactory.Create(pin)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the polarity of transitions that will be counted. The polarity may only be changed when pin counting is not started.
     * @remarks
     * The default polarity value is Falling. See [GpioChangePolarity](gpiochangepolarity.md) for more information on polarity values. Counting a single edge can be considerably more efficient than counting both edges.
     * 
     * The following exceptions can be thrown when setting the polarity:
     * 
     * * E_INVALIDARG - value is not a valid [GpioChangePolarity](gpiochangepolarity.md) value.
     * * HRESULT_FROM_WIN32(ERROR_BAD_COMMAND) - change counting is currently active. Polarity can only be set before calling [Start()](gpiochangecounter_start_1587696324.md) or after calling [Stop()](gpiochangecounter_stop_1201535524.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangecounter.polarity
     * @type {Integer} 
     */
    Polarity {
        get => this.get_Polarity()
        set => this.put_Polarity(value)
    }

    /**
     * Gets whether pin change counting is currently active.
     * @remarks
     * Returns TRUE if pin change counting is active, and FALSE otherwise.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangecounter.isstarted
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
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Polarity(value) {
        if (!this.HasProp("__IGpioChangeCounter")) {
            if ((queryResult := this.QueryInterface(IGpioChangeCounter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeCounter := IGpioChangeCounter(outPtr)
        }

        return this.__IGpioChangeCounter.put_Polarity(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Polarity() {
        if (!this.HasProp("__IGpioChangeCounter")) {
            if ((queryResult := this.QueryInterface(IGpioChangeCounter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeCounter := IGpioChangeCounter(outPtr)
        }

        return this.__IGpioChangeCounter.get_Polarity()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStarted() {
        if (!this.HasProp("__IGpioChangeCounter")) {
            if ((queryResult := this.QueryInterface(IGpioChangeCounter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeCounter := IGpioChangeCounter(outPtr)
        }

        return this.__IGpioChangeCounter.get_IsStarted()
    }

    /**
     * Starts counting changes in pin polarity. This method may only be called when change counting is not already active.
     * @remarks
     * Calling Start() may enable or reconfigure interrupts for the pin.
     * 
     * The following exceptions can be thrown by this method:
     * 
     * * HRESULT_FROM_WIN32(ERROR_BAD_COMMAND) - change counting has already been started.
     * * HRESULT_FROM_WIN32(ERROR_INVALID_HANDLE) - the change counter or the associated pin has been disposed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangecounter.start
     */
    Start() {
        if (!this.HasProp("__IGpioChangeCounter")) {
            if ((queryResult := this.QueryInterface(IGpioChangeCounter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeCounter := IGpioChangeCounter(outPtr)
        }

        return this.__IGpioChangeCounter.Start()
    }

    /**
     * Stop counting changes in pin polarity. This method may only be called when change counting is currently active.
     * @remarks
     * Calling Stop() may disable or reconfigure interrupts for the pin.
     * 
     * The following exceptions can be thrown by this method:
     * 
     * * HRESULT_FROM_WIN32(ERROR_BAD_COMMAND) - change counting is not currently active.
     * * HRESULT_FROM_WIN32(ERROR_INVALID_HANDLE) - the change counter or the associated pin has been disposed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangecounter.stop
     */
    Stop() {
        if (!this.HasProp("__IGpioChangeCounter")) {
            if ((queryResult := this.QueryInterface(IGpioChangeCounter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeCounter := IGpioChangeCounter(outPtr)
        }

        return this.__IGpioChangeCounter.Stop()
    }

    /**
     * Reads the current count of polarity changes. Before counting has been started, this will return 0.
     * @remarks
     * The following exception can be thrown by this method:
     * 
     * * HRESULT_FROM_WIN32(ERROR_INVALID_HANDLE) - the change counter or the associated pin has been disposed.
     * @returns {GpioChangeCount} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangecounter.read
     */
    Read() {
        if (!this.HasProp("__IGpioChangeCounter")) {
            if ((queryResult := this.QueryInterface(IGpioChangeCounter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeCounter := IGpioChangeCounter(outPtr)
        }

        return this.__IGpioChangeCounter.Read()
    }

    /**
     * Resets the count to 0 and returns the previous count.
     * @remarks
     * The following exception can be thrown by this method:
     * 
     * * HRESULT_FROM_WIN32(ERROR_INVALID_HANDLE) - the change counter or the associated pin has been disposed.
     * @returns {GpioChangeCount} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangecounter.reset
     */
    Reset() {
        if (!this.HasProp("__IGpioChangeCounter")) {
            if ((queryResult := this.QueryInterface(IGpioChangeCounter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioChangeCounter := IGpioChangeCounter(outPtr)
        }

        return this.__IGpioChangeCounter.Reset()
    }

    /**
     * Closes the change counter, disassociating it from its pin.
     * @remarks
     * If change counting is active for this counter, calling this method will also stop it.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiochangecounter.close
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
