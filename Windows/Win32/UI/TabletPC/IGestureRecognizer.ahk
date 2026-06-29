#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Reacts to events by recognizing gestures and adding gesture data to the input queue.
 * @remarks
 * This interface is implemented by the <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a>.
 * 
 * The gesture recognizer analyzes digitizer input and injects gesture recognition results into the input queue.
 * 
 * Adding an instance of the <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a> to multiple <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> instances is not a valid operation.
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/nn-rtscom-igesturerecognizer
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IGestureRecognizer extends IUnknown {
    /**
     * The interface identifier for IGestureRecognizer
     * @type {Guid}
     */
    static IID := Guid("{ae9ef86b-7054-45e3-ae22-3174dc8811b7}")

    /**
     * The class identifier for GestureRecognizer
     * @type {Guid}
     */
    static CLSID := Guid("{ea30c654-c62c-441f-ac00-95f9a196782c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGestureRecognizer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Enabled        : IntPtr
        put_Enabled        : IntPtr
        get_MaxStrokeCount : IntPtr
        put_MaxStrokeCount : IntPtr
        EnableGestures     : IntPtr
        Reset              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGestureRecognizer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {Integer} 
     */
    MaxStrokeCount {
        get => this.get_MaxStrokeCount()
        set => this.put_MaxStrokeCount(value)
    }

    /**
     * Gets or sets a value that indicates whether gesture recognition is enabled. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-igesturerecognizer-get_enabled
     */
    get_Enabled() {
        result := ComCall(3, this, BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * Gets or sets a value that indicates whether gesture recognition is enabled. (Put)
     * @param {BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-igesturerecognizer-put_enabled
     */
    put_Enabled(fEnabled) {
        result := ComCall(4, this, BOOL, fEnabled, "HRESULT")
        return result
    }

    /**
     * Gets or sets the maximum number of strokes allowed per gesture recognition. (Get)
     * @remarks
     * Valid values are 1 and 2. When the <b>MaxStrokeCount</b> property is 2, gesture recognizer looks back to the most recent two strokes and attempts to recognize them as gestures. This may result in multiple recognition calls and multiple gesture events flowing through the system.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-igesturerecognizer-get_maxstrokecount
     */
    get_MaxStrokeCount() {
        result := ComCall(5, this, "int*", &pcStrokes := 0, "HRESULT")
        return pcStrokes
    }

    /**
     * Gets or sets the maximum number of strokes allowed per gesture recognition. (Put)
     * @remarks
     * Valid values are 1 and 2. When the <b>MaxStrokeCount</b> property is 2, gesture recognizer looks back to the most recent two strokes and attempts to recognize them as gestures. This may result in multiple recognition calls and multiple gesture events flowing through the system.
     * @param {Integer} cStrokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-igesturerecognizer-put_maxstrokecount
     */
    put_MaxStrokeCount(cStrokes) {
        result := ComCall(6, this, "int", cStrokes, "HRESULT")
        return result
    }

    /**
     * Sets a value that indicates to which application gestures the GestureRecognizer Class object responds.
     * @remarks
     * You cannot enable <b>AllGestures</b> in conjunction with any other gestures.
     * @param {Integer} cGestures The size of the array to which the <i>pGestures</i> parameter points. Valid values are between 0 and 64, inclusive.
     * @param {Pointer<Integer>} pGestures An array of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkapplicationgesture">InkApplicationGesture Enumeration</a> values that indicates to which application gestures the <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a> object responds.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-igesturerecognizer-enablegestures
     */
    EnableGestures(cGestures, pGestures) {
        pGesturesMarshal := pGestures is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", cGestures, pGesturesMarshal, pGestures, "HRESULT")
        return result
    }

    /**
     * Deletes past stroke information from the GestureRecognizer Class object.
     * @remarks
     * Removes any past strokes from consideration for gestures. If Reset is called while the user is in the middle of writing a stroke, the <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a> object ignores that stroke.
     * @returns {HRESULT} For a description of return values see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-igesturerecognizer-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGestureRecognizer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.get_MaxStrokeCount := CallbackCreate(GetMethod(implObj, "get_MaxStrokeCount"), flags, 2)
        this.vtbl.put_MaxStrokeCount := CallbackCreate(GetMethod(implObj, "put_MaxStrokeCount"), flags, 2)
        this.vtbl.EnableGestures := CallbackCreate(GetMethod(implObj, "EnableGestures"), flags, 3)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.get_MaxStrokeCount)
        CallbackFree(this.vtbl.put_MaxStrokeCount)
        CallbackFree(this.vtbl.EnableGestures)
        CallbackFree(this.vtbl.Reset)
    }
}
