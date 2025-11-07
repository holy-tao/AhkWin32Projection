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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectState", "SetConnectState", "TransitionOnline", "TransitionOffline"]

    /**
     * 
     * @param {Pointer<Integer>} pConnectState 
     * @param {Pointer<Integer>} pOfflineReason 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate
     */
    GetConnectState(pConnectState, pOfflineReason) {
        pConnectStateMarshal := pConnectState is VarRef ? "int*" : "ptr"
        pOfflineReasonMarshal := pOfflineReason is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pConnectStateMarshal, pConnectState, pOfflineReasonMarshal, pOfflineReason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {Integer} ConnectState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-setconnectstate
     */
    SetConnectState(hwndParent, dwFlags, ConnectState) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "uint", dwFlags, "int", ConnectState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitiononline
     */
    TransitionOnline(hwndParent, dwFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {BOOL} bForceOpenFilesClosed 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitionoffline
     */
    TransitionOffline(hwndParent, dwFlags, bForceOpenFilesClosed) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "uint", dwFlags, "int", bForceOpenFilesClosed, "int*", &pbOpenFilesPreventedTransition := 0, "HRESULT")
        return pbOpenFilesPreventedTransition
    }
}
