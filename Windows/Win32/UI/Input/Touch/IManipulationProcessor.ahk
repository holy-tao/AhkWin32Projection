#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IManipulationProcessor provides functionality for monitoring and responding to multitouch input.
 * @see https://docs.microsoft.com/windows/win32/api//manipulations/nn-manipulations-imanipulationprocessor
 * @namespace Windows.Win32.UI.Input.Touch
 * @version v4.0.30319
 */
class IManipulationProcessor extends IUnknown{
    /**
     * The interface identifier for IManipulationProcessor
     * @type {Guid}
     */
    static IID => Guid("{a22ac519-8300-48a0-bef4-f1be8737dba4}")

    /**
     * The class identifier for ManipulationProcessor
     * @type {Guid}
     */
    static CLSID => Guid("{597d4fb0-47fd-4aff-89b9-c6cfae8cf08e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} manipulations 
     * @returns {HRESULT} 
     */
    get_SupportedManipulations(manipulations) {
        result := ComCall(3, this, "int*", manipulations, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} manipulations 
     * @returns {HRESULT} 
     */
    put_SupportedManipulations(manipulations) {
        result := ComCall(4, this, "int", manipulations, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pivotPointX 
     * @returns {HRESULT} 
     */
    get_PivotPointX(pivotPointX) {
        result := ComCall(5, this, "float*", pivotPointX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} pivotPointX 
     * @returns {HRESULT} 
     */
    put_PivotPointX(pivotPointX) {
        result := ComCall(6, this, "float", pivotPointX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pivotPointY 
     * @returns {HRESULT} 
     */
    get_PivotPointY(pivotPointY) {
        result := ComCall(7, this, "float*", pivotPointY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} pivotPointY 
     * @returns {HRESULT} 
     */
    put_PivotPointY(pivotPointY) {
        result := ComCall(8, this, "float", pivotPointY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pivotRadius 
     * @returns {HRESULT} 
     */
    get_PivotRadius(pivotRadius) {
        result := ComCall(9, this, "float*", pivotRadius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} pivotRadius 
     * @returns {HRESULT} 
     */
    put_PivotRadius(pivotRadius) {
        result := ComCall(10, this, "float", pivotRadius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CompleteManipulation() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    ProcessDown(manipulatorId, x, y) {
        result := ComCall(12, this, "uint", manipulatorId, "float", x, "float", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    ProcessMove(manipulatorId, x, y) {
        result := ComCall(13, this, "uint", manipulatorId, "float", x, "float", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    ProcessUp(manipulatorId, x, y) {
        result := ComCall(14, this, "uint", manipulatorId, "float", x, "float", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Integer} timestamp 
     * @returns {HRESULT} 
     */
    ProcessDownWithTime(manipulatorId, x, y, timestamp) {
        result := ComCall(15, this, "uint", manipulatorId, "float", x, "float", y, "uint", timestamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Integer} timestamp 
     * @returns {HRESULT} 
     */
    ProcessMoveWithTime(manipulatorId, x, y, timestamp) {
        result := ComCall(16, this, "uint", manipulatorId, "float", x, "float", y, "uint", timestamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Integer} timestamp 
     * @returns {HRESULT} 
     */
    ProcessUpWithTime(manipulatorId, x, y, timestamp) {
        result := ComCall(17, this, "uint", manipulatorId, "float", x, "float", y, "uint", timestamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} velocityX 
     * @returns {HRESULT} 
     */
    GetVelocityX(velocityX) {
        result := ComCall(18, this, "float*", velocityX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} velocityY 
     * @returns {HRESULT} 
     */
    GetVelocityY(velocityY) {
        result := ComCall(19, this, "float*", velocityY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} expansionVelocity 
     * @returns {HRESULT} 
     */
    GetExpansionVelocity(expansionVelocity) {
        result := ComCall(20, this, "float*", expansionVelocity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} angularVelocity 
     * @returns {HRESULT} 
     */
    GetAngularVelocity(angularVelocity) {
        result := ComCall(21, this, "float*", angularVelocity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} minRadius 
     * @returns {HRESULT} 
     */
    get_MinimumScaleRotateRadius(minRadius) {
        result := ComCall(22, this, "float*", minRadius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} minRadius 
     * @returns {HRESULT} 
     */
    put_MinimumScaleRotateRadius(minRadius) {
        result := ComCall(23, this, "float", minRadius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
