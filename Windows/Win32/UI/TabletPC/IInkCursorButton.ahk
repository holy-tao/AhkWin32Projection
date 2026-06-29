#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\InkCursorButtonState.ahk" { InkCursorButtonState }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents general information about a button on a tablet pointing and selecting device.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkcursorbutton
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkCursorButton extends IDispatch {
    /**
     * The interface identifier for IInkCursorButton
     * @type {Guid}
     */
    static IID := Guid("{85ef9417-1d59-49b2-a13c-702c85430894}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkCursorButton interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name  : IntPtr
        get_Id    : IntPtr
        get_State : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkCursorButton.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {InkCursorButtonState} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the name of the object. (IInkCursorButton.get_Name)
     * @remarks
     * Accessing this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, WM_PAINT; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursorbutton-get_name
     */
    get_Name() {
        Name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    /**
     * Gets the identifier of an object. (IInkCursorButton.get_Id)
     * @remarks
     * An object's identifier never changes.
     * 
     * <div class="alert"><b>Note</b>  Accessing this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to <b>SC_HOTKEY</b> or <b>SC_TASKLIST</b>; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursorbutton-get_id
     */
    get_Id() {
        Id := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, Id, "HRESULT")
        return Id
    }

    /**
     * Gets the state of a cursor button, such as whether the button is unavailable, up, or down.
     * @remarks
     * For a detailed list of state values that you can use, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkcursorbuttonstate">InkCursorButtonState</a> enumeration.
     * @returns {InkCursorButtonState} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursorbutton-get_state
     */
    get_State() {
        result := ComCall(9, this, "int*", &CurrentState := 0, "HRESULT")
        return CurrentState
    }

    Query(iid) {
        if (IInkCursorButton.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_State)
    }
}
