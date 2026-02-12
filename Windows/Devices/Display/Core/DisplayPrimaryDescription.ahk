#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayPrimaryDescription.ahk
#Include .\IDisplayPrimaryDescriptionStatics.ahk
#Include .\IDisplayPrimaryDescriptionFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes a set of properties that are used for allocating [DisplaySurface](displaysurface.md) objects using [CreatePrimary](displaydevice_createprimary_269038610.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayprimarydescription
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayPrimaryDescription extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayPrimaryDescription

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayPrimaryDescription.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a primary description with the specified standard properties, as well as extra properties.
     * @param {IIterable<IKeyValuePair<Guid, IInspectable>>} extraProperties Reserved for future use.
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} pixelFormat 
     * @param {Integer} colorSpace 
     * @param {Boolean} isStereo 
     * @param {Direct3DMultisampleDescription} multisampleDescription 
     * @returns {DisplayPrimaryDescription} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayprimarydescription.createwithproperties
     */
    static CreateWithProperties(extraProperties, width, height, pixelFormat, colorSpace, isStereo, multisampleDescription) {
        if (!DisplayPrimaryDescription.HasProp("__IDisplayPrimaryDescriptionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.Core.DisplayPrimaryDescription")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPrimaryDescriptionStatics.IID)
            DisplayPrimaryDescription.__IDisplayPrimaryDescriptionStatics := IDisplayPrimaryDescriptionStatics(factoryPtr)
        }

        return DisplayPrimaryDescription.__IDisplayPrimaryDescriptionStatics.CreateWithProperties(extraProperties, width, height, pixelFormat, colorSpace, isStereo, multisampleDescription)
    }

    /**
     * Creates a primary description with the specified standard properties.
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} pixelFormat 
     * @param {Integer} colorSpace 
     * @param {Boolean} isStereo 
     * @param {Direct3DMultisampleDescription} multisampleDescription 
     * @returns {DisplayPrimaryDescription} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayprimarydescription.#ctor
     */
    static CreateInstance(width, height, pixelFormat, colorSpace, isStereo, multisampleDescription) {
        if (!DisplayPrimaryDescription.HasProp("__IDisplayPrimaryDescriptionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.Core.DisplayPrimaryDescription")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPrimaryDescriptionFactory.IID)
            DisplayPrimaryDescription.__IDisplayPrimaryDescriptionFactory := IDisplayPrimaryDescriptionFactory(factoryPtr)
        }

        return DisplayPrimaryDescription.__IDisplayPrimaryDescriptionFactory.CreateInstance(width, height, pixelFormat, colorSpace, isStereo, multisampleDescription)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the width of a surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayprimarydescription.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of a surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayprimarydescription.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the DXGI-compatible format of a surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayprimarydescription.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * Gets the DXGI-compatible color space of a surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayprimarydescription.colorspace
     * @type {Integer} 
     */
    ColorSpace {
        get => this.get_ColorSpace()
    }

    /**
     * Gets a value indicating whether the description is of a stereoscopic 3D surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayprimarydescription.isstereo
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
    }

    /**
     * Gets the multisampling properties of a surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayprimarydescription.multisampledescription
     * @type {Direct3DMultisampleDescription} 
     */
    MultisampleDescription {
        get => this.get_MultisampleDescription()
    }

    /**
     * Reserved for future use.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayprimarydescription.properties
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
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
        if (!this.HasProp("__IDisplayPrimaryDescription")) {
            if ((queryResult := this.QueryInterface(IDisplayPrimaryDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPrimaryDescription := IDisplayPrimaryDescription(outPtr)
        }

        return this.__IDisplayPrimaryDescription.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IDisplayPrimaryDescription")) {
            if ((queryResult := this.QueryInterface(IDisplayPrimaryDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPrimaryDescription := IDisplayPrimaryDescription(outPtr)
        }

        return this.__IDisplayPrimaryDescription.get_Height()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        if (!this.HasProp("__IDisplayPrimaryDescription")) {
            if ((queryResult := this.QueryInterface(IDisplayPrimaryDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPrimaryDescription := IDisplayPrimaryDescription(outPtr)
        }

        return this.__IDisplayPrimaryDescription.get_Format()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorSpace() {
        if (!this.HasProp("__IDisplayPrimaryDescription")) {
            if ((queryResult := this.QueryInterface(IDisplayPrimaryDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPrimaryDescription := IDisplayPrimaryDescription(outPtr)
        }

        return this.__IDisplayPrimaryDescription.get_ColorSpace()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        if (!this.HasProp("__IDisplayPrimaryDescription")) {
            if ((queryResult := this.QueryInterface(IDisplayPrimaryDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPrimaryDescription := IDisplayPrimaryDescription(outPtr)
        }

        return this.__IDisplayPrimaryDescription.get_IsStereo()
    }

    /**
     * 
     * @returns {Direct3DMultisampleDescription} 
     */
    get_MultisampleDescription() {
        if (!this.HasProp("__IDisplayPrimaryDescription")) {
            if ((queryResult := this.QueryInterface(IDisplayPrimaryDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPrimaryDescription := IDisplayPrimaryDescription(outPtr)
        }

        return this.__IDisplayPrimaryDescription.get_MultisampleDescription()
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IDisplayPrimaryDescription")) {
            if ((queryResult := this.QueryInterface(IDisplayPrimaryDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayPrimaryDescription := IDisplayPrimaryDescription(outPtr)
        }

        return this.__IDisplayPrimaryDescription.get_Properties()
    }

;@endregion Instance Methods
}
