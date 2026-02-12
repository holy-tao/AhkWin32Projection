#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IMediaDeviceControlCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaDeviceControlCapabilities
     * @type {Guid}
     */
    static IID => Guid("{23005816-eb85-43e2-b92b-8240d5ee70ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Supported", "get_Min", "get_Max", "get_Step", "get_Default", "get_AutoModeSupported"]

    /**
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * @type {Float} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * @type {Float} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * @type {Float} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * @type {Float} 
     */
    Default {
        get => this.get_Default()
    }

    /**
     * @type {Boolean} 
     */
    AutoModeSupported {
        get => this.get_AutoModeSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Min() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Max() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Step() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets or sets the default drawing attributes to use when drawing and displaying ink. (IInkCollector.get_DefaultDrawingAttributes)
     * @remarks
     * The drawing attributes specified with this property are the attributes that are assigned to a new cursor.
     * 
     * The default drawing attributes are as follows:
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_antialiased">AntiAliased</a> = <b>TRUE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_color">Color</a> = <b>BLACK</b> (RGB(0,0,0)) if not in High Contrast mode; otherwise, Color=COLOR_WINDOWTEXT.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_fittocurve">FitToCurve</a> = <b>FALSE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> = 1 (in ink space units)
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_ignorepressure">IgnorePressure</a> = <b>FALSE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_pentip">PenTip</a> = <b>Ball</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_rasteroperation">RasterOperation</a> = <b>CopyPen</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_transparency">Transparency</a> = 0 (totally opaque)
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width">Width</a> = 53 (in ink space units)
     * 
     * To set different attributes on a new cursor, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object.
     * 
     * To change the drawing attributes of a single stroke, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object. To change the drawing attributes of a collection of strokes, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokes-modifydrawingattributes">ModifyDrawingAttributes</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * 
     * <div class="alert"><b>Note</b>  The <b>DefaultDrawingAttributes</b> property contains the drawing attributes that all cursors use unless they set their own <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property. For example, a new <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object uses <b>DefaultDrawingAttributes</b>, and an old <b>IInkCursor</b> object on which the <b>DrawingAttributes</b> is set to <b>NULL</b> also uses <b>DefaultDrawingAttributes</b>.</div>
     * <div> </div>
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkcollector-get_defaultdrawingattributes
     */
    get_Default() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoModeSupported() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
