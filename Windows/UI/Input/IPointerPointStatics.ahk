#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PointerPoint.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IPointerPointStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerPointStatics
     * @type {Guid}
     */
    static IID => Guid("{a506638d-2a1a-413e-bc75-9f38381cc069}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentPoint", "GetIntermediatePoints", "GetCurrentPointTransformed", "GetIntermediatePointsTransformed"]

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {PointerPoint} 
     */
    GetCurrentPoint(pointerId) {
        result := ComCall(6, this, "uint", pointerId, "ptr*", &pointerPoint_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointerPoint(pointerPoint_)
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {IVector<PointerPoint>} 
     */
    GetIntermediatePoints(pointerId) {
        result := ComCall(7, this, "uint", pointerId, "ptr*", &pointerPoints := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(PointerPoint, pointerPoints)
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @param {IPointerPointTransform} transform_ 
     * @returns {PointerPoint} 
     */
    GetCurrentPointTransformed(pointerId, transform_) {
        result := ComCall(8, this, "uint", pointerId, "ptr", transform_, "ptr*", &pointerPoint_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointerPoint(pointerPoint_)
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @param {IPointerPointTransform} transform_ 
     * @returns {IVector<PointerPoint>} 
     */
    GetIntermediatePointsTransformed(pointerId, transform_) {
        result := ComCall(9, this, "uint", pointerId, "ptr", transform_, "ptr*", &pointerPoints := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(PointerPoint, pointerPoints)
    }
}
