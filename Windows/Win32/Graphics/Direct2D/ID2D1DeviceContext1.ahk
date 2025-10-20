#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext.ahk

/**
 * Enables creation and drawing of geometry realization objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nn-d2d1_2-id2d1devicecontext1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DeviceContext1 extends ID2D1DeviceContext{
    /**
     * The interface identifier for ID2D1DeviceContext1
     * @type {Guid}
     */
    static IID => Guid("{d37f57e4-6908-459f-a199-e72f24f79987}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 92

    /**
     * 
     * @param {Pointer<ID2D1Geometry>} geometry 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<ID2D1GeometryRealization>} geometryRealization 
     * @returns {HRESULT} 
     */
    CreateFilledGeometryRealization(geometry, flatteningTolerance, geometryRealization) {
        result := ComCall(92, this, "ptr", geometry, "float", flatteningTolerance, "ptr", geometryRealization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Geometry>} geometry 
     * @param {Float} flatteningTolerance 
     * @param {Float} strokeWidth 
     * @param {Pointer<ID2D1StrokeStyle>} strokeStyle 
     * @param {Pointer<ID2D1GeometryRealization>} geometryRealization 
     * @returns {HRESULT} 
     */
    CreateStrokedGeometryRealization(geometry, flatteningTolerance, strokeWidth, strokeStyle, geometryRealization) {
        result := ComCall(93, this, "ptr", geometry, "float", flatteningTolerance, "float", strokeWidth, "ptr", strokeStyle, "ptr", geometryRealization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1GeometryRealization>} geometryRealization 
     * @param {Pointer<ID2D1Brush>} brush 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawGeometryRealization(geometryRealization, brush) {
        ComCall(94, this, "ptr", geometryRealization, "ptr", brush)
        return result
    }
}
