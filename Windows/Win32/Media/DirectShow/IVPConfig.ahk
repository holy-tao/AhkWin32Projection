#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVPBaseConfig.ahk" { IVPBaseConfig }
#Import ".\AMVPSIZE.ahk" { AMVPSIZE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The IVPConfig interface must be implemented by any filter that wraps a hardware decoder with a video port.
 * @remarks
 * Include Dvp.h and Vptype.h before Vpconfig.h.
 * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nn-vpconfig-ivpconfig
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVPConfig extends IVPBaseConfig {
    /**
     * The interface identifier for IVPConfig
     * @type {Guid}
     */
    static IID := Guid("{bc29a660-30e3-11d0-9e69-00c04fd7c15b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVPConfig interfaces
    */
    struct Vtbl extends IVPBaseConfig.Vtbl {
        IsVPDecimationAllowed : IntPtr
        SetScalingFactors     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVPConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IsVPDecimationAllowed method, given the context, retrieves whether scaling at the video port is possible.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter uses this function to determine whether the driver needs the mixer to decimate video data at its own discretion. This function can be especially useful in a capture with preview situation in which you would not want the VP mixer filter to perform any scaling at the video port.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Pointer<BOOL>} pbIsDecimationAllowed Receives a Boolean value indicating whether decimation is possible.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpconfig-isvpdecimationallowed
     */
    IsVPDecimationAllowed(pbIsDecimationAllowed) {
        pbIsDecimationAllowedMarshal := pbIsDecimationAllowed is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pbIsDecimationAllowedMarshal, pbIsDecimationAllowed, "HRESULT")
        return result
    }

    /**
     * The SetScalingFactors method sets the factors by which the decoder should scale the video stream.
     * @remarks
     * If the decoder does not support the specified scaling factors, then it sets the values to the nearest factors it can support.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Pointer<AMVPSIZE>} pamvpSize Pointer to the new scaling size structure (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vptype/ns-vptype-amvpsize">AMVPSIZE</a>) to use to specify the width and height.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpconfig-setscalingfactors
     */
    SetScalingFactors(pamvpSize) {
        result := ComCall(17, this, AMVPSIZE.Ptr, pamvpSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVPConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsVPDecimationAllowed := CallbackCreate(GetMethod(implObj, "IsVPDecimationAllowed"), flags, 2)
        this.vtbl.SetScalingFactors := CallbackCreate(GetMethod(implObj, "SetScalingFactors"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsVPDecimationAllowed)
        CallbackFree(this.vtbl.SetScalingFactors)
    }
}
