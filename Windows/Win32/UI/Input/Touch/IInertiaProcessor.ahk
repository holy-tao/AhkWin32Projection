#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IInertiaProcessor interface handles calculations regarding object motion for Windows Touch.
 * @see https://learn.microsoft.com/windows/win32/api/manipulations/nn-manipulations-iinertiaprocessor
 * @namespace Windows.Win32.UI.Input.Touch
 */
export default struct IInertiaProcessor extends IUnknown {
    /**
     * The interface identifier for IInertiaProcessor
     * @type {Guid}
     */
    static IID := Guid("{18b00c6d-c5ee-41b1-90a9-9d4a929095ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInertiaProcessor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_InitialOriginX               : IntPtr
        put_InitialOriginX               : IntPtr
        get_InitialOriginY               : IntPtr
        put_InitialOriginY               : IntPtr
        get_InitialVelocityX             : IntPtr
        put_InitialVelocityX             : IntPtr
        get_InitialVelocityY             : IntPtr
        put_InitialVelocityY             : IntPtr
        get_InitialAngularVelocity       : IntPtr
        put_InitialAngularVelocity       : IntPtr
        get_InitialExpansionVelocity     : IntPtr
        put_InitialExpansionVelocity     : IntPtr
        get_InitialRadius                : IntPtr
        put_InitialRadius                : IntPtr
        get_BoundaryLeft                 : IntPtr
        put_BoundaryLeft                 : IntPtr
        get_BoundaryTop                  : IntPtr
        put_BoundaryTop                  : IntPtr
        get_BoundaryRight                : IntPtr
        put_BoundaryRight                : IntPtr
        get_BoundaryBottom               : IntPtr
        put_BoundaryBottom               : IntPtr
        get_ElasticMarginLeft            : IntPtr
        put_ElasticMarginLeft            : IntPtr
        get_ElasticMarginTop             : IntPtr
        put_ElasticMarginTop             : IntPtr
        get_ElasticMarginRight           : IntPtr
        put_ElasticMarginRight           : IntPtr
        get_ElasticMarginBottom          : IntPtr
        put_ElasticMarginBottom          : IntPtr
        get_DesiredDisplacement          : IntPtr
        put_DesiredDisplacement          : IntPtr
        get_DesiredRotation              : IntPtr
        put_DesiredRotation              : IntPtr
        get_DesiredExpansion             : IntPtr
        put_DesiredExpansion             : IntPtr
        get_DesiredDeceleration          : IntPtr
        put_DesiredDeceleration          : IntPtr
        get_DesiredAngularDeceleration   : IntPtr
        put_DesiredAngularDeceleration   : IntPtr
        get_DesiredExpansionDeceleration : IntPtr
        put_DesiredExpansionDeceleration : IntPtr
        get_InitialTimestamp             : IntPtr
        put_InitialTimestamp             : IntPtr
        Reset                            : IntPtr
        Process                          : IntPtr
        ProcessTime                      : IntPtr
        Complete                         : IntPtr
        CompleteTime                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInertiaProcessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    InitialOriginX {
        get => this.get_InitialOriginX()
        set => this.put_InitialOriginX(value)
    }

    /**
     * @type {Float} 
     */
    InitialOriginY {
        get => this.get_InitialOriginY()
        set => this.put_InitialOriginY(value)
    }

    /**
     * @type {Float} 
     */
    InitialVelocityX {
        get => this.get_InitialVelocityX()
        set => this.put_InitialVelocityX(value)
    }

    /**
     * @type {Float} 
     */
    InitialVelocityY {
        get => this.get_InitialVelocityY()
        set => this.put_InitialVelocityY(value)
    }

    /**
     * @type {Float} 
     */
    InitialAngularVelocity {
        get => this.get_InitialAngularVelocity()
        set => this.put_InitialAngularVelocity(value)
    }

    /**
     * @type {Float} 
     */
    InitialExpansionVelocity {
        get => this.get_InitialExpansionVelocity()
        set => this.put_InitialExpansionVelocity(value)
    }

    /**
     * @type {Float} 
     */
    InitialRadius {
        get => this.get_InitialRadius()
        set => this.put_InitialRadius(value)
    }

    /**
     * @type {Float} 
     */
    BoundaryLeft {
        get => this.get_BoundaryLeft()
        set => this.put_BoundaryLeft(value)
    }

    /**
     * @type {Float} 
     */
    BoundaryTop {
        get => this.get_BoundaryTop()
        set => this.put_BoundaryTop(value)
    }

    /**
     * @type {Float} 
     */
    BoundaryRight {
        get => this.get_BoundaryRight()
        set => this.put_BoundaryRight(value)
    }

    /**
     * @type {Float} 
     */
    BoundaryBottom {
        get => this.get_BoundaryBottom()
        set => this.put_BoundaryBottom(value)
    }

    /**
     * @type {Float} 
     */
    ElasticMarginLeft {
        get => this.get_ElasticMarginLeft()
        set => this.put_ElasticMarginLeft(value)
    }

    /**
     * @type {Float} 
     */
    ElasticMarginTop {
        get => this.get_ElasticMarginTop()
        set => this.put_ElasticMarginTop(value)
    }

    /**
     * @type {Float} 
     */
    ElasticMarginRight {
        get => this.get_ElasticMarginRight()
        set => this.put_ElasticMarginRight(value)
    }

    /**
     * @type {Float} 
     */
    ElasticMarginBottom {
        get => this.get_ElasticMarginBottom()
        set => this.put_ElasticMarginBottom(value)
    }

    /**
     * @type {Float} 
     */
    DesiredDisplacement {
        get => this.get_DesiredDisplacement()
        set => this.put_DesiredDisplacement(value)
    }

    /**
     * @type {Float} 
     */
    DesiredRotation {
        get => this.get_DesiredRotation()
        set => this.put_DesiredRotation(value)
    }

    /**
     * @type {Float} 
     */
    DesiredExpansion {
        get => this.get_DesiredExpansion()
        set => this.put_DesiredExpansion(value)
    }

    /**
     * @type {Float} 
     */
    DesiredDeceleration {
        get => this.get_DesiredDeceleration()
        set => this.put_DesiredDeceleration(value)
    }

    /**
     * @type {Float} 
     */
    DesiredAngularDeceleration {
        get => this.get_DesiredAngularDeceleration()
        set => this.put_DesiredAngularDeceleration(value)
    }

    /**
     * @type {Float} 
     */
    DesiredExpansionDeceleration {
        get => this.get_DesiredExpansionDeceleration()
        set => this.put_DesiredExpansionDeceleration(value)
    }

    /**
     * @type {Integer} 
     */
    InitialTimestamp {
        get => this.get_InitialTimestamp()
        set => this.put_InitialTimestamp(value)
    }

    /**
     * The InitialOriginX property specifies the starting horizontal location for a target with inertia. (Get)
     * @remarks
     * A user can manipulate an object to set the <b>InitialOriginX</b> to be outside of the elastic bounds.
     * 	 Setting <b>InitialOriginX</b> to a value outside of the elastic bounds will cause an exception to be thrown.
     * 	 To prevent  users from setting the origin out of bounds, check that <b>InitialOriginX</b> is valid before 
     * 	 setting it on an <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface. If Inertia processing has already started, calling put_InitialOriginX()
     * 	 will reset the inertia state to initial time stamp.
     * 	 
     * 
     * All locations used for the inertia and manipulation processor are relative. If you want to use screen coordinates,
     * 	      you pass screen coordinates to the manipulation (or inertia) processor; if you want to use absolute coordinates, 
     * 			you pass those into the processor you are using. 
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialoriginx
     */
    get_InitialOriginX() {
        result := ComCall(3, this, "float*", &x := 0, "HRESULT")
        return x
    }

    /**
     * The InitialOriginX property specifies the starting horizontal location for a target with inertia. (Put)
     * @remarks
     * A user can manipulate an object to set the <b>InitialOriginX</b> to be outside of the elastic bounds.
     * 	 Setting <b>InitialOriginX</b> to a value outside of the elastic bounds will cause an exception to be thrown.
     * 	 To prevent  users from setting the origin out of bounds, check that <b>InitialOriginX</b> is valid before 
     * 	 setting it on an <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface. If Inertia processing has already started, calling put_InitialOriginX()
     * 	 will reset the inertia state to initial time stamp.
     * 	 
     * 
     * All locations used for the inertia and manipulation processor are relative. If you want to use screen coordinates,
     * 	      you pass screen coordinates to the manipulation (or inertia) processor; if you want to use absolute coordinates, 
     * 			you pass those into the processor you are using. 
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} x 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialoriginx
     */
    put_InitialOriginX(x) {
        result := ComCall(4, this, "float", x, "HRESULT")
        return result
    }

    /**
     * The InitialOriginY property specifies the starting vertical location for a target with inertia. (Get)
     * @remarks
     * A user can manipulate an object to set the <b>InitialOriginY</b> to be outside of the elastic bounds.
     * 	 Setting <b>InitialOriginY</b> to a value outside of the elastic bounds will cause an exception to be thrown.
     * 	 To prevent  users from setting the origin out of bounds, check that <b>InitialOriginY</b> is valid before setting it 
     * 	 on an <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.	 If Inertia processing has already started, calling put_InitialOriginY() 
     * 	 will reset the inertia state to initial time stamp.
     * 	 
     * 
     * All locations used for the inertia and manipulation processor are relative. If you want to use screen coordinates, 
     * 		  you pass screen coordinates to the manipulation (or inertia) processor; if you want to use absolute coordinates, you 
     * 		  pass those into the processor you are using. 	 
     * 	 
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialoriginy
     */
    get_InitialOriginY() {
        result := ComCall(5, this, "float*", &y := 0, "HRESULT")
        return y
    }

    /**
     * The InitialOriginY property specifies the starting vertical location for a target with inertia. (Put)
     * @remarks
     * A user can manipulate an object to set the <b>InitialOriginY</b> to be outside of the elastic bounds.
     * 	 Setting <b>InitialOriginY</b> to a value outside of the elastic bounds will cause an exception to be thrown.
     * 	 To prevent  users from setting the origin out of bounds, check that <b>InitialOriginY</b> is valid before setting it 
     * 	 on an <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.	 If Inertia processing has already started, calling put_InitialOriginY() 
     * 	 will reset the inertia state to initial time stamp.
     * 	 
     * 
     * All locations used for the inertia and manipulation processor are relative. If you want to use screen coordinates, 
     * 		  you pass screen coordinates to the manipulation (or inertia) processor; if you want to use absolute coordinates, you 
     * 		  pass those into the processor you are using. 	 
     * 	 
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialoriginy
     */
    put_InitialOriginY(y) {
        result := ComCall(6, this, "float", y, "HRESULT")
        return result
    }

    /**
     * The InitialVelocityX property specifies the initial movement of the target object on the horizontal axis. (Get)
     * @remarks
     * If Inertia processing has already started, setting <b>InitialVelocityX</b> will reset the inertia engine to the initial state with new velocity values applied.	 		
     * 	 
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialvelocityx
     */
    get_InitialVelocityX() {
        result := ComCall(7, this, "float*", &x := 0, "HRESULT")
        return x
    }

    /**
     * The InitialVelocityX property specifies the initial movement of the target object on the horizontal axis. (Put)
     * @remarks
     * If Inertia processing has already started, setting <b>InitialVelocityX</b> will reset the inertia engine to the initial state with new velocity values applied.	 		
     * 	 
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} x 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialvelocityx
     */
    put_InitialVelocityX(x) {
        result := ComCall(8, this, "float", x, "HRESULT")
        return result
    }

    /**
     * The InitialVelocityY property specifies the initial movement of the target object on the vertical axis. (Get)
     * @remarks
     * If inertia processing has already started, setting <b>InitialVelocityY</b> will reset the inertia engine to the initial state with new velocity values applied.		
     * 		
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialvelocityy
     */
    get_InitialVelocityY() {
        result := ComCall(9, this, "float*", &y := 0, "HRESULT")
        return y
    }

    /**
     * The InitialVelocityY property specifies the initial movement of the target object on the vertical axis. (Put)
     * @remarks
     * If inertia processing has already started, setting <b>InitialVelocityY</b> will reset the inertia engine to the initial state with new velocity values applied.		
     * 		
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialvelocityy
     */
    put_InitialVelocityY(y) {
        result := ComCall(10, this, "float", y, "HRESULT")
        return result
    }

    /**
     * The InitialAngularVelocity property specifies the rotational (angular) velocity of the target when movement begins. (Get)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredrotation">DesiredRotation</a> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredangulardeceleration">DesiredAngularDeceleration</a> are mutually exclusive.  If one is set, the other should be NaN.  If the <b>DesiredRotation</b> property is set, the API will set the <b>DesiredAngularDeceleration</b> property so that the object will stop after the desired number of radians.
     *        The unit of angular acceleration is radians.
     *       
     * 
     * If inertia processing has already started, setting <b>InitialAngularVelocity</b> will reset the inertia engine to the initial state with new velocity values applied.
     * 		
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialangularvelocity
     */
    get_InitialAngularVelocity() {
        result := ComCall(11, this, "float*", &velocity := 0, "HRESULT")
        return velocity
    }

    /**
     * The InitialAngularVelocity property specifies the rotational (angular) velocity of the target when movement begins. (Put)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredrotation">DesiredRotation</a> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredangulardeceleration">DesiredAngularDeceleration</a> are mutually exclusive.  If one is set, the other should be NaN.  If the <b>DesiredRotation</b> property is set, the API will set the <b>DesiredAngularDeceleration</b> property so that the object will stop after the desired number of radians.
     *        The unit of angular acceleration is radians.
     *       
     * 
     * If inertia processing has already started, setting <b>InitialAngularVelocity</b> will reset the inertia engine to the initial state with new velocity values applied.
     * 		
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} velocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialangularvelocity
     */
    put_InitialAngularVelocity(velocity) {
        result := ComCall(12, this, "float", velocity, "HRESULT")
        return result
    }

    /**
     * The InitialExpansionVelocity property specifies the rate of radius expansion for a target when the target was affected by inertia. (Get)
     * @remarks
     * The amount of expansion that the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> extrapolates will be determined by the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansion">DesiredExpansion</a> or <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansiondeceleration">DesiredExpansionDeceleration</a> property.
     *       <b>DesiredExpansion</b> and <b>DesiredExpansionDeceleration</b> are mutually exclusive.  If one is set, the other should be NaN.
     *     If using the <b>DesiredExpansion</b> property, the API will set the appropriate <b>DesiredExpansionDeceleration</b> value to expand the requested amount.
     * 
     * If inertia processing has already started, setting <b>InitialExpansionVelocity</b> will reset the inertia engine to the initial state with new velocity values applied.
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialexpansionvelocity
     */
    get_InitialExpansionVelocity() {
        result := ComCall(13, this, "float*", &velocity := 0, "HRESULT")
        return velocity
    }

    /**
     * The InitialExpansionVelocity property specifies the rate of radius expansion for a target when the target was affected by inertia. (Put)
     * @remarks
     * The amount of expansion that the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> extrapolates will be determined by the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansion">DesiredExpansion</a> or <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansiondeceleration">DesiredExpansionDeceleration</a> property.
     *       <b>DesiredExpansion</b> and <b>DesiredExpansionDeceleration</b> are mutually exclusive.  If one is set, the other should be NaN.
     *     If using the <b>DesiredExpansion</b> property, the API will set the appropriate <b>DesiredExpansionDeceleration</b> value to expand the requested amount.
     * 
     * If inertia processing has already started, setting <b>InitialExpansionVelocity</b> will reset the inertia engine to the initial state with new velocity values applied.
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} velocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialexpansionvelocity
     */
    put_InitialExpansionVelocity(velocity) {
        result := ComCall(14, this, "float", velocity, "HRESULT")
        return result
    }

    /**
     * The InitialRadius property specifies the distance from the edge of the target to its center before the object was changed. (Get)
     * @remarks
     * If Inertia processing has already started, setting <b>InitialRadius</b> will reset the inertia engine to the initial state with new radius value applied.
     * 	 
     * 
     * Call this function to set initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a>, or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialradius
     */
    get_InitialRadius() {
        result := ComCall(15, this, "float*", &radius := 0, "HRESULT")
        return radius
    }

    /**
     * The InitialRadius property specifies the distance from the edge of the target to its center before the object was changed. (Put)
     * @remarks
     * If Inertia processing has already started, setting <b>InitialRadius</b> will reset the inertia engine to the initial state with new radius value applied.
     * 	 
     * 
     * Call this function to set initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a>, or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialradius
     */
    put_InitialRadius(radius) {
        result := ComCall(16, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * The BoundaryLeft property limits how far towards the left of the screen the target object can move. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundaryleft
     */
    get_BoundaryLeft() {
        result := ComCall(17, this, "float*", &left := 0, "HRESULT")
        return left
    }

    /**
     * The BoundaryLeft property limits how far towards the left of the screen the target object can move. (Put)
     * @param {Float} left 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_boundaryleft
     */
    put_BoundaryLeft(left) {
        result := ComCall(18, this, "float", left, "HRESULT")
        return result
    }

    /**
     * The BoundaryTop property limits how far towards the top of the screen the target object can move. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundarytop
     */
    get_BoundaryTop() {
        result := ComCall(19, this, "float*", &top := 0, "HRESULT")
        return top
    }

    /**
     * The BoundaryTop property limits how far towards the top of the screen the target object can move. (Put)
     * @param {Float} top 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_boundarytop
     */
    put_BoundaryTop(top) {
        result := ComCall(20, this, "float", top, "HRESULT")
        return result
    }

    /**
     * The BoundaryRight property limits how far towards the right of the screen the target object can move. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundaryright
     */
    get_BoundaryRight() {
        result := ComCall(21, this, "float*", &right := 0, "HRESULT")
        return right
    }

    /**
     * The BoundaryRight property limits how far towards the right of the screen the target object can move. (Put)
     * @param {Float} right 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_boundaryright
     */
    put_BoundaryRight(right) {
        result := ComCall(22, this, "float", right, "HRESULT")
        return result
    }

    /**
     * The BoundaryBottom property limits how far towards the bottom of the screen the target object can move. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundarybottom
     */
    get_BoundaryBottom() {
        result := ComCall(23, this, "float*", &bottom := 0, "HRESULT")
        return bottom
    }

    /**
     * The BoundaryBottom property limits how far towards the bottom of the screen the target object can move. (Put)
     * @param {Float} bottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_boundarybottom
     */
    put_BoundaryBottom(bottom) {
        result := ComCall(24, this, "float", bottom, "HRESULT")
        return result
    }

    /**
     * The ElasticMarginLeft property specifies the leftmost region for bouncing the target object. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmarginleft
     */
    get_ElasticMarginLeft() {
        result := ComCall(25, this, "float*", &left := 0, "HRESULT")
        return left
    }

    /**
     * The ElasticMarginLeft property specifies the leftmost region for bouncing the target object. (Put)
     * @param {Float} left 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_elasticmarginleft
     */
    put_ElasticMarginLeft(left) {
        result := ComCall(26, this, "float", left, "HRESULT")
        return result
    }

    /**
     * The ElasticMarginTop property specifies the topmost region for bouncing the target object. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmargintop
     */
    get_ElasticMarginTop() {
        result := ComCall(27, this, "float*", &top := 0, "HRESULT")
        return top
    }

    /**
     * The ElasticMarginTop property specifies the topmost region for bouncing the target object. (Put)
     * @param {Float} top 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_elasticmargintop
     */
    put_ElasticMarginTop(top) {
        result := ComCall(28, this, "float", top, "HRESULT")
        return result
    }

    /**
     * The ElasticMarginRight property specifies the rightmost region for bouncing the target object. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmarginright
     */
    get_ElasticMarginRight() {
        result := ComCall(29, this, "float*", &right := 0, "HRESULT")
        return right
    }

    /**
     * The ElasticMarginRight property specifies the rightmost region for bouncing the target object. (Put)
     * @param {Float} right 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_elasticmarginright
     */
    put_ElasticMarginRight(right) {
        result := ComCall(30, this, "float", right, "HRESULT")
        return result
    }

    /**
     * The ElasticMarginBottom property specifies the bottom region for bouncing the target object. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmarginbottom
     */
    get_ElasticMarginBottom() {
        result := ComCall(31, this, "float*", &bottom := 0, "HRESULT")
        return bottom
    }

    /**
     * The ElasticMarginBottom property specifies the bottom region for bouncing the target object. (Put)
     * @param {Float} bottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_elasticmarginbottom
     */
    put_ElasticMarginBottom(bottom) {
        result := ComCall(32, this, "float", bottom, "HRESULT")
        return result
    }

    /**
     * The DesiredDisplacement property specifies the desired distance that the object will travel. (Get)
     * @remarks
     * <b>DesiredDisplacement</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desireddeceleration">DesiredDeceleration</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 
     * If inertia processing has already started, setting <b>DesiredDisplacement</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desireddisplacement
     */
    get_DesiredDisplacement() {
        result := ComCall(33, this, "float*", &displacement := 0, "HRESULT")
        return displacement
    }

    /**
     * The DesiredDisplacement property specifies the desired distance that the object will travel. (Put)
     * @remarks
     * <b>DesiredDisplacement</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desireddeceleration">DesiredDeceleration</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 
     * If inertia processing has already started, setting <b>DesiredDisplacement</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} displacement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desireddisplacement
     */
    put_DesiredDisplacement(displacement) {
        result := ComCall(34, this, "float", displacement, "HRESULT")
        return result
    }

    /**
     * The DesiredRotation property specifies how far the current inertia processor object should manipulate the target object in radians. (Get)
     * @remarks
     * <b>DesiredRotation</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredangulardeceleration">DesiredAngularDeceleration</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 
     * If inertia processing has already started, setting <b>DesiredRotation</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredrotation
     */
    get_DesiredRotation() {
        result := ComCall(35, this, "float*", &rotation := 0, "HRESULT")
        return rotation
    }

    /**
     * The DesiredRotation property specifies how far the current inertia processor object should manipulate the target object in radians. (Put)
     * @remarks
     * <b>DesiredRotation</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredangulardeceleration">DesiredAngularDeceleration</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 
     * If inertia processing has already started, setting <b>DesiredRotation</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} rotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desiredrotation
     */
    put_DesiredRotation(rotation) {
        result := ComCall(36, this, "float", rotation, "HRESULT")
        return result
    }

    /**
     * The DesiredExpansion property specifies the desired change in the object's average radius. (Get)
     * @remarks
     * <b>DesiredExpansion</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansiondeceleration">DesiredExpansionDeceleration</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 
     * If inertia processing has already started, setting <b>DesiredExpansion</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansion
     */
    get_DesiredExpansion() {
        result := ComCall(37, this, "float*", &expansion := 0, "HRESULT")
        return expansion
    }

    /**
     * The DesiredExpansion property specifies the desired change in the object's average radius. (Put)
     * @remarks
     * <b>DesiredExpansion</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansiondeceleration">DesiredExpansionDeceleration</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 
     * If inertia processing has already started, setting <b>DesiredExpansion</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} expansion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desiredexpansion
     */
    put_DesiredExpansion(expansion) {
        result := ComCall(38, this, "float", expansion, "HRESULT")
        return result
    }

    /**
     * The DesiredDeceleration property specifies the desired rate at which translation operations will decelerate. (Get)
     * @remarks
     * <b>DesiredDeceleration</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desireddisplacement">DesiredDisplacement</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 
     * If inertia processing has already started, setting <b>DesiredDeceleration</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desireddeceleration
     */
    get_DesiredDeceleration() {
        result := ComCall(39, this, "float*", &deceleration := 0, "HRESULT")
        return deceleration
    }

    /**
     * The DesiredDeceleration property specifies the desired rate at which translation operations will decelerate. (Put)
     * @remarks
     * <b>DesiredDeceleration</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desireddisplacement">DesiredDisplacement</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 
     * If inertia processing has already started, setting <b>DesiredDeceleration</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} deceleration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desireddeceleration
     */
    put_DesiredDeceleration(deceleration) {
        result := ComCall(40, this, "float", deceleration, "HRESULT")
        return result
    }

    /**
     * The DesiredAngularDeceleration property specifies the desired rate that the target object will stop spinning in radians per msec squared. (Get)
     * @remarks
     * <b>DesiredAngularDeceleration</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredrotation">DesiredRotation</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 		
     * 
     * If inertia processing has already started, setting <b>DesiredAngularDeceleration</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredangulardeceleration
     */
    get_DesiredAngularDeceleration() {
        result := ComCall(41, this, "float*", &deceleration := 0, "HRESULT")
        return deceleration
    }

    /**
     * The DesiredAngularDeceleration property specifies the desired rate that the target object will stop spinning in radians per msec squared. (Put)
     * @remarks
     * <b>DesiredAngularDeceleration</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredrotation">DesiredRotation</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 		
     * 
     * If inertia processing has already started, setting <b>DesiredAngularDeceleration</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} deceleration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desiredangulardeceleration
     */
    put_DesiredAngularDeceleration(deceleration) {
        result := ComCall(42, this, "float", deceleration, "HRESULT")
        return result
    }

    /**
     * The DesiredExpansionDeceleration property specifies the rate at which the object will stop expanding. (Get)
     * @remarks
     * <b>DesiredExpansionDeceleration</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansion">DesiredExpansion</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 
     * If inertia processing has already started, setting <b>DesiredExpansionDeceleration</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansiondeceleration
     */
    get_DesiredExpansionDeceleration() {
        result := ComCall(43, this, "float*", &deceleration := 0, "HRESULT")
        return deceleration
    }

    /**
     * The DesiredExpansionDeceleration property specifies the rate at which the object will stop expanding. (Put)
     * @remarks
     * <b>DesiredExpansionDeceleration</b> and <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansion">DesiredExpansion</a> are mutually exclusive.  If one is set, the other should be NaN.
     * 
     * If inertia processing has already started, setting <b>DesiredExpansionDeceleration</b> will reset the inertia engine to the initial state with new deceleration value applied.
     *       
     * 
     * Call this function to set the initial state of inertia. You would call this function most likely during the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> or in the constructor of the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-iinertiaprocessor">IInertiaProcessor</a> interface.
     * @param {Float} deceleration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desiredexpansiondeceleration
     */
    put_DesiredExpansionDeceleration(deceleration) {
        result := ComCall(44, this, "float", deceleration, "HRESULT")
        return result
    }

    /**
     * The InitialTimestamp property specifies the starting time stamp for a target object with inertia. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialtimestamp
     */
    get_InitialTimestamp() {
        result := ComCall(45, this, "uint*", &_timestamp := 0, "HRESULT")
        return _timestamp
    }

    /**
     * The InitialTimestamp property specifies the starting time stamp for a target object with inertia. (Put)
     * @param {Integer} _timestamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialtimestamp
     */
    put_InitialTimestamp(_timestamp) {
        result := ComCall(46, this, "uint", _timestamp, "HRESULT")
        return result
    }

    /**
     * The Reset method initializes the processor with initial timestamp and restarts inertia.
     * @remarks
     * If you have changed properties on an object currently being manipulated by inertia, call <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-iinertiaprocessor-complete">Complete</a> before calling <b>Reset</b>.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-reset
     */
    Reset() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * The Process method performs calculations and can raise the Started, Delta, or Completed event depending on whether extrapolation is completed or not. If extrapolation finished at the previous tick, the method is no-op.
     * @returns {BOOL} Indicates whether an operation was performed. A value of false indicates extrapolation was finished at a previous tick and the operation was a no-op.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-process
     */
    Process() {
        result := ComCall(48, this, BOOL.Ptr, &completed := 0, "HRESULT")
        return completed
    }

    /**
     * The ProcessTime method performs calculations for the given tick and can raise the Started, Delta, or Completed event depending on whether extrapolation is completed or not. If extrapolation finished at the previous tick, the method is no-op.
     * @param {Integer} _timestamp A parameter that contains a timestamp (in millisecs) to process.
     * @returns {BOOL} Indicates whether an operation was performed. A value of false indicates extrapolation was finished at a previous tick and the operation was a no-op.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-processtime
     */
    ProcessTime(_timestamp) {
        result := ComCall(49, this, "uint", _timestamp, BOOL.Ptr, &completed := 0, "HRESULT")
        return completed
    }

    /**
     * The Complete method finishes the current manipulation and stops inertia on the inertia processor.
     * @remarks
     * The <b>Complete</b> method raises the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event	on an <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nn-manipulations-_imanipulationevents">_IManipulationEvents</a> interface implementation.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-complete
     */
    Complete() {
        result := ComCall(50, this, "HRESULT")
        return result
    }

    /**
     * Finishes the current manipulation at the given tick, stops inertia on the inertia processor, and raises the ManipulationCompleted event.
     * @remarks
     * The <b>CompleteTime</b> method raises the <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted">ManipulationCompleted</a> event on an <a href="https://docs.microsoft.com/windows/win32/api/manipulations/nn-manipulations-_imanipulationevents">_IManipulationEvents</a> interface implementation.
     * @param {Integer} _timestamp A parameter containing a timestamp (in milliseconds) to process.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, otherwise returns an error code such as <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-completetime
     */
    CompleteTime(_timestamp) {
        result := ComCall(51, this, "uint", _timestamp, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInertiaProcessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_InitialOriginX := CallbackCreate(GetMethod(implObj, "get_InitialOriginX"), flags, 2)
        this.vtbl.put_InitialOriginX := CallbackCreate(GetMethod(implObj, "put_InitialOriginX"), flags, 2)
        this.vtbl.get_InitialOriginY := CallbackCreate(GetMethod(implObj, "get_InitialOriginY"), flags, 2)
        this.vtbl.put_InitialOriginY := CallbackCreate(GetMethod(implObj, "put_InitialOriginY"), flags, 2)
        this.vtbl.get_InitialVelocityX := CallbackCreate(GetMethod(implObj, "get_InitialVelocityX"), flags, 2)
        this.vtbl.put_InitialVelocityX := CallbackCreate(GetMethod(implObj, "put_InitialVelocityX"), flags, 2)
        this.vtbl.get_InitialVelocityY := CallbackCreate(GetMethod(implObj, "get_InitialVelocityY"), flags, 2)
        this.vtbl.put_InitialVelocityY := CallbackCreate(GetMethod(implObj, "put_InitialVelocityY"), flags, 2)
        this.vtbl.get_InitialAngularVelocity := CallbackCreate(GetMethod(implObj, "get_InitialAngularVelocity"), flags, 2)
        this.vtbl.put_InitialAngularVelocity := CallbackCreate(GetMethod(implObj, "put_InitialAngularVelocity"), flags, 2)
        this.vtbl.get_InitialExpansionVelocity := CallbackCreate(GetMethod(implObj, "get_InitialExpansionVelocity"), flags, 2)
        this.vtbl.put_InitialExpansionVelocity := CallbackCreate(GetMethod(implObj, "put_InitialExpansionVelocity"), flags, 2)
        this.vtbl.get_InitialRadius := CallbackCreate(GetMethod(implObj, "get_InitialRadius"), flags, 2)
        this.vtbl.put_InitialRadius := CallbackCreate(GetMethod(implObj, "put_InitialRadius"), flags, 2)
        this.vtbl.get_BoundaryLeft := CallbackCreate(GetMethod(implObj, "get_BoundaryLeft"), flags, 2)
        this.vtbl.put_BoundaryLeft := CallbackCreate(GetMethod(implObj, "put_BoundaryLeft"), flags, 2)
        this.vtbl.get_BoundaryTop := CallbackCreate(GetMethod(implObj, "get_BoundaryTop"), flags, 2)
        this.vtbl.put_BoundaryTop := CallbackCreate(GetMethod(implObj, "put_BoundaryTop"), flags, 2)
        this.vtbl.get_BoundaryRight := CallbackCreate(GetMethod(implObj, "get_BoundaryRight"), flags, 2)
        this.vtbl.put_BoundaryRight := CallbackCreate(GetMethod(implObj, "put_BoundaryRight"), flags, 2)
        this.vtbl.get_BoundaryBottom := CallbackCreate(GetMethod(implObj, "get_BoundaryBottom"), flags, 2)
        this.vtbl.put_BoundaryBottom := CallbackCreate(GetMethod(implObj, "put_BoundaryBottom"), flags, 2)
        this.vtbl.get_ElasticMarginLeft := CallbackCreate(GetMethod(implObj, "get_ElasticMarginLeft"), flags, 2)
        this.vtbl.put_ElasticMarginLeft := CallbackCreate(GetMethod(implObj, "put_ElasticMarginLeft"), flags, 2)
        this.vtbl.get_ElasticMarginTop := CallbackCreate(GetMethod(implObj, "get_ElasticMarginTop"), flags, 2)
        this.vtbl.put_ElasticMarginTop := CallbackCreate(GetMethod(implObj, "put_ElasticMarginTop"), flags, 2)
        this.vtbl.get_ElasticMarginRight := CallbackCreate(GetMethod(implObj, "get_ElasticMarginRight"), flags, 2)
        this.vtbl.put_ElasticMarginRight := CallbackCreate(GetMethod(implObj, "put_ElasticMarginRight"), flags, 2)
        this.vtbl.get_ElasticMarginBottom := CallbackCreate(GetMethod(implObj, "get_ElasticMarginBottom"), flags, 2)
        this.vtbl.put_ElasticMarginBottom := CallbackCreate(GetMethod(implObj, "put_ElasticMarginBottom"), flags, 2)
        this.vtbl.get_DesiredDisplacement := CallbackCreate(GetMethod(implObj, "get_DesiredDisplacement"), flags, 2)
        this.vtbl.put_DesiredDisplacement := CallbackCreate(GetMethod(implObj, "put_DesiredDisplacement"), flags, 2)
        this.vtbl.get_DesiredRotation := CallbackCreate(GetMethod(implObj, "get_DesiredRotation"), flags, 2)
        this.vtbl.put_DesiredRotation := CallbackCreate(GetMethod(implObj, "put_DesiredRotation"), flags, 2)
        this.vtbl.get_DesiredExpansion := CallbackCreate(GetMethod(implObj, "get_DesiredExpansion"), flags, 2)
        this.vtbl.put_DesiredExpansion := CallbackCreate(GetMethod(implObj, "put_DesiredExpansion"), flags, 2)
        this.vtbl.get_DesiredDeceleration := CallbackCreate(GetMethod(implObj, "get_DesiredDeceleration"), flags, 2)
        this.vtbl.put_DesiredDeceleration := CallbackCreate(GetMethod(implObj, "put_DesiredDeceleration"), flags, 2)
        this.vtbl.get_DesiredAngularDeceleration := CallbackCreate(GetMethod(implObj, "get_DesiredAngularDeceleration"), flags, 2)
        this.vtbl.put_DesiredAngularDeceleration := CallbackCreate(GetMethod(implObj, "put_DesiredAngularDeceleration"), flags, 2)
        this.vtbl.get_DesiredExpansionDeceleration := CallbackCreate(GetMethod(implObj, "get_DesiredExpansionDeceleration"), flags, 2)
        this.vtbl.put_DesiredExpansionDeceleration := CallbackCreate(GetMethod(implObj, "put_DesiredExpansionDeceleration"), flags, 2)
        this.vtbl.get_InitialTimestamp := CallbackCreate(GetMethod(implObj, "get_InitialTimestamp"), flags, 2)
        this.vtbl.put_InitialTimestamp := CallbackCreate(GetMethod(implObj, "put_InitialTimestamp"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Process := CallbackCreate(GetMethod(implObj, "Process"), flags, 2)
        this.vtbl.ProcessTime := CallbackCreate(GetMethod(implObj, "ProcessTime"), flags, 3)
        this.vtbl.Complete := CallbackCreate(GetMethod(implObj, "Complete"), flags, 1)
        this.vtbl.CompleteTime := CallbackCreate(GetMethod(implObj, "CompleteTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_InitialOriginX)
        CallbackFree(this.vtbl.put_InitialOriginX)
        CallbackFree(this.vtbl.get_InitialOriginY)
        CallbackFree(this.vtbl.put_InitialOriginY)
        CallbackFree(this.vtbl.get_InitialVelocityX)
        CallbackFree(this.vtbl.put_InitialVelocityX)
        CallbackFree(this.vtbl.get_InitialVelocityY)
        CallbackFree(this.vtbl.put_InitialVelocityY)
        CallbackFree(this.vtbl.get_InitialAngularVelocity)
        CallbackFree(this.vtbl.put_InitialAngularVelocity)
        CallbackFree(this.vtbl.get_InitialExpansionVelocity)
        CallbackFree(this.vtbl.put_InitialExpansionVelocity)
        CallbackFree(this.vtbl.get_InitialRadius)
        CallbackFree(this.vtbl.put_InitialRadius)
        CallbackFree(this.vtbl.get_BoundaryLeft)
        CallbackFree(this.vtbl.put_BoundaryLeft)
        CallbackFree(this.vtbl.get_BoundaryTop)
        CallbackFree(this.vtbl.put_BoundaryTop)
        CallbackFree(this.vtbl.get_BoundaryRight)
        CallbackFree(this.vtbl.put_BoundaryRight)
        CallbackFree(this.vtbl.get_BoundaryBottom)
        CallbackFree(this.vtbl.put_BoundaryBottom)
        CallbackFree(this.vtbl.get_ElasticMarginLeft)
        CallbackFree(this.vtbl.put_ElasticMarginLeft)
        CallbackFree(this.vtbl.get_ElasticMarginTop)
        CallbackFree(this.vtbl.put_ElasticMarginTop)
        CallbackFree(this.vtbl.get_ElasticMarginRight)
        CallbackFree(this.vtbl.put_ElasticMarginRight)
        CallbackFree(this.vtbl.get_ElasticMarginBottom)
        CallbackFree(this.vtbl.put_ElasticMarginBottom)
        CallbackFree(this.vtbl.get_DesiredDisplacement)
        CallbackFree(this.vtbl.put_DesiredDisplacement)
        CallbackFree(this.vtbl.get_DesiredRotation)
        CallbackFree(this.vtbl.put_DesiredRotation)
        CallbackFree(this.vtbl.get_DesiredExpansion)
        CallbackFree(this.vtbl.put_DesiredExpansion)
        CallbackFree(this.vtbl.get_DesiredDeceleration)
        CallbackFree(this.vtbl.put_DesiredDeceleration)
        CallbackFree(this.vtbl.get_DesiredAngularDeceleration)
        CallbackFree(this.vtbl.put_DesiredAngularDeceleration)
        CallbackFree(this.vtbl.get_DesiredExpansionDeceleration)
        CallbackFree(this.vtbl.put_DesiredExpansionDeceleration)
        CallbackFree(this.vtbl.get_InitialTimestamp)
        CallbackFree(this.vtbl.put_InitialTimestamp)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Process)
        CallbackFree(this.vtbl.ProcessTime)
        CallbackFree(this.vtbl.Complete)
        CallbackFree(this.vtbl.CompleteTime)
    }
}
