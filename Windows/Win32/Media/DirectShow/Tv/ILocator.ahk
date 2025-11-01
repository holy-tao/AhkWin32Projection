#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ILocator interface is implemented (through derived interfaces such as IATSCLocator) on Locator objects that contain tuning information about the tuning space.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ILocator)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ilocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ILocator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocator
     * @type {Guid}
     */
    static IID => Guid("{286d7f89-760c-4f89-80c4-66841d2507aa}")

    /**
     * The class identifier for Locator
     * @type {Guid}
     */
    static CLSID => Guid("{0888c883-ac4f-4943-b516-2c38d9b34562}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CarrierFrequency", "put_CarrierFrequency", "get_InnerFEC", "put_InnerFEC", "get_InnerFECRate", "put_InnerFECRate", "get_OuterFEC", "put_OuterFEC", "get_OuterFECRate", "put_OuterFECRate", "get_Modulation", "put_Modulation", "get_SymbolRate", "put_SymbolRate", "Clone"]

    /**
     * 
     * @param {Pointer<Integer>} Frequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_carrierfrequency
     */
    get_CarrierFrequency(Frequency) {
        FrequencyMarshal := Frequency is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, FrequencyMarshal, Frequency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Frequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_carrierfrequency
     */
    put_CarrierFrequency(Frequency) {
        result := ComCall(8, this, "int", Frequency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_innerfec
     */
    get_InnerFEC(FEC) {
        FECMarshal := FEC is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, FECMarshal, FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_innerfec
     */
    put_InnerFEC(FEC) {
        result := ComCall(10, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_innerfecrate
     */
    get_InnerFECRate(FEC) {
        FECMarshal := FEC is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, FECMarshal, FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_innerfecrate
     */
    put_InnerFECRate(FEC) {
        result := ComCall(12, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_outerfec
     */
    get_OuterFEC(FEC) {
        FECMarshal := FEC is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, FECMarshal, FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_outerfec
     */
    put_OuterFEC(FEC) {
        result := ComCall(14, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_outerfecrate
     */
    get_OuterFECRate(FEC) {
        FECMarshal := FEC is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, FECMarshal, FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_outerfecrate
     */
    put_OuterFECRate(FEC) {
        result := ComCall(16, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Modulation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_modulation
     */
    get_Modulation(Modulation) {
        ModulationMarshal := Modulation is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, ModulationMarshal, Modulation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Modulation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_modulation
     */
    put_Modulation(Modulation) {
        result := ComCall(18, this, "int", Modulation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Rate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_symbolrate
     */
    get_SymbolRate(Rate) {
        RateMarshal := Rate is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, RateMarshal, Rate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Rate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_symbolrate
     */
    put_SymbolRate(Rate) {
        result := ComCall(20, this, "int", Rate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ILocator>} NewLocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-clone
     */
    Clone(NewLocator) {
        result := ComCall(21, this, "ptr*", NewLocator, "HRESULT")
        return result
    }
}
