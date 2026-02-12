#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IColorPaletteResources extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorPaletteResources
     * @type {Guid}
     */
    static IID => Guid("{258088c4-aef2-5d3f-833b-c36db6278ed9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AltHigh", "put_AltHigh", "get_AltLow", "put_AltLow", "get_AltMedium", "put_AltMedium", "get_AltMediumHigh", "put_AltMediumHigh", "get_AltMediumLow", "put_AltMediumLow", "get_BaseHigh", "put_BaseHigh", "get_BaseLow", "put_BaseLow", "get_BaseMedium", "put_BaseMedium", "get_BaseMediumHigh", "put_BaseMediumHigh", "get_BaseMediumLow", "put_BaseMediumLow", "get_ChromeAltLow", "put_ChromeAltLow", "get_ChromeBlackHigh", "put_ChromeBlackHigh", "get_ChromeBlackLow", "put_ChromeBlackLow", "get_ChromeBlackMediumLow", "put_ChromeBlackMediumLow", "get_ChromeBlackMedium", "put_ChromeBlackMedium", "get_ChromeDisabledHigh", "put_ChromeDisabledHigh", "get_ChromeDisabledLow", "put_ChromeDisabledLow", "get_ChromeHigh", "put_ChromeHigh", "get_ChromeLow", "put_ChromeLow", "get_ChromeMedium", "put_ChromeMedium", "get_ChromeMediumLow", "put_ChromeMediumLow", "get_ChromeWhite", "put_ChromeWhite", "get_ChromeGray", "put_ChromeGray", "get_ListLow", "put_ListLow", "get_ListMedium", "put_ListMedium", "get_ErrorText", "put_ErrorText", "get_Accent", "put_Accent"]

    /**
     * @type {IReference<Color>} 
     */
    AltHigh {
        get => this.get_AltHigh()
        set => this.put_AltHigh(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    AltLow {
        get => this.get_AltLow()
        set => this.put_AltLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    AltMedium {
        get => this.get_AltMedium()
        set => this.put_AltMedium(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    AltMediumHigh {
        get => this.get_AltMediumHigh()
        set => this.put_AltMediumHigh(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    AltMediumLow {
        get => this.get_AltMediumLow()
        set => this.put_AltMediumLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    BaseHigh {
        get => this.get_BaseHigh()
        set => this.put_BaseHigh(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    BaseLow {
        get => this.get_BaseLow()
        set => this.put_BaseLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    BaseMedium {
        get => this.get_BaseMedium()
        set => this.put_BaseMedium(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    BaseMediumHigh {
        get => this.get_BaseMediumHigh()
        set => this.put_BaseMediumHigh(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    BaseMediumLow {
        get => this.get_BaseMediumLow()
        set => this.put_BaseMediumLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeAltLow {
        get => this.get_ChromeAltLow()
        set => this.put_ChromeAltLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeBlackHigh {
        get => this.get_ChromeBlackHigh()
        set => this.put_ChromeBlackHigh(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeBlackLow {
        get => this.get_ChromeBlackLow()
        set => this.put_ChromeBlackLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeBlackMediumLow {
        get => this.get_ChromeBlackMediumLow()
        set => this.put_ChromeBlackMediumLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeBlackMedium {
        get => this.get_ChromeBlackMedium()
        set => this.put_ChromeBlackMedium(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeDisabledHigh {
        get => this.get_ChromeDisabledHigh()
        set => this.put_ChromeDisabledHigh(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeDisabledLow {
        get => this.get_ChromeDisabledLow()
        set => this.put_ChromeDisabledLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeHigh {
        get => this.get_ChromeHigh()
        set => this.put_ChromeHigh(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeLow {
        get => this.get_ChromeLow()
        set => this.put_ChromeLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeMedium {
        get => this.get_ChromeMedium()
        set => this.put_ChromeMedium(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeMediumLow {
        get => this.get_ChromeMediumLow()
        set => this.put_ChromeMediumLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeWhite {
        get => this.get_ChromeWhite()
        set => this.put_ChromeWhite(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ChromeGray {
        get => this.get_ChromeGray()
        set => this.put_ChromeGray(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ListLow {
        get => this.get_ListLow()
        set => this.put_ListLow(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ListMedium {
        get => this.get_ListMedium()
        set => this.put_ListMedium(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ErrorText {
        get => this.get_ErrorText()
        set => this.put_ErrorText(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    Accent {
        get => this.get_Accent()
        set => this.put_Accent(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_AltHigh() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_AltHigh(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_AltLow() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_AltLow(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_AltMedium() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_AltMedium(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_AltMediumHigh() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_AltMediumHigh(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_AltMediumLow() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_AltMediumLow(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BaseHigh() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BaseHigh(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BaseLow() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BaseLow(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BaseMedium() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BaseMedium(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BaseMediumHigh() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BaseMediumHigh(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BaseMediumLow() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BaseMediumLow(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeAltLow() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeAltLow(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeBlackHigh() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeBlackHigh(value) {
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeBlackLow() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeBlackLow(value) {
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeBlackMediumLow() {
        result := ComCall(32, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeBlackMediumLow(value) {
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeBlackMedium() {
        result := ComCall(34, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeBlackMedium(value) {
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeDisabledHigh() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeDisabledHigh(value) {
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeDisabledLow() {
        result := ComCall(38, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeDisabledLow(value) {
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeHigh() {
        result := ComCall(40, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeHigh(value) {
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeLow() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeLow(value) {
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeMedium() {
        result := ComCall(44, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeMedium(value) {
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeMediumLow() {
        result := ComCall(46, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeMediumLow(value) {
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeWhite() {
        result := ComCall(48, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeWhite(value) {
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeGray() {
        result := ComCall(50, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeGray(value) {
        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ListLow() {
        result := ComCall(52, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ListLow(value) {
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ListMedium() {
        result := ComCall(54, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ListMedium(value) {
        result := ComCall(55, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ErrorText() {
        result := ComCall(56, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ErrorText(value) {
        result := ComCall(57, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_Accent() {
        result := ComCall(58, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_Accent(value) {
        result := ComCall(59, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
