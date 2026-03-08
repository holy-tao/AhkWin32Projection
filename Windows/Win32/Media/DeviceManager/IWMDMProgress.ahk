#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The optional, application-implemented IWMDMProgress allows an application to track the progress of operations, such as formatting media or file transfers.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmprogress
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMProgress extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMProgress
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a0c-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin", "Progress", "End"]

    /**
     * The Begin method indicates that an operation is beginning. An estimate of the duration of the operation is provided when possible.
     * @remarks
     * This operation is called by various methods to indicate that an operation is beginning. The number of ticks passed in <i>dwEstimatedTicks</i> is an estimate of how many ticks are needed for the operation to complete. During the course of the operation, the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmprogress-progress">Progress</a> method is called to indicate how many ticks have transpired. Applications can use the estimate to configure display mechanisms that show progress.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmprogress3-begin3">IWMDMProgress3::Begin3</a> method provides more information about what action is occurring.
     * @param {Integer} dwEstimatedTicks <b>DWORD</b> specifying the estimated number of ticks that are needed for the operation to complete.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Device Manager should cancel the current operation without waiting for it to finish. If the application is using block mode, then Windows Media Device Manager will return this error to the application.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress-begin
     */
    Begin(dwEstimatedTicks) {
        result := ComCall(3, this, "uint", dwEstimatedTicks, "HRESULT")
        return result
    }

    /**
     * The Progress method indicates that an operation is still in progress.
     * @remarks
     * This method is called by all other Windows Media Device Manager methods. The intention is that <b>Progress</b> will be called once per estimated tick. However, the <i>dwTranspiredTicks</i> parameter must be checked on each call because the operation being performed may not guarantee a call once for each estimated tick.
     * 
     * The application returns S_OK to the calling method to indicate that the operation should continue. The application returns WMDM_E_USER_CANCELLED to indicate that the operation should be cancelled. If the application is using block mode and returns WMDM_E_USER_CANCELLED, then Windows Media Device Manager will return this same error to the application.
     * @param {Integer} dwTranspiredTicks <b>DWORD</b> specifying the number of ticks that have transpired so far.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Device Manager should cancel the current operation without waiting for it to finish. If the application is using block mode, then Windows Media Device Manager will return this error to the application.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress-progress
     */
    Progress(dwTranspiredTicks) {
        result := ComCall(4, this, "uint", dwTranspiredTicks, "HRESULT")
        return result
    }

    /**
     * The End method indicates that an operation is finished.
     * @remarks
     * This method is called by various interfaces to indicate that an operation is ending. Windows Media Device Manager ignores any return code returned by the <b>End</b> method because the operation is completed or terminated before this method is called.
     * @returns {HRESULT} The return value from the method is ignored by Windows Media Device Manager.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress-end
     */
    End() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
