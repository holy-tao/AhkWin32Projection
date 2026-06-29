#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\MANIPULATION_PROCESSOR_MANIPULATIONS.ahk" { MANIPULATION_PROCESSOR_MANIPULATIONS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IManipulationProcessor provides functionality for monitoring and responding to multitouch input.
 * @see https://learn.microsoft.com/windows/win32/api/manipulations/nn-manipulations-imanipulationprocessor
 * @namespace Windows.Win32.UI.Input.Touch
 */
export default struct IManipulationProcessor extends IUnknown {
    /**
     * The interface identifier for IManipulationProcessor
     * @type {Guid}
     */
    static IID := Guid("{a22ac519-8300-48a0-bef4-f1be8737dba4}")

    /**
     * The class identifier for ManipulationProcessor
     * @type {Guid}
     */
    static CLSID := Guid("{597d4fb0-47fd-4aff-89b9-c6cfae8cf08e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IManipulationProcessor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_SupportedManipulations   : IntPtr
        put_SupportedManipulations   : IntPtr
        get_PivotPointX              : IntPtr
        put_PivotPointX              : IntPtr
        get_PivotPointY              : IntPtr
        put_PivotPointY              : IntPtr
        get_PivotRadius              : IntPtr
        put_PivotRadius              : IntPtr
        CompleteManipulation         : IntPtr
        ProcessDown                  : IntPtr
        ProcessMove                  : IntPtr
        ProcessUp                    : IntPtr
        ProcessDownWithTime          : IntPtr
        ProcessMoveWithTime          : IntPtr
        ProcessUpWithTime            : IntPtr
        GetVelocityX                 : IntPtr
        GetVelocityY                 : IntPtr
        GetExpansionVelocity         : IntPtr
        GetAngularVelocity           : IntPtr
        get_MinimumScaleRotateRadius : IntPtr
        put_MinimumScaleRotateRadius : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IManipulationProcessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {MANIPULATION_PROCESSOR_MANIPULATIONS} 
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
     * The SupportedManipulations property is used to indicate which manipulations are supported by an object. (Get)
     * @remarks
     * With this property you can control which manipulations the supports and which it does not. 
     * 	 For example, you can block all y-translation manipulations while supporting x-translation manipulations.
     * @returns {MANIPULATION_PROCESSOR_MANIPULATIONS} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_supportedmanipulations
     */
    get_SupportedManipulations() {
        result := ComCall(3, this, "int*", &manipulations := 0, "HRESULT")
        return manipulations
    }

    /**
     * The SupportedManipulations property is used to indicate which manipulations are supported by an object. (Put)
     * @remarks
     * With this property you can control which manipulations the supports and which it does not. 
     * 	 For example, you can block all y-translation manipulations while supporting x-translation manipulations.
     * @param {MANIPULATION_PROCESSOR_MANIPULATIONS} manipulations 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-put_supportedmanipulations
     */
    put_SupportedManipulations(manipulations) {
        result := ComCall(4, this, MANIPULATION_PROCESSOR_MANIPULATIONS, manipulations, "HRESULT")
        return result
    }

    /**
     * The PivotPointX property is the horizontal center of the object. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_pivotpointx
     */
    get_PivotPointX() {
        result := ComCall(5, this, "float*", &pivotPointX := 0, "HRESULT")
        return pivotPointX
    }

    /**
     * The PivotPointX property is the horizontal center of the object. (Put)
     * @param {Float} pivotPointX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-put_pivotpointx
     */
    put_PivotPointX(pivotPointX) {
        result := ComCall(6, this, "float", pivotPointX, "HRESULT")
        return result
    }

    /**
     * The PivotPointY property is the vertical center of the object. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_pivotpointy
     */
    get_PivotPointY() {
        result := ComCall(7, this, "float*", &pivotPointY := 0, "HRESULT")
        return pivotPointY
    }

    /**
     * The PivotPointY property is the vertical center of the object. (Put)
     * @param {Float} pivotPointY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-put_pivotpointy
     */
    put_PivotPointY(pivotPointY) {
        result := ComCall(8, this, "float", pivotPointY, "HRESULT")
        return result
    }

    /**
     * The PivotRadius property is used to determine how much rotation is used in single finger manipulation. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  The pivot radius must either be negative, 0, or a value greater than 1. Setting the pivot radius to a value between 0.0 and 1.0 will return <b>E_INVALIDARG</b>.
     *       </div>
     * <div> </div>
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_pivotradius
     */
    get_PivotRadius() {
        result := ComCall(9, this, "float*", &pivotRadius := 0, "HRESULT")
        return pivotRadius
    }

    /**
     * The PivotRadius property is used to determine how much rotation is used in single finger manipulation. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  The pivot radius must either be negative, 0, or a value greater than 1. Setting the pivot radius to a value between 0.0 and 1.0 will return <b>E_INVALIDARG</b>.
     *       </div>
     * <div> </div>
     * @param {Float} pivotRadius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-put_pivotradius
     */
    put_PivotRadius(pivotRadius) {
        result := ComCall(10, this, "float", pivotRadius, "HRESULT")
        return result
    }

    /**
     * The CompleteManipulation method is called when the developer chooses to end the manipulation.
     * @remarks
     * This method raises the ManipulationCompleted() event in response.
     *   
     * 
     * During a Windows Touch gesture, manipulation gets started as soon as first touch input is sent for processing. 
     *   If <b>CompleteManipulation</b> is called before the second touch input gets a chance to be processed, 
     *   the second touch input will start a new manipulation.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-completemanipulation
     */
    CompleteManipulation() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The ProcessDown method feeds touch down data to the manipulation processor associated with a target.
     * @remarks
     * This method takes a timestamp using system time rather than from the touch hardware. To improve the experience in 
     *     cases where performance is degrading you should use the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-imanipulationprocessor-processdownwithtime">ProcessDownWithTime</a> method.
     * @param {Integer} manipulatorId The identifier for the touch contact that you want to process.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processdown
     */
    ProcessDown(manipulatorId, x, y) {
        result := ComCall(12, this, "uint", manipulatorId, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * The ProcessMove method feeds movement data for the target object to its manipulation processor.
     * @remarks
     * This method takes a timestamp using system time rather than from the touch hardware. To improve the experience in 
     *     cases where performance is degrading you should use the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-imanipulationprocessor-processmovewithtime">ProcessMoveWithTime</a> method.
     * @param {Integer} manipulatorId The identifier for the touch contact that you want to process.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processmove
     */
    ProcessMove(manipulatorId, x, y) {
        result := ComCall(13, this, "uint", manipulatorId, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * The ProcessUp method feeds data to a target's manipulation processor for touch up sequences.
     * @remarks
     * This method takes a timestamp using system time rather than from the touch hardware. To improve the experience in 
     *     cases where performance is degrading you should use the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-imanipulationprocessor-processupwithtime">ProcessUpWithTime</a> method.
     * @param {Integer} manipulatorId The identifier for the touch contact that you want to process.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processup
     */
    ProcessUp(manipulatorId, x, y) {
        result := ComCall(14, this, "uint", manipulatorId, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * Feeds touch down data, including a timestamp, to the manipulation processor associated with a target.
     * @remarks
     * It is possible to receive touch events out of the order they were produced.  To fix this, 
     *     you should extract the timestamp from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touchinput">TOUCHINPUT</a> structure when you process events.
     * @param {Integer} manipulatorId The identifier for the touch contact to be processed.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @param {Integer} _timestamp The time of the data event.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code such as <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processdownwithtime
     */
    ProcessDownWithTime(manipulatorId, x, y, _timestamp) {
        result := ComCall(15, this, "uint", manipulatorId, "float", x, "float", y, "uint", _timestamp, "HRESULT")
        return result
    }

    /**
     * Feeds movement data, including a time stamp, for the target object to its manipulation processor.
     * @remarks
     * It is possible to receive touch events out of the order they were produced.  To fix this, 
     *     you should extract the time stamp from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touchinput">TOUCHINPUT</a> structure when you process events.
     * @param {Integer} manipulatorId The identifier for the touch contact to be processed.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @param {Integer} _timestamp The time of the data event.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code such as <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processmovewithtime
     */
    ProcessMoveWithTime(manipulatorId, x, y, _timestamp) {
        result := ComCall(16, this, "uint", manipulatorId, "float", x, "float", y, "uint", _timestamp, "HRESULT")
        return result
    }

    /**
     * Feeds data, including a timestamp, to a target's manipulation processor for touch-up sequences.
     * @remarks
     * It is possible to receive touch events out of the order they were produced.  To fix this, 
     *     you should extract the timestamp from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touchinput">TOUCHINPUT</a> structure when you process events.
     * @param {Integer} manipulatorId The identifier for the touch contact to be processed.
     * @param {Float} x The horizontal coordinate data associated with the target.
     * @param {Float} y The vertical coordinate data associated with the target.
     * @param {Integer} _timestamp The time of the data event.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code such as <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-processupwithtime
     */
    ProcessUpWithTime(manipulatorId, x, y, _timestamp) {
        result := ComCall(17, this, "uint", manipulatorId, "float", x, "float", y, "uint", _timestamp, "HRESULT")
        return result
    }

    /**
     * Calculates and returns the horizontal velocity for the target object.
     * @remarks
     * This value is useful when you are using the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface. You should pass this value when the manipulation completes.
     * @returns {Float} The calculated horizontal velocity.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getvelocityx
     */
    GetVelocityX() {
        result := ComCall(18, this, "float*", &velocityX := 0, "HRESULT")
        return velocityX
    }

    /**
     * Calculates and returns the vertical velocity.
     * @remarks
     * This value is useful when you are using the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface. You should pass this value when the manipulation completes.
     * @returns {Float} The calculated vertical velocity.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getvelocityy
     */
    GetVelocityY() {
        result := ComCall(19, this, "float*", &velocityY := 0, "HRESULT")
        return velocityY
    }

    /**
     * The GetExpansionVelocity method calculates the rate that the target object is expanding at.
     * @remarks
     * This value is useful when you are using the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface. You should pass this value when the manipulation completes.
     * @returns {Float} The rate of expansion.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getexpansionvelocity
     */
    GetExpansionVelocity() {
        result := ComCall(20, this, "float*", &expansionVelocity := 0, "HRESULT")
        return expansionVelocity
    }

    /**
     * The GetAngularVelocity method calculates the rotational velocity that the target object is moving at.
     * @remarks
     * This value is useful when you are setting up the initial state of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface. You should pass this value when the manipulation completes.
     * 
     * This property is expressed in radians per millisecond if explicit timestamps are not specified by using calls to <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-imanipulationprocessor-processmovewithtime">ProcessMoveWithTime</a>, <b>ProcessMoveWithTime</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-imanipulationprocessor-processupwithtime">ProcessUpWithTime</a>. Otherwise, this function uses radians per user defined time units.
     * @returns {Float} The calculated rotational velocity.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-getangularvelocity
     */
    GetAngularVelocity() {
        result := ComCall(21, this, "float*", &angularVelocity := 0, "HRESULT")
        return angularVelocity
    }

    /**
     * Specifies how large the distance contacts on a scale or rotate gesture need to be to trigger manipulation. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is set in centipixels (100ths of a pixel).
     *   </div>
     * <div> </div>
     *     
     * 	 Setting this value will make the manipulation processor ignore gestures that have too small of a radius.
     * 	 This is useful if you want to prevent a user from manipulating an object to too small of a radius.  For example,
     * 	 if you are using a manipulation processor with a circle and want the ensure that it maintains a radius greater
     * 	 than 100 pixels, you would set this value to 10000.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-get_minimumscalerotateradius
     */
    get_MinimumScaleRotateRadius() {
        result := ComCall(22, this, "float*", &minRadius := 0, "HRESULT")
        return minRadius
    }

    /**
     * Specifies how large the distance contacts on a scale or rotate gesture need to be to trigger manipulation. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is set in centipixels (100ths of a pixel).
     *   </div>
     * <div> </div>
     *     
     * 	 Setting this value will make the manipulation processor ignore gestures that have too small of a radius.
     * 	 This is useful if you want to prevent a user from manipulating an object to too small of a radius.  For example,
     * 	 if you are using a manipulation processor with a circle and want the ensure that it maintains a radius greater
     * 	 than 100 pixels, you would set this value to 10000.
     * @param {Float} minRadius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-imanipulationprocessor-put_minimumscalerotateradius
     */
    put_MinimumScaleRotateRadius(minRadius) {
        result := ComCall(23, this, "float", minRadius, "HRESULT")
        return result
    }

    Query(iid) {
        if (IManipulationProcessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SupportedManipulations := CallbackCreate(GetMethod(implObj, "get_SupportedManipulations"), flags, 2)
        this.vtbl.put_SupportedManipulations := CallbackCreate(GetMethod(implObj, "put_SupportedManipulations"), flags, 2)
        this.vtbl.get_PivotPointX := CallbackCreate(GetMethod(implObj, "get_PivotPointX"), flags, 2)
        this.vtbl.put_PivotPointX := CallbackCreate(GetMethod(implObj, "put_PivotPointX"), flags, 2)
        this.vtbl.get_PivotPointY := CallbackCreate(GetMethod(implObj, "get_PivotPointY"), flags, 2)
        this.vtbl.put_PivotPointY := CallbackCreate(GetMethod(implObj, "put_PivotPointY"), flags, 2)
        this.vtbl.get_PivotRadius := CallbackCreate(GetMethod(implObj, "get_PivotRadius"), flags, 2)
        this.vtbl.put_PivotRadius := CallbackCreate(GetMethod(implObj, "put_PivotRadius"), flags, 2)
        this.vtbl.CompleteManipulation := CallbackCreate(GetMethod(implObj, "CompleteManipulation"), flags, 1)
        this.vtbl.ProcessDown := CallbackCreate(GetMethod(implObj, "ProcessDown"), flags, 4)
        this.vtbl.ProcessMove := CallbackCreate(GetMethod(implObj, "ProcessMove"), flags, 4)
        this.vtbl.ProcessUp := CallbackCreate(GetMethod(implObj, "ProcessUp"), flags, 4)
        this.vtbl.ProcessDownWithTime := CallbackCreate(GetMethod(implObj, "ProcessDownWithTime"), flags, 5)
        this.vtbl.ProcessMoveWithTime := CallbackCreate(GetMethod(implObj, "ProcessMoveWithTime"), flags, 5)
        this.vtbl.ProcessUpWithTime := CallbackCreate(GetMethod(implObj, "ProcessUpWithTime"), flags, 5)
        this.vtbl.GetVelocityX := CallbackCreate(GetMethod(implObj, "GetVelocityX"), flags, 2)
        this.vtbl.GetVelocityY := CallbackCreate(GetMethod(implObj, "GetVelocityY"), flags, 2)
        this.vtbl.GetExpansionVelocity := CallbackCreate(GetMethod(implObj, "GetExpansionVelocity"), flags, 2)
        this.vtbl.GetAngularVelocity := CallbackCreate(GetMethod(implObj, "GetAngularVelocity"), flags, 2)
        this.vtbl.get_MinimumScaleRotateRadius := CallbackCreate(GetMethod(implObj, "get_MinimumScaleRotateRadius"), flags, 2)
        this.vtbl.put_MinimumScaleRotateRadius := CallbackCreate(GetMethod(implObj, "put_MinimumScaleRotateRadius"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SupportedManipulations)
        CallbackFree(this.vtbl.put_SupportedManipulations)
        CallbackFree(this.vtbl.get_PivotPointX)
        CallbackFree(this.vtbl.put_PivotPointX)
        CallbackFree(this.vtbl.get_PivotPointY)
        CallbackFree(this.vtbl.put_PivotPointY)
        CallbackFree(this.vtbl.get_PivotRadius)
        CallbackFree(this.vtbl.put_PivotRadius)
        CallbackFree(this.vtbl.CompleteManipulation)
        CallbackFree(this.vtbl.ProcessDown)
        CallbackFree(this.vtbl.ProcessMove)
        CallbackFree(this.vtbl.ProcessUp)
        CallbackFree(this.vtbl.ProcessDownWithTime)
        CallbackFree(this.vtbl.ProcessMoveWithTime)
        CallbackFree(this.vtbl.ProcessUpWithTime)
        CallbackFree(this.vtbl.GetVelocityX)
        CallbackFree(this.vtbl.GetVelocityY)
        CallbackFree(this.vtbl.GetExpansionVelocity)
        CallbackFree(this.vtbl.GetAngularVelocity)
        CallbackFree(this.vtbl.get_MinimumScaleRotateRadius)
        CallbackFree(this.vtbl.put_MinimumScaleRotateRadius)
    }
}
