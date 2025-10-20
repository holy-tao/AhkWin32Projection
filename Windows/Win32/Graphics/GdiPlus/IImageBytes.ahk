#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class IImageBytes extends IUnknown{
    /**
     * The interface identifier for IImageBytes
     * @type {Guid}
     */
    static IID => Guid("{025d1823-6c7d-447b-bbdb-a3cbc3dfa2fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcb 
     * @returns {HRESULT} 
     */
    CountBytes(pcb) {
        result := ComCall(3, this, "uint*", pcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cb 
     * @param {Integer} ulOffset 
     * @param {Pointer<Void>} ppvBytes 
     * @returns {HRESULT} 
     */
    LockBytes(cb, ulOffset, ppvBytes) {
        result := ComCall(4, this, "uint", cb, "uint", ulOffset, "ptr", ppvBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvBytes 
     * @param {Integer} cb 
     * @param {Integer} ulOffset 
     * @returns {HRESULT} 
     */
    UnlockBytes(pvBytes, cb, ulOffset) {
        result := ComCall(5, this, "ptr", pvBytes, "uint", cb, "uint", ulOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
