#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ModulationType.ahk" { ModulationType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FECMethod.ahk" { FECMethod }
#Import ".\SpectralInversion.ahk" { SpectralInversion }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\BinaryConvolutionCodeRate.ahk" { BinaryConvolutionCodeRate }

/**
 * The IBDA_DigitalDemodulator interface is exposed on BDA device filters, specifically demodulators, that are not capable of automatically detecting the characteristics of a signal.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DigitalDemodulator)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_digitaldemodulator
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_DigitalDemodulator extends IUnknown {
    /**
     * The interface identifier for IBDA_DigitalDemodulator
     * @type {Guid}
     */
    static IID := Guid("{ef30f379-985b-4d10-b640-a79d5e04e1e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_DigitalDemodulator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_ModulationType    : IntPtr
        get_ModulationType    : IntPtr
        put_InnerFECMethod    : IntPtr
        get_InnerFECMethod    : IntPtr
        put_InnerFECRate      : IntPtr
        get_InnerFECRate      : IntPtr
        put_OuterFECMethod    : IntPtr
        get_OuterFECMethod    : IntPtr
        put_OuterFECRate      : IntPtr
        get_OuterFECRate      : IntPtr
        put_SymbolRate        : IntPtr
        get_SymbolRate        : IntPtr
        put_SpectralInversion : IntPtr
        get_SpectralInversion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_DigitalDemodulator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ModulationType} 
     */
    ModulationType {
        get => this.get_ModulationType()
        set => this.put_ModulationType(value)
    }

    /**
     * @type {FECMethod} 
     */
    InnerFECMethod {
        get => this.get_InnerFECMethod()
        set => this.put_InnerFECMethod(value)
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
    OuterFECMethod {
        get => this.get_OuterFECMethod()
        set => this.put_OuterFECMethod(value)
    }

    /**
     * @type {BinaryConvolutionCodeRate} 
     */
    OuterFECRate {
        get => this.get_OuterFECRate()
        set => this.put_OuterFECRate(value)
    }

    /**
     * @type {Integer} 
     */
    SymbolRate {
        get => this.get_SymbolRate()
        set => this.put_SymbolRate(value)
    }

    /**
     * @type {SpectralInversion} 
     */
    SpectralInversion {
        get => this.get_SpectralInversion()
        set => this.put_SpectralInversion(value)
    }

    /**
     * The put_ModulationType method specifies the modulation type for the signal.
     * @param {Pointer<ModulationType>} pModulationType Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/modulationtype">ModulationType</a> variable that specifies the modulation type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_modulationtype
     */
    put_ModulationType(pModulationType) {
        pModulationTypeMarshal := pModulationType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pModulationTypeMarshal, pModulationType, "HRESULT")
        return result
    }

    /**
     * The get_ModulationType method retrieves the modulation type for the signal.
     * @param {Pointer<ModulationType>} pModulationType Pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/modulationtype">ModulationType</a> variable indicating the modulation type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_modulationtype
     */
    get_ModulationType(pModulationType) {
        pModulationTypeMarshal := pModulationType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pModulationTypeMarshal, pModulationType, "HRESULT")
        return result
    }

    /**
     * The put_InnerFECMethod method specifies the inner forward error correction method for the signal.
     * @param {Pointer<FECMethod>} pFECMethod Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> variable that specifies the inner forward error correction method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_innerfecmethod
     */
    put_InnerFECMethod(pFECMethod) {
        pFECMethodMarshal := pFECMethod is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pFECMethodMarshal, pFECMethod, "HRESULT")
        return result
    }

    /**
     * The get_InnerFECMethod method retrieves the inner forward error correction method.
     * @param {Pointer<FECMethod>} pFECMethod Pointer that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_innerfecmethod
     */
    get_InnerFECMethod(pFECMethod) {
        pFECMethodMarshal := pFECMethod is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pFECMethodMarshal, pFECMethod, "HRESULT")
        return result
    }

    /**
     * The put_InnerFECRate method specifies the inner forward error correction rate.
     * @param {Pointer<BinaryConvolutionCodeRate>} pFECRate Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> variable that specifies the inner FEC rate.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_innerfecrate
     */
    put_InnerFECRate(pFECRate) {
        pFECRateMarshal := pFECRate is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pFECRateMarshal, pFECRate, "HRESULT")
        return result
    }

    /**
     * The get_InnerFECRate method retrieves the inner forward error correction rate being used on the signal.
     * @param {Pointer<BinaryConvolutionCodeRate>} pFECRate Pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> variable that indicates the rate.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_innerfecrate
     */
    get_InnerFECRate(pFECRate) {
        pFECRateMarshal := pFECRate is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pFECRateMarshal, pFECRate, "HRESULT")
        return result
    }

    /**
     * The put_OuterFECMethod method specifies the outer forward error correction method for the signal.
     * @param {Pointer<FECMethod>} pFECMethod Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_outerfecmethod
     */
    put_OuterFECMethod(pFECMethod) {
        pFECMethodMarshal := pFECMethod is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pFECMethodMarshal, pFECMethod, "HRESULT")
        return result
    }

    /**
     * The get_OuterFECMethod method retrieves the outer forward error correction method for the signal .
     * @param {Pointer<FECMethod>} pFECMethod Pointer that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> variable that indicates the FEC method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_outerfecmethod
     */
    get_OuterFECMethod(pFECMethod) {
        pFECMethodMarshal := pFECMethod is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pFECMethodMarshal, pFECMethod, "HRESULT")
        return result
    }

    /**
     * The put_OuterFECRate method specifies the outer forward error correction rate for the signal.
     * @param {Pointer<BinaryConvolutionCodeRate>} pFECRate Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> variable that specifies the FEC rate.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_outerfecrate
     */
    put_OuterFECRate(pFECRate) {
        pFECRateMarshal := pFECRate is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pFECRateMarshal, pFECRate, "HRESULT")
        return result
    }

    /**
     * The get_OuterFECRate method retrieves the outer forward error correction rate for the signal.
     * @param {Pointer<BinaryConvolutionCodeRate>} pFECRate Pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> variable that indicates the rate.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_outerfecrate
     */
    get_OuterFECRate(pFECRate) {
        pFECRateMarshal := pFECRate is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pFECRateMarshal, pFECRate, "HRESULT")
        return result
    }

    /**
     * The put_SymbolRate method specifies the symbol rate for the signal.
     * @param {Pointer<Integer>} pSymbolRate Pointer to a ULONG that specifies the symbol rate.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_symbolrate
     */
    put_SymbolRate(pSymbolRate) {
        pSymbolRateMarshal := pSymbolRate is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pSymbolRateMarshal, pSymbolRate, "HRESULT")
        return result
    }

    /**
     * The get_SymbolRate method retrieves the symbol rate for the signal.
     * @param {Pointer<Integer>} pSymbolRate Pointer that receives the symbol rate.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_symbolrate
     */
    get_SymbolRate(pSymbolRate) {
        pSymbolRateMarshal := pSymbolRate is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pSymbolRateMarshal, pSymbolRate, "HRESULT")
        return result
    }

    /**
     * The put_SpectralInversion method specifies the spectral inversion value for the signal.
     * @param {Pointer<SpectralInversion>} pSpectralInversion Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/spectralinversion">SpectralInversion</a> variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-put_spectralinversion
     */
    put_SpectralInversion(pSpectralInversion) {
        pSpectralInversionMarshal := pSpectralInversion is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pSpectralInversionMarshal, pSpectralInversion, "HRESULT")
        return result
    }

    /**
     * The get_SpectralInversion method retrieves the spectral inversion value for the signal.
     * @remarks
     * For more information, see <b>KSPROPERTY_BDA_SPECTRAL_INVERSION</b> in the Windows DDK.
     * @param {Pointer<SpectralInversion>} pSpectralInversion Pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/spectralinversion">SpectralInversion</a> variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_digitaldemodulator-get_spectralinversion
     */
    get_SpectralInversion(pSpectralInversion) {
        pSpectralInversionMarshal := pSpectralInversion is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pSpectralInversionMarshal, pSpectralInversion, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_DigitalDemodulator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_ModulationType := CallbackCreate(GetMethod(implObj, "put_ModulationType"), flags, 2)
        this.vtbl.get_ModulationType := CallbackCreate(GetMethod(implObj, "get_ModulationType"), flags, 2)
        this.vtbl.put_InnerFECMethod := CallbackCreate(GetMethod(implObj, "put_InnerFECMethod"), flags, 2)
        this.vtbl.get_InnerFECMethod := CallbackCreate(GetMethod(implObj, "get_InnerFECMethod"), flags, 2)
        this.vtbl.put_InnerFECRate := CallbackCreate(GetMethod(implObj, "put_InnerFECRate"), flags, 2)
        this.vtbl.get_InnerFECRate := CallbackCreate(GetMethod(implObj, "get_InnerFECRate"), flags, 2)
        this.vtbl.put_OuterFECMethod := CallbackCreate(GetMethod(implObj, "put_OuterFECMethod"), flags, 2)
        this.vtbl.get_OuterFECMethod := CallbackCreate(GetMethod(implObj, "get_OuterFECMethod"), flags, 2)
        this.vtbl.put_OuterFECRate := CallbackCreate(GetMethod(implObj, "put_OuterFECRate"), flags, 2)
        this.vtbl.get_OuterFECRate := CallbackCreate(GetMethod(implObj, "get_OuterFECRate"), flags, 2)
        this.vtbl.put_SymbolRate := CallbackCreate(GetMethod(implObj, "put_SymbolRate"), flags, 2)
        this.vtbl.get_SymbolRate := CallbackCreate(GetMethod(implObj, "get_SymbolRate"), flags, 2)
        this.vtbl.put_SpectralInversion := CallbackCreate(GetMethod(implObj, "put_SpectralInversion"), flags, 2)
        this.vtbl.get_SpectralInversion := CallbackCreate(GetMethod(implObj, "get_SpectralInversion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_ModulationType)
        CallbackFree(this.vtbl.get_ModulationType)
        CallbackFree(this.vtbl.put_InnerFECMethod)
        CallbackFree(this.vtbl.get_InnerFECMethod)
        CallbackFree(this.vtbl.put_InnerFECRate)
        CallbackFree(this.vtbl.get_InnerFECRate)
        CallbackFree(this.vtbl.put_OuterFECMethod)
        CallbackFree(this.vtbl.get_OuterFECMethod)
        CallbackFree(this.vtbl.put_OuterFECRate)
        CallbackFree(this.vtbl.get_OuterFECRate)
        CallbackFree(this.vtbl.put_SymbolRate)
        CallbackFree(this.vtbl.get_SymbolRate)
        CallbackFree(this.vtbl.put_SpectralInversion)
        CallbackFree(this.vtbl.get_SpectralInversion)
    }
}
