#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ILocator.ahk
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
     * @type {Integer} 
     */
    CarrierFrequency {
        get => this.get_CarrierFrequency()
        set => this.put_CarrierFrequency(value)
    }

    /**
     * @type {Integer} 
     */
    InnerFEC {
        get => this.get_InnerFEC()
        set => this.put_InnerFEC(value)
    }

    /**
     * @type {Integer} 
     */
    InnerFECRate {
        get => this.get_InnerFECRate()
        set => this.put_InnerFECRate(value)
    }

    /**
     * @type {Integer} 
     */
    OuterFEC {
        get => this.get_OuterFEC()
        set => this.put_OuterFEC(value)
    }

    /**
     * @type {Integer} 
     */
    OuterFECRate {
        get => this.get_OuterFECRate()
        set => this.put_OuterFECRate(value)
    }

    /**
     * @type {Integer} 
     */
    Modulation {
        get => this.get_Modulation()
        set => this.put_Modulation(value)
    }

    /**
     * @type {Integer} 
     */
    SymbolRate {
        get => this.get_SymbolRate()
        set => this.put_SymbolRate(value)
    }

    /**
     * The get_CarrierFrequency method gets the frequency of the RF signal.
     * @returns {Integer} Receives the frequency, in kilohertz (kHz).
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-get_carrierfrequency
     */
    get_CarrierFrequency() {
        result := ComCall(7, this, "int*", &Frequency := 0, "HRESULT")
        return Frequency
    }

    /**
     * The put_CarrierFrequency method sets the frequency of the RF signal.
     * @param {Integer} Frequency The frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-put_carrierfrequency
     */
    put_CarrierFrequency(Frequency) {
        result := ComCall(8, this, "int", Frequency, "HRESULT")
        return result
    }

    /**
     * The get_InnerFEC method gets the type of inner FEC that is used.
     * @returns {Integer} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> that receives the type of inner FEC.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-get_innerfec
     */
    get_InnerFEC() {
        result := ComCall(9, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_InnerFEC method sets the type of inner FEC to use.
     * @param {Integer} FEC Specifies the inner FEC. This parameter is a value of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-put_innerfec
     */
    put_InnerFEC(FEC) {
        result := ComCall(10, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * The get_InnerFECRate method gets the inner FEC rate.
     * @returns {Integer} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> that receives the inner FEC rate.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-get_innerfecrate
     */
    get_InnerFECRate() {
        result := ComCall(11, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_InnerFECRate method sets the inner FEC rate.
     * @param {Integer} FEC Specifies the inner FEC rate. This parameter is a value of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-put_innerfecrate
     */
    put_InnerFECRate(FEC) {
        result := ComCall(12, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * The get_OuterFEC method gets the type of outer FEC that is used.
     * @returns {Integer} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> that receives the type of outer FEC.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-get_outerfec
     */
    get_OuterFEC() {
        result := ComCall(13, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_OuterFEC method sets the type of outer FEC to use.
     * @param {Integer} FEC Specifies the outer FEC. This parameter is a value of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-put_outerfec
     */
    put_OuterFEC(FEC) {
        result := ComCall(14, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * The get_OuterFECRate method gets the outer FEC rate.
     * @returns {Integer} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> that receives the outer FEC rate.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-get_outerfecrate
     */
    get_OuterFECRate() {
        result := ComCall(15, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_OuterFECRate method sets the outer FEC rate.
     * @param {Integer} FEC Specifies the outer FEC rate. This parameter is a value of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-put_outerfecrate
     */
    put_OuterFECRate(FEC) {
        result := ComCall(16, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * The get_Modulation method gets the modulation type.
     * @returns {Integer} Receives the modulation type, as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/modulationtype">ModulationType</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-get_modulation
     */
    get_Modulation() {
        result := ComCall(17, this, "int*", &Modulation := 0, "HRESULT")
        return Modulation
    }

    /**
     * The put_Modulation method sets the modulation type.
     * @param {Integer} Modulation The modulation type, as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/modulationtype">ModulationType</a> enumeration.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-put_modulation
     */
    put_Modulation(Modulation) {
        result := ComCall(18, this, "int", Modulation, "HRESULT")
        return result
    }

    /**
     * The get_SymbolRate method gets the QPSK symbol rate.
     * @returns {Integer} Receives the QPSK symbol rate. The rate is expressed in symbols per second.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-get_symbolrate
     */
    get_SymbolRate() {
        result := ComCall(19, this, "int*", &Rate := 0, "HRESULT")
        return Rate
    }

    /**
     * The put_SymbolRate method sets the QPSK symbol rate.
     * @param {Integer} Rate Specifies the QPSK symbol rate. The rate is expressed in symbols per second.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-put_symbolrate
     */
    put_SymbolRate(Rate) {
        result := ComCall(20, this, "int", Rate, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a copy of the Locator.
     * @returns {ILocator} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ilocator">ILocator</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ilocator-clone
     */
    Clone() {
        result := ComCall(21, this, "ptr*", &NewLocator := 0, "HRESULT")
        return ILocator(NewLocator)
    }
}
