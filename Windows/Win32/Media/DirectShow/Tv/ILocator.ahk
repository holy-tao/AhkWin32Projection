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
     * 
     * @param {Pointer<Int32>} Frequency 
     * @returns {HRESULT} 
     */
    get_CarrierFrequency(Frequency) {
        result := ComCall(7, this, "int*", Frequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Frequency 
     * @returns {HRESULT} 
     */
    put_CarrierFrequency(Frequency) {
        result := ComCall(8, this, "int", Frequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} FEC 
     * @returns {HRESULT} 
     */
    get_InnerFEC(FEC) {
        result := ComCall(9, this, "int*", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     */
    put_InnerFEC(FEC) {
        result := ComCall(10, this, "int", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} FEC 
     * @returns {HRESULT} 
     */
    get_InnerFECRate(FEC) {
        result := ComCall(11, this, "int*", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     */
    put_InnerFECRate(FEC) {
        result := ComCall(12, this, "int", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} FEC 
     * @returns {HRESULT} 
     */
    get_OuterFEC(FEC) {
        result := ComCall(13, this, "int*", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     */
    put_OuterFEC(FEC) {
        result := ComCall(14, this, "int", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} FEC 
     * @returns {HRESULT} 
     */
    get_OuterFECRate(FEC) {
        result := ComCall(15, this, "int*", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FEC 
     * @returns {HRESULT} 
     */
    put_OuterFECRate(FEC) {
        result := ComCall(16, this, "int", FEC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Modulation 
     * @returns {HRESULT} 
     */
    get_Modulation(Modulation) {
        result := ComCall(17, this, "int*", Modulation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Modulation 
     * @returns {HRESULT} 
     */
    put_Modulation(Modulation) {
        result := ComCall(18, this, "int", Modulation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Rate 
     * @returns {HRESULT} 
     */
    get_SymbolRate(Rate) {
        result := ComCall(19, this, "int*", Rate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Rate 
     * @returns {HRESULT} 
     */
    put_SymbolRate(Rate) {
        result := ComCall(20, this, "int", Rate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ILocator>} NewLocator 
     * @returns {HRESULT} 
     */
    Clone(NewLocator) {
        result := ComCall(21, this, "ptr", NewLocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
