#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintOemCommon extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintOemCommon
     * @type {Guid}
     */
    static IID => Guid("{7f42285e-91d5-11d1-8820-00c04fb961ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo", "DevMode"]

    /**
     * 
     * @param {Integer} dwMode 
     * @param {Pointer} pBuffer 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {HRESULT} 
     */
    GetInfo(dwMode, pBuffer, cbSize, pcbNeeded) {
        pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwMode, "ptr", pBuffer, "uint", cbSize, pcbNeededMarshal, pcbNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @param {Pointer<OEMDMPARAM>} pOemDMParam 
     * @returns {HRESULT} 
     */
    DevMode(dwMode, pOemDMParam) {
        result := ComCall(4, this, "uint", dwMode, "ptr", pOemDMParam, "HRESULT")
        return result
    }
}
