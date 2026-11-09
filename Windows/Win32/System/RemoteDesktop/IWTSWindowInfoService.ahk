#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IWTSWindowChangedCallback.ahk
#Include .\RdpSessionType.ahk
#Include .\WTSWindowInfo.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class IWTSWindowInfoService extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSWindowInfoService
     * @type {Guid}
     */
    static IID => Guid("{2a002c7b-0120-4d04-bfb1-3c73110c8581}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWindowInfo", "GetRdpClientProcessId", "GetRdpSessionType", "SubscribeWindowChanged", "UnsubscribeWindowChanged"]

    /**
     * Retrieves information about the specified window. (GetWindowInfo)
     * @param {HWND} remoteHwnd 
     * @returns {WTSWindowInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getwindowinfo
     */
    GetWindowInfo(remoteHwnd) {
        remoteHwnd := remoteHwnd is Win32Handle ? NumGet(remoteHwnd, "ptr") : remoteHwnd

        _windowInfo := WTSWindowInfo()
        result := ComCall(3, this, "ptr", remoteHwnd, "ptr", _windowInfo, "HRESULT")
        return _windowInfo
    }

    /**
     * @returns {Integer} 
     */
    GetRdpClientProcessId() {
        result := ComCall(4, this, "uint*", &processId := 0, "HRESULT")
        return processId
    }

    /**
     * @returns {RdpSessionType} 
     */
    GetRdpSessionType() {
        result := ComCall(5, this, "int*", &sessionType := 0, "HRESULT")
        return sessionType
    }

    /**
     * @param {HWND} remoteHwnd 
     * @param {IWTSWindowChangedCallback} windowChanged 
     * @returns {HRESULT} 
     */
    SubscribeWindowChanged(remoteHwnd, windowChanged) {
        remoteHwnd := remoteHwnd is Win32Handle ? NumGet(remoteHwnd, "ptr") : remoteHwnd

        result := ComCall(6, this, "ptr", remoteHwnd, "ptr", windowChanged, "HRESULT")
        return result
    }

    /**
     * @param {HWND} remoteHwnd 
     * @param {IWTSWindowChangedCallback} windowChanged 
     * @returns {HRESULT} 
     */
    UnsubscribeWindowChanged(remoteHwnd, windowChanged) {
        remoteHwnd := remoteHwnd is Win32Handle ? NumGet(remoteHwnd, "ptr") : remoteHwnd

        result := ComCall(7, this, "ptr", remoteHwnd, "ptr", windowChanged, "HRESULT")
        return result
    }
}
