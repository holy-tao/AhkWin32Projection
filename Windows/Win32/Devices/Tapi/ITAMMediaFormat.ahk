#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Media\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITAMMediaFormat interface (tapi3ds.h) sets and gets DirectShow media format.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nn-tapi3ds-itammediaformat
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAMMediaFormat extends IUnknown {
    /**
     * The interface identifier for ITAMMediaFormat
     * @type {Guid}
     */
    static IID := Guid("{0364eb00-4a77-11d1-a671-006097c9a2e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAMMediaFormat interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_MediaFormat : IntPtr
        put_MediaFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAMMediaFormat.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Pointer<AM_MEDIA_TYPE>} 
     */
    MediaFormat {
        get => this.get_MediaFormat()
        set => this.put_MediaFormat(value)
    }

    /**
     * The ITAMMediaFormat::get_MediaFormat method (tapi3ds.h) gets the media format.
     * @returns {Pointer<AM_MEDIA_TYPE>} Pointer to an array of 
     * <b>AM_MEDIA_TYPE</b> structures. For more information on <b>AM_MEDIA_TYPE</b>, see the DirectX documentation.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itammediaformat-get_mediaformat
     */
    get_MediaFormat() {
        result := ComCall(3, this, "ptr*", &ppmt := 0, "HRESULT")
        return ppmt
    }

    /**
     * The ITAMMediaFormat::put_MediaFormat method (tapi3ds.h) sets the media format.
     * @remarks
     * On addresses where a variety of formats are supported (such as Wave MSP addresses, which are used on most modems and voice boards), this call is mandatory or the terminal will not be able to connect.
     * 
     * For other addresses, such as those implemented over IP, the format may be fixed/predetermined. In that case, this call will fail if the format is not the same as the predetermined format. To retrieve such a predetermined format, an application can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nf-tapi3-itammediaformat-get_mediaformat">get_MediaFormat</a>.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to 
     * <b>AM_MEDIA_TYPE</b> structure. For more information on <b>AM_MEDIA_TYPE</b>, see the DirectX documentation.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itammediaformat-put_mediaformat
     */
    put_MediaFormat(pmt) {
        result := ComCall(4, this, AM_MEDIA_TYPE.Ptr, pmt, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITAMMediaFormat.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MediaFormat := CallbackCreate(GetMethod(implObj, "get_MediaFormat"), flags, 2)
        this.vtbl.put_MediaFormat := CallbackCreate(GetMethod(implObj, "put_MediaFormat"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MediaFormat)
        CallbackFree(this.vtbl.put_MediaFormat)
    }
}
