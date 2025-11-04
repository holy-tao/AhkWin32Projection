#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class IImageBytes extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CountBytes", "LockBytes", "UnlockBytes"]

    /**
     * 
     * @param {Pointer<Integer>} pcb 
     * @returns {HRESULT} 
     */
    CountBytes(pcb) {
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcbMarshal, pcb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cb 
     * @param {Integer} ulOffset 
     * @param {Pointer<Pointer<Void>>} ppvBytes 
     * @returns {HRESULT} 
     */
    LockBytes(cb, ulOffset, ppvBytes) {
        ppvBytesMarshal := ppvBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cb, "uint", ulOffset, ppvBytesMarshal, ppvBytes, "HRESULT")
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
        pvBytesMarshal := pvBytes is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pvBytesMarshal, pvBytes, "uint", cb, "uint", ulOffset, "HRESULT")
        return result
    }
}
