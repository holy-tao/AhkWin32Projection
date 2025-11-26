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
     * Determines whether an item is online or offline and, if offline, why.
     * @param {Pointer<Integer>} pConnectState Receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_connect_state">OFFLINEFILES_CONNECT_STATE</a> enumeration value that indicates whether the item is online or offline.
     * 
     * <div class="alert"><b>Note</b>  This value sets the Offline Status property value in Windows Explorer.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pOfflineReason If the item is offline, this parameter receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_offline_reason">OFFLINEFILES_OFFLINE_REASON</a> enumeration value that indicates why the item is offline.
     * 
     * <div class="alert"><b>Note</b>  This value generates the parenthesized suffix in the Offline Status property value in Windows Explorer when the status is offline.</div>
     * <div> </div>
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate
     */
    GetConnectState(pConnectState, pOfflineReason) {
        pConnectStateMarshal := pConnectState is VarRef ? "int*" : "ptr"
        pOfflineReasonMarshal := pOfflineReason is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pConnectStateMarshal, pConnectState, pOfflineReasonMarshal, pOfflineReason, "HRESULT")
        return result
    }

    /**
     * Sets the connection state for an item.
     * @param {HWND} hwndParent Provides a parent window handle used for any interactive user interface elements such as credential request dialogs.  This parameter may be <b>NULL</b>.  This parameter is ignored if the OFFLINEFILES_TRANSITION_FLAG_INTERACTIVE flag is not specified in the <i>dwFlags</i> parameter.
     * @param {Integer} dwFlags One or more of the following flag values:
     * @param {Integer} ConnectState Specify one of the following <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_connect_state">OFFLINEFILES_CONNECT_STATE</a> enumeration values.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesconnectioninfo-setconnectstate
     */
    SetConnectState(hwndParent, dwFlags, ConnectState) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "uint", dwFlags, "int", ConnectState, "HRESULT")
        return result
    }

    /**
     * Transitions an item online if possible.
     * @param {HWND} hwndParent Provides a parent window handle used for any interactive user interface elements such as credential request dialogs.  This parameter may be <b>NULL</b>.  This parameter is ignored if the OFFLINEFILES_TRANSITION_FLAG_INTERACTIVE flag is not specified in the <i>dwFlags</i> parameter.
     * @param {Integer} dwFlags One or more of the following flag values:
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitiononline
     */
    TransitionOnline(hwndParent, dwFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Transitions an item offline if possible.
     * @param {HWND} hwndParent Provides a parent window handle used for any interactive user interface elements such as credential request dialogs.  This parameter may be <b>NULL</b>.  This parameter is ignored if the <b>OFFLINEFILES_TRANSITION_FLAG_INTERACTIVE</b> flag is not set.
     * @param {Integer} dwFlags One or more of the following flag values:
     * @param {BOOL} bForceOpenFilesClosed By default, any open handles to files that are not cached by Offline Files prevent the transition to offline.  If this parameter is <b>TRUE</b>, the operation will forcibly close these files handles, allowing the scope to transition offline.
     * 
     * <div class="alert"><b>Note</b>  If file handles are forcibly closed, this can cause unexpected consequences, depending on the applications that are using those files.</div>
     * <div> </div>
     * @returns {BOOL} Receives <b>TRUE</b> if open files prevented the transition, or <b>FALSE</b> otherwise.  This value is useful only if <b>FALSE</b> was specified for the <i>bForceOpenFilesClosed</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitionoffline
     */
    TransitionOffline(hwndParent, dwFlags, bForceOpenFilesClosed) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "uint", dwFlags, "int", bForceOpenFilesClosed, "int*", &pbOpenFilesPreventedTransition := 0, "HRESULT")
        return pbOpenFilesPreventedTransition
    }
}
