#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<HMONITOR>} value 
     * @returns {HRESULT} 
     */
    GetMonitor(value) {
        result := ComCall(3, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} value 
     * @returns {HRESULT} 
     */
    GetInvokePoint(value) {
        result := ComCall(4, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    GetShowCommand(value) {
        result := ComCall(5, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} value 
     * @returns {HRESULT} 
     */
    GetShowUI(value) {
        result := ComCall(6, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the status of the specified virtual key. The status specifies whether the key is up, down, or toggled (on, off�alternating each time the key is pressed).
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} Type: <b>SHORT</b>
     * 
     * The return value specifies the status of the specified virtual key, as follows:
     * 
     * <ul>
     * <li>If the high-order bit is 1, the key is down; otherwise, it is up.</li>
     * <li>If the low-order bit is 1, the key is toggled. A key, such as the CAPS LOCK key, is toggled if it is turned on. The key is off and untoggled if the low-order bit is 0. A toggle key's indicator light (if any) on the keyboard will be on when the key is toggled, and off when the key is untoggled.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeystate
     */
    GetKeyState(value) {
        result := ComCall(7, this, "uint*", value, "HRESULT")
        return result
    }
}
