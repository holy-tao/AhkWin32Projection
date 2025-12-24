#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods that detect user activity in a Protected Broadcast Driver Architecture (PBDA) media graph.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_UserActivityService)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_useractivityservice
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_UserActivityService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_UserActivityService
     * @type {Guid}
     */
    static IID => Guid("{53b14189-e478-4b7a-a1ff-506db4b99dfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCurrentTunerUseReason", "GetUserActivityInterval", "UserActivityDetected"]

    /**
     * Specifies the current tuner use reason for a Media Sink Device (MSD) in a Protected Broadcast Driver Architecture (PBDA) media graph.
     * @param {Integer} dwUseReason 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_useractivityservice-setcurrenttunerusereason
     */
    SetCurrentTunerUseReason(dwUseReason) {
        result := ComCall(3, this, "uint", dwUseReason, "HRESULT")
        return result
    }

    /**
     * Gets the interval that a Media Sink Device (MSD) in a Protected Broadcast Driver Architecture (PBDA) media graph waits before calling the UserActivityDetected method after the MSD detects user activity.
     * @returns {Integer} Gets the user activity interval, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_useractivityservice-getuseractivityinterval
     */
    GetUserActivityInterval() {
        result := ComCall(4, this, "uint*", &pdwActivityInterval := 0, "HRESULT")
        return pdwActivityInterval
    }

    /**
     * Indicates that a Media Sink Device (MSD) in a Protected Broadcast Driver Architecture (PBDA) media graph has detected user activity and is informing a Media Transfer Device (MTD) of this activity.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User activity service failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_useractivityservice-useractivitydetected
     */
    UserActivityDetected() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
