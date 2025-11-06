#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSJACK_DESCRIPTION3.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsJackDescription3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsJackDescription3
     * @type {Guid}
     */
    static IID => Guid("{e3f6778b-6660-4cc8-a291-ecc4192d9967}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetJackCount", "GetJackDescription3"]

    /**
     * 
     * @returns {Integer} 
     */
    GetJackCount() {
        result := ComCall(3, this, "uint*", &pcJacks := 0, "HRESULT")
        return pcJacks
    }

    /**
     * 
     * @param {Integer} nJack 
     * @returns {KSJACK_DESCRIPTION3} 
     */
    GetJackDescription3(nJack) {
        pDescription3 := KSJACK_DESCRIPTION3()
        result := ComCall(4, this, "uint", nJack, "ptr", pDescription3, "HRESULT")
        return pDescription3
    }
}
