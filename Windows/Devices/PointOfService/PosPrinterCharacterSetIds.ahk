#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPosPrinterCharacterSetIdsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the set of identifiers for the character sets that a point-of-service printer can use.
 * @remarks
 * This class consists entirely of static members, so you do not need to create an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercharactersetids
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterCharacterSetIds extends IInspectable {
;@region Static Properties
    /**
     * Gets the identifier for the UTF16LE character set.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercharactersetids.utf16le
     * @type {Integer} 
     */
    static Utf16LE {
        get => PosPrinterCharacterSetIds.get_Utf16LE()
    }

    /**
     * Gets the identifier for the ASCII character set.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercharactersetids.ascii
     * @type {Integer} 
     */
    static Ascii {
        get => PosPrinterCharacterSetIds.get_Ascii()
    }

    /**
     * Gets the identifier for the ANSI character set.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintercharactersetids.ansi
     * @type {Integer} 
     */
    static Ansi {
        get => PosPrinterCharacterSetIds.get_Ansi()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Utf16LE() {
        if (!PosPrinterCharacterSetIds.HasProp("__IPosPrinterCharacterSetIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.PosPrinterCharacterSetIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPosPrinterCharacterSetIdsStatics.IID)
            PosPrinterCharacterSetIds.__IPosPrinterCharacterSetIdsStatics := IPosPrinterCharacterSetIdsStatics(factoryPtr)
        }

        return PosPrinterCharacterSetIds.__IPosPrinterCharacterSetIdsStatics.get_Utf16LE()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ascii() {
        if (!PosPrinterCharacterSetIds.HasProp("__IPosPrinterCharacterSetIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.PosPrinterCharacterSetIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPosPrinterCharacterSetIdsStatics.IID)
            PosPrinterCharacterSetIds.__IPosPrinterCharacterSetIdsStatics := IPosPrinterCharacterSetIdsStatics(factoryPtr)
        }

        return PosPrinterCharacterSetIds.__IPosPrinterCharacterSetIdsStatics.get_Ascii()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ansi() {
        if (!PosPrinterCharacterSetIds.HasProp("__IPosPrinterCharacterSetIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.PosPrinterCharacterSetIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPosPrinterCharacterSetIdsStatics.IID)
            PosPrinterCharacterSetIds.__IPosPrinterCharacterSetIdsStatics := IPosPrinterCharacterSetIdsStatics(factoryPtr)
        }

        return PosPrinterCharacterSetIds.__IPosPrinterCharacterSetIdsStatics.get_Ansi()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
