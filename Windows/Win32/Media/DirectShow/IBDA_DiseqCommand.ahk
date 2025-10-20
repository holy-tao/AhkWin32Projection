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
     * 
     * @param {BOOLEAN} bEnable 
     * @returns {HRESULT} 
     */
    put_EnableDiseqCommands(bEnable) {
        result := ComCall(3, this, "char", bEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulLNBSource 
     * @returns {HRESULT} 
     */
    put_DiseqLNBSource(ulLNBSource) {
        result := ComCall(4, this, "uint", ulLNBSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOLEAN} bUseToneBurst 
     * @returns {HRESULT} 
     */
    put_DiseqUseToneBurst(bUseToneBurst) {
        result := ComCall(5, this, "char", bUseToneBurst, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRepeats 
     * @returns {HRESULT} 
     */
    put_DiseqRepeats(ulRepeats) {
        result := ComCall(6, this, "uint", ulRepeats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRequestId 
     * @param {Integer} ulcbCommandLen 
     * @param {Pointer<Byte>} pbCommand 
     * @returns {HRESULT} 
     */
    put_DiseqSendCommand(ulRequestId, ulcbCommandLen, pbCommand) {
        result := ComCall(7, this, "uint", ulRequestId, "uint", ulcbCommandLen, "char*", pbCommand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRequestId 
     * @param {Pointer<UInt32>} pulcbResponseLen 
     * @param {Pointer<Byte>} pbResponse 
     * @returns {HRESULT} 
     */
    get_DiseqResponse(ulRequestId, pulcbResponseLen, pbResponse) {
        result := ComCall(8, this, "uint", ulRequestId, "uint*", pulcbResponseLen, "char*", pbResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
