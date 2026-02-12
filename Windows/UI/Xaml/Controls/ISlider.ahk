#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Data\IValueConverter.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISlider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISlider
     * @type {Guid}
     */
    static IID => Guid("{89572027-4c48-4700-8076-497ba73d9c18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IntermediateValue", "put_IntermediateValue", "get_StepFrequency", "put_StepFrequency", "get_SnapsTo", "put_SnapsTo", "get_TickFrequency", "put_TickFrequency", "get_TickPlacement", "put_TickPlacement", "get_Orientation", "put_Orientation", "get_IsDirectionReversed", "put_IsDirectionReversed", "get_IsThumbToolTipEnabled", "put_IsThumbToolTipEnabled", "get_ThumbToolTipValueConverter", "put_ThumbToolTipValueConverter"]

    /**
     * @type {Float} 
     */
    IntermediateValue {
        get => this.get_IntermediateValue()
        set => this.put_IntermediateValue(value)
    }

    /**
     * @type {Float} 
     */
    StepFrequency {
        get => this.get_StepFrequency()
        set => this.put_StepFrequency(value)
    }

    /**
     * @type {Integer} 
     */
    SnapsTo {
        get => this.get_SnapsTo()
        set => this.put_SnapsTo(value)
    }

    /**
     * @type {Float} 
     */
    TickFrequency {
        get => this.get_TickFrequency()
        set => this.put_TickFrequency(value)
    }

    /**
     * @type {Integer} 
     */
    TickPlacement {
        get => this.get_TickPlacement()
        set => this.put_TickPlacement(value)
    }

    /**
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDirectionReversed {
        get => this.get_IsDirectionReversed()
        set => this.put_IsDirectionReversed(value)
    }

    /**
     * @type {Boolean} 
     */
    IsThumbToolTipEnabled {
        get => this.get_IsThumbToolTipEnabled()
        set => this.put_IsThumbToolTipEnabled(value)
    }

    /**
     * @type {IValueConverter} 
     */
    ThumbToolTipValueConverter {
        get => this.get_ThumbToolTipValueConverter()
        set => this.put_ThumbToolTipValueConverter(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_IntermediateValue() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_IntermediateValue(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StepFrequency() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_StepFrequency(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SnapsTo() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_SnapsTo(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TickFrequency() {
        result := ComCall(12, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TickFrequency(value) {
        result := ComCall(13, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TickPlacement() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_TickPlacement(value) {
        result := ComCall(15, this, "int", value, "int")
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
        result := ComCall(16, this, "int*", &value := 0, "int")
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
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDirectionReversed() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_IsDirectionReversed(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsThumbToolTipEnabled() {
        result := ComCall(20, this, "int*", &value := 0, "int")
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
    put_IsThumbToolTipEnabled(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IValueConverter} 
     */
    get_ThumbToolTipValueConverter() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IValueConverter(value)
    }

    /**
     * 
     * @param {IValueConverter} value 
     * @returns {HRESULT} 
     */
    put_ThumbToolTipValueConverter(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
