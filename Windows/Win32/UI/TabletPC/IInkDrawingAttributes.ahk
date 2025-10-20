#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkdrawingattributes
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDrawingAttributes extends IDispatch{
    /**
     * The interface identifier for IInkDrawingAttributes
     * @type {Guid}
     */
    static IID => Guid("{bf519b75-0a15-4623-adc9-c00d436a8092}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} CurrentColor 
     * @returns {HRESULT} 
     */
    get_Color(CurrentColor) {
        result := ComCall(7, this, "int*", CurrentColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewColor 
     * @returns {HRESULT} 
     */
    put_Color(NewColor) {
        result := ComCall(8, this, "int", NewColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} CurrentWidth 
     * @returns {HRESULT} 
     */
    get_Width(CurrentWidth) {
        result := ComCall(9, this, "float*", CurrentWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} NewWidth 
     * @returns {HRESULT} 
     */
    put_Width(NewWidth) {
        result := ComCall(10, this, "float", NewWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} CurrentHeight 
     * @returns {HRESULT} 
     */
    get_Height(CurrentHeight) {
        result := ComCall(11, this, "float*", CurrentHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} NewHeight 
     * @returns {HRESULT} 
     */
    put_Height(NewHeight) {
        result := ComCall(12, this, "float", NewHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Flag 
     * @returns {HRESULT} 
     */
    get_FitToCurve(Flag) {
        result := ComCall(13, this, "ptr", Flag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Flag 
     * @returns {HRESULT} 
     */
    put_FitToCurve(Flag) {
        result := ComCall(14, this, "short", Flag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Flag 
     * @returns {HRESULT} 
     */
    get_IgnorePressure(Flag) {
        result := ComCall(15, this, "ptr", Flag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Flag 
     * @returns {HRESULT} 
     */
    put_IgnorePressure(Flag) {
        result := ComCall(16, this, "short", Flag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Flag 
     * @returns {HRESULT} 
     */
    get_AntiAliased(Flag) {
        result := ComCall(17, this, "ptr", Flag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Flag 
     * @returns {HRESULT} 
     */
    put_AntiAliased(Flag) {
        result := ComCall(18, this, "short", Flag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CurrentTransparency 
     * @returns {HRESULT} 
     */
    get_Transparency(CurrentTransparency) {
        result := ComCall(19, this, "int*", CurrentTransparency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewTransparency 
     * @returns {HRESULT} 
     */
    put_Transparency(NewTransparency) {
        result := ComCall(20, this, "int", NewTransparency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CurrentRasterOperation 
     * @returns {HRESULT} 
     */
    get_RasterOperation(CurrentRasterOperation) {
        result := ComCall(21, this, "int*", CurrentRasterOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewRasterOperation 
     * @returns {HRESULT} 
     */
    put_RasterOperation(NewRasterOperation) {
        result := ComCall(22, this, "int", NewRasterOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CurrentPenTip 
     * @returns {HRESULT} 
     */
    get_PenTip(CurrentPenTip) {
        result := ComCall(23, this, "int*", CurrentPenTip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewPenTip 
     * @returns {HRESULT} 
     */
    put_PenTip(NewPenTip) {
        result := ComCall(24, this, "int", NewPenTip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkExtendedProperties>} Properties 
     * @returns {HRESULT} 
     */
    get_ExtendedProperties(Properties) {
        result := ComCall(25, this, "ptr", Properties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDrawingAttributes>} DrawingAttributes 
     * @returns {HRESULT} 
     */
    Clone(DrawingAttributes) {
        result := ComCall(26, this, "ptr", DrawingAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
