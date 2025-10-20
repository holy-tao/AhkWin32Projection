#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDigitalLocator.ahk

/**
 * The IDVBTLocator interface is implemented on the DVBTLocator object.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBTLocator)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idvbtlocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVBTLocator extends IDigitalLocator{
    /**
     * The interface identifier for IDVBTLocator
     * @type {Guid}
     */
    static IID => Guid("{8664da16-dda2-42ac-926a-c18f9127c302}")

    /**
     * The class identifier for DVBTLocator
     * @type {Guid}
     */
    static CLSID => Guid("{9cd64701-bdf3-4d14-8e03-f12983d86664}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * 
     * @param {Pointer<Int32>} BandWidthVal 
     * @returns {HRESULT} 
     */
    get_Bandwidth(BandWidthVal) {
        result := ComCall(22, this, "int*", BandWidthVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BandwidthVal 
     * @returns {HRESULT} 
     */
    put_Bandwidth(BandwidthVal) {
        result := ComCall(23, this, "int", BandwidthVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} FEC 
     * @returns {HRESULT} 
     */
    get_LPInnerFEC(FEC) {
        result := ComCall(24, this, "int*", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     */
    put_LPInnerFEC(FEC) {
        result := ComCall(25, this, "int", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} FEC 
     * @returns {HRESULT} 
     */
    get_LPInnerFECRate(FEC) {
        result := ComCall(26, this, "int*", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     */
    put_LPInnerFECRate(FEC) {
        result := ComCall(27, this, "int", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Alpha 
     * @returns {HRESULT} 
     */
    get_HAlpha(Alpha) {
        result := ComCall(28, this, "int*", Alpha, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Alpha 
     * @returns {HRESULT} 
     */
    put_HAlpha(Alpha) {
        result := ComCall(29, this, "int", Alpha, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} GI 
     * @returns {HRESULT} 
     */
    get_Guard(GI) {
        result := ComCall(30, this, "int*", GI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} GI 
     * @returns {HRESULT} 
     */
    put_Guard(GI) {
        result := ComCall(31, this, "int", GI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} mode 
     * @returns {HRESULT} 
     */
    get_Mode(mode) {
        result := ComCall(32, this, "int*", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    put_Mode(mode) {
        result := ComCall(33, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} OtherFrequencyInUseVal 
     * @returns {HRESULT} 
     */
    get_OtherFrequencyInUse(OtherFrequencyInUseVal) {
        result := ComCall(34, this, "ptr", OtherFrequencyInUseVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} OtherFrequencyInUseVal 
     * @returns {HRESULT} 
     */
    put_OtherFrequencyInUse(OtherFrequencyInUseVal) {
        result := ComCall(35, this, "short", OtherFrequencyInUseVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
