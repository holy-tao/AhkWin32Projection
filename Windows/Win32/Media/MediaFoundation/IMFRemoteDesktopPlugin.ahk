#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Modifies a topology for use in a Terminal Services environment.
 * @remarks
 * 
 * To use this interface, do the following:
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> with the <b>SM_REMOTESESSION</b> flag. The function returns <b>TRUE</b> if the calling process is associated with a Terminal Services client session.
 *           </li>
 * <li>If <b>GetSystemMetrics</b> returns <b>TRUE</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreateremotedesktopplugin">MFCreateRemoteDesktopPlugin</a>. This function returns a pointer to the <b>IMFRemoteDesktopPlugin</b> interface.
 *           </li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfremotedesktopplugin-updatetopology">UpdateTopology</a> with a pointer to the topology.
 *           </li>
 * </ol>
 * The application must call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfremotedesktopplugin-updatetopology">UpdateTopology</a> before calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-settopology">IMFMediaSession::SetTopology</a> on the Media Session.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfremotedesktopplugin
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFRemoteDesktopPlugin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFRemoteDesktopPlugin
     * @type {Guid}
     */
    static IID => Guid("{1cde6309-cae0-4940-907e-c1ec9c3d1d4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateTopology"]

    /**
     * Modifies a topology for use in a Terminal Services environment.
     * @param {IMFTopology} pTopology Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the topology.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfremotedesktopplugin-updatetopology
     */
    UpdateTopology(pTopology) {
        result := ComCall(3, this, "ptr", pTopology, "HRESULT")
        return result
    }
}
