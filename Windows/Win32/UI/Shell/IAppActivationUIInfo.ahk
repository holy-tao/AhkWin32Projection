#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IAppActivationUIInfo extends IUnknown {
    /**
     * The interface identifier for IAppActivationUIInfo
     * @type {Guid}
     */
    static IID := Guid("{abad189d-9fa3-4278-b3ca-8ca448a88dcb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppActivationUIInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMonitor     : IntPtr
        GetInvokePoint : IntPtr
        GetShowCommand : IntPtr
        GetShowUI      : IntPtr
        GetKeyState    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppActivationUIInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HMONITOR} 
     */
    GetMonitor() {
        value := HMONITOR()
        result := ComCall(3, this, HMONITOR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    GetInvokePoint() {
        value := POINT()
        result := ComCall(4, this, POINT.Ptr, value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetShowCommand() {
        result := ComCall(5, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetShowUI() {
        result := ComCall(6, this, BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the status of the specified virtual key. The status specifies whether the key is up, down, or toggled (on, off�alternating each time the key is pressed).
     * @remarks
     * The key status returned from this function changes as a thread reads key messages from its message queue. The status does not reflect the interrupt-level state associated with the hardware. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getasynckeystate">GetAsyncKeyState</a> function to retrieve that information.
     * 
     * An application calls <b>GetKeyState</b> in response to a keyboard-input message. This function retrieves the state of the key when the input message was generated.
     * 
     * To retrieve state information for all the virtual keys, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeyboardstate">GetKeyboardState</a> function.
     * 
     * An application can use the <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">virtual key code</a> constants <b>VK_SHIFT</b>, <b>VK_CONTROL</b>, and <b>VK_MENU</b> as values for the 
     *     <i>nVirtKey</i> parameter. This gives the status of the SHIFT, CTRL, or ALT keys without distinguishing between left and right. An application can also use the following virtual-key code constants as values for 
     *     <i>nVirtKey</i> to distinguish between the left and right instances of those keys:
     * 
     * <b>VK_LSHIFT</b>
     * <b>VK_RSHIFT</b>
     * <b>VK_LCONTROL</b>
     * <b>VK_RCONTROL</b>
     * <b>VK_LMENU</b>
     * <b>VK_RMENU</b>
     * These left- and right-distinguishing constants are available to an application only through the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeyboardstate">GetKeyboardState</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setkeyboardstate">SetKeyboardState</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getasynckeystate">GetAsyncKeyState</a>, <b>GetKeyState</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-mapvirtualkeya">MapVirtualKey</a> functions.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getkeystate
     */
    GetKeyState() {
        result := ComCall(7, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IAppActivationUIInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMonitor := CallbackCreate(GetMethod(implObj, "GetMonitor"), flags, 2)
        this.vtbl.GetInvokePoint := CallbackCreate(GetMethod(implObj, "GetInvokePoint"), flags, 2)
        this.vtbl.GetShowCommand := CallbackCreate(GetMethod(implObj, "GetShowCommand"), flags, 2)
        this.vtbl.GetShowUI := CallbackCreate(GetMethod(implObj, "GetShowUI"), flags, 2)
        this.vtbl.GetKeyState := CallbackCreate(GetMethod(implObj, "GetKeyState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMonitor)
        CallbackFree(this.vtbl.GetInvokePoint)
        CallbackFree(this.vtbl.GetShowCommand)
        CallbackFree(this.vtbl.GetShowUI)
        CallbackFree(this.vtbl.GetKeyState)
    }
}
