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
     * @type {Integer} 
     */
    Bandwidth {
        get => this.get_Bandwidth()
        set => this.put_Bandwidth(value)
    }

    /**
     * @type {Integer} 
     */
    LPInnerFEC {
        get => this.get_LPInnerFEC()
        set => this.put_LPInnerFEC(value)
    }

    /**
     * @type {Integer} 
     */
    LPInnerFECRate {
        get => this.get_LPInnerFECRate()
        set => this.put_LPInnerFECRate(value)
    }

    /**
     * @type {Integer} 
     */
    HAlpha {
        get => this.get_HAlpha()
        set => this.put_HAlpha(value)
    }

    /**
     * @type {Integer} 
     */
    Guard {
        get => this.get_Guard()
        set => this.put_Guard(value)
    }

    /**
     * @type {Integer} 
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
     * @returns {Integer} Receives the bandwidth, in megahertz (MHz).
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-get_bandwidth
     */
    get_Bandwidth() {
        result := ComCall(22, this, "int*", &BandWidthVal := 0, "HRESULT")
        return BandWidthVal
    }

    /**
     * The put_BandWidth method sets the bandwidth of the frequency.
     * @param {Integer} BandwidthVal Specifies the bandwidth, in megahertz (MHz). The value should be taken from the bandwidth field in the terrestrial delivery system descriptor.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-put_bandwidth
     */
    put_Bandwidth(BandwidthVal) {
        result := ComCall(23, this, "int", BandwidthVal, "HRESULT")
        return result
    }

    /**
     * The get_LPInnerFEC method retrieves the inner FEC type of the low-priority stream.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-get_lpinnerfec
     */
    get_LPInnerFEC() {
        result := ComCall(24, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_LPInnerFEC method sets the inner FEC type of the low-priority stream.
     * @param {Integer} FEC Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/fecmethod">FECMethod</a> that specifies the FEC type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-put_lpinnerfec
     */
    put_LPInnerFEC(FEC) {
        result := ComCall(25, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * The get_LPInnerFECRate method retrieves the inner FEC rate of the low-priority stream.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-get_lpinnerfecrate
     */
    get_LPInnerFECRate() {
        result := ComCall(26, this, "int*", &FEC := 0, "HRESULT")
        return FEC
    }

    /**
     * The put_LPInnerFECRate method sets the inner FEC rate of the low-priority stream.
     * @param {Integer} FEC Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/binaryconvolutioncoderate">BinaryConvolutionCodeRate</a> that specifies the rate.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-put_lpinnerfecrate
     */
    put_LPInnerFECRate(FEC) {
        result := ComCall(27, this, "int", FEC, "HRESULT")
        return result
    }

    /**
     * The get_HAlpha method retrieves the hierarchy alpha.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/hierarchyalpha">HierarchyAlpha</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-get_halpha
     */
    get_HAlpha() {
        result := ComCall(28, this, "int*", &Alpha := 0, "HRESULT")
        return Alpha
    }

    /**
     * The put_HAlpha method sets the hierarchy alpha.
     * @param {Integer} Alpha Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/hierarchyalpha">HierarchyAlpha</a> that specifies the hierarchy alpha.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-put_halpha
     */
    put_HAlpha(Alpha) {
        result := ComCall(29, this, "int", Alpha, "HRESULT")
        return result
    }

    /**
     * The get_Guard method retrieves the guard interval.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/guardinterval">GuardInterval</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-get_guard
     */
    get_Guard() {
        result := ComCall(30, this, "int*", &GI := 0, "HRESULT")
        return GI
    }

    /**
     * The put_Guard method sets the guard interval.
     * @param {Integer} GI Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/guardinterval">GuardInterval</a> that specifies the guard interval.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-put_guard
     */
    put_Guard(GI) {
        result := ComCall(31, this, "int", GI, "HRESULT")
        return result
    }

    /**
     * The get_Mode method receives the transmission mode.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/transmissionmode">TransmissionMode</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-get_mode
     */
    get_Mode() {
        result := ComCall(32, this, "int*", &mode := 0, "HRESULT")
        return mode
    }

    /**
     * The put_Mode method sets the transmission mode.
     * @param {Integer} mode Specifies the transmission mode as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/transmissionmode">TransmissionMode</a> enumeration.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-put_mode
     */
    put_Mode(mode) {
        result := ComCall(33, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * The get_OtherFrequencyInUse method indicates whether the frequency is being used by another DVB-T broadcaster.
     * @returns {VARIANT_BOOL} Receives that value VARIANT_TRUE if the frequency is being used by another DVB-T broadcaster, or VARIANT_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-get_otherfrequencyinuse
     */
    get_OtherFrequencyInUse() {
        result := ComCall(34, this, "short*", &OtherFrequencyInUseVal := 0, "HRESULT")
        return OtherFrequencyInUseVal
    }

    /**
     * The put_OtherFrequencyInUse method specifies whether the frequency is being used by another DVB-T broadcaster.
     * @param {VARIANT_BOOL} OtherFrequencyInUseVal Specify VARIANT_TRUE if the frequency is being used by another DVB-T broadcaster, or VARIANT_FALSE otherwise.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator-put_otherfrequencyinuse
     */
    put_OtherFrequencyInUse(OtherFrequencyInUseVal) {
        result := ComCall(35, this, "short", OtherFrequencyInUseVal, "HRESULT")
        return result
    }
}
