#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/inputpaneinterop/nn-inputpaneinterop-iinputpaneinterop
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IInputPane extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputPane
     * @type {Guid}
     */
    static IID => Guid("{640ada70-06f3-4c87-a678-9829c9127c28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_Showing", "remove_Showing", "add_Hiding", "remove_Hiding", "get_OccludedRect"]

    /**
     * @type {RECT} 
     */
    OccludedRect {
        get => this.get_OccludedRect()
    }

    /**
     * 
     * @param {TypedEventHandler<InputPane, InputPaneVisibilityEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Showing(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Showing(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InputPane, InputPaneVisibilityEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Hiding(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Hiding(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_OccludedRect() {
        value := RECT()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
