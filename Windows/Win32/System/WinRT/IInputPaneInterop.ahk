#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables access to the members of the InputPane class in a desktop app.
 * @remarks
 * 
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
  * <pre class="syntax" xml:space="preserve"><code>[
  *     uuid(75CF2C57-9195-4931-8332-F0B409E916AF),
  * ]
  * interface IInputPaneInterop : IInspectable
  * {
  *     // Creates an instance of InputPane initialized with the window handle.
  *     HRESULT GetForWindow([in] HWND appWindow, [in] REFIID riid,
  *         [out, retval, iid_is(riid)] void** inputPane);
  * }
  * </code></pre>
  * For store apps, use the <a href="https://docs.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane.getforcurrentview">InputPane.GetForCurrentView</a> method to get an <a href="https://docs.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane">InputPane</a> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//inputpaneinterop/nn-inputpaneinterop-iinputpaneinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IInputPaneInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputPaneInterop
     * @type {Guid}
     */
    static IID => Guid("{75cf2c57-9195-4931-8332-f0b409e916af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} inputPane 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inputpaneinterop/nf-inputpaneinterop-iinputpaneinterop-getforwindow
     */
    GetForWindow(appWindow, riid, inputPane) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        inputPaneMarshal := inputPane is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, inputPaneMarshal, inputPane, "HRESULT")
        return result
    }
}
