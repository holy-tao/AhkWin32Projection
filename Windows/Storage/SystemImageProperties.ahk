#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemImageProperties.ahk
#Include ..\..\Guid.ahk

/**
 * A helper object that provides indexing names for [Windows image file properties](/windows/desktop/properties/image-bumper).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.systemimageproperties
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SystemImageProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemImageProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemImageProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the [System.Image.HorizontalSize](/windows/desktop/properties/props-system-image-horizontalsize) property (one of the [Windows image file properties](/windows/desktop/properties/image-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemimageproperties.horizontalsize
     * @type {HSTRING} 
     */
    HorizontalSize {
        get => this.get_HorizontalSize()
    }

    /**
     * Gets the name of the [System.Image.VerticalSize](/windows/desktop/properties/props-system-image-verticalsize) property (one of the [Windows image file properties](/windows/desktop/properties/image-bumper)).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemimageproperties.verticalsize
     * @type {HSTRING} 
     */
    VerticalSize {
        get => this.get_VerticalSize()
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
    get_HorizontalSize() {
        if (!this.HasProp("__ISystemImageProperties")) {
            if ((queryResult := this.QueryInterface(ISystemImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemImageProperties := ISystemImageProperties(outPtr)
        }

        return this.__ISystemImageProperties.get_HorizontalSize()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VerticalSize() {
        if (!this.HasProp("__ISystemImageProperties")) {
            if ((queryResult := this.QueryInterface(ISystemImageProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemImageProperties := ISystemImageProperties(outPtr)
        }

        return this.__ISystemImageProperties.get_VerticalSize()
    }

;@endregion Instance Methods
}
