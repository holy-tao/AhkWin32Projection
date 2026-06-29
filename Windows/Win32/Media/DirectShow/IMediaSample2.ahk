#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMediaSample.ahk" { IMediaSample }

/**
 * The IMediaSample2 interface sets and retrieves properties on media samples.This interface inherits the IMediaSample interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-imediasample2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMediaSample2 extends IMediaSample {
    /**
     * The interface identifier for IMediaSample2
     * @type {Guid}
     */
    static IID := Guid("{36b73884-c2c8-11cf-8b46-00805f6cef60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaSample2 interfaces
    */
    struct Vtbl extends IMediaSample.Vtbl {
        GetProperties : IntPtr
        SetProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaSample2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetProperties method retrieves the properties of a media sample.
     * @remarks
     * The retrieved data conforms to the format of the [AM_SAMPLE2_PROPERTIES](/windows/win32/api/strmif/ns-strmif-am_sample2_properties) structure. You can retrieve a subset of the sample properties by setting <i>cbProperties</i> to a value less than the size of the <b>AM_SAMPLE2_PROPERTIES</b> structure.
     * 
     * For efficiency, the <b>pMediaType</b> member returned in <b>AM_SAMPLE2_PROPERTIES</b> is a pointer to the data stored in the media sample, not a copy of that data. The pointer may become invalid after the sample is passed to another filter, or after the input pin's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imeminputpin-receive">IMemInputPin::Receive</a> method has completed. Also, do not free the pointer or delete the media type.
     * @param {Integer} cbProperties Length of property data to retrieve, in bytes.
     * @param {Integer} pbProperties Pointer to a buffer of size <i>cbProperties</i>.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample2-getproperties
     */
    GetProperties(cbProperties, pbProperties) {
        result := ComCall(19, this, "uint", cbProperties, "ptr", pbProperties, "HRESULT")
        return result
    }

    /**
     * The SetProperties method sets the properties of a media sample.
     * @remarks
     * The data contained in [AM_SAMPLE2_PROPERTIES](/windows/win32/api/strmif/ns-strmif-am_sample2_properties) structure. You can specify a subset of the sample properties by setting <i>cbProperties</i> to a value less than the size of the <b>AM_SAMPLE2_PROPERTIES</b> structure.
     * 
     * The standard implementation of this method does not support updating [AM_SAMPLE2_PROPERTIES](/windows/win32/api/strmif/ns-strmif-am_sample2_properties) structure. If these members are not equal to zero, the method returns <b>E_INVALIDARG</b>. To modify the data contained in the sample's memory buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediasample-getpointer">IMediaSample::GetPointer</a>.
     * @param {Integer} cbProperties Length of property data to set, in bytes.
     * @param {Integer} pbProperties Pointer to a buffer of size <i>cbProperties</i>.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample2-setproperties
     */
    SetProperties(cbProperties, pbProperties) {
        result := ComCall(20, this, "uint", cbProperties, "ptr", pbProperties, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMediaSample2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 3)
        this.vtbl.SetProperties := CallbackCreate(GetMethod(implObj, "SetProperties"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.SetProperties)
    }
}
