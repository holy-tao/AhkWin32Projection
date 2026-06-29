#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sets properties on the audio resampler DSP.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-iwmresamplerprops
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMResamplerProps extends IUnknown {
    /**
     * The interface identifier for IWMResamplerProps
     * @type {Guid}
     */
    static IID := Guid("{e7e9984f-f09f-4da4-903f-6e2e0efe56b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMResamplerProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetHalfFilterLength : IntPtr
        SetUserChannelMtx   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMResamplerProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the quality of the output.
     * @remarks
     * This method is equivalent to setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-wmresamp-filterquality">MFPKEY_WMRESAMP_FILTERQUALITY</a> property.
     * @param {Integer} lhalfFilterLen Specifies the quality of the output. The valid range is 1 to 60, inclusive.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresamplerprops-sethalffilterlength
     */
    SetHalfFilterLength(lhalfFilterLen) {
        result := ComCall(3, this, "int", lhalfFilterLen, "HRESULT")
        return result
    }

    /**
     * Specifies the channel matrix.
     * @remarks
     * This method is equivalent to setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-wmresamp-channelmtx">MFPKEY_WMRESAMP_CHANNELMTX</a> property, except that the matrix is represented differently:
     * 
     * <ul>
     * <li>Values are floating point.</li>
     * <li>The matrix is transposed.</li>
     * </ul>
     * To convert from the integer values given in the MFPKEY_WMRESAMP_CHANNELMTX property to floating-point values, use the following formula:
     * 
     * <c>(float)pow(10.0,((double)Coeff)/(65536.0*20.0))</c>
     * 
     * where <i>Coeff</i> is an integer coefficient.
     * @param {Pointer<Float>} userChannelMtx Pointer to an array of floating-point values that represents a channel conversion matrix.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresamplerprops-setuserchannelmtx
     */
    SetUserChannelMtx(userChannelMtx) {
        userChannelMtxMarshal := userChannelMtx is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, userChannelMtxMarshal, userChannelMtx, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMResamplerProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetHalfFilterLength := CallbackCreate(GetMethod(implObj, "SetHalfFilterLength"), flags, 2)
        this.vtbl.SetUserChannelMtx := CallbackCreate(GetMethod(implObj, "SetUserChannelMtx"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetHalfFilterLength)
        CallbackFree(this.vtbl.SetUserChannelMtx)
    }
}
