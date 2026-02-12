#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ICompositionSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionSurfaceBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionSurfaceBrush
     * @type {Guid}
     */
    static IID => Guid("{ad016d79-1e4c-4c0d-9c29-83338c87c162}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BitmapInterpolationMode", "put_BitmapInterpolationMode", "get_HorizontalAlignmentRatio", "put_HorizontalAlignmentRatio", "get_Stretch", "put_Stretch", "get_Surface", "put_Surface", "get_VerticalAlignmentRatio", "put_VerticalAlignmentRatio"]

    /**
     * @type {Integer} 
     */
    BitmapInterpolationMode {
        get => this.get_BitmapInterpolationMode()
        set => this.put_BitmapInterpolationMode(value)
    }

    /**
     * @type {Float} 
     */
    HorizontalAlignmentRatio {
        get => this.get_HorizontalAlignmentRatio()
        set => this.put_HorizontalAlignmentRatio(value)
    }

    /**
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * @type {ICompositionSurface} 
     */
    Surface {
        get => this.get_Surface()
        set => this.put_Surface(value)
    }

    /**
     * @type {Float} 
     */
    VerticalAlignmentRatio {
        get => this.get_VerticalAlignmentRatio()
        set => this.put_VerticalAlignmentRatio(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapInterpolationMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_BitmapInterpolationMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalAlignmentRatio() {
        result := ComCall(8, this, "float*", &value := 0, "int")
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
    put_HorizontalAlignmentRatio(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
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
    put_Stretch(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ICompositionSurface} 
     */
    get_Surface() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICompositionSurface(value)
    }

    /**
     * 
     * @param {ICompositionSurface} value 
     * @returns {HRESULT} 
     */
    put_Surface(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalAlignmentRatio() {
        result := ComCall(14, this, "float*", &value := 0, "int")
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
    put_VerticalAlignmentRatio(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
