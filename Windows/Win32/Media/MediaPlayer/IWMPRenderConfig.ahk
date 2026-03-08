#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPRenderConfig interface provides methods to specify or retrieve a value indicating whether Media Foundation&#8211;based playback is restricted to the current process.Note  Using this interface with protected content is not supported. .
 * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nn-wmprealestate-iwmprenderconfig
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPRenderConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPRenderConfig
     * @type {Guid}
     */
    static IID => Guid("{959506c1-0314-4ec5-9e61-8528db5e5478}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_inProcOnly", "get_inProcOnly"]

    /**
     */
    inProcOnly {
        get => this.get_inProcOnly()
        set => this.put_inProcOnly(value)
    }

    /**
     * The put_inProcOnly method specifies a value indicating whether playback is restricted to the current process.
     * @remarks
     * Using this method with protected content is not supported.
     * 
     * This method can be helpful when debugging. If your program works with the Media Foundation topology directly (for example, specifying an EVR presenter by using the <a href="https://docs.microsoft.com/windows/desktop/api/wmprealestate/nn-wmprealestate-iwmpvideorenderconfig">IWMPVideoRenderConfig</a> interface), it might be easier to debug your code when the presenter is in the same process.
     * 
     * This method might also be useful if your Media Foundation components are designed to run in the main program's process.
     * 
     * Note that DirectShow graphs in Windows Media Player always run in the main process.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {BOOL} fInProc <b>BOOL</b>, <b>TRUE</b> specifying that playback is restricted to the current process.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nf-wmprealestate-iwmprenderconfig-put_inproconly
     */
    put_inProcOnly(fInProc) {
        result := ComCall(3, this, "int", fInProc, "HRESULT")
        return result
    }

    /**
     * The get_inProcOnly method retrieves a value indicating whether playback is restricted to the current process.
     * @remarks
     * Using this method with protected content is not supported.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<BOOL>} pfInProc Pointer to a <b>BOOL</b> that receives the result. <b>TRUE</b> specifies that playback is restricted to the current process.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nf-wmprealestate-iwmprenderconfig-get_inproconly
     */
    get_inProcOnly(pfInProc) {
        pfInProcMarshal := pfInProc is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pfInProcMarshal, pfInProc, "HRESULT")
        return result
    }
}
