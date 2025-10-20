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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Bandwidth", "put_Bandwidth", "get_LPInnerFEC", "put_LPInnerFEC", "get_LPInnerFECRate", "put_LPInnerFECRate", "get_HAlpha", "put_HAlpha", "get_Guard", "put_Guard", "get_Mode", "put_Mode", "get_OtherFrequencyInUse", "put_OtherFrequencyInUse"]

    /**
     * 
     * @param {Pointer<Integer>} BandWidthVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_bandwidth
     */
    get_Bandwidth(BandWidthVal) {
        result := ComCall(22, this, "int*", BandWidthVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BandwidthVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_bandwidth
     */
    put_Bandwidth(BandwidthVal) {
        result := ComCall(23, this, "int", BandwidthVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_lpinnerfec
     */
    get_LPInnerFEC(FEC) {
        result := ComCall(24, this, "int*", FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_lpinnerfec
     */
    put_LPInnerFEC(FEC) {
        result := ComCall(25, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_lpinnerfecrate
     */
    get_LPInnerFECRate(FEC) {
        result := ComCall(26, this, "int*", FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_lpinnerfecrate
     */
    put_LPInnerFECRate(FEC) {
        result := ComCall(27, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Alpha 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_halpha
     */
    get_HAlpha(Alpha) {
        result := ComCall(28, this, "int*", Alpha, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Alpha 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_halpha
     */
    put_HAlpha(Alpha) {
        result := ComCall(29, this, "int", Alpha, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} GI 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_guard
     */
    get_Guard(GI) {
        result := ComCall(30, this, "int*", GI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} GI 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_guard
     */
    put_Guard(GI) {
        result := ComCall(31, this, "int", GI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_mode
     */
    get_Mode(mode) {
        result := ComCall(32, this, "int*", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_mode
     */
    put_Mode(mode) {
        result := ComCall(33, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} OtherFrequencyInUseVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_otherfrequencyinuse
     */
    get_OtherFrequencyInUse(OtherFrequencyInUseVal) {
        result := ComCall(34, this, "ptr", OtherFrequencyInUseVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} OtherFrequencyInUseVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_otherfrequencyinuse
     */
    put_OtherFrequencyInUse(OtherFrequencyInUseVal) {
        result := ComCall(35, this, "short", OtherFrequencyInUseVal, "HRESULT")
        return result
    }
}
