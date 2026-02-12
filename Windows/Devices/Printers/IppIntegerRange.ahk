#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIppIntegerRange.ahk
#Include .\IIppIntegerRangeFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about a `rangeOfInteger` attribute as defined by the [Internet Printing Protocol (IPP) specification](https://tools.ietf.org/html/rfc8011).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippintegerrange
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppIntegerRange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIppIntegerRange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIppIntegerRange.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [IppIntegerRange](ippintegerrange.md) class with the specified values. This object represents information about a `rangeOfInteger` attribute as defined by the Internet Printing Protocol (IPP).
     * @param {Integer} start The lower bound of the integer range (inclusive).
     * @param {Integer} end The upper bound of the integer range (inclusive).
     * @returns {IppIntegerRange} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippintegerrange.#ctor
     */
    static CreateInstance(start, end) {
        if (!IppIntegerRange.HasProp("__IIppIntegerRangeFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppIntegerRange")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppIntegerRangeFactory.IID)
            IppIntegerRange.__IIppIntegerRangeFactory := IIppIntegerRangeFactory(factoryPtr)
        }

        return IppIntegerRange.__IIppIntegerRangeFactory.CreateInstance(start, end)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the lower bound (inclusive) of the `rangeOfInteger` attribute (as defined by the Internet Printing Protocol (IPP)) that is represented by the current [IppIntegerRange](ippintegerrange.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippintegerrange.start
     * @type {Integer} 
     */
    Start {
        get => this.get_Start()
    }

    /**
     * Gets the upper bound (inclusive) of the `rangeOfInteger` attribute (as defined by the Internet Printing Protocol (IPP)) that is represented by the current [IppIntegerRange](ippintegerrange.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippintegerrange.end
     * @type {Integer} 
     */
    End {
        get => this.get_End()
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
    get_Start() {
        if (!this.HasProp("__IIppIntegerRange")) {
            if ((queryResult := this.QueryInterface(IIppIntegerRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppIntegerRange := IIppIntegerRange(outPtr)
        }

        return this.__IIppIntegerRange.get_Start()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_End() {
        if (!this.HasProp("__IIppIntegerRange")) {
            if ((queryResult := this.QueryInterface(IIppIntegerRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppIntegerRange := IIppIntegerRange(outPtr)
        }

        return this.__IIppIntegerRange.get_End()
    }

;@endregion Instance Methods
}
