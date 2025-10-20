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
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(7, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Id 
     * @returns {HRESULT} 
     */
    get_Id(Id) {
        result := ComCall(8, this, "ptr", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CurrentState 
     * @returns {HRESULT} 
     */
    get_State(CurrentState) {
        result := ComCall(9, this, "int*", CurrentState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
