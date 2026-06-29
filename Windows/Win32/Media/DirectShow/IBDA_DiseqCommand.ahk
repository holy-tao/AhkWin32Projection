#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls cable television satellite equipment, using Digital Satellite Equipment Control (DiSEqC) commands.
 * @remarks
 * Depending on the cable television equipment in use, this interface can be used to select the LNB converter source, move a motor dish, or control radio frequency (RF) switching equipment.
 *       
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DiseqCommand)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_diseqcommand
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_DiseqCommand extends IUnknown {
    /**
     * The interface identifier for IBDA_DiseqCommand
     * @type {Guid}
     */
    static IID := Guid("{f84e2ab0-3c6b-45e3-a0fc-8669d4b81f11}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_DiseqCommand interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_EnableDiseqCommands : IntPtr
        put_DiseqLNBSource      : IntPtr
        put_DiseqUseToneBurst   : IntPtr
        put_DiseqRepeats        : IntPtr
        put_DiseqSendCommand    : IntPtr
        get_DiseqResponse       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_DiseqCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOLEAN} 
     */
    EnableDiseqCommands {
        set => this.put_EnableDiseqCommands(value)
    }

    /**
     * @type {Integer} 
     */
    DiseqLNBSource {
        set => this.put_DiseqLNBSource(value)
    }

    /**
     * @type {BOOLEAN} 
     */
    DiseqUseToneBurst {
        set => this.put_DiseqUseToneBurst(value)
    }

    /**
     * @type {Integer} 
     */
    DiseqRepeats {
        set => this.put_DiseqRepeats(value)
    }

    /**
     * Enables or disables the use of Digital Satellite Equipment Control (DiSEqC) commands.
     * @remarks
     * Depending on the satellite installation, DiSEqC commands might be required. However, enabling DiSEqC can result in the driver taking longer to switch transponders (typically by 100–300 milliseconds). Therefore, it is recommended to disable DiSEqC commands if they are not required.
     * @param {BOOLEAN} bEnable If <b>TRUE</b>, DiSEqC commands are enabled. Otherwise, DiSEqC commands are disabled.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_enablediseqcommands
     */
    put_EnableDiseqCommands(bEnable) {
        result := ComCall(3, this, BOOLEAN, bEnable, "HRESULT")
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqlnbsource
     */
    put_DiseqLNBSource(ulLNBSource) {
        result := ComCall(4, this, "uint", ulLNBSource, "HRESULT")
        return result
    }

    /**
     * Enables or disables Tone-Burst commands.
     * @remarks
     * The Tone-Burst command uses a 22-kHz carrier signal to select either source position A or source position B. 
     * 
     * Typically the driver enables or disables Tone-Burst as needed when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqlnbsource">IBDA_DiseqCommand::put_DiseqLNBSource</a>. However, you can use  the <b>put_DiseqUseToneBurst</b> method to switch this mode on or off, either to improve channel switching or to maintain compatibility with particular equipment. Note that using Tone-Burst can increase  the amount of time required for tuning by about 40 milliseconds.
     * @param {BOOLEAN} bUseToneBurst If <b>TRUE</b>, Tone-Burst commands are enabled. Otherwise, Tone-Burst commands are disabled.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_disequsetoneburst
     */
    put_DiseqUseToneBurst(bUseToneBurst) {
        result := ComCall(5, this, BOOLEAN, bUseToneBurst, "HRESULT")
        return result
    }

    /**
     * Enables or disables repeated Digital Satellite Equipment Control (DiSEqC) commands.
     * @remarks
     * When two DiSEqC switches are cascaded, the tuner might have to repeat
     * commands for the far device. However, repeated commands can increase  the amount of time required for tuning by about 100 milliseconds. Therefore, it is recommended to disable repeated commands if they are not required.
     * @param {Integer} ulRepeats The number of times to repeat each DiSEqC command. To disable repeated commands, set <i>ulRepeats</i> to 0.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqrepeats
     */
    put_DiseqRepeats(ulRepeats) {
        result := ComCall(6, this, "uint", ulRepeats, "HRESULT")
        return result
    }

    /**
     * Sends a Digital Satellite Equipment Control (DiSEqC) command.
     * @remarks
     * This method is required for version 1.2 and later of the DiSEqC command set.
     * 
     * To get the command response from the driver, call <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_diseqcommand-get_diseqresponse">IBDA_DiseqCommand::get_DiseqResponse</a>.
     * @param {Integer} ulRequestId An identifier for the command that is assigned by the application.
     * @param {Integer} ulcbCommandLen The size of the <i>pbCommand</i> array, in bytes.
     * @param {Pointer<Integer>} pbCommand Pointer to a byte array that contains the DiSEqC command, starting with the framing byte. The driver inserts the parity bits for the command.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqsendcommand
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-get_diseqresponse
     */
    get_DiseqResponse(ulRequestId, pulcbResponseLen, pbResponse) {
        pulcbResponseLenMarshal := pulcbResponseLen is VarRef ? "uint*" : "ptr"
        pbResponseMarshal := pbResponse is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", ulRequestId, pulcbResponseLenMarshal, pulcbResponseLen, pbResponseMarshal, pbResponse, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_DiseqCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_EnableDiseqCommands := CallbackCreate(GetMethod(implObj, "put_EnableDiseqCommands"), flags, 2)
        this.vtbl.put_DiseqLNBSource := CallbackCreate(GetMethod(implObj, "put_DiseqLNBSource"), flags, 2)
        this.vtbl.put_DiseqUseToneBurst := CallbackCreate(GetMethod(implObj, "put_DiseqUseToneBurst"), flags, 2)
        this.vtbl.put_DiseqRepeats := CallbackCreate(GetMethod(implObj, "put_DiseqRepeats"), flags, 2)
        this.vtbl.put_DiseqSendCommand := CallbackCreate(GetMethod(implObj, "put_DiseqSendCommand"), flags, 4)
        this.vtbl.get_DiseqResponse := CallbackCreate(GetMethod(implObj, "get_DiseqResponse"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_EnableDiseqCommands)
        CallbackFree(this.vtbl.put_DiseqLNBSource)
        CallbackFree(this.vtbl.put_DiseqUseToneBurst)
        CallbackFree(this.vtbl.put_DiseqRepeats)
        CallbackFree(this.vtbl.put_DiseqSendCommand)
        CallbackFree(this.vtbl.get_DiseqResponse)
    }
}
