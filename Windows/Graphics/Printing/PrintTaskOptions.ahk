#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskOptionsCore.ahk
#Include .\IPrintTaskOptionsCoreProperties.ahk
#Include .\IPrintTaskOptionsCoreUIConfiguration.ahk
#Include .\IPrintTaskOptions.ahk
#Include .\IPrintTaskOptions2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of methods and properties for managing the options which define how the content is to be printed.
 * @remarks
 * The PrintTaskOptions class provides access to the different values that define how the content in the print task is to be formatted during printing. The PrintTaskOptions object may contain information like the size of the printed page, its orientation, and the type of media on which the content will be printed. In addition the PrintTaskOptions object provides access to the list of options to be displayed in the print window.
 * 
 * While each option in PrintTaskOptions, for example [MediaSize](printtaskoptions_mediasize.md) or [MediaType](printmediatype.md), has a specific set of supported values, all the options support the same general pattern for representing some common cases. The common case values are *Default*, *NotAvailable* and *PrinterCustom*.
 * 
 * Each option contains a default value, and it is the value that is assigned to the option by the print target. When this value is retrieved via a property access, it is an indication that the print target has not yet determined the actual value for this option. When you set the default value for a particular option, it indicates to the print target that it must use the default value that it has for that option. If there is no default value for that option, then the option value is unchanged.
 * 
 * An option may also report a *NotAvailable* value. This indicates that the specific option is not available for the currently selected print target. For example, if the Duplex property returns a *NotAvailable* value, it indicates that the print target does not support duplex functionality. It is not possible to set an option to the *NotAvailable* value.
 * 
 * The final value that is common to all options is *PrinterCustom*. This indicates that the print target supports the functionality but the current selection is custom to this printer. For example, a print target may support a special method for binding the document that is not one of the standard values. In this case a property query on the Binding option will return the *PrinterCustom* value. Custom output sizes will also be represented as *PrinterCustom* values but the actual physical sizes will still be available via the [GetPageDescription](printtaskoptions_getpagedescription_1541239181.md) method.
 * 
 * An app may also use PrintTaskOptions to customize the options that appear in the print window. The [DisplayedOptions](printtaskoptions_displayedoptions.md) property returns a vector containing the list of option items that will be displayed. Modifications to this list by inserting, appending, removing, or re-ordering options will be reflected in the print window. If a particular print target does not support an option, the option will not be displayed to the user. For the names of the standard options, see [StandardPrintTaskOptions](standardprinttaskoptions.md).
 * 
 * Here is a code snippet that you could use, for example, to set the printed output to color, and also to set the size of the media on which it can be printed. The `PrintTaskOptions` object is accessed through the [PrintTask.Options](printtask_options.md) property.
 * 
 * ```csharp
 * // Set output to color
 * printTask.Options.ColorMode = PrintColorMode.Color;
 * 
 * // Set the media size for printing
 * printTask.Options.MediaSize = PrintMediaSize.NorthAmericaLegal;
 * 
 * ```
 * 
 * For more information about the allowed values for these print task options see [PrintColorMode](printcolormode.md) and [PrintMediaSize](printmediasize.md).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintTaskOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskOptionsCore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskOptionsCore.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the media size option of the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.mediasize
     * @type {Integer} 
     */
    MediaSize {
        get => this.get_MediaSize()
        set => this.put_MediaSize(value)
    }

    /**
     * Gets or sets the media type option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.mediatype
     * @type {Integer} 
     */
    MediaType {
        get => this.get_MediaType()
        set => this.put_MediaType(value)
    }

    /**
     * Gets or sets the orientation option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets the print quality option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.printquality
     * @type {Integer} 
     */
    PrintQuality {
        get => this.get_PrintQuality()
        set => this.put_PrintQuality(value)
    }

    /**
     * Gets or sets the color mode option of the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.colormode
     * @type {Integer} 
     */
    ColorMode {
        get => this.get_ColorMode()
        set => this.put_ColorMode(value)
    }

    /**
     * Gets or sets the duplex option of the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.duplex
     * @type {Integer} 
     */
    Duplex {
        get => this.get_Duplex()
        set => this.put_Duplex(value)
    }

    /**
     * Gets or sets the collation option of the print tasks.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.collation
     * @type {Integer} 
     */
    Collation {
        get => this.get_Collation()
        set => this.put_Collation(value)
    }

    /**
     * Gets or sets the staple option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.staple
     * @type {Integer} 
     */
    Staple {
        get => this.get_Staple()
        set => this.put_Staple(value)
    }

    /**
     * Gets or sets the hole punch option of the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.holepunch
     * @type {Integer} 
     */
    HolePunch {
        get => this.get_HolePunch()
        set => this.put_HolePunch(value)
    }

    /**
     * Gets or sets the binding option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.binding
     * @type {Integer} 
     */
    Binding {
        get => this.get_Binding()
        set => this.put_Binding(value)
    }

    /**
     * Gets the minimum number of copies allowed for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.mincopies
     * @type {Integer} 
     */
    MinCopies {
        get => this.get_MinCopies()
    }

    /**
     * Gets the maximum number of copies supported for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.maxcopies
     * @type {Integer} 
     */
    MaxCopies {
        get => this.get_MaxCopies()
    }

    /**
     * Gets or sets the value for the number of copies for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.numberofcopies
     * @type {Integer} 
     */
    NumberOfCopies {
        get => this.get_NumberOfCopies()
        set => this.put_NumberOfCopies(value)
    }

    /**
     * Gets the list of options displayed for the print experience.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.displayedoptions
     * @type {IVector<HSTRING>} 
     */
    DisplayedOptions {
        get => this.get_DisplayedOptions()
    }

    /**
     * Gets or sets the bordering option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.bordering
     * @type {Integer} 
     */
    Bordering {
        get => this.get_Bordering()
        set => this.put_Bordering(value)
    }

    /**
     * Gets the page range options for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.pagerangeoptions
     * @type {PrintPageRangeOptions} 
     */
    PageRangeOptions {
        get => this.get_PageRangeOptions()
    }

    /**
     * Gets the custom page range options for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.custompageranges
     * @type {IVector<PrintPageRange>} 
     */
    CustomPageRanges {
        get => this.get_CustomPageRanges()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves the physical dimensions of the printed page.
     * @param {Integer} jobPageNumber The page number.
     * @returns {PrintPageDescription} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.getpagedescription
     */
    GetPageDescription(jobPageNumber) {
        if (!this.HasProp("__IPrintTaskOptionsCore")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCore := IPrintTaskOptionsCore(outPtr)
        }

        return this.__IPrintTaskOptionsCore.GetPageDescription(jobPageNumber)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MediaSize(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_MediaSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaSize() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_MediaSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MediaType(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_MediaType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaType() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_MediaType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_Orientation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrintQuality(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_PrintQuality(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrintQuality() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_PrintQuality()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorMode(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_ColorMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorMode() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_ColorMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Duplex(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_Duplex(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Duplex() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_Duplex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Collation(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_Collation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Collation() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_Collation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Staple(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_Staple(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Staple() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_Staple()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HolePunch(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_HolePunch(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HolePunch() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_HolePunch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Binding(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_Binding(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Binding() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_Binding()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinCopies() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_MinCopies()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxCopies() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_MaxCopies()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NumberOfCopies(value) {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.put_NumberOfCopies(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfCopies() {
        if (!this.HasProp("__IPrintTaskOptionsCoreProperties")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreProperties := IPrintTaskOptionsCoreProperties(outPtr)
        }

        return this.__IPrintTaskOptionsCoreProperties.get_NumberOfCopies()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DisplayedOptions() {
        if (!this.HasProp("__IPrintTaskOptionsCoreUIConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreUIConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreUIConfiguration := IPrintTaskOptionsCoreUIConfiguration(outPtr)
        }

        return this.__IPrintTaskOptionsCoreUIConfiguration.get_DisplayedOptions()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Bordering(value) {
        if (!this.HasProp("__IPrintTaskOptions")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptions := IPrintTaskOptions(outPtr)
        }

        return this.__IPrintTaskOptions.put_Bordering(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bordering() {
        if (!this.HasProp("__IPrintTaskOptions")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptions := IPrintTaskOptions(outPtr)
        }

        return this.__IPrintTaskOptions.get_Bordering()
    }

    /**
     * Retrieves the physical dimensions and formatting data of a printed page.
     * @param {PrintPageInfo} printPageInfo_ The formatting data for a given print section.
     * @returns {IRandomAccessStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskoptions.getpageprintticket
     */
    GetPagePrintTicket(printPageInfo_) {
        if (!this.HasProp("__IPrintTaskOptions")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptions := IPrintTaskOptions(outPtr)
        }

        return this.__IPrintTaskOptions.GetPagePrintTicket(printPageInfo_)
    }

    /**
     * 
     * @returns {PrintPageRangeOptions} 
     */
    get_PageRangeOptions() {
        if (!this.HasProp("__IPrintTaskOptions2")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptions2 := IPrintTaskOptions2(outPtr)
        }

        return this.__IPrintTaskOptions2.get_PageRangeOptions()
    }

    /**
     * 
     * @returns {IVector<PrintPageRange>} 
     */
    get_CustomPageRanges() {
        if (!this.HasProp("__IPrintTaskOptions2")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptions2 := IPrintTaskOptions2(outPtr)
        }

        return this.__IPrintTaskOptions2.get_CustomPageRanges()
    }

;@endregion Instance Methods
}
