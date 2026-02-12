#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HMONITOR.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAppActivationUIInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppActivationUIInfo
     * @type {Guid}
     */
    static IID => Guid("{abad189d-9fa3-4278-b3ca-8ca448a88dcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMonitor", "GetInvokePoint", "GetShowCommand", "GetShowUI", "GetKeyState"]

    /**
     * Retrieves a monitor's minimum, maximum, and current brightness settings.
     * @remarks
     * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_BRIGHTNESS flag.
     *       
     * 
     * This function takes about 40 milliseconds to return.
     *       
     * 
     * The brightness setting is a continuous monitor setting. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
     * @returns {HMONITOR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorbrightness
     */
    GetMonitor() {
        value := HMONITOR()
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    GetInvokePoint() {
        value := POINT()
        result := ComCall(4, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetShowCommand() {
        result := ComCall(5, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetShowUI() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getkeystate
     */
    GetKeyState() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
