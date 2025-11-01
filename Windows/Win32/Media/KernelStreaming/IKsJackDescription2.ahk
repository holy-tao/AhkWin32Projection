#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IKsJackDescription2 interface provides information about the jacks or internal connectors that provide a physical connection between a device on an audio adapter and an external or internal endpoint device (for example, a microphone or CD player).
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iksjackdescription2
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsJackDescription2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsJackDescription2
     * @type {Guid}
     */
    static IID => Guid("{478f3a9b-e0c9-4827-9228-6f5505ffe76a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetJackCount", "GetJackDescription2"]

    /**
     * 
     * @param {Pointer<Integer>} pcJacks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iksjackdescription2-getjackcount
     */
    GetJackCount(pcJacks) {
        pcJacksMarshal := pcJacks is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcJacksMarshal, pcJacks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nJack 
     * @param {Pointer<KSJACK_DESCRIPTION2>} pDescription2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iksjackdescription2-getjackdescription2
     */
    GetJackDescription2(nJack, pDescription2) {
        result := ComCall(4, this, "uint", nJack, "ptr", pDescription2, "HRESULT")
        return result
    }
}
