#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPSyncDevice2.ahk

/**
 * The IWMPSyncDevice3 interface provides methods for estimating the size required to synchronize a playlist to a device.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsyncdevice3
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSyncDevice3 extends IWMPSyncDevice2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSyncDevice3
     * @type {Guid}
     */
    static IID => Guid("{b22c85f9-263c-4372-a0da-b518db9b4098}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["estimateSyncSize", "cancelEstimation"]

    /**
     * The estimateSyncSize method initiates the estimation of the size required on the device to synchronize a specified playlist.
     * @param {IWMPPlaylist} pNonRulePlaylist A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nn-wmp-iwmpplaylist">IWMPPlaylist</a> interface that represents the playlist for which the size will be estimated. This parameter can be set to <b>NULL</b>. If this argument is specified the estimation will return the size of <i>pNonRulePlaylist</i> and the current sync rules, if any.
     * @param {IWMPPlaylist} pRulesPlaylist A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nn-wmp-iwmpplaylist">IWMPPlaylist</a> interface that represents the playlist for which the size will be estimated. This parameter can be set to <b>NULL</b>. If this argument is specified then the current sync rules will be excluded from the estimation so that the estimation will return the size of <i>pNonRulePlaylist</i> and <i>pRulesPlaylist</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is shutting down, or <i>pNonRulePlaylist</i> and <i>pRulesPlaylist</i>  are both <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A synchronization session is already in progress for the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice3-estimatesyncsize
     */
    estimateSyncSize(pNonRulePlaylist, pRulesPlaylist) {
        result := ComCall(20, this, "ptr", pNonRulePlaylist, "ptr", pRulesPlaylist, "HRESULT")
        return result
    }

    /**
     * The cancelEstimation method cancels an estimation that was previously initiated by estimateSyncSize.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice3-cancelestimation
     */
    cancelEstimation() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
