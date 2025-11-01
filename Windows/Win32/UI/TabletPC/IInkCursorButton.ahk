#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents general information about a button on a tablet pointing and selecting device.
 * @remarks
 * 
  * An <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> can contain zero to 32 associated buttons, and these buttons are provided to an application as <b>IInkCursorButton</b> objects. Examples of cursor buttons are:
  * 
  * <ul>
  * <li>The writing end of a pen</li>
  * <li>The inverted (or "eraser") end of a pen</li>
  * <li>The barrel of a pen</li>
  * <li>The button on a pen</li>
  * </ul>
  * A single pen cursor with no barrel may consist of two cursor buttons: the writing end and the inverted end. Each button can have a specific function, and an application must know which button, by identifier, is being used before it can accept input from the cursor. For example, an application must know the identifier of the inverted end of the pen before strokes can be erased.
  * 
  * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkcursorbutton
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkCursorButton extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkCursorButton
     * @type {Guid}
     */
    static IID => Guid("{85ef9417-1d59-49b2-a13c-702c85430894}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Id", "get_State"]

    /**
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursorbutton-get_name
     */
    get_Name(Name) {
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursorbutton-get_id
     */
    get_Id(Id) {
        result := ComCall(8, this, "ptr", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} CurrentState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursorbutton-get_state
     */
    get_State(CurrentState) {
        CurrentStateMarshal := CurrentState is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, CurrentStateMarshal, CurrentState, "HRESULT")
        return result
    }
}
