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
     * 
     * @returns {HMONITOR} 
     */
    GetMonitor() {
        value := HMONITOR()
        result := ComCall(3, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    GetInvokePoint() {
        value := POINT()
        result := ComCall(4, this, "ptr", value, "HRESULT")
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
        result := ComCall(6, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the status of the specified virtual key. The status specifies whether the key is up, down, or toggled (on, off�alternating each time the key is pressed).
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeystate
     */
    GetKeyState() {
        result := ComCall(7, this, "uint*", &value := 0, "HRESULT")
        return value
    }
}
