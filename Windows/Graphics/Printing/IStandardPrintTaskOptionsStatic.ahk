#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IStandardPrintTaskOptionsStatic extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStandardPrintTaskOptionsStatic
     * @type {Guid}
     */
    static IID => Guid("{b4483d26-0dd0-4cd4-baff-930fc7d6a574}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaSize", "get_MediaType", "get_Orientation", "get_PrintQuality", "get_ColorMode", "get_Duplex", "get_Collation", "get_Staple", "get_HolePunch", "get_Binding", "get_Copies", "get_NUp", "get_InputBin"]

    /**
     * @type {HSTRING} 
     */
    MediaSize {
        get => this.get_MediaSize()
    }

    /**
     * @type {HSTRING} 
     */
    MediaType {
        get => this.get_MediaType()
    }

    /**
     * @type {HSTRING} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * @type {HSTRING} 
     */
    PrintQuality {
        get => this.get_PrintQuality()
    }

    /**
     * @type {HSTRING} 
     */
    ColorMode {
        get => this.get_ColorMode()
    }

    /**
     * @type {HSTRING} 
     */
    Duplex {
        get => this.get_Duplex()
    }

    /**
     * @type {HSTRING} 
     */
    Collation {
        get => this.get_Collation()
    }

    /**
     * @type {HSTRING} 
     */
    Staple {
        get => this.get_Staple()
    }

    /**
     * @type {HSTRING} 
     */
    HolePunch {
        get => this.get_HolePunch()
    }

    /**
     * @type {HSTRING} 
     */
    Binding {
        get => this.get_Binding()
    }

    /**
     * @type {HSTRING} 
     */
    Copies {
        get => this.get_Copies()
    }

    /**
     * @type {HSTRING} 
     */
    NUp {
        get => this.get_NUp()
    }

    /**
     * @type {HSTRING} 
     */
    InputBin {
        get => this.get_InputBin()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MediaSize() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MediaType() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Orientation() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrintQuality() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ColorMode() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Duplex() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Collation() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Staple() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HolePunch() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Binding() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Copies() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NUp() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InputBin() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
