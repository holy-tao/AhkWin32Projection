#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\UI\Color.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IVideoTransformEffectDefinition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoTransformEffectDefinition
     * @type {Guid}
     */
    static IID => Guid("{9664bb6a-1ea6-4aa6-8074-abe8851ecae2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PaddingColor", "put_PaddingColor", "get_OutputSize", "put_OutputSize", "get_CropRectangle", "put_CropRectangle", "get_Rotation", "put_Rotation", "get_Mirror", "put_Mirror", "put_ProcessingAlgorithm", "get_ProcessingAlgorithm"]

    /**
     * @type {Color} 
     */
    PaddingColor {
        get => this.get_PaddingColor()
        set => this.put_PaddingColor(value)
    }

    /**
     * @type {SIZE} 
     */
    OutputSize {
        get => this.get_OutputSize()
        set => this.put_OutputSize(value)
    }

    /**
     * @type {RECT} 
     */
    CropRectangle {
        get => this.get_CropRectangle()
        set => this.put_CropRectangle(value)
    }

    /**
     * @type {Integer} 
     */
    Rotation {
        get => this.get_Rotation()
        set => this.put_Rotation(value)
    }

    /**
     * @type {Integer} 
     */
    Mirror {
        get => this.get_Mirror()
        set => this.put_Mirror(value)
    }

    /**
     * @type {Integer} 
     */
    ProcessingAlgorithm {
        get => this.get_ProcessingAlgorithm()
        set => this.put_ProcessingAlgorithm(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_PaddingColor() {
        value := Color()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_PaddingColor(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_OutputSize() {
        value := SIZE()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_OutputSize(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_CropRectangle() {
        value := RECT()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_CropRectangle(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Rotation() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_Rotation(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mirror() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
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
    put_Mirror(value) {
        result := ComCall(15, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProcessingAlgorithm(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessingAlgorithm() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
