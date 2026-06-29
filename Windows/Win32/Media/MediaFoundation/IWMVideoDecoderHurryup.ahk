#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls the speed of the video decoder.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-iwmvideodecoderhurryup
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMVideoDecoderHurryup extends IUnknown {
    /**
     * The interface identifier for IWMVideoDecoderHurryup
     * @type {Guid}
     */
    static IID := Guid("{352bb3bd-2d4d-4323-9e71-dcdcfbd53ca6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMVideoDecoderHurryup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetHurryup : IntPtr
        GetHurryup : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMVideoDecoderHurryup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the speed mode of the video decoder.
     * @param {Integer} lHurryup The speed mode of the video decoder.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1 (default)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will determine the decoding speed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will decode in real time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1 to 4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will decode faster than real time. The higher the value, the faster the decoding.
     * 
     * </td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmvideodecoderhurryup-sethurryup
     */
    SetHurryup(lHurryup) {
        result := ComCall(3, this, "int", lHurryup, "HRESULT")
        return result
    }

    /**
     * Retrieves the current speed mode of the video decoder.
     * @param {Pointer<Integer>} plHurryup Address of a variable that receives the decoder speed mode.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1 (default)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will determine the decoding speed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will decode in real time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1 to 4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will decode faster than real time.
     * 
     * </td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmvideodecoderhurryup-gethurryup
     */
    GetHurryup(plHurryup) {
        plHurryupMarshal := plHurryup is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plHurryupMarshal, plHurryup, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMVideoDecoderHurryup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetHurryup := CallbackCreate(GetMethod(implObj, "SetHurryup"), flags, 2)
        this.vtbl.GetHurryup := CallbackCreate(GetMethod(implObj, "GetHurryup"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetHurryup)
        CallbackFree(this.vtbl.GetHurryup)
    }
}
