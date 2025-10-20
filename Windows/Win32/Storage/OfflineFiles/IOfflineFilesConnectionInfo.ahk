#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Presents query and action capabilities associated with the online-offline transition behavior of Offline Files.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesconnectioninfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesConnectionInfo extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesConnectionInfo
     * @type {Guid}
     */
    static IID => Guid("{efb23a09-a867-4be8-83a6-86969a7d0856}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pConnectState 
     * @param {Pointer<Int32>} pOfflineReason 
     * @returns {HRESULT} 
     */
    GetConnectState(pConnectState, pOfflineReason) {
        result := ComCall(3, this, "int*", pConnectState, "int*", pOfflineReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {Integer} ConnectState 
     * @returns {HRESULT} 
     */
    SetConnectState(hwndParent, dwFlags, ConnectState) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "uint", dwFlags, "int", ConnectState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    TransitionOnline(hwndParent, dwFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {BOOL} bForceOpenFilesClosed 
     * @param {Pointer<BOOL>} pbOpenFilesPreventedTransition 
     * @returns {HRESULT} 
     */
    TransitionOffline(hwndParent, dwFlags, bForceOpenFilesClosed, pbOpenFilesPreventedTransition) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "uint", dwFlags, "int", bForceOpenFilesClosed, "ptr", pbOpenFilesPreventedTransition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
