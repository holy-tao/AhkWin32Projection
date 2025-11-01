#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a device's Mux Service. The Mux Service is used to specify which packet identifiers (PIDs) in the MPEG transport stream are delivered to a media sink device (MSD).
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_MUX)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_mux
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_MUX extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_MUX
     * @type {Guid}
     */
    static IID => Guid("{942aafec-4c05-4c74-b8eb-8706c2a4943f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPidList", "GetPidList"]

    /**
     * 
     * @param {Integer} ulPidListCount 
     * @param {Pointer<BDA_MUX_PIDLISTITEM>} pbPidListBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_mux-setpidlist
     */
    SetPidList(ulPidListCount, pbPidListBuffer) {
        result := ComCall(3, this, "uint", ulPidListCount, "ptr", pbPidListBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulPidListCount 
     * @param {Pointer<BDA_MUX_PIDLISTITEM>} pbPidListBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_mux-getpidlist
     */
    GetPidList(pulPidListCount, pbPidListBuffer) {
        pulPidListCountMarshal := pulPidListCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulPidListCountMarshal, pulPidListCount, "ptr", pbPidListBuffer, "HRESULT")
        return result
    }
}
