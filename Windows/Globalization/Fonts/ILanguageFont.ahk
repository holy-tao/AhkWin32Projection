#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\UI\Text\FontWeight.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.Fonts
 * @version WindowsRuntime 1.4
 */
class ILanguageFont extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguageFont
     * @type {Guid}
     */
    static IID => Guid("{b12e5c3a-b76d-459b-beeb-901151cd77d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FontFamily", "get_FontWeight", "get_FontStretch", "get_FontStyle", "get_ScaleFactor"]

    /**
     * @type {HSTRING} 
     */
    FontFamily {
        get => this.get_FontFamily()
    }

    /**
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
    }

    /**
     * @type {Integer} 
     */
    FontStretch {
        get => this.get_FontStretch()
    }

    /**
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
    }

    /**
     * @type {Float} 
     */
    ScaleFactor {
        get => this.get_ScaleFactor()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FontFamily() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        weight := FontWeight()
        result := ComCall(7, this, "ptr", weight, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return weight
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStretch() {
        result := ComCall(8, this, "int*", &stretch_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return stretch_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        result := ComCall(9, this, "int*", &style_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return style_
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleFactor() {
        result := ComCall(10, this, "double*", &scale := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return scale
    }
}
