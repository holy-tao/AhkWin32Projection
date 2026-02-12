#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\Media\Brush.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarPenButton extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarPenButton
     * @type {Guid}
     */
    static IID => Guid("{e0b80c21-b032-40ee-a2b9-507f6ccb827b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Palette", "put_Palette", "get_MinStrokeWidth", "put_MinStrokeWidth", "get_MaxStrokeWidth", "put_MaxStrokeWidth", "get_SelectedBrush", "get_SelectedBrushIndex", "put_SelectedBrushIndex", "get_SelectedStrokeWidth", "put_SelectedStrokeWidth"]

    /**
     * @type {IVector<Brush>} 
     */
    Palette {
        get => this.get_Palette()
        set => this.put_Palette(value)
    }

    /**
     * @type {Float} 
     */
    MinStrokeWidth {
        get => this.get_MinStrokeWidth()
        set => this.put_MinStrokeWidth(value)
    }

    /**
     * @type {Float} 
     */
    MaxStrokeWidth {
        get => this.get_MaxStrokeWidth()
        set => this.put_MaxStrokeWidth(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedBrush {
        get => this.get_SelectedBrush()
    }

    /**
     * @type {Integer} 
     */
    SelectedBrushIndex {
        get => this.get_SelectedBrushIndex()
        set => this.put_SelectedBrushIndex(value)
    }

    /**
     * @type {Float} 
     */
    SelectedStrokeWidth {
        get => this.get_SelectedStrokeWidth()
        set => this.put_SelectedStrokeWidth(value)
    }

    /**
     * 
     * @returns {IVector<Brush>} 
     */
    get_Palette() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Brush, value)
    }

    /**
     * 
     * @param {IVector<Brush>} value 
     * @returns {HRESULT} 
     */
    put_Palette(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinStrokeWidth() {
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
    put_MinStrokeWidth(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxStrokeWidth() {
        result := ComCall(10, this, "double*", &value := 0, "int")
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
    put_MaxStrokeWidth(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedBrush() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedBrushIndex() {
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
    put_SelectedBrushIndex(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SelectedStrokeWidth() {
        result := ComCall(15, this, "double*", &value := 0, "int")
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
    put_SelectedStrokeWidth(value) {
        result := ComCall(16, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
