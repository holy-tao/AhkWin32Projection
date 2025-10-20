#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsJackDescription3 extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pcJacks 
     * @returns {HRESULT} 
     */
    GetJackCount(pcJacks) {
        result := ComCall(3, this, "uint*", pcJacks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nJack 
     * @param {Pointer<KSJACK_DESCRIPTION3>} pDescription3 
     * @returns {HRESULT} 
     */
    GetJackDescription3(nJack, pDescription3) {
        result := ComCall(4, this, "uint", nJack, "ptr", pDescription3, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
