#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Reacts to events by recognizing gestures and adding gesture data to the input queue.
 * @remarks
 * 
 * This interface is implemented by the <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a>.
 * 
 * The gesture recognizer analyzes digitizer input and injects gesture recognition results into the input queue.
 * 
 * Adding an instance of the <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a> to multiple <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> instances is not a valid operation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-igesturerecognizer
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IGestureRecognizer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGestureRecognizer
     * @type {Guid}
     */
    static IID => Guid("{ae9ef86b-7054-45e3-ae22-3174dc8811b7}")

    /**
     * The class identifier for GestureRecognizer
     * @type {Guid}
     */
    static CLSID => Guid("{ea30c654-c62c-441f-ac00-95f9a196782c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Enabled", "put_Enabled", "get_MaxStrokeCount", "put_MaxStrokeCount", "EnableGestures", "Reset"]

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
     * Gets or sets a value that indicates whether gesture recognition is enabled.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-igesturerecognizer-get_enabled
     */
    get_Enabled() {
        result := ComCall(3, this, "int*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * Gets or sets a value that indicates whether gesture recognition is enabled.
     * @param {BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-igesturerecognizer-put_enabled
     */
    put_Enabled(fEnabled) {
        result := ComCall(4, this, "int", fEnabled, "HRESULT")
        return result
    }

    /**
     * Gets or sets the maximum number of strokes allowed per gesture recognition.
     * @remarks
     * 
     * Valid values are 1 and 2. When the <b>MaxStrokeCount</b> property is 2, gesture recognizer looks back to the most recent two strokes and attempts to recognize them as gestures. This may result in multiple recognition calls and multiple gesture events flowing through the system.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-igesturerecognizer-get_maxstrokecount
     */
    get_MaxStrokeCount() {
        result := ComCall(5, this, "int*", &pcStrokes := 0, "HRESULT")
        return pcStrokes
    }

    /**
     * Gets or sets the maximum number of strokes allowed per gesture recognition.
     * @remarks
     * 
     * Valid values are 1 and 2. When the <b>MaxStrokeCount</b> property is 2, gesture recognizer looks back to the most recent two strokes and attempts to recognize them as gestures. This may result in multiple recognition calls and multiple gesture events flowing through the system.
     * 
     * 
     * @param {Integer} cStrokes 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-igesturerecognizer-put_maxstrokecount
     */
    put_MaxStrokeCount(cStrokes) {
        result := ComCall(6, this, "int", cStrokes, "HRESULT")
        return result
    }

    /**
     * Sets a value that indicates to which application gestures the GestureRecognizer Class object responds.
     * @param {Integer} cGestures The size of the array to which the <i>pGestures</i> parameter points. Valid values are between 0 and 64, inclusive.
     * @param {Pointer<Integer>} pGestures An array of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkapplicationgesture">InkApplicationGesture Enumeration</a> values that indicates to which application gestures the <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a> object responds.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-igesturerecognizer-enablegestures
     */
    EnableGestures(cGestures, pGestures) {
        pGesturesMarshal := pGestures is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", cGestures, pGesturesMarshal, pGestures, "HRESULT")
        return result
    }

    /**
     * Deletes past stroke information from the GestureRecognizer Class object.
     * @returns {HRESULT} For a description of return values see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-igesturerecognizer-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
