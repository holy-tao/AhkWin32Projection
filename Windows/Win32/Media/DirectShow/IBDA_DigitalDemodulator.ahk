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
     * 
     * @param {Pointer<Int32>} pModulationType 
     * @returns {HRESULT} 
     */
    put_ModulationType(pModulationType) {
        result := ComCall(3, this, "int*", pModulationType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pModulationType 
     * @returns {HRESULT} 
     */
    get_ModulationType(pModulationType) {
        result := ComCall(4, this, "int*", pModulationType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFECMethod 
     * @returns {HRESULT} 
     */
    put_InnerFECMethod(pFECMethod) {
        result := ComCall(5, this, "int*", pFECMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFECMethod 
     * @returns {HRESULT} 
     */
    get_InnerFECMethod(pFECMethod) {
        result := ComCall(6, this, "int*", pFECMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFECRate 
     * @returns {HRESULT} 
     */
    put_InnerFECRate(pFECRate) {
        result := ComCall(7, this, "int*", pFECRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFECRate 
     * @returns {HRESULT} 
     */
    get_InnerFECRate(pFECRate) {
        result := ComCall(8, this, "int*", pFECRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFECMethod 
     * @returns {HRESULT} 
     */
    put_OuterFECMethod(pFECMethod) {
        result := ComCall(9, this, "int*", pFECMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFECMethod 
     * @returns {HRESULT} 
     */
    get_OuterFECMethod(pFECMethod) {
        result := ComCall(10, this, "int*", pFECMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFECRate 
     * @returns {HRESULT} 
     */
    put_OuterFECRate(pFECRate) {
        result := ComCall(11, this, "int*", pFECRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFECRate 
     * @returns {HRESULT} 
     */
    get_OuterFECRate(pFECRate) {
        result := ComCall(12, this, "int*", pFECRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pSymbolRate 
     * @returns {HRESULT} 
     */
    put_SymbolRate(pSymbolRate) {
        result := ComCall(13, this, "uint*", pSymbolRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pSymbolRate 
     * @returns {HRESULT} 
     */
    get_SymbolRate(pSymbolRate) {
        result := ComCall(14, this, "uint*", pSymbolRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pSpectralInversion 
     * @returns {HRESULT} 
     */
    put_SpectralInversion(pSpectralInversion) {
        result := ComCall(15, this, "int*", pSpectralInversion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pSpectralInversion 
     * @returns {HRESULT} 
     */
    get_SpectralInversion(pSpectralInversion) {
        result := ComCall(16, this, "int*", pSpectralInversion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
