#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Enables access to the members of the InputPane class in a desktop app.
 * @remarks
 * You can obtain an instance of the <b>IInputPaneInterop</b> interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> method on the activation factory instance for the <a href="https://docs.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane">InputPane</a> class.
 * 
 *  
 * 
 * 
 * 
 * For an example that uses the <b>IInputPaneInterop</b> interface, see the <a href="https://github.com/Microsoft/WPF-Samples/tree/master/Input and Commands/TouchKeyboard/TouchKeyboardNotifier">touch keyboard notification WPF sample</a>.
 * 
 * The following example shows the definition of the IInputPaneInterop interface.
 * 
 * 
 * ``` syntax
 * [
 *     uuid(75CF2C57-9195-4931-8332-F0B409E916AF),
 * ]
 * interface IInputPaneInterop : IInspectable
 * {
 *     // Creates an instance of InputPane initialized with the window handle.
 *     HRESULT GetForWindow([in] HWND appWindow, [in] REFIID riid,
 *         [out, retval, iid_is(riid)] void** inputPane);
 * }
 * 
 * ```
 * 
 * For store apps, use the <a href="https://docs.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane.getforcurrentview">InputPane.GetForCurrentView</a> method to get an <a href="https://docs.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane">InputPane</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/inputpaneinterop/nn-inputpaneinterop-iinputpaneinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IInputPaneInterop extends IInspectable {
    /**
     * The interface identifier for IInputPaneInterop
     * @type {Guid}
     */
    static IID := Guid("{75cf2c57-9195-4931-8332-f0b409e916af}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInputPaneInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInputPaneInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an instance of an InputPane object for the specified window.
     * @param {HWND} appWindow The top-level ([GA_ROOT](../winuser/nf-winuser-getancestor.md)) window for which you want to get the <a href="https://docs.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane">InputPane</a> object.
     * @param {Pointer<Guid>} riid The interface identifier for the interface that you want to get in the *inputPane* parameter. This value is typically **IID_IInputPane** or **IID_IInputPane2**, as defined in Windows.UI.ViewManagement.h.
     * @returns {Pointer<Void>} The <a href="https://docs.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane">InputPane</a> object for the window that the *appWindow* parameter specifies. This parameter is typically a pointer to an **IInputPane** or **IInputPane2** interface, as defined in Windows.UI.ViewManagement.idl.
     * @see https://learn.microsoft.com/windows/win32/api/inputpaneinterop/nf-inputpaneinterop-iinputpaneinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        result := ComCall(6, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &inputPane := 0, "HRESULT")
        return inputPane
    }

    Query(iid) {
        if (IInputPaneInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetForWindow := CallbackCreate(GetMethod(implObj, "GetForWindow"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetForWindow)
    }
}
