#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIppResolution.ahk
#Include .\IIppResolutionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about a `resolution` attribute as defined by the [Internet Printing Protocol (IPP) specification](https://tools.ietf.org/html/rfc8011).
 * @remarks
 * For more information about this class, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippresolution
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppResolution extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIppResolution

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIppResolution.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [IppResolution](ippresolution.md) class with the specified values. This object represents information about a `resolution` attribute as defined by the Internet Printing Protocol (IPP).
     * @param {Integer} width The width of the `resolution` attribute.
     * @param {Integer} height The height of the `resolution` attribute.
     * @param {Integer} unit_ The unit of the `resolution` attribute.
     * @returns {IppResolution} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippresolution.#ctor
     */
    static CreateInstance(width, height, unit_) {
        if (!IppResolution.HasProp("__IIppResolutionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppResolution")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppResolutionFactory.IID)
            IppResolution.__IIppResolutionFactory := IIppResolutionFactory(factoryPtr)
        }

        return IppResolution.__IIppResolutionFactory.CreateInstance(width, height, unit_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the width of the `resolution` attribute (as defined by the Internet Printing Protocol (IPP)) that is represented by the current [IppResolution](ippresolution.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippresolution.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of the `resolution` attribute (as defined by the Internet Printing Protocol (IPP)) that is represented by the current [IppResolution](ippresolution.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippresolution.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the unit of the `resolution` attribute (as defined by the Internet Printing Protocol (IPP)) that is represented by the current [IppResolution](ippresolution.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippresolution.unit
     * @type {Integer} 
     */
    Unit {
        get => this.get_Unit()
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
    get_Width() {
        if (!this.HasProp("__IIppResolution")) {
            if ((queryResult := this.QueryInterface(IIppResolution.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppResolution := IIppResolution(outPtr)
        }

        return this.__IIppResolution.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IIppResolution")) {
            if ((queryResult := this.QueryInterface(IIppResolution.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppResolution := IIppResolution(outPtr)
        }

        return this.__IIppResolution.get_Height()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unit() {
        if (!this.HasProp("__IIppResolution")) {
            if ((queryResult := this.QueryInterface(IIppResolution.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppResolution := IIppResolution(outPtr)
        }

        return this.__IIppResolution.get_Unit()
    }

;@endregion Instance Methods
}
