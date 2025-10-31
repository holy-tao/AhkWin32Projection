#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_DigitalDemodulator interface is exposed on BDA device filters, specifically demodulators, that are not capable of automatically detecting the characteristics of a signal.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DigitalDemodulator)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_digitaldemodulator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DigitalDemodulator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_DigitalDemodulator
     * @type {Guid}
     */
    static IID => Guid("{ef30f379-985b-4d10-b640-a79d5e04e1e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ModulationType", "get_ModulationType", "put_InnerFECMethod", "get_InnerFECMethod", "put_InnerFECRate", "get_InnerFECRate", "put_OuterFECMethod", "get_OuterFECMethod", "put_OuterFECRate", "get_OuterFECRate", "put_SymbolRate", "get_SymbolRate", "put_SpectralInversion", "get_SpectralInversion"]

    /**
     * 
     * @param {Pointer<Integer>} pModulationType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_modulationtype
     */
    put_ModulationType(pModulationType) {
        result := ComCall(3, this, "int*", pModulationType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pModulationType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_modulationtype
     */
    get_ModulationType(pModulationType) {
        result := ComCall(4, this, "int*", pModulationType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFECMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_innerfecmethod
     */
    put_InnerFECMethod(pFECMethod) {
        result := ComCall(5, this, "int*", pFECMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFECMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_innerfecmethod
     */
    get_InnerFECMethod(pFECMethod) {
        result := ComCall(6, this, "int*", pFECMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFECRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_innerfecrate
     */
    put_InnerFECRate(pFECRate) {
        result := ComCall(7, this, "int*", pFECRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFECRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_innerfecrate
     */
    get_InnerFECRate(pFECRate) {
        result := ComCall(8, this, "int*", pFECRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFECMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_outerfecmethod
     */
    put_OuterFECMethod(pFECMethod) {
        result := ComCall(9, this, "int*", pFECMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFECMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_outerfecmethod
     */
    get_OuterFECMethod(pFECMethod) {
        result := ComCall(10, this, "int*", pFECMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFECRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_outerfecrate
     */
    put_OuterFECRate(pFECRate) {
        result := ComCall(11, this, "int*", pFECRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFECRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_outerfecrate
     */
    get_OuterFECRate(pFECRate) {
        result := ComCall(12, this, "int*", pFECRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSymbolRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_symbolrate
     */
    put_SymbolRate(pSymbolRate) {
        result := ComCall(13, this, "uint*", pSymbolRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSymbolRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_symbolrate
     */
    get_SymbolRate(pSymbolRate) {
        result := ComCall(14, this, "uint*", pSymbolRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSpectralInversion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_spectralinversion
     */
    put_SpectralInversion(pSpectralInversion) {
        result := ComCall(15, this, "int*", pSpectralInversion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSpectralInversion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_spectralinversion
     */
    get_SpectralInversion(pSpectralInversion) {
        result := ComCall(16, this, "int*", pSpectralInversion, "HRESULT")
        return result
    }
}
