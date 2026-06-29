#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\InkRecognitionConfidence.ahk" { InkRecognitionConfidence }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\InkApplicationGesture.ahk" { InkApplicationGesture }

/**
 * Represents the ability to query particular properties of a gesture returned from a gesture recognition.
 * @remarks
 * Gesture support is built-in by using the Microsoft gesture recognizer. Available gestures are found in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkapplicationgesture">InkApplicationGesture</a> enumeration type. For more information about gestures, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-gestures">Using Gestures</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms702526(v=vs.85)">Command Input on the Tablet PC</a>.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkgesture
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkGesture extends IDispatch {
    /**
     * The interface identifier for IInkGesture
     * @type {Guid}
     */
    static IID := Guid("{3bdc0a97-04e5-4e26-b813-18f052d41def}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkGesture interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Confidence : IntPtr
        get_Id         : IntPtr
        GetHotPoint    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkGesture.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {InkRecognitionConfidence} 
     */
    Confidence {
        get => this.get_Confidence()
    }

    /**
     * @type {InkApplicationGesture} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the level of confidence (strong, intermediate, or poor) that a recognizer has in the recognition of an IInkRecognitionAlternate object or a gesture. (IInkGesture.get_Confidence)
     * @remarks
     * For a list of confidence values that may be returned, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognitionconfidence">InkRecognitionConfidence</a> enumeration type.
     * 
     * <div class="alert"><b>Note</b>  Confidence evaluation is available for all gesture recognizers in the current release of Windows XP Tablet PC Edition.</div>
     * <div> </div>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternate">IInkRecognitionAlternate</a> object:
     * 
     * If the alternate represents a phrase or sentence, the value represents the lowest confidence level of a recognition segment found in the phrase or sentence. However, if the alternate represents a word, the value represents the confidence level of the word.
     * 
     * <div class="alert"><b>Note</b>  This property throws an exception if the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> that generates the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionalternate">IInkRecognitionAlternate</a> does not support confidence levels.</div>
     * <div> </div>
     * Of the Microsoft recognizers, only the Microsoft English (US) Handwriting Recognizer and the Microsoft Gesture Recognizer support confidence levels. Third party recognizers may or may not support confidence levels.
     * @returns {InkRecognitionConfidence} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkgesture-get_confidence
     */
    get_Confidence() {
        result := ComCall(7, this, "int*", &Confidence := 0, "HRESULT")
        return Confidence
    }

    /**
     * Gets the identifier of an object. (IInkGesture.get_Id)
     * @remarks
     * An object's identifier never changes.
     * 
     * <div class="alert"><b>Note</b>  Accessing this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>; <b>WM_ACTIVATEAPP</b>; <b>WM_NCACTIVATE</b>; <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to <b>SC_HOTKEY</b> or <b>SC_TASKLIST</b>; and <b>WM_SYSKEYDOWN</b> (when processing ALT+TAB or ALT+ESC key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * @returns {InkApplicationGesture} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkgesture-get_id
     */
    get_Id() {
        result := ComCall(8, this, "int*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * Gets the hot point of the gesture, in ink space coordinates.
     * @remarks
     * The hot point is the one distinguishing point of a gesture. It is usually the point of the angle in a gesture or the point at which the gesture is intended to occur in relation to the content around it. If there is no discernable hot point for a known gesture, the starting point of the gesture is the hot point.
     * 
     * For example, the hot point of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkapplicationgesture">Check</a> gesture is the point of the angle, and the hot point of the <b>Curlicue</b> gesture is the start of the stroke that is the gesture.
     * 
     * For more information about how a hot point is used, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-gestures">Using Gestures</a>.
     * @param {Pointer<Integer>} X The X-value of the hot point, in ink space coordinates.
     * @param {Pointer<Integer>} Y The Y-value of the hot point, in ink space coordinates.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error information is provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred while processing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkgesture-gethotpoint
     */
    GetHotPoint(X, Y) {
        XMarshal := X is VarRef ? "int*" : "ptr"
        YMarshal := Y is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, XMarshal, X, YMarshal, Y, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkGesture.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Confidence := CallbackCreate(GetMethod(implObj, "get_Confidence"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.GetHotPoint := CallbackCreate(GetMethod(implObj, "GetHotPoint"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Confidence)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.GetHotPoint)
    }
}
