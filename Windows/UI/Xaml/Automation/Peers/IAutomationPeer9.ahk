#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IAutomationPeer9 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPeer9
     * @type {Guid}
     */
    static IID => Guid("{df2e0265-1d74-57fa-8094-f81c2f626b8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDialog"]

    /**
     * Determines whether a message is intended for the specified dialog box and, if it is, processes the message. (Unicode)
     * @remarks
     * Although the <b>IsDialogMessage</b> function is intended for modeless dialog boxes, you can use it with any window that contains controls, enabling the windows to provide the same keyboard selection as is used in a dialog box. 
     * 
     * When <b>IsDialogMessage</b> processes a message, it checks for keyboard messages and converts them into selections for the corresponding dialog box. For example, the TAB key, when pressed, selects the next control or group of controls, and the DOWN ARROW key, when pressed, selects the next control in a group. 
     * 
     * Because the <b>IsDialogMessage</b> function performs all necessary translating and dispatching of messages, a message processed by <b>IsDialogMessage</b> must not be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-translatemessage">TranslateMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dispatchmessage">DispatchMessage</a> function. 
     * 
     * <b>IsDialogMessage</b> sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-getdlgcode">WM_GETDLGCODE</a> messages to the dialog box procedure to determine which keys should be processed. 
     * 
     * <b>IsDialogMessage</b> can send <a href="https://docs.microsoft.com/windows/desktop/dlgbox/dm-getdefid">DM_GETDEFID</a> and <a href="https://docs.microsoft.com/windows/desktop/dlgbox/dm-setdefid">DM_SETDEFID</a> messages to the window. These messages are defined in the Winuser.h header file as <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-user">WM_USER</a> and <b>WM_USER</b> + 1, so conflicts are possible with application-defined messages having the same values. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winuser.h header defines IsDialogMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-isdialogmessagew
     */
    IsDialog() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
