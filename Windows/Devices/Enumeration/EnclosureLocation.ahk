#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEnclosureLocation.ahk
#Include .\IEnclosureLocation2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the physical location of a device in its enclosure.
 * @remarks
 * The [EnclosureLocation](deviceinformation_enclosurelocation.md) property returns this object.
 * 
 * If the physical location of a device within its enclosure is unknown, the [inDock](enclosurelocation_indock.md) and [inLid](enclosurelocation_inlid.md) properties are false and the [Panel](enclosurelocation_panel.md) property has the value **Unknown**.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.enclosurelocation
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class EnclosureLocation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEnclosureLocation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEnclosureLocation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether the device is physically located in the docking station of the portable computer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.enclosurelocation.indock
     * @type {Boolean} 
     */
    InDock {
        get => this.get_InDock()
    }

    /**
     * Indicates whether the device is physically located in the lid of the portable computer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.enclosurelocation.inlid
     * @type {Boolean} 
     */
    InLid {
        get => this.get_InLid()
    }

    /**
     * Indicates which panel of the computer the device is physically located on.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.enclosurelocation.panel
     * @type {Integer} 
     */
    Panel {
        get => this.get_Panel()
    }

    /**
     * Gets the physical degree of rotation for a device in its enclosure.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.enclosurelocation.rotationangleindegreesclockwise
     * @type {Integer} 
     */
    RotationAngleInDegreesClockwise {
        get => this.get_RotationAngleInDegreesClockwise()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InDock() {
        if (!this.HasProp("__IEnclosureLocation")) {
            if ((queryResult := this.QueryInterface(IEnclosureLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnclosureLocation := IEnclosureLocation(outPtr)
        }

        return this.__IEnclosureLocation.get_InDock()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InLid() {
        if (!this.HasProp("__IEnclosureLocation")) {
            if ((queryResult := this.QueryInterface(IEnclosureLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnclosureLocation := IEnclosureLocation(outPtr)
        }

        return this.__IEnclosureLocation.get_InLid()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Panel() {
        if (!this.HasProp("__IEnclosureLocation")) {
            if ((queryResult := this.QueryInterface(IEnclosureLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnclosureLocation := IEnclosureLocation(outPtr)
        }

        return this.__IEnclosureLocation.get_Panel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RotationAngleInDegreesClockwise() {
        if (!this.HasProp("__IEnclosureLocation2")) {
            if ((queryResult := this.QueryInterface(IEnclosureLocation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnclosureLocation2 := IEnclosureLocation2(outPtr)
        }

        return this.__IEnclosureLocation2.get_RotationAngleInDegreesClockwise()
    }

;@endregion Instance Methods
}
