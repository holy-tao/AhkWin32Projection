#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStandardPrintTaskOptionsStatic3.ahk
#Include .\IStandardPrintTaskOptionsStatic.ahk
#Include .\IStandardPrintTaskOptionsStatic2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the canonical names for the options represented by the [PrintTaskOptions](printtaskoptions.md) class. You can use the StandardPrintTaskOptions class to identify print options displayed in the user experience or to retrieve specific options using the [PrintTaskOptionDetails](../windows.graphics.printing.optiondetails/printtaskoptiondetails.md) class.
 * @remarks
 * The StandardPrintTaskOptions class provides the canonical names for the common print task options used in the [PrintTaskOptions](printtaskoptions.md) object. These names may be used to add or remove items from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate the options that appear in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). These names may also be used with the [PrintTaskOptionDetails](../windows.graphics.printing.optiondetails/printtaskoptiondetails.md) object to locate the standard options in the list of options. These names are considered to be unique, and any attempt to create options of the same name will be rejected.
 * 
 * Here is a code snippet that you could use, for example, to append the standard print task options to be displayed in the UI:
 * 
 * ```csharp
 * // Choose the printer options to be shown.
 * // The order in which the options are appended determines the order in which they appear in the UI
 * displayedOptions.Clear();
 * displayedOptions.Add(Windows.Graphics.Printing.StandardPrintTaskOptions.Copies);
 * displayedOptions.Add(Windows.Graphics.Printing.StandardPrintTaskOptions.Orientation);
 * displayedOptions.Add(Windows.Graphics.Printing.StandardPrintTaskOptions.MediaSize);
 * displayedOptions.Add(Windows.Graphics.Printing.StandardPrintTaskOptions.Collation);
 * displayedOptions.Add(Windows.Graphics.Printing.StandardPrintTaskOptions.Duplex);
 * ```
 * 
 * For more information on this and other printing scenarios, see [Printing](/windows/uwp/devices-sensors/print-from-your-app) and the [UWP print sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Printing).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class StandardPrintTaskOptions extends IInspectable {
;@region Static Properties
    /**
     * Gets the canonical name for the custom page ranges option for the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the custom page ranges option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the custom page ranges option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). This property only applies to printers that support the custom page ranges capability.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.custompageranges
     * @type {HSTRING} 
     */
    static CustomPageRanges {
        get => StandardPrintTaskOptions.get_CustomPageRanges()
    }

    /**
     * Gets the canonical name for the media size option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the media size (or paper size) option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the media size option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.mediasize
     * @type {HSTRING} 
     */
    static MediaSize {
        get => StandardPrintTaskOptions.get_MediaSize()
    }

    /**
     * Gets the canonical name for the media type option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the media type (or paper type) option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the media type option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.mediatype
     * @type {HSTRING} 
     */
    static MediaType {
        get => StandardPrintTaskOptions.get_MediaType()
    }

    /**
     * Gets the canonical name for the orientation option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the orientation option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the orientation option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.orientation
     * @type {HSTRING} 
     */
    static Orientation {
        get => StandardPrintTaskOptions.get_Orientation()
    }

    /**
     * Gets the canonical name for the print quality option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the print quality option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the print quality option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). This property only applies to printers that support the print quality capability.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.printquality
     * @type {HSTRING} 
     */
    static PrintQuality {
        get => StandardPrintTaskOptions.get_PrintQuality()
    }

    /**
     * Gets the canonical name for color mode option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the color mode option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the color mode option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). This property only applies to printers that support the color mode capability.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.colormode
     * @type {HSTRING} 
     */
    static ColorMode {
        get => StandardPrintTaskOptions.get_ColorMode()
    }

    /**
     * Gets the canonical name for the duplex option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the duplex option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the duplex option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). This property only applies to printers that support the duplex capability.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.duplex
     * @type {HSTRING} 
     */
    static Duplex {
        get => StandardPrintTaskOptions.get_Duplex()
    }

    /**
     * Gets the canonical name for collation option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the collation option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the collation option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). This property only applies to printers that support the collation capability.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.collation
     * @type {HSTRING} 
     */
    static Collation {
        get => StandardPrintTaskOptions.get_Collation()
    }

    /**
     * Gets the canonical name for the staple option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the staple option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the staple option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). This property only applies to printers that support the staple capability.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.staple
     * @type {HSTRING} 
     */
    static Staple {
        get => StandardPrintTaskOptions.get_Staple()
    }

    /**
     * Gets the canonical name for the hole punch option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the hole punch option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the hole punch option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). This property only applies to printers that support the hole punch capability.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.holepunch
     * @type {HSTRING} 
     */
    static HolePunch {
        get => StandardPrintTaskOptions.get_HolePunch()
    }

    /**
     * Gets the canonical name for the binding option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the document binding option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the document binding option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). This property only applies to printers that support the document binding capability.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.binding
     * @type {HSTRING} 
     */
    static Binding {
        get => StandardPrintTaskOptions.get_Binding()
    }

    /**
     * Gets the canonical name for the copies option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the copies option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the copies option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.copies
     * @type {HSTRING} 
     */
    static Copies {
        get => StandardPrintTaskOptions.get_Copies()
    }

    /**
     * Gets the canonical name for the NUp (pages per sheet) option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the NUp (pages per sheet) option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the pages per sheet option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). This property only applies to printers that support the pages per sheet capability.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.nup
     * @type {HSTRING} 
     */
    static NUp {
        get => StandardPrintTaskOptions.get_NUp()
    }

    /**
     * Gets the canonical name for the input bin option of the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the input bin (or paper tray) option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the input bin option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.inputbin
     * @type {HSTRING} 
     */
    static InputBin {
        get => StandardPrintTaskOptions.get_InputBin()
    }

    /**
     * Gets the canonical name of the bordering option for the print task.
     * @remarks
     * Use this property to get the canonical name to add or remove the bordering option from the [PrintTaskOptions.DisplayedOptions](printtaskoptions_displayedoptions.md) list to indicate whether the bordering option appears in the print preview UI. For more information, see [Customize the print preview UI](/windows/uwp/devices-sensors/customize-the-print-preview-ui). This property only applies to printers that support the bordering capability (for example, to print borders or no borders).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.standardprinttaskoptions.bordering
     * @type {HSTRING} 
     */
    static Bordering {
        get => StandardPrintTaskOptions.get_Bordering()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CustomPageRanges() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic3")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic3.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic3 := IStandardPrintTaskOptionsStatic3(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic3.get_CustomPageRanges()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MediaSize() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_MediaSize()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MediaType() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_MediaType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Orientation() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_Orientation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PrintQuality() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_PrintQuality()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ColorMode() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_ColorMode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Duplex() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_Duplex()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Collation() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_Collation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Staple() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_Staple()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HolePunch() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_HolePunch()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Binding() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_Binding()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Copies() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_Copies()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NUp() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_NUp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_InputBin() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic := IStandardPrintTaskOptionsStatic(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic.get_InputBin()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Bordering() {
        if (!StandardPrintTaskOptions.HasProp("__IStandardPrintTaskOptionsStatic2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.StandardPrintTaskOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardPrintTaskOptionsStatic2.IID)
            StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic2 := IStandardPrintTaskOptionsStatic2(factoryPtr)
        }

        return StandardPrintTaskOptions.__IStandardPrintTaskOptionsStatic2.get_Bordering()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
