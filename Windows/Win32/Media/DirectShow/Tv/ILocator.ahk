#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\ModulationType.ahk" { ModulationType }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\FECMethod.ahk" { FECMethod }
#Import "..\BinaryConvolutionCodeRate.ahk" { BinaryConvolutionCodeRate }

/**
 * The ILocator interface is implemented (through derived interfaces such as IATSCLocator) on Locator objects that contain tuning information about the tuning space.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ILocator)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ilocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ILocator extends IDispatch {
    /**
     * The interface identifier for ILocator
     * @type {Guid}
     */
    static IID := Guid("{286d7f89-760c-4f89-80c4-66841d2507aa}")

    /**
     * The class identifier for Locator
     * @type {Guid}
     */
    static CLSID := Guid("{0888c883-ac4f-4943-b516-2c38d9b34562}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILocator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CarrierFrequency : IntPtr
        put_CarrierFrequency : IntPtr
        get_InnerFEC         : IntPtr
        put_InnerFEC         : IntPtr
        get_InnerFECRate     : IntPtr
        put_InnerFECRate     : IntPtr
        get_OuterFEC         : IntPtr
        put_OuterFEC         : IntPtr
        get_OuterFECRate     : IntPtr
        put_OuterFECRate     : IntPtr
        get_Modulation       : IntPtr
        put_Modulation       : IntPtr
        get_SymbolRate       : IntPtr
        put_SymbolRate       : IntPtr
        Clone                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    CarrierFrequency {
        get => this.get_CarrierFrequency()
        set => this.put_CarrierFrequency(value)
    }

    /**
     * @type {FECMethod} 
     */
    InnerFEC {
        get => this.get_InnerFEC()
        set => this.put_InnerFEC(value)
    }

    /**
     * @type {BinaryConvolutionCodeRate} 
     */
    InnerFECRate {
        get => this.get_InnerFECRate()
        set => this.put_InnerFECRate(value)
    }

    /**
     * @type {FECMethod} 
     */
    OuterFEC {
        get => this.get_OuterFEC()
        set => this.put_OuterFEC(value)
    }

    /**
     * @type {BinaryConvolutionCodeRate} 
     */
    OuterFECRate {
        get => this.get_OuterFECRate()
        set => this.put_OuterFECRate(value)
    }

    /**
     * @type {ModulationType} 
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
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_carrierfrequency
     */
    get_CarrierFrequency() {
        result := ComCall(7, this, "int*", &Frequency := 0, "HRESULT")
        return Frequency
    }

    /**
     * The put_CarrierFrequency method sets the frequency of the RF signal.
     * @param {Integer} Frequency The frequency, in kilohertz (kHz).
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_carrierfrequency
     */
    put_CarrierFrequency(Frequency) {
        result := ComCall(8, this, "int", Frequency, "HRESULT")
        return result
    }

    /**
     * The get_InnerFEC method gets the type of inner FEC that is used.
     * @returns {FECMethod} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> that receives the type of inner FEC.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_innerfec
     */
    get_InnerFEC() {
        result := ComCall(9, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_InnerFEC method sets the type of inner FEC to use.
     * @param {FECMethod} FEC Specifies the inner FEC. This parameter is a value of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_innerfec
     */
    put_InnerFEC(FEC) {
        result := ComCall(10, this, FECMethod, FEC, "HRESULT")
        return result
    }

    /**
     * The get_InnerFECRate method gets the inner FEC rate.
     * @returns {BinaryConvolutionCodeRate} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> that receives the inner FEC rate.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_innerfecrate
     */
    get_InnerFECRate() {
        result := ComCall(11, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_InnerFECRate method sets the inner FEC rate.
     * @param {BinaryConvolutionCodeRate} FEC Specifies the inner FEC rate. This parameter is a value of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_innerfecrate
     */
    put_InnerFECRate(FEC) {
        result := ComCall(12, this, BinaryConvolutionCodeRate, FEC, "HRESULT")
        return result
    }

    /**
     * The get_OuterFEC method gets the type of outer FEC that is used.
     * @returns {FECMethod} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> that receives the type of outer FEC.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_outerfec
     */
    get_OuterFEC() {
        result := ComCall(13, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_OuterFEC method sets the type of outer FEC to use.
     * @param {FECMethod} FEC Specifies the outer FEC. This parameter is a value of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_outerfec
     */
    put_OuterFEC(FEC) {
        result := ComCall(14, this, FECMethod, FEC, "HRESULT")
        return result
    }

    /**
     * The get_OuterFECRate method gets the outer FEC rate.
     * @returns {BinaryConvolutionCodeRate} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> that receives the outer FEC rate.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_outerfecrate
     */
    get_OuterFECRate() {
        result := ComCall(15, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_OuterFECRate method sets the outer FEC rate.
     * @param {BinaryConvolutionCodeRate} FEC Specifies the outer FEC rate. This parameter is a value of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_outerfecrate
     */
    put_OuterFECRate(FEC) {
        result := ComCall(16, this, BinaryConvolutionCodeRate, FEC, "HRESULT")
        return result
    }

    /**
     * The get_Modulation method gets the modulation type.
     * @remarks
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ilocator-put_modulation">put_Modulation</a> for the definition of <b>ModulationType</b>.
     * @returns {ModulationType} Receives the modulation type, as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/modulationtype">ModulationType</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_modulation
     */
    get_Modulation() {
        result := ComCall(17, this, "int*", &Modulation := 0, "HRESULT")
        return Modulation
    }

    /**
     * The put_Modulation method sets the modulation type.
     * @param {ModulationType} Modulation The modulation type, as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/modulationtype">ModulationType</a> enumeration.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_modulation
     */
    put_Modulation(Modulation) {
        result := ComCall(18, this, ModulationType, Modulation, "HRESULT")
        return result
    }

    /**
     * The get_SymbolRate method gets the QPSK symbol rate.
     * @returns {Integer} Receives the QPSK symbol rate. The rate is expressed in symbols per second.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-get_symbolrate
     */
    get_SymbolRate() {
        result := ComCall(19, this, "int*", &Rate := 0, "HRESULT")
        return Rate
    }

    /**
     * The put_SymbolRate method sets the QPSK symbol rate.
     * @param {Integer} Rate Specifies the QPSK symbol rate. The rate is expressed in symbols per second.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-put_symbolrate
     */
    put_SymbolRate(Rate) {
        result := ComCall(20, this, "int", Rate, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a copy of the Locator.
     * @returns {ILocator} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ilocator">ILocator</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ilocator-clone
     */
    Clone() {
        result := ComCall(21, this, "ptr*", &NewLocator := 0, "HRESULT")
        return ILocator(NewLocator)
    }

    Query(iid) {
        if (ILocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CarrierFrequency := CallbackCreate(GetMethod(implObj, "get_CarrierFrequency"), flags, 2)
        this.vtbl.put_CarrierFrequency := CallbackCreate(GetMethod(implObj, "put_CarrierFrequency"), flags, 2)
        this.vtbl.get_InnerFEC := CallbackCreate(GetMethod(implObj, "get_InnerFEC"), flags, 2)
        this.vtbl.put_InnerFEC := CallbackCreate(GetMethod(implObj, "put_InnerFEC"), flags, 2)
        this.vtbl.get_InnerFECRate := CallbackCreate(GetMethod(implObj, "get_InnerFECRate"), flags, 2)
        this.vtbl.put_InnerFECRate := CallbackCreate(GetMethod(implObj, "put_InnerFECRate"), flags, 2)
        this.vtbl.get_OuterFEC := CallbackCreate(GetMethod(implObj, "get_OuterFEC"), flags, 2)
        this.vtbl.put_OuterFEC := CallbackCreate(GetMethod(implObj, "put_OuterFEC"), flags, 2)
        this.vtbl.get_OuterFECRate := CallbackCreate(GetMethod(implObj, "get_OuterFECRate"), flags, 2)
        this.vtbl.put_OuterFECRate := CallbackCreate(GetMethod(implObj, "put_OuterFECRate"), flags, 2)
        this.vtbl.get_Modulation := CallbackCreate(GetMethod(implObj, "get_Modulation"), flags, 2)
        this.vtbl.put_Modulation := CallbackCreate(GetMethod(implObj, "put_Modulation"), flags, 2)
        this.vtbl.get_SymbolRate := CallbackCreate(GetMethod(implObj, "get_SymbolRate"), flags, 2)
        this.vtbl.put_SymbolRate := CallbackCreate(GetMethod(implObj, "put_SymbolRate"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CarrierFrequency)
        CallbackFree(this.vtbl.put_CarrierFrequency)
        CallbackFree(this.vtbl.get_InnerFEC)
        CallbackFree(this.vtbl.put_InnerFEC)
        CallbackFree(this.vtbl.get_InnerFECRate)
        CallbackFree(this.vtbl.put_InnerFECRate)
        CallbackFree(this.vtbl.get_OuterFEC)
        CallbackFree(this.vtbl.put_OuterFEC)
        CallbackFree(this.vtbl.get_OuterFECRate)
        CallbackFree(this.vtbl.put_OuterFECRate)
        CallbackFree(this.vtbl.get_Modulation)
        CallbackFree(this.vtbl.put_Modulation)
        CallbackFree(this.vtbl.get_SymbolRate)
        CallbackFree(this.vtbl.put_SymbolRate)
        CallbackFree(this.vtbl.Clone)
    }
}
