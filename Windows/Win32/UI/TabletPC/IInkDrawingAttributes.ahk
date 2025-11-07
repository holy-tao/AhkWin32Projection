#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkExtendedProperties.ahk
#Include .\IInkDrawingAttributes.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkdrawingattributes
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDrawingAttributes extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Color", "put_Color", "get_Width", "put_Width", "get_Height", "put_Height", "get_FitToCurve", "put_FitToCurve", "get_IgnorePressure", "put_IgnorePressure", "get_AntiAliased", "put_AntiAliased", "get_Transparency", "put_Transparency", "get_RasterOperation", "put_RasterOperation", "get_PenTip", "put_PenTip", "get_ExtendedProperties", "Clone"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_color
     */
    get_Color() {
        result := ComCall(7, this, "int*", &CurrentColor := 0, "HRESULT")
        return CurrentColor
    }

    /**
     * 
     * @param {Integer} NewColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-put_color
     */
    put_Color(NewColor) {
        result := ComCall(8, this, "int", NewColor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width
     */
    get_Width() {
        result := ComCall(9, this, "float*", &CurrentWidth := 0, "HRESULT")
        return CurrentWidth
    }

    /**
     * 
     * @param {Float} NewWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-put_width
     */
    put_Width(NewWidth) {
        result := ComCall(10, this, "float", NewWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height
     */
    get_Height() {
        result := ComCall(11, this, "float*", &CurrentHeight := 0, "HRESULT")
        return CurrentHeight
    }

    /**
     * 
     * @param {Float} NewHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-put_height
     */
    put_Height(NewHeight) {
        result := ComCall(12, this, "float", NewHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_fittocurve
     */
    get_FitToCurve() {
        result := ComCall(13, this, "short*", &Flag := 0, "HRESULT")
        return Flag
    }

    /**
     * 
     * @param {VARIANT_BOOL} Flag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-put_fittocurve
     */
    put_FitToCurve(Flag) {
        result := ComCall(14, this, "short", Flag, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_ignorepressure
     */
    get_IgnorePressure() {
        result := ComCall(15, this, "short*", &Flag := 0, "HRESULT")
        return Flag
    }

    /**
     * 
     * @param {VARIANT_BOOL} Flag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-put_ignorepressure
     */
    put_IgnorePressure(Flag) {
        result := ComCall(16, this, "short", Flag, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_antialiased
     */
    get_AntiAliased() {
        result := ComCall(17, this, "short*", &Flag := 0, "HRESULT")
        return Flag
    }

    /**
     * 
     * @param {VARIANT_BOOL} Flag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-put_antialiased
     */
    put_AntiAliased(Flag) {
        result := ComCall(18, this, "short", Flag, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_transparency
     */
    get_Transparency() {
        result := ComCall(19, this, "int*", &CurrentTransparency := 0, "HRESULT")
        return CurrentTransparency
    }

    /**
     * 
     * @param {Integer} NewTransparency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-put_transparency
     */
    put_Transparency(NewTransparency) {
        result := ComCall(20, this, "int", NewTransparency, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_rasteroperation
     */
    get_RasterOperation() {
        result := ComCall(21, this, "int*", &CurrentRasterOperation := 0, "HRESULT")
        return CurrentRasterOperation
    }

    /**
     * 
     * @param {Integer} NewRasterOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-put_rasteroperation
     */
    put_RasterOperation(NewRasterOperation) {
        result := ComCall(22, this, "int", NewRasterOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_pentip
     */
    get_PenTip() {
        result := ComCall(23, this, "int*", &CurrentPenTip := 0, "HRESULT")
        return CurrentPenTip
    }

    /**
     * 
     * @param {Integer} NewPenTip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-put_pentip
     */
    put_PenTip(NewPenTip) {
        result := ComCall(24, this, "int", NewPenTip, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkExtendedProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_extendedproperties
     */
    get_ExtendedProperties() {
        result := ComCall(25, this, "ptr*", &Properties := 0, "HRESULT")
        return IInkExtendedProperties(Properties)
    }

    /**
     * 
     * @returns {IInkDrawingAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdrawingattributes-clone
     */
    Clone() {
        result := ComCall(26, this, "ptr*", &DrawingAttributes := 0, "HRESULT")
        return IInkDrawingAttributes(DrawingAttributes)
    }
}
