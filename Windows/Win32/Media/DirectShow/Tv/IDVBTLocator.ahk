#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\GuardInterval.ahk" { GuardInterval }
#Import "..\FECMethod.ahk" { FECMethod }
#Import "..\HierarchyAlpha.ahk" { HierarchyAlpha }
#Import "..\BinaryConvolutionCodeRate.ahk" { BinaryConvolutionCodeRate }
#Import "..\TransmissionMode.ahk" { TransmissionMode }
#Import ".\IDigitalLocator.ahk" { IDigitalLocator }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IDVBTLocator interface is implemented on the DVBTLocator object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBTLocator)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idvbtlocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVBTLocator extends IDigitalLocator {
    /**
     * The interface identifier for IDVBTLocator
     * @type {Guid}
     */
    static IID := Guid("{8664da16-dda2-42ac-926a-c18f9127c302}")

    /**
     * The class identifier for DVBTLocator
     * @type {Guid}
     */
    static CLSID := Guid("{9cd64701-bdf3-4d14-8e03-f12983d86664}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVBTLocator interfaces
    */
    struct Vtbl extends IDigitalLocator.Vtbl {
        get_Bandwidth           : IntPtr
        put_Bandwidth           : IntPtr
        get_LPInnerFEC          : IntPtr
        put_LPInnerFEC          : IntPtr
        get_LPInnerFECRate      : IntPtr
        put_LPInnerFECRate      : IntPtr
        get_HAlpha              : IntPtr
        put_HAlpha              : IntPtr
        get_Guard               : IntPtr
        put_Guard               : IntPtr
        get_Mode                : IntPtr
        put_Mode                : IntPtr
        get_OtherFrequencyInUse : IntPtr
        put_OtherFrequencyInUse : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVBTLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Bandwidth {
        get => this.get_Bandwidth()
        set => this.put_Bandwidth(value)
    }

    /**
     * @type {FECMethod} 
     */
    LPInnerFEC {
        get => this.get_LPInnerFEC()
        set => this.put_LPInnerFEC(value)
    }

    /**
     * @type {BinaryConvolutionCodeRate} 
     */
    LPInnerFECRate {
        get => this.get_LPInnerFECRate()
        set => this.put_LPInnerFECRate(value)
    }

    /**
     * @type {HierarchyAlpha} 
     */
    HAlpha {
        get => this.get_HAlpha()
        set => this.put_HAlpha(value)
    }

    /**
     * @type {GuardInterval} 
     */
    Guard {
        get => this.get_Guard()
        set => this.put_Guard(value)
    }

    /**
     * @type {TransmissionMode} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    OtherFrequencyInUse {
        get => this.get_OtherFrequencyInUse()
        set => this.put_OtherFrequencyInUse(value)
    }

    /**
     * The get_Bandwidth method retrieves the bandwidth of the frequency.
     * @remarks
     * The bandwidth is determined by the bandwidth field in the DVB terrestrial delivery system descriptor, as defined in EN 300 468. Valid values are 7 or 8.
     * @returns {Integer} Receives the bandwidth, in megahertz (MHz).
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_bandwidth
     */
    get_Bandwidth() {
        result := ComCall(22, this, "int*", &BandWidthVal := 0, "HRESULT")
        return BandWidthVal
    }

    /**
     * The put_BandWidth method sets the bandwidth of the frequency.
     * @param {Integer} BandwidthVal Specifies the bandwidth, in megahertz (MHz). The value should be taken from the bandwidth field in the terrestrial delivery system descriptor.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_bandwidth
     */
    put_Bandwidth(BandwidthVal) {
        result := ComCall(23, this, "int", BandwidthVal, "HRESULT")
        return result
    }

    /**
     * The get_LPInnerFEC method retrieves the inner FEC type of the low-priority stream.
     * @returns {FECMethod} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_lpinnerfec
     */
    get_LPInnerFEC() {
        result := ComCall(24, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_LPInnerFEC method sets the inner FEC type of the low-priority stream.
     * @param {FECMethod} FEC Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> that specifies the FEC type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_lpinnerfec
     */
    put_LPInnerFEC(FEC) {
        result := ComCall(25, this, FECMethod, FEC, "HRESULT")
        return result
    }

    /**
     * The get_LPInnerFECRate method retrieves the inner FEC rate of the low-priority stream.
     * @returns {BinaryConvolutionCodeRate} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_lpinnerfecrate
     */
    get_LPInnerFECRate() {
        result := ComCall(26, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_LPInnerFECRate method sets the inner FEC rate of the low-priority stream.
     * @param {BinaryConvolutionCodeRate} FEC Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> that specifies the rate.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_lpinnerfecrate
     */
    put_LPInnerFECRate(FEC) {
        result := ComCall(27, this, BinaryConvolutionCodeRate, FEC, "HRESULT")
        return result
    }

    /**
     * The get_HAlpha method retrieves the hierarchy alpha.
     * @returns {HierarchyAlpha} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/hierarchyalpha">HierarchyAlpha</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_halpha
     */
    get_HAlpha() {
        result := ComCall(28, this, "int*", &Alpha := 0, "HRESULT")
        return Alpha
    }

    /**
     * The put_HAlpha method sets the hierarchy alpha.
     * @param {HierarchyAlpha} Alpha Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/hierarchyalpha">HierarchyAlpha</a> that specifies the hierarchy alpha.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_halpha
     */
    put_HAlpha(Alpha) {
        result := ComCall(29, this, HierarchyAlpha, Alpha, "HRESULT")
        return result
    }

    /**
     * The get_Guard method retrieves the guard interval.
     * @returns {GuardInterval} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/guardinterval">GuardInterval</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_guard
     */
    get_Guard() {
        result := ComCall(30, this, "int*", &GI := 0, "HRESULT")
        return GI
    }

    /**
     * The put_Guard method sets the guard interval.
     * @param {GuardInterval} GI Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/guardinterval">GuardInterval</a> that specifies the guard interval.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_guard
     */
    put_Guard(GI) {
        result := ComCall(31, this, GuardInterval, GI, "HRESULT")
        return result
    }

    /**
     * The get_Mode method receives the transmission mode.
     * @returns {TransmissionMode} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/transmissionmode">TransmissionMode</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_mode
     */
    get_Mode() {
        result := ComCall(32, this, "int*", &_mode := 0, "HRESULT")
        return _mode
    }

    /**
     * The put_Mode method sets the transmission mode.
     * @param {TransmissionMode} _mode Specifies the transmission mode as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/transmissionmode">TransmissionMode</a> enumeration.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_mode
     */
    put_Mode(_mode) {
        result := ComCall(33, this, TransmissionMode, _mode, "HRESULT")
        return result
    }

    /**
     * The get_OtherFrequencyInUse method indicates whether the frequency is being used by another DVB-T broadcaster.
     * @returns {VARIANT_BOOL} Receives that value VARIANT_TRUE if the frequency is being used by another DVB-T broadcaster, or VARIANT_FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-get_otherfrequencyinuse
     */
    get_OtherFrequencyInUse() {
        result := ComCall(34, this, VARIANT_BOOL.Ptr, &OtherFrequencyInUseVal := 0, "HRESULT")
        return OtherFrequencyInUseVal
    }

    /**
     * The put_OtherFrequencyInUse method specifies whether the frequency is being used by another DVB-T broadcaster.
     * @param {VARIANT_BOOL} OtherFrequencyInUseVal Specify VARIANT_TRUE if the frequency is being used by another DVB-T broadcaster, or VARIANT_FALSE otherwise.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtlocator-put_otherfrequencyinuse
     */
    put_OtherFrequencyInUse(OtherFrequencyInUseVal) {
        result := ComCall(35, this, VARIANT_BOOL, OtherFrequencyInUseVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVBTLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Bandwidth := CallbackCreate(GetMethod(implObj, "get_Bandwidth"), flags, 2)
        this.vtbl.put_Bandwidth := CallbackCreate(GetMethod(implObj, "put_Bandwidth"), flags, 2)
        this.vtbl.get_LPInnerFEC := CallbackCreate(GetMethod(implObj, "get_LPInnerFEC"), flags, 2)
        this.vtbl.put_LPInnerFEC := CallbackCreate(GetMethod(implObj, "put_LPInnerFEC"), flags, 2)
        this.vtbl.get_LPInnerFECRate := CallbackCreate(GetMethod(implObj, "get_LPInnerFECRate"), flags, 2)
        this.vtbl.put_LPInnerFECRate := CallbackCreate(GetMethod(implObj, "put_LPInnerFECRate"), flags, 2)
        this.vtbl.get_HAlpha := CallbackCreate(GetMethod(implObj, "get_HAlpha"), flags, 2)
        this.vtbl.put_HAlpha := CallbackCreate(GetMethod(implObj, "put_HAlpha"), flags, 2)
        this.vtbl.get_Guard := CallbackCreate(GetMethod(implObj, "get_Guard"), flags, 2)
        this.vtbl.put_Guard := CallbackCreate(GetMethod(implObj, "put_Guard"), flags, 2)
        this.vtbl.get_Mode := CallbackCreate(GetMethod(implObj, "get_Mode"), flags, 2)
        this.vtbl.put_Mode := CallbackCreate(GetMethod(implObj, "put_Mode"), flags, 2)
        this.vtbl.get_OtherFrequencyInUse := CallbackCreate(GetMethod(implObj, "get_OtherFrequencyInUse"), flags, 2)
        this.vtbl.put_OtherFrequencyInUse := CallbackCreate(GetMethod(implObj, "put_OtherFrequencyInUse"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Bandwidth)
        CallbackFree(this.vtbl.put_Bandwidth)
        CallbackFree(this.vtbl.get_LPInnerFEC)
        CallbackFree(this.vtbl.put_LPInnerFEC)
        CallbackFree(this.vtbl.get_LPInnerFECRate)
        CallbackFree(this.vtbl.put_LPInnerFECRate)
        CallbackFree(this.vtbl.get_HAlpha)
        CallbackFree(this.vtbl.put_HAlpha)
        CallbackFree(this.vtbl.get_Guard)
        CallbackFree(this.vtbl.put_Guard)
        CallbackFree(this.vtbl.get_Mode)
        CallbackFree(this.vtbl.put_Mode)
        CallbackFree(this.vtbl.get_OtherFrequencyInUse)
        CallbackFree(this.vtbl.put_OtherFrequencyInUse)
    }
}
