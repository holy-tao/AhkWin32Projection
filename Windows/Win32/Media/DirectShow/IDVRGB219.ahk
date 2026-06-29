#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDVRGB219 interface controls the dynamic range in the DV Video Encoder and DV Video Decoder filters.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-idvrgb219
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDVRGB219 extends IUnknown {
    /**
     * The interface identifier for IDVRGB219
     * @type {Guid}
     */
    static IID := Guid("{58473a19-2bc8-4663-8012-25f81babddd1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVRGB219 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetRGB219 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVRGB219.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetRGB219 method controls the dynamic range for DV encoding and decoding.
     * @remarks
     * For the encoder, this method has no effect unless the input type is RGB-24. For the decoder, it has no effect unless the output type is RGB-24 or RGB-32.
     * @param {BOOL} bState Boolean value that specifies the filter's encoding or decoder behavior.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>TRUE</b></td>
     * <td>Enable RGB-219 mode.</td>
     * </tr>
     * <tr>
     * <td><b>FALSE</b></td>
     * <td>Disable RGB-219 mode. Use the default mode.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> failure code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvrgb219-setrgb219
     */
    SetRGB219(bState) {
        result := ComCall(3, this, BOOL, bState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVRGB219.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRGB219 := CallbackCreate(GetMethod(implObj, "SetRGB219"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRGB219)
    }
}
