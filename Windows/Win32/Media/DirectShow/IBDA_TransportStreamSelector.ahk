#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_TransportStreamSelector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_TransportStreamSelector
     * @type {Guid}
     */
    static IID => Guid("{1dcfafe9-b45e-41b3-bb2a-561eb129ae98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTSID", "GetTSInformation"]

    /**
     * 
     * @param {Integer} usTSID 
     * @returns {HRESULT} 
     */
    SetTSID(usTSID) {
        result := ComCall(3, this, "ushort", usTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulTSInformationBufferLen 
     * @param {Pointer<Integer>} pbTSInformationBuffer 
     * @returns {HRESULT} 
     */
    GetTSInformation(pulTSInformationBufferLen, pbTSInformationBuffer) {
        result := ComCall(4, this, "uint*", pulTSInformationBufferLen, "char*", pbTSInformationBuffer, "HRESULT")
        return result
    }
}
