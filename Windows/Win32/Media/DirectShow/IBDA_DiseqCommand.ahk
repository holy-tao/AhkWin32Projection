#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls cable television satelite equipment, using Digital Satellite Equipment Control (DiSEqC) commands.
 * @remarks
 * 
 * Depending on the cable television equipment in use, this interface can be used to select the LNB converter source, move a motor dish, or control radio frequency (RF) switching equipment.
 *       
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DiseqCommand)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_diseqcommand
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DiseqCommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_DiseqCommand
     * @type {Guid}
     */
    static IID => Guid("{f84e2ab0-3c6b-45e3-a0fc-8669d4b81f11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_EnableDiseqCommands", "put_DiseqLNBSource", "put_DiseqUseToneBurst", "put_DiseqRepeats", "put_DiseqSendCommand", "get_DiseqResponse"]

    /**
     * @type {HRESULT} 
     */
    EnableDiseqCommands {
        set => this.put_EnableDiseqCommands(value)
    }

    /**
     * @type {HRESULT} 
     */
    DiseqLNBSource {
        set => this.put_DiseqLNBSource(value)
    }

    /**
     * @type {HRESULT} 
     */
    DiseqUseToneBurst {
        set => this.put_DiseqUseToneBurst(value)
    }

    /**
     * @type {HRESULT} 
     */
    DiseqRepeats {
        set => this.put_DiseqRepeats(value)
    }

    /**
     * Enables or disables the use of Digital Satellite Equipment Control (DiSEqC) commands.
     * @param {BOOLEAN} bEnable If <b>TRUE</b>, DiSEqC commands are enabled. Otherwise, DiSEqC commands are disabled.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_diseqcommand-put_enablediseqcommands
     */
    put_EnableDiseqCommands(bEnable) {
        result := ComCall(3, this, "char", bEnable, "HRESULT")
        return result
    }

    /**
     * Sets the low-noise block (LNB) converter source.
     * @param {Integer} ulLNBSource The LNB converter source to use.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Source position A.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Source position B.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="2"></a><dl>
     * <dt><b>2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Source position C.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="3"></a><dl>
     * <dt><b>3</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Source position D.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqlnbsource
     */
    put_DiseqLNBSource(ulLNBSource) {
        result := ComCall(4, this, "uint", ulLNBSource, "HRESULT")
        return result
    }

    /**
     * Enables or disables Tone-Burst commands.
     * @param {BOOLEAN} bUseToneBurst If <b>TRUE</b>, Tone-Burst commands are enabled. Otherwise, Tone-Burst commands are disabled.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_diseqcommand-put_disequsetoneburst
     */
    put_DiseqUseToneBurst(bUseToneBurst) {
        result := ComCall(5, this, "char", bUseToneBurst, "HRESULT")
        return result
    }

    /**
     * Enables or disables repeated Digital Satellite Equipment Control (DiSEqC) commands.
     * @param {Integer} ulRepeats The number of times to repeat each DiSEqC command. To disable repeated commands, set <i>ulRepeats</i> to 0.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqrepeats
     */
    put_DiseqRepeats(ulRepeats) {
        result := ComCall(6, this, "uint", ulRepeats, "HRESULT")
        return result
    }

    /**
     * Sends a Digital Satellite Equipment Control (DiSEqC) command.
     * @param {Integer} ulRequestId An identifier for the command that is assigned by the application.
     * @param {Integer} ulcbCommandLen The size of the <i>pbCommand</i> array, in bytes.
     * @param {Pointer<Integer>} pbCommand Pointer to a byte array that contains the DiSEqC command, starting with the framing byte. The driver inserts the parity bits for the command.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqsendcommand
     */
    put_DiseqSendCommand(ulRequestId, ulcbCommandLen, pbCommand) {
        pbCommandMarshal := pbCommand is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", ulRequestId, "uint", ulcbCommandLen, pbCommandMarshal, pbCommand, "HRESULT")
        return result
    }

    /**
     * Gets the driver's response to a Digital Satellite Equipment Control (DiSEqC) command.
     * @param {Integer} ulRequestId The identifier of the command. The application assigns this value when it calls <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqsendcommand">IBDA_DiseqCommand::put_DiseqSendCommand</a>.
     * @param {Pointer<Integer>} pulcbResponseLen On input, specifies the size of the <i>pbResponse</i> array, in bytes. On output, receives the number of bytes of data written into the <i>pbResponse</i> buffer.
     * @param {Pointer<Integer>} pbResponse Pointer to a byte array that receives the driver's response.
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
     * <dt><b><b>S_OK</b></b></dt>
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
     * <dt><b><b>BDA_E_BUFFER_TOO_SMALL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer given in the <i>pbResponse</i> parameter is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_diseqcommand-get_diseqresponse
     */
    get_DiseqResponse(ulRequestId, pulcbResponseLen, pbResponse) {
        pulcbResponseLenMarshal := pulcbResponseLen is VarRef ? "uint*" : "ptr"
        pbResponseMarshal := pbResponse is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", ulRequestId, pulcbResponseLenMarshal, pulcbResponseLen, pbResponseMarshal, pbResponse, "HRESULT")
        return result
    }
}
