#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface with properties that provide access to the core options for a print task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintTaskOptionsCoreProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskOptionsCoreProperties
     * @type {Guid}
     */
    static IID => Guid("{c1b71832-9e93-4e55-814b-3326a59efce1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_MediaSize", "get_MediaSize", "put_MediaType", "get_MediaType", "put_Orientation", "get_Orientation", "put_PrintQuality", "get_PrintQuality", "put_ColorMode", "get_ColorMode", "put_Duplex", "get_Duplex", "put_Collation", "get_Collation", "put_Staple", "get_Staple", "put_HolePunch", "get_HolePunch", "put_Binding", "get_Binding", "get_MinCopies", "get_MaxCopies", "put_NumberOfCopies", "get_NumberOfCopies"]

    /**
     * Gets or sets the media size option of the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.mediasize
     * @type {Integer} 
     */
    MediaSize {
        get => this.get_MediaSize()
        set => this.put_MediaSize(value)
    }

    /**
     * Gets or sets the media type option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.mediatype
     * @type {Integer} 
     */
    MediaType {
        get => this.get_MediaType()
        set => this.put_MediaType(value)
    }

    /**
     * Gets or sets the orientation option for a print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets the print quality option for a print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.printquality
     * @type {Integer} 
     */
    PrintQuality {
        get => this.get_PrintQuality()
        set => this.put_PrintQuality(value)
    }

    /**
     * Gets or sets the color mode option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.colormode
     * @type {Integer} 
     */
    ColorMode {
        get => this.get_ColorMode()
        set => this.put_ColorMode(value)
    }

    /**
     * Gets or sets the duplex option for a print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.duplex
     * @type {Integer} 
     */
    Duplex {
        get => this.get_Duplex()
        set => this.put_Duplex(value)
    }

    /**
     * Gets or sets the collation option for a print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.collation
     * @type {Integer} 
     */
    Collation {
        get => this.get_Collation()
        set => this.put_Collation(value)
    }

    /**
     * Gets or sets the staple option for a print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.staple
     * @type {Integer} 
     */
    Staple {
        get => this.get_Staple()
        set => this.put_Staple(value)
    }

    /**
     * Gets or sets the hole punch option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.holepunch
     * @type {Integer} 
     */
    HolePunch {
        get => this.get_HolePunch()
        set => this.put_HolePunch(value)
    }

    /**
     * Gets or sets the binding option for a print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.binding
     * @type {Integer} 
     */
    Binding {
        get => this.get_Binding()
        set => this.put_Binding(value)
    }

    /**
     * Gets the **MinCopies** option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.mincopies
     * @type {Integer} 
     */
    MinCopies {
        get => this.get_MinCopies()
    }

    /**
     * Gets the **MaxCopies** option for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.maxcopies
     * @type {Integer} 
     */
    MaxCopies {
        get => this.get_MaxCopies()
    }

    /**
     * Gets or sets the **NumberOfCopies** option for a print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreproperties.numberofcopies
     * @type {Integer} 
     */
    NumberOfCopies {
        get => this.get_NumberOfCopies()
        set => this.put_NumberOfCopies(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MediaSize(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaSize() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_MediaType(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaType() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_Orientation(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_PrintQuality(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrintQuality() {
        result := ComCall(13, this, "int*", &value := 0, "int")
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
    put_ColorMode(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorMode() {
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
    put_Duplex(value) {
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
    get_Duplex() {
        result := ComCall(17, this, "int*", &value := 0, "int")
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
    put_Collation(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Collation() {
        result := ComCall(19, this, "int*", &value := 0, "int")
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
    put_Staple(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Staple() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_HolePunch(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HolePunch() {
        result := ComCall(23, this, "int*", &value := 0, "int")
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
    put_Binding(value) {
        result := ComCall(24, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Binding() {
        result := ComCall(25, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinCopies() {
        result := ComCall(26, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxCopies() {
        result := ComCall(27, this, "uint*", &value := 0, "int")
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
    put_NumberOfCopies(value) {
        result := ComCall(28, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfCopies() {
        result := ComCall(29, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
