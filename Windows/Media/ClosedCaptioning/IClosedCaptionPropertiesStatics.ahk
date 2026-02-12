#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\UI\Color.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.ClosedCaptioning
 * @version WindowsRuntime 1.4
 */
class IClosedCaptionPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClosedCaptionPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{10aa1f84-cc30-4141-b503-5272289e0c20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FontColor", "get_ComputedFontColor", "get_FontOpacity", "get_FontSize", "get_FontStyle", "get_FontEffect", "get_BackgroundColor", "get_ComputedBackgroundColor", "get_BackgroundOpacity", "get_RegionColor", "get_ComputedRegionColor", "get_RegionOpacity"]

    /**
     * @type {Integer} 
     */
    FontColor {
        get => this.get_FontColor()
    }

    /**
     * @type {Color} 
     */
    ComputedFontColor {
        get => this.get_ComputedFontColor()
    }

    /**
     * @type {Integer} 
     */
    FontOpacity {
        get => this.get_FontOpacity()
    }

    /**
     * @type {Integer} 
     */
    FontSize {
        get => this.get_FontSize()
    }

    /**
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
    }

    /**
     * @type {Integer} 
     */
    FontEffect {
        get => this.get_FontEffect()
    }

    /**
     * @type {Integer} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
    }

    /**
     * @type {Color} 
     */
    ComputedBackgroundColor {
        get => this.get_ComputedBackgroundColor()
    }

    /**
     * @type {Integer} 
     */
    BackgroundOpacity {
        get => this.get_BackgroundOpacity()
    }

    /**
     * @type {Integer} 
     */
    RegionColor {
        get => this.get_RegionColor()
    }

    /**
     * @type {Color} 
     */
    ComputedRegionColor {
        get => this.get_ComputedRegionColor()
    }

    /**
     * @type {Integer} 
     */
    RegionOpacity {
        get => this.get_RegionOpacity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontColor() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_ComputedFontColor() {
        value := Color()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontOpacity() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontSize() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontEffect() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundColor() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_ComputedBackgroundColor() {
        value := Color()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundOpacity() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RegionColor() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_ComputedRegionColor() {
        value := Color()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RegionOpacity() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
