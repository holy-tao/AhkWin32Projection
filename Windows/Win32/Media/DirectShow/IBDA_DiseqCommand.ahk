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
     * 
     * @param {BOOLEAN} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_enablediseqcommands
     */
    put_EnableDiseqCommands(bEnable) {
        result := ComCall(3, this, "char", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulLNBSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqlnbsource
     */
    put_DiseqLNBSource(ulLNBSource) {
        result := ComCall(4, this, "uint", ulLNBSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} bUseToneBurst 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_disequsetoneburst
     */
    put_DiseqUseToneBurst(bUseToneBurst) {
        result := ComCall(5, this, "char", bUseToneBurst, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRepeats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqrepeats
     */
    put_DiseqRepeats(ulRepeats) {
        result := ComCall(6, this, "uint", ulRepeats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRequestId 
     * @param {Integer} ulcbCommandLen 
     * @param {Pointer<Integer>} pbCommand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-put_diseqsendcommand
     */
    put_DiseqSendCommand(ulRequestId, ulcbCommandLen, pbCommand) {
        pbCommandMarshal := pbCommand is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", ulRequestId, "uint", ulcbCommandLen, pbCommandMarshal, pbCommand, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRequestId 
     * @param {Pointer<Integer>} pulcbResponseLen 
     * @param {Pointer<Integer>} pbResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_diseqcommand-get_diseqresponse
     */
    get_DiseqResponse(ulRequestId, pulcbResponseLen, pbResponse) {
        pulcbResponseLenMarshal := pulcbResponseLen is VarRef ? "uint*" : "ptr"
        pbResponseMarshal := pbResponse is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", ulRequestId, pulcbResponseLenMarshal, pulcbResponseLen, pbResponseMarshal, pbResponse, "HRESULT")
        return result
    }
}
