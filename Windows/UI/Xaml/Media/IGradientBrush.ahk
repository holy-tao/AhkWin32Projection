#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GradientStopCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IGradientBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGradientBrush
     * @type {Guid}
     */
    static IID => Guid("{2166e69f-935a-4191-8e3c-1c8dfdfcdc78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SpreadMethod", "put_SpreadMethod", "get_MappingMode", "put_MappingMode", "get_ColorInterpolationMode", "put_ColorInterpolationMode", "get_GradientStops", "put_GradientStops"]

    /**
     * @type {Integer} 
     */
    SpreadMethod {
        get => this.get_SpreadMethod()
        set => this.put_SpreadMethod(value)
    }

    /**
     * @type {Integer} 
     */
    MappingMode {
        get => this.get_MappingMode()
        set => this.put_MappingMode(value)
    }

    /**
     * @type {Integer} 
     */
    ColorInterpolationMode {
        get => this.get_ColorInterpolationMode()
        set => this.put_ColorInterpolationMode(value)
    }

    /**
     * @type {GradientStopCollection} 
     */
    GradientStops {
        get => this.get_GradientStops()
        set => this.put_GradientStops(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SpreadMethod() {
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
    put_SpreadMethod(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MappingMode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_MappingMode(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorInterpolationMode() {
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
    put_ColorInterpolationMode(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {GradientStopCollection} 
     */
    get_GradientStops() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GradientStopCollection(value)
    }

    /**
     * 
     * @param {GradientStopCollection} value 
     * @returns {HRESULT} 
     */
    put_GradientStops(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
