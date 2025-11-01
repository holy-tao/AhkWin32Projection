#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicInstrument extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusicInstrument
     * @type {Guid}
     */
    static IID => Guid("{d2ac287d-b39b-11d1-8704-00600893b1bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPatch", "SetPatch"]

    /**
     * 
     * @param {Pointer<Integer>} pdwPatch 
     * @returns {HRESULT} 
     */
    GetPatch(pdwPatch) {
        pdwPatchMarshal := pdwPatch is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwPatchMarshal, pdwPatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPatch 
     * @returns {HRESULT} 
     */
    SetPatch(dwPatch) {
        result := ComCall(4, this, "uint", dwPatch, "HRESULT")
        return result
    }
}
