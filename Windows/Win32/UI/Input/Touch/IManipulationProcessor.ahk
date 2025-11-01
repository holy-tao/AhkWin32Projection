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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedManipulations", "put_SupportedManipulations", "get_PivotPointX", "put_PivotPointX", "get_PivotPointY", "put_PivotPointY", "get_PivotRadius", "put_PivotRadius", "CompleteManipulation", "ProcessDown", "ProcessMove", "ProcessUp", "ProcessDownWithTime", "ProcessMoveWithTime", "ProcessUpWithTime", "GetVelocityX", "GetVelocityY", "GetExpansionVelocity", "GetAngularVelocity", "get_MinimumScaleRotateRadius", "put_MinimumScaleRotateRadius"]

    /**
     * 
     * @param {Pointer<Integer>} manipulations 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_supportedmanipulations
     */
    get_SupportedManipulations(manipulations) {
        manipulationsMarshal := manipulations is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, manipulationsMarshal, manipulations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} manipulations 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-put_supportedmanipulations
     */
    put_SupportedManipulations(manipulations) {
        result := ComCall(4, this, "int", manipulations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pivotPointX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_pivotpointx
     */
    get_PivotPointX(pivotPointX) {
        pivotPointXMarshal := pivotPointX is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, pivotPointXMarshal, pivotPointX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} pivotPointX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-put_pivotpointx
     */
    put_PivotPointX(pivotPointX) {
        result := ComCall(6, this, "float", pivotPointX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pivotPointY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_pivotpointy
     */
    get_PivotPointY(pivotPointY) {
        pivotPointYMarshal := pivotPointY is VarRef ? "float*" : "ptr"

        result := ComCall(7, this, pivotPointYMarshal, pivotPointY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} pivotPointY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-put_pivotpointy
     */
    put_PivotPointY(pivotPointY) {
        result := ComCall(8, this, "float", pivotPointY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pivotRadius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_pivotradius
     */
    get_PivotRadius(pivotRadius) {
        pivotRadiusMarshal := pivotRadius is VarRef ? "float*" : "ptr"

        result := ComCall(9, this, pivotRadiusMarshal, pivotRadius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} pivotRadius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-put_pivotradius
     */
    put_PivotRadius(pivotRadius) {
        result := ComCall(10, this, "float", pivotRadius, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-completemanipulation
     */
    CompleteManipulation() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processdown
     */
    ProcessDown(manipulatorId, x, y) {
        result := ComCall(12, this, "uint", manipulatorId, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processmove
     */
    ProcessMove(manipulatorId, x, y) {
        result := ComCall(13, this, "uint", manipulatorId, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processup
     */
    ProcessUp(manipulatorId, x, y) {
        result := ComCall(14, this, "uint", manipulatorId, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Integer} timestamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processdownwithtime
     */
    ProcessDownWithTime(manipulatorId, x, y, timestamp) {
        result := ComCall(15, this, "uint", manipulatorId, "float", x, "float", y, "uint", timestamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Integer} timestamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processmovewithtime
     */
    ProcessMoveWithTime(manipulatorId, x, y, timestamp) {
        result := ComCall(16, this, "uint", manipulatorId, "float", x, "float", y, "uint", timestamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} manipulatorId 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Integer} timestamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processupwithtime
     */
    ProcessUpWithTime(manipulatorId, x, y, timestamp) {
        result := ComCall(17, this, "uint", manipulatorId, "float", x, "float", y, "uint", timestamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} velocityX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getvelocityx
     */
    GetVelocityX(velocityX) {
        velocityXMarshal := velocityX is VarRef ? "float*" : "ptr"

        result := ComCall(18, this, velocityXMarshal, velocityX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} velocityY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getvelocityy
     */
    GetVelocityY(velocityY) {
        velocityYMarshal := velocityY is VarRef ? "float*" : "ptr"

        result := ComCall(19, this, velocityYMarshal, velocityY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} expansionVelocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getexpansionvelocity
     */
    GetExpansionVelocity(expansionVelocity) {
        expansionVelocityMarshal := expansionVelocity is VarRef ? "float*" : "ptr"

        result := ComCall(20, this, expansionVelocityMarshal, expansionVelocity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} angularVelocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getangularvelocity
     */
    GetAngularVelocity(angularVelocity) {
        angularVelocityMarshal := angularVelocity is VarRef ? "float*" : "ptr"

        result := ComCall(21, this, angularVelocityMarshal, angularVelocity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} minRadius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_minimumscalerotateradius
     */
    get_MinimumScaleRotateRadius(minRadius) {
        minRadiusMarshal := minRadius is VarRef ? "float*" : "ptr"

        result := ComCall(22, this, minRadiusMarshal, minRadius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} minRadius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-put_minimumscalerotateradius
     */
    put_MinimumScaleRotateRadius(minRadius) {
        result := ComCall(23, this, "float", minRadius, "HRESULT")
        return result
    }
}
