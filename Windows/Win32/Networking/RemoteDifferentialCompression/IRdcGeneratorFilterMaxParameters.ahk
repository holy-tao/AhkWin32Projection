#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sets and retrieves parameters used by the FilterMax generator.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-irdcgeneratorfiltermaxparameters
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct IRdcGeneratorFilterMaxParameters extends IUnknown {
    /**
     * The interface identifier for IRdcGeneratorFilterMaxParameters
     * @type {Guid}
     */
    static IID := Guid("{96236a72-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcGeneratorFilterMaxParameters
     * @type {Guid}
     */
    static CLSID := Guid("{96236a87-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRdcGeneratorFilterMaxParameters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHorizonSize    : IntPtr
        SetHorizonSize    : IntPtr
        GetHashWindowSize : IntPtr
        SetHashWindowSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRdcGeneratorFilterMaxParameters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the horizon size�the length over which the FilterMax generator looks for local maxima.
     * @returns {Integer} Address of a <b>ULONG</b> that will receive the length in bytes of the horizon size. 
     *       The valid range is from <b>MSRDC_MINIMUM_HORIZONSIZE</b> to 
     *       <b>MSRDC_MAXIMUM_HORIZONSIZE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-gethorizonsize
     */
    GetHorizonSize() {
        result := ComCall(3, this, "uint*", &horizonSize := 0, "HRESULT")
        return horizonSize
    }

    /**
     * Sets the horizon size�the length over which the FilterMax generator looks for local maxima.
     * @param {Integer} horizonSize Specifies the length in bytes of the horizon size. 
     *       The valid range is from <b>MSRDC_MINIMUM_HORIZONSIZE</b> to 
     *       <b>MSRDC_MAXIMUM_HORIZONSIZE</b>. If this parameter is not set then a suitable default will 
     *       be used.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-sethorizonsize
     */
    SetHorizonSize(horizonSize) {
        result := ComCall(4, this, "uint", horizonSize, "HRESULT")
        return result
    }

    /**
     * Returns the hash window size�the size of the sliding window used by the FilterMax generator for computing the hash used in the local maxima calculations.
     * @returns {Integer} Address of a <b>ULONG</b> that will receive the length in bytes of the hash window 
     *       size. The valid range is from <b>MSRDC_MINIMUM_HASHWINDOWSIZE</b> to 
     *       <b>MSRDC_MAXIMUM_HASHWINDOWSIZE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-gethashwindowsize
     */
    GetHashWindowSize() {
        result := ComCall(5, this, "uint*", &hashWindowSize := 0, "HRESULT")
        return hashWindowSize
    }

    /**
     * Sets the hash window size�the size of the sliding window used by the FilterMax generator for computing the hash used in the local maxima calculations.
     * @param {Integer} hashWindowSize The length in bytes of the hash window size. The valid range is from 
     *       <b>MSRDC_MINIMUM_HASHWINDOWSIZE</b> to 
     *       <b>MSRDC_MAXIMUM_HASHWINDOWSIZE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-sethashwindowsize
     */
    SetHashWindowSize(hashWindowSize) {
        result := ComCall(6, this, "uint", hashWindowSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRdcGeneratorFilterMaxParameters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHorizonSize := CallbackCreate(GetMethod(implObj, "GetHorizonSize"), flags, 2)
        this.vtbl.SetHorizonSize := CallbackCreate(GetMethod(implObj, "SetHorizonSize"), flags, 2)
        this.vtbl.GetHashWindowSize := CallbackCreate(GetMethod(implObj, "GetHashWindowSize"), flags, 2)
        this.vtbl.SetHashWindowSize := CallbackCreate(GetMethod(implObj, "SetHashWindowSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHorizonSize)
        CallbackFree(this.vtbl.SetHorizonSize)
        CallbackFree(this.vtbl.GetHashWindowSize)
        CallbackFree(this.vtbl.SetHashWindowSize)
    }
}
