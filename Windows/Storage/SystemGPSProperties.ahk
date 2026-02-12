#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemGPSProperties.ahk
#Include ..\..\Guid.ahk

/**
 * A helper object that provides indexing names for [GPS file properties](/windows/desktop/properties/gps-bumper).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.systemgpsproperties
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SystemGPSProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemGPSProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemGPSProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the property (one of the [GPS file properties](/windows/desktop/properties/props-system-gps-latitudedecimal).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemgpsproperties.latitudedecimal
     * @type {HSTRING} 
     */
    LatitudeDecimal {
        get => this.get_LatitudeDecimal()
    }

    /**
     * Gets the name of the property (one of the [GPS file properties](/windows/desktop/properties/props-system-gps-longitudedecimal).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemgpsproperties.longitudedecimal
     * @type {HSTRING} 
     */
    LongitudeDecimal {
        get => this.get_LongitudeDecimal()
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
    get_LatitudeDecimal() {
        if (!this.HasProp("__ISystemGPSProperties")) {
            if ((queryResult := this.QueryInterface(ISystemGPSProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemGPSProperties := ISystemGPSProperties(outPtr)
        }

        return this.__ISystemGPSProperties.get_LatitudeDecimal()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LongitudeDecimal() {
        if (!this.HasProp("__ISystemGPSProperties")) {
            if ((queryResult := this.QueryInterface(ISystemGPSProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemGPSProperties := ISystemGPSProperties(outPtr)
        }

        return this.__ISystemGPSProperties.get_LongitudeDecimal()
    }

;@endregion Instance Methods
}
