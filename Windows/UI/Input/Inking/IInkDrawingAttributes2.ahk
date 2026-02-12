#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Numerics\Matrix3x2.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkDrawingAttributes2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDrawingAttributes2
     * @type {Guid}
     */
    static IID => Guid("{7cab6508-8ec4-42fd-a5a5-e4b7d1d5316d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PenTipTransform", "put_PenTipTransform", "get_DrawAsHighlighter", "put_DrawAsHighlighter"]

    /**
     * @type {Matrix3x2} 
     */
    PenTipTransform {
        get => this.get_PenTipTransform()
        set => this.put_PenTipTransform(value)
    }

    /**
     * @type {Boolean} 
     */
    DrawAsHighlighter {
        get => this.get_DrawAsHighlighter()
        set => this.put_DrawAsHighlighter(value)
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_PenTipTransform() {
        value := Matrix3x2()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    put_PenTipTransform(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DrawAsHighlighter() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_DrawAsHighlighter(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
