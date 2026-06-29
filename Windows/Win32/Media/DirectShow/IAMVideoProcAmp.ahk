#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMVideoProcAmp interface adjusts the qualities of an incoming video signal, such as brightness, contrast, hue, saturation, gamma, and sharpness.The WDM Video Capture filter exposes this interface if the hardware supports image adjustment.
 * @remarks
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-videoprocamp">PROPSETID_VIDCAP_VIDEOPROCAMP</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamvideoprocamp
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMVideoProcAmp extends IUnknown {
    /**
     * The interface identifier for IAMVideoProcAmp
     * @type {Guid}
     */
    static IID := Guid("{c6e13360-30ac-11d0-a18c-00a0c9118956}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMVideoProcAmp interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRange : IntPtr
        Set      : IntPtr
        Get      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMVideoProcAmp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetRange method gets the range and default value of a specified video property.
     * @param {Integer} _Property Specifies the property to query, as a value from the [VideoProcAmpProperty](/windows/desktop/api/strmif/ne-strmif-videoprocampproperty) enumeration.
     * @param {Pointer<Integer>} pMin Receives the minimum value of the property.
     * @param {Pointer<Integer>} pMax Receives the maximum value of the property.
     * @param {Pointer<Integer>} pSteppingDelta Receives the step size for the property. The step size is the smallest increment by which the property can change.
     * @param {Pointer<Integer>} pDefault Receives the default value of the property.
     * @param {Pointer<Integer>} pCapsFlags Receives a member of the [VideoProcAmpFlags](/windows/desktop/api/strmif/ne-strmif-videoprocampflags) enumeration, indicating whether the property is controlled automatically or manually.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PROP_ID_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support this property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideoprocamp-getrange
     */
    GetRange(_Property, pMin, pMax, pSteppingDelta, pDefault, pCapsFlags) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagsMarshal := pCapsFlags is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", _Property, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagsMarshal, pCapsFlags, "HRESULT")
        return result
    }

    /**
     * The Set method sets video quality for a specified property.
     * @remarks
     * If the <i>pCapsFlags</i> parameter is <b>VideoProcAmp_Flags_Auto</b>, the <i>lValue</i> parameter is ignored.
     * @param {Integer} _Property The property to set, specified as a [VideoProcAmpProperty](/windows/desktop/api/strmif/ne-strmif-videoprocampproperty) enumeration value.
     * @param {Integer} lValue The new value of the property.
     * @param {Integer} Flags The desired control setting, specified as a [VideoProcAmpFlags](/windows/desktop/api/strmif/ne-strmif-videoprocampflags) enumeration
     *           value.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideoprocamp-set
     */
    Set(_Property, lValue, Flags) {
        result := ComCall(4, this, "int", _Property, "int", lValue, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The Get method gets the current setting of a video property.
     * @param {Integer} _Property Specifies the property to retrieve, as a value from the [VideoProcAmpProperty](/windows/desktop/api/strmif/ne-strmif-videoprocampproperty) enumeration.
     * @param {Pointer<Integer>} lValue Receives the value of the property.
     * @param {Pointer<Integer>} Flags Receives a member of the [VideoProcAmpFlags](/windows/desktop/api/strmif/ne-strmif-videoprocampflags) enumeration. The returned value indicates whether the setting is controlled manually or automatically.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideoprocamp-get
     */
    Get(_Property, lValue, Flags) {
        lValueMarshal := lValue is VarRef ? "int*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int", _Property, lValueMarshal, lValue, FlagsMarshal, Flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMVideoProcAmp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRange := CallbackCreate(GetMethod(implObj, "GetRange"), flags, 7)
        this.vtbl.Set := CallbackCreate(GetMethod(implObj, "Set"), flags, 4)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRange)
        CallbackFree(this.vtbl.Set)
        CallbackFree(this.vtbl.Get)
    }
}
