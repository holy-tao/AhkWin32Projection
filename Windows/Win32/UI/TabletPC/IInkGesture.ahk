#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents the ability to query particular properties of a gesture returned from a gesture recognition.
 * @remarks
 * 
  * Gesture support is built-in by using the Microsoft gesture recognizer. Available gestures are found in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkapplicationgesture">InkApplicationGesture</a> enumeration type. For more information about gestures, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-gestures">Using Gestures</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms702526(v=vs.85)">Command Input on the Tablet PC</a>.
  * 
  * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkgesture
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkGesture extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkGesture
     * @type {Guid}
     */
    static IID => Guid("{3bdc0a97-04e5-4e26-b813-18f052d41def}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Confidence", "get_Id", "GetHotPoint"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkgesture-get_confidence
     */
    get_Confidence() {
        result := ComCall(7, this, "int*", &Confidence := 0, "HRESULT")
        return Confidence
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkgesture-get_id
     */
    get_Id() {
        result := ComCall(8, this, "int*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {Pointer<Integer>} X 
     * @param {Pointer<Integer>} Y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkgesture-gethotpoint
     */
    GetHotPoint(X, Y) {
        XMarshal := X is VarRef ? "int*" : "ptr"
        YMarshal := Y is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, XMarshal, X, YMarshal, Y, "HRESULT")
        return result
    }
}
