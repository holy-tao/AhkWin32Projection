#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintOemCommon extends IUnknown{
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
     * 
     * @param {Integer} dwMode 
     * @param {Pointer} pBuffer 
     * @param {Integer} cbSize 
     * @param {Pointer<UInt32>} pcbNeeded 
     * @returns {HRESULT} 
     */
    GetInfo(dwMode, pBuffer, cbSize, pcbNeeded) {
        result := ComCall(3, this, "uint", dwMode, "ptr", pBuffer, "uint", cbSize, "uint*", pcbNeeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @param {Pointer<OEMDMPARAM>} pOemDMParam 
     * @returns {HRESULT} 
     */
    DevMode(dwMode, pOemDMParam) {
        result := ComCall(4, this, "uint", dwMode, "ptr", pOemDMParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
