#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCameraPose2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCameraPose2
     * @type {Guid}
     */
    static IID => Guid("{232be073-5d2d-4560-814e-2697c4fce16b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OverrideViewTransform", "OverrideProjectionTransform", "OverrideViewport"]

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {HolographicStereoTransform} coordinateSystemToViewTransform 
     * @returns {HRESULT} 
     */
    OverrideViewTransform(coordinateSystem, coordinateSystemToViewTransform) {
        result := ComCall(6, this, "ptr", coordinateSystem, "ptr", coordinateSystemToViewTransform, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HolographicStereoTransform} projectionTransform 
     * @returns {HRESULT} 
     */
    OverrideProjectionTransform(projectionTransform) {
        result := ComCall(7, this, "ptr", projectionTransform, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RECT} leftViewport 
     * @param {RECT} rightViewport 
     * @returns {HRESULT} 
     */
    OverrideViewport(leftViewport, rightViewport) {
        result := ComCall(8, this, "ptr", leftViewport, "ptr", rightViewport, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
