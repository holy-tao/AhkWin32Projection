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
     * The SupportedManipulations property is used to indicate which manipulations are supported by an object.
     * @remarks
     * 
     * With this property you can control which manipulations the supports and which it does not. 
     * 	 For example, you can block all y-translation manipulations while supporting x-translation manipulations.
     * 	 
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-get_supportedmanipulations
     */
    get_SupportedManipulations() {
        result := ComCall(3, this, "int*", &manipulations := 0, "HRESULT")
        return manipulations
    }

    /**
     * The SupportedManipulations property is used to indicate which manipulations are supported by an object.
     * @remarks
     * 
     * With this property you can control which manipulations the supports and which it does not. 
     * 	 For example, you can block all y-translation manipulations while supporting x-translation manipulations.
     * 	 
     * 
     * 
     * 
     * @param {Integer} manipulations 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-put_supportedmanipulations
     */
    put_SupportedManipulations(manipulations) {
        result := ComCall(4, this, "int", manipulations, "HRESULT")
        return result
    }

    /**
     * The PivotPointX property is the horizontal center of the object.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-get_pivotpointx
     */
    get_PivotPointX() {
        result := ComCall(5, this, "float*", &pivotPointX := 0, "HRESULT")
        return pivotPointX
    }

    /**
     * The PivotPointX property is the horizontal center of the object.
     * @param {Float} pivotPointX 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-put_pivotpointx
     */
    put_PivotPointX(pivotPointX) {
        result := ComCall(6, this, "float", pivotPointX, "HRESULT")
        return result
    }

    /**
     * The PivotPointY property is the vertical center of the object.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-get_pivotpointy
     */
    get_PivotPointY() {
        result := ComCall(7, this, "float*", &pivotPointY := 0, "HRESULT")
        return pivotPointY
    }

    /**
     * The PivotPointY property is the vertical center of the object.
     * @param {Float} pivotPointY 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-put_pivotpointy
     */
    put_PivotPointY(pivotPointY) {
        result := ComCall(8, this, "float", pivotPointY, "HRESULT")
        return result
    }

    /**
     * The PivotRadius property is used to determine how much rotation is used in single finger manipulation.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The pivot radius must either be negative, 0, or a value greater than 1. Setting the pivot radius to a value between 0.0 and 1.0 will return <b>E_INVALIDARG</b>.
     *       </div>
     * <div> </div>
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-get_pivotradius
     */
    get_PivotRadius() {
        result := ComCall(9, this, "float*", &pivotRadius := 0, "HRESULT")
        return pivotRadius
    }

    /**
     * The PivotRadius property is used to determine how much rotation is used in single finger manipulation.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The pivot radius must either be negative, 0, or a value greater than 1. Setting the pivot radius to a value between 0.0 and 1.0 will return <b>E_INVALIDARG</b>.
     *       </div>
     * <div> </div>
     * 
     * 
     * @param {Float} pivotRadius 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-put_pivotradius
     */
    put_PivotRadius(pivotRadius) {
        result := ComCall(10, this, "float", pivotRadius, "HRESULT")
        return result
    }

    /**
     * The CompleteManipulation method is called when the developer chooses to end the manipulation.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-completemanipulation
     */
    CompleteManipulation() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The ProcessDown method feeds touch down data to the manipulation processor associated with a target.
     * @param {Integer} manipulatorId The identifier for the touch contact that you want to process.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-processdown
     */
    ProcessDown(manipulatorId, x, y) {
        result := ComCall(12, this, "uint", manipulatorId, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * The ProcessMove method feeds movement data for the target object to its manipulation processor.
     * @param {Integer} manipulatorId The identifier for the touch contact that you want to process.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-processmove
     */
    ProcessMove(manipulatorId, x, y) {
        result := ComCall(13, this, "uint", manipulatorId, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * The ProcessUp method feeds data to a target's manipulation processor for touch up sequences.
     * @param {Integer} manipulatorId The identifier for the touch contact that you want to process.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-processup
     */
    ProcessUp(manipulatorId, x, y) {
        result := ComCall(14, this, "uint", manipulatorId, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * Feeds touch down data, including a timestamp, to the manipulation processor associated with a target.
     * @param {Integer} manipulatorId The identifier for the touch contact to be processed.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @param {Integer} timestamp The time of the data event.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code such as <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-processdownwithtime
     */
    ProcessDownWithTime(manipulatorId, x, y, timestamp) {
        result := ComCall(15, this, "uint", manipulatorId, "float", x, "float", y, "uint", timestamp, "HRESULT")
        return result
    }

    /**
     * Feeds movement data, including a time stamp, for the target object to its manipulation processor.
     * @param {Integer} manipulatorId The identifier for the touch contact to be processed.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @param {Integer} timestamp The time of the data event.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code such as <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-processmovewithtime
     */
    ProcessMoveWithTime(manipulatorId, x, y, timestamp) {
        result := ComCall(16, this, "uint", manipulatorId, "float", x, "float", y, "uint", timestamp, "HRESULT")
        return result
    }

    /**
     * Feeds data, including a timestamp, to a target's manipulation processor for touch-up sequences.
     * @param {Integer} manipulatorId The identifier for the touch contact to be processed.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @param {Integer} timestamp The time of the data event.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code such as <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-processupwithtime
     */
    ProcessUpWithTime(manipulatorId, x, y, timestamp) {
        result := ComCall(17, this, "uint", manipulatorId, "float", x, "float", y, "uint", timestamp, "HRESULT")
        return result
    }

    /**
     * Calculates and returns the horizontal velocity for the target object.
     * @returns {Float} The calculated horizontal velocity.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-getvelocityx
     */
    GetVelocityX() {
        result := ComCall(18, this, "float*", &velocityX := 0, "HRESULT")
        return velocityX
    }

    /**
     * Calculates and returns the vertical velocity.
     * @returns {Float} The calculated vertical velocity.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-getvelocityy
     */
    GetVelocityY() {
        result := ComCall(19, this, "float*", &velocityY := 0, "HRESULT")
        return velocityY
    }

    /**
     * The GetExpansionVelocity method calculates the rate that the target object is expanding at.
     * @returns {Float} The rate of expansion.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-getexpansionvelocity
     */
    GetExpansionVelocity() {
        result := ComCall(20, this, "float*", &expansionVelocity := 0, "HRESULT")
        return expansionVelocity
    }

    /**
     * The GetAngularVelocity method calculates the rotational velocity that the target object is moving at.
     * @returns {Float} The calculated rotational velocity.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-getangularvelocity
     */
    GetAngularVelocity() {
        result := ComCall(21, this, "float*", &angularVelocity := 0, "HRESULT")
        return angularVelocity
    }

    /**
     * Specifies how large the distance contacts on a scale or rotate gesture need to be to trigger manipulation.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This property is set in centipixels (100ths of a pixel).
     *   </div>
     * <div> </div>
     *     
     * 	 Setting this value will make the manipulation processor ignore gestures that have too small of a radius.
     * 	 This is useful if you want to prevent a user from manipulating an object to too small of a radius.  For example,
     * 	 if you are using a manipulation processor with a circle and want the ensure that it maintains a radius greater
     * 	 than 100 pixels, you would set this value to 10000.	
     *   
     * 
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-get_minimumscalerotateradius
     */
    get_MinimumScaleRotateRadius() {
        result := ComCall(22, this, "float*", &minRadius := 0, "HRESULT")
        return minRadius
    }

    /**
     * Specifies how large the distance contacts on a scale or rotate gesture need to be to trigger manipulation.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This property is set in centipixels (100ths of a pixel).
     *   </div>
     * <div> </div>
     *     
     * 	 Setting this value will make the manipulation processor ignore gestures that have too small of a radius.
     * 	 This is useful if you want to prevent a user from manipulating an object to too small of a radius.  For example,
     * 	 if you are using a manipulation processor with a circle and want the ensure that it maintains a radius greater
     * 	 than 100 pixels, you would set this value to 10000.	
     *   
     * 
     * 
     * 
     * @param {Float} minRadius 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-imanipulationprocessor-put_minimumscalerotateradius
     */
    put_MinimumScaleRotateRadius(minRadius) {
        result := ComCall(23, this, "float", minRadius, "HRESULT")
        return result
    }
}
