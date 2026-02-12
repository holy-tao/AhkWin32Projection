#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents properties and actions common to all type of claimed stations for a point-of-service printer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ICommonClaimedPosPrinterStation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommonClaimedPosPrinterStation
     * @type {Guid}
     */
    static IID => Guid("{b7eb66a8-fe8a-4cfb-8b42-e35b280cb27c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_CharactersPerLine", "get_CharactersPerLine", "put_LineHeight", "get_LineHeight", "put_LineSpacing", "get_LineSpacing", "get_LineWidth", "put_IsLetterQuality", "get_IsLetterQuality", "get_IsPaperNearEnd", "put_ColorCartridge", "get_ColorCartridge", "get_IsCoverOpen", "get_IsCartridgeRemoved", "get_IsCartridgeEmpty", "get_IsHeadCleaning", "get_IsPaperEmpty", "get_IsReadyToPrint", "ValidateData"]

    /**
     * Gets or sets the number of characters the station can print per line of text.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.charactersperline
     * @type {Integer} 
     */
    CharactersPerLine {
        get => this.get_CharactersPerLine()
        set => this.put_CharactersPerLine(value)
    }

    /**
     * Gets or sets the current height of the printed line for the printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.lineheight
     * @type {Integer} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * Gets or sets the spacing of each single-high print line for the printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies. This spacing includes both the height of printed line and of the white space between each pair of lines.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.linespacing
     * @type {Integer} 
     */
    LineSpacing {
        get => this.get_LineSpacing()
        set => this.put_LineSpacing(value)
    }

    /**
     * Gets the current width of the printed line for the printer station, in the units that the [ClaimedPosPrinter.MapMode](claimedposprinter_mapmode.md) property specifies.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.linewidth
     * @type {Integer} 
     */
    LineWidth {
        get => this.get_LineWidth()
    }

    /**
     * Gets or sets whether the printer station prints with high quality or high speed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.isletterquality
     * @type {Boolean} 
     */
    IsLetterQuality {
        get => this.get_IsLetterQuality()
        set => this.put_IsLetterQuality(value)
    }

    /**
     * Gets whether the printer station is almost out of paper.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.ispapernearend
     * @type {Boolean} 
     */
    IsPaperNearEnd {
        get => this.get_IsPaperNearEnd()
    }

    /**
     * Gets or sets the color cartridge that the printer station should use when it prints.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.colorcartridge
     * @type {Integer} 
     */
    ColorCartridge {
        get => this.get_ColorCartridge()
        set => this.put_ColorCartridge(value)
    }

    /**
     * Gets whether the cover of the printer station is currently open.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.iscoveropen
     * @type {Boolean} 
     */
    IsCoverOpen {
        get => this.get_IsCoverOpen()
    }

    /**
     * Gets whether the cartridge of the printer station is currently removed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.iscartridgeremoved
     * @type {Boolean} 
     */
    IsCartridgeRemoved {
        get => this.get_IsCartridgeRemoved()
    }

    /**
     * Gets whether the cartridge of the printer station is currently out of ink or toner.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.iscartridgeempty
     * @type {Boolean} 
     */
    IsCartridgeEmpty {
        get => this.get_IsCartridgeEmpty()
    }

    /**
     * Gets whether the printer station is currently cleaning its print head.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.isheadcleaning
     * @type {Boolean} 
     */
    IsHeadCleaning {
        get => this.get_IsHeadCleaning()
    }

    /**
     * Gets whether the printer station needs paper.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.ispaperempty
     * @type {Boolean} 
     */
    IsPaperEmpty {
        get => this.get_IsPaperEmpty()
    }

    /**
     * Gets whether the printer station is on and accepting print jobs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.isreadytoprint
     * @type {Boolean} 
     */
    IsReadyToPrint {
        get => this.get_IsReadyToPrint()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharactersPerLine(value) {
        result := ComCall(6, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharactersPerLine() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LineHeight(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineHeight() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LineSpacing(value) {
        result := ComCall(10, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineSpacing() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineWidth() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLetterQuality(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLetterQuality() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaperNearEnd() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorCartridge(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorCartridge() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCoverOpen() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCartridgeRemoved() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCartridgeEmpty() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHeadCleaning() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaperEmpty() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadyToPrint() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Determines whether a data sequence, possibly including one or more escape sequences, is valid for the printer station, before you use that data sequence when you call the [IPosPrinterJob.Print](iposprinterjob_print_1512698335.md) and [IPosPrinterJob.ExecuteAsync](iposprinterjob_executeasync_2108924004.md) methods.
     * @param {HSTRING} data The data sequence that you want to validate before you use it with the [IPosPrinterJob.Print](iposprinterjob_print_1512698335.md) method. This sequence may include printable data and escape sequences.
     * 
     * If the sequence is not valid, and you use it with [IPosPrinterJob.Print](iposprinterjob_print_1512698335.md) anyways, the job fails when you run it with [IPosPrinterJob.ExecuteAsync](iposprinterjob_executeasync_2108924004.md). You cannot remove a print instruction that uses an invalid data sequence after you add the instruction to the job with [IPosPrinterJob.Print](iposprinterjob_print_1512698335.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonclaimedposprinterstation.validatedata
     */
    ValidateData(data) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(24, this, "ptr", data, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
