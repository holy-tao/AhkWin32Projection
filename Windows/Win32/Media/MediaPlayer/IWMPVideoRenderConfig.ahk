#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPVideoRenderConfig interface provides a method that configures the enhanced video renderer (EVR) used by Windows Media Player.
 * @see https://docs.microsoft.com/windows/win32/api//wmprealestate/nn-wmprealestate-iwmpvideorenderconfig
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPVideoRenderConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPVideoRenderConfig
     * @type {Guid}
     */
    static IID => Guid("{6d6cf803-1ec0-4c8d-b3ca-f18e27282074}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_presenterActivate"]

    /**
     * @type {HRESULT} 
     */
    presenterActivate {
        set => this.put_presenterActivate(value)
    }

    /**
     * The put_presenterActivate method provides Windows Media Player with an activation object for a custom video presenter.
     * @param {IMFActivate} pActivate A pointer to an <b>IMFActivate</b> interface that Windows Media Player or another Windows component will use to activate the custom video presenter.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmprealestate/nf-wmprealestate-iwmpvideorenderconfig-put_presenteractivate
     */
    put_presenterActivate(pActivate) {
        result := ComCall(3, this, "ptr", pActivate, "HRESULT")
        return result
    }
}
