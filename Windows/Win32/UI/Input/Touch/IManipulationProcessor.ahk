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
     * @type {Integer} 
     */
    SupportedManipulations {
        get => this.get_SupportedManipulations()
        set => this.put_SupportedManipulations(value)
    }

    /**
     * @type {Float} 
     */
    PivotPointX {
        get => this.get_PivotPointX()
        set => this.put_PivotPointX(value)
    }

    /**
     * @type {Float} 
     */
    PivotPointY {
        get => this.get_PivotPointY()
        set => this.put_PivotPointY(value)
    }

    /**
     * @type {Float} 
     */
    PivotRadius {
        get => this.get_PivotRadius()
        set => this.put_PivotRadius(value)
    }

    /**
     * @type {Float} 
     */
    MinimumScaleRotateRadius {
        get => this.get_MinimumScaleRotateRadius()
        set => this.put_MinimumScaleRotateRadius(value)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_supportedmanipulations
     */
    get_SupportedManipulations() {
        result := ComCall(3, this, "int*", &manipulations := 0, "HRESULT")
        return manipulations
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_pivotpointx
     */
    get_PivotPointX() {
        result := ComCall(5, this, "float*", &pivotPointX := 0, "HRESULT")
        return pivotPointX
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_pivotpointy
     */
    get_PivotPointY() {
        result := ComCall(7, this, "float*", &pivotPointY := 0, "HRESULT")
        return pivotPointY
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_pivotradius
     */
    get_PivotRadius() {
        result := ComCall(9, this, "float*", &pivotRadius := 0, "HRESULT")
        return pivotRadius
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getvelocityx
     */
    GetVelocityX() {
        result := ComCall(18, this, "float*", &velocityX := 0, "HRESULT")
        return velocityX
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getvelocityy
     */
    GetVelocityY() {
        result := ComCall(19, this, "float*", &velocityY := 0, "HRESULT")
        return velocityY
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getexpansionvelocity
     */
    GetExpansionVelocity() {
        result := ComCall(20, this, "float*", &expansionVelocity := 0, "HRESULT")
        return expansionVelocity
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getangularvelocity
     */
    GetAngularVelocity() {
        result := ComCall(21, this, "float*", &angularVelocity := 0, "HRESULT")
        return angularVelocity
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_minimumscalerotateradius
     */
    get_MinimumScaleRotateRadius() {
        result := ComCall(22, this, "float*", &minRadius := 0, "HRESULT")
        return minRadius
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
