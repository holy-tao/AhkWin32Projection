#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPVideoRenderConfig interface provides a method that configures the enhanced video renderer (EVR) used by Windows Media Player.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmprealestate/nn-wmprealestate-iwmpvideorenderconfig
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
     * @remarks
     * In certain situations, Windows Media Player uses a video pipeline that includes the enhanced video renderer (EVR). The EVR is a system component that allows other components and applications to provide custom plug-ins that perform tasks like video mixing and video presenting.
     * 
     * An application that embeds Windows Media Player can provide a custom video presenter for the EVR by calling <b>put_presenterActivate</b>. The application must create its own activation object that implements the <b>IMFActivate</b> interface. The application provides Windows Media Player with that interface in the <i>pActivate</i> parameter. When Windows Media Player or another system component needs to create an instance of the custom presenter, it calls the <b>ActivateObject</b> method of the <b>IMFActivate</b> interface provided by the application.
     * 
     * The activation object is responsible for initializing the custom presenter. The nature of the initialization and the format of any context data required for the initialization are completely under the control of those who develop the custom presenter and the activation object.
     * 
     * The EVR, custom presenters, activation objects, and the <b>IMFActivate</b> interface are documented in the Microsoft Media Foundation SDK, which is part of the Microsoft Windows SDK. You can download the Windows SDK from the <a href="https://msdn.microsoft.com/downloads/default.aspx">MSDN Download and Code Center</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmprealestate/nf-wmprealestate-iwmpvideorenderconfig-put_presenteractivate
     */
    put_presenterActivate(pActivate) {
        result := ComCall(3, this, "ptr", pActivate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
