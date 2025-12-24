#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPControls.ahk

/**
 * The IWMPControls2 interface provides a method that supplements the IWMPControls interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcontrols2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPControls2 extends IWMPControls{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPControls2
     * @type {Guid}
     */
    static IID => Guid("{6f030d25-0890-480f-9775-1f7e40ab5b8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["step"]

    /**
     * The step method causes the current video media item to freeze playback on the next frame or the previous frame.
     * @param {Integer} lStep <b>long</b> indicating how many frames to step before freezing. Must be set to 1 or -1.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols2-step
     */
    step(lStep) {
        result := ComCall(23, this, "int", lStep, "HRESULT")
        return result
    }
}
