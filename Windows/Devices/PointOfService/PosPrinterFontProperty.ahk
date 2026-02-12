#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPosPrinterFontProperty.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the property of a specific point-of-service printer font.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterfontproperty
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterFontProperty extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPosPrinterFontProperty

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPosPrinterFontProperty.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the typeface of the point-of-service printer font.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterfontproperty.typeface
     * @type {HSTRING} 
     */
    TypeFace {
        get => this.get_TypeFace()
    }

    /**
     * Gets whether the point-of-service printer font is scalable to any size.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterfontproperty.isscalabletoanysize
     * @type {Boolean} 
     */
    IsScalableToAnySize {
        get => this.get_IsScalableToAnySize()
    }

    /**
     * Gets the list of character sizes of the point-of-service printer font.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterfontproperty.charactersizes
     * @type {IVectorView<SizeUInt32>} 
     */
    CharacterSizes {
        get => this.get_CharacterSizes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TypeFace() {
        if (!this.HasProp("__IPosPrinterFontProperty")) {
            if ((queryResult := this.QueryInterface(IPosPrinterFontProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterFontProperty := IPosPrinterFontProperty(outPtr)
        }

        return this.__IPosPrinterFontProperty.get_TypeFace()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScalableToAnySize() {
        if (!this.HasProp("__IPosPrinterFontProperty")) {
            if ((queryResult := this.QueryInterface(IPosPrinterFontProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterFontProperty := IPosPrinterFontProperty(outPtr)
        }

        return this.__IPosPrinterFontProperty.get_IsScalableToAnySize()
    }

    /**
     * 
     * @returns {IVectorView<SizeUInt32>} 
     */
    get_CharacterSizes() {
        if (!this.HasProp("__IPosPrinterFontProperty")) {
            if ((queryResult := this.QueryInterface(IPosPrinterFontProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterFontProperty := IPosPrinterFontProperty(outPtr)
        }

        return this.__IPosPrinterFontProperty.get_CharacterSizes()
    }

;@endregion Instance Methods
}
