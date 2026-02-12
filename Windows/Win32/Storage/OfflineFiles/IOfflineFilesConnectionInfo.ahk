#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Presents query and action capabilities associated with the online-offline transition behavior of Offline Files.
 * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nn-cscobj-iofflinefilesconnectioninfo
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
     * @remarks
     * This method requires that the item have connection state information.  If that information is unavailable at the time of this method call, the method call will initiate the extra query of the cache item to obtain the current connection state.
     * @param {Pointer<Integer>} pConnectState Receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_connect_state">OFFLINEFILES_CONNECT_STATE</a> enumeration value that indicates whether the item is online or offline.
     * 
     * <div class="alert"><b>Note</b>  This value sets the Offline Status property value in Windows Explorer.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pOfflineReason If the item is offline, this parameter receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_offline_reason">OFFLINEFILES_OFFLINE_REASON</a> enumeration value that indicates why the item is offline.
     * 
     * <div class="alert"><b>Note</b>  This value generates the parenthesized suffix in the Offline Status property value in Windows Explorer when the status is offline.</div>
     * <div> </div>
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate
     */
    GetConnectState(pConnectState, pOfflineReason) {
        pConnectStateMarshal := pConnectState is VarRef ? "int*" : "ptr"
        pOfflineReasonMarshal := pOfflineReason is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pConnectStateMarshal, pConnectState, pOfflineReasonMarshal, pOfflineReason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the connection state for an item.
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitiononline">IOfflineFilesConnectionInfo::TransitionOnline</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitionoffline">IOfflineFilesConnectionInfo::TransitionOffline</a> methods are preferred over this method as they provide greater control over the handling and detecting of open handles in the online-to-offline transition.
     * @param {HWND} hwndParent Provides a parent window handle used for any interactive user interface elements such as credential request dialogs.  This parameter may be <b>NULL</b>.  This parameter is ignored if the OFFLINEFILES_TRANSITION_FLAG_INTERACTIVE flag is not specified in the <i>dwFlags</i> parameter.
     * @param {Integer} dwFlags One or more of the following flag values:
     * @param {Integer} ConnectState Specify one of the following <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_connect_state">OFFLINEFILES_CONNECT_STATE</a> enumeration values.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesconnectioninfo-setconnectstate
     */
    SetConnectState(hwndParent, dwFlags, ConnectState) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "uint", dwFlags, "int", ConnectState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Transitions an item online if possible.
     * @remarks
     * Note that the entire scope of the item is transitioned online, not just the item.  An item's scope is defined as the closest ancestor shared folder of the item.
     * @param {HWND} hwndParent Provides a parent window handle used for any interactive user interface elements such as credential request dialogs.  This parameter may be <b>NULL</b>.  This parameter is ignored if the OFFLINEFILES_TRANSITION_FLAG_INTERACTIVE flag is not specified in the <i>dwFlags</i> parameter.
     * @param {Integer} dwFlags One or more of the following flag values:
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitiononline
     */
    TransitionOnline(hwndParent, dwFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Transitions an item offline if possible.
     * @remarks
     * Note that the entire scope of the item is transitioned offline, not just the item.  An item's scope is defined as the closest ancestor shared folder of the item.
     * 
     * If open handles prevent the offline transition, the function returns a success value and <i>*pbOpenFilesPreventTransition</i> receives <b>TRUE</b>.
     * 
     * Here is an example of how this method is used: When transitioning a scope offline through Windows Vista Explorer's Work Offline button, this method is first called with the <i>bForceOpenFilesClosed</i> parameter set to <b>FALSE</b>.  If the function indicates that open files prevented the offline transition, Windows Explorer presents a dialog asking the user if they want to force those files closed and repeat the attempt.  If they respond affirmatively, the function call is repeated with the <i>bForceOpenFilesClosed</i> parameter set to <b>TRUE</b>.
     * @param {HWND} hwndParent Provides a parent window handle used for any interactive user interface elements such as credential request dialogs.  This parameter may be <b>NULL</b>.  This parameter is ignored if the <b>OFFLINEFILES_TRANSITION_FLAG_INTERACTIVE</b> flag is not set.
     * @param {Integer} dwFlags One or more of the following flag values:
     * @param {BOOL} bForceOpenFilesClosed By default, any open handles to files that are not cached by Offline Files prevent the transition to offline.  If this parameter is <b>TRUE</b>, the operation will forcibly close these files handles, allowing the scope to transition offline.
     * 
     * <div class="alert"><b>Note</b>  If file handles are forcibly closed, this can cause unexpected consequences, depending on the applications that are using those files.</div>
     * <div> </div>
     * @returns {BOOL} Receives <b>TRUE</b> if open files prevented the transition, or <b>FALSE</b> otherwise.  This value is useful only if <b>FALSE</b> was specified for the <i>bForceOpenFilesClosed</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitionoffline
     */
    TransitionOffline(hwndParent, dwFlags, bForceOpenFilesClosed) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "uint", dwFlags, "int", bForceOpenFilesClosed, "int*", &pbOpenFilesPreventedTransition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbOpenFilesPreventedTransition
    }
}
