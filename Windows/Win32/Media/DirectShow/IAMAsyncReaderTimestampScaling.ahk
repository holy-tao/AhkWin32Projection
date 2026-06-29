#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a pull-mode source filter to support larger file sizes.
 * @remarks
 * In the pull model, the parser filter requests data from the source filter by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iasyncreader-request">IAsyncReader::Request</a>. The input to this method is a media sample. The time stamp on the sample specifies the location to read in the stream, as a byte offset.
 * 
 * By default, the time stamp uses the following formula: Time = byte offset × 10000000. This scaling factor limits the effective file size to about 860 GB. To support larger file sizes, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamasyncreadertimestampscaling-settimestampmode">SetTimestampMode</a> with the value <b>TRUE</b>. This call sets the scaling factor to 1, so the formula becomes: Time = byte offset.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamasyncreadertimestampscaling
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMAsyncReaderTimestampScaling extends IUnknown {
    /**
     * The interface identifier for IAMAsyncReaderTimestampScaling
     * @type {Guid}
     */
    static IID := Guid("{cf7b26fc-9a00-485b-8147-3e789d5e8f67}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMAsyncReaderTimestampScaling interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTimestampMode : IntPtr
        SetTimestampMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMAsyncReaderTimestampScaling.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the filter's time-stamping mode.
     * @returns {BOOL} Receives a Boolean value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Time stamps are in units of bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Time stamps are in units of bytes × 10000000. To get the offset in bytes, divide the sample time by 10000000.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamasyncreadertimestampscaling-gettimestampmode
     */
    GetTimestampMode() {
        result := ComCall(3, this, BOOL.Ptr, &pfRaw := 0, "HRESULT")
        return pfRaw
    }

    /**
     * Sets the filter's time-stamping mode.
     * @remarks
     * To support large files (greater than 850 GB), the downstream parser filter can call this method with the value <b>TRUE</b>. For backward compatibility, the default setting is <b>FALSE</b>. Call the method when the pins connect.
     * 
     * Applications should never call this method; doing so will cause the parser filter to misinterpret the time stamps.
     * @param {BOOL} fRaw Specifies the units for the source filter's time stamps.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Time stamps are in units of bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Time stamps are in units of bytes × 10000000. To get the offset in bytes, divide the sample time by 10000000.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The default value is <b>FALSE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamasyncreadertimestampscaling-settimestampmode
     */
    SetTimestampMode(fRaw) {
        result := ComCall(4, this, BOOL, fRaw, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMAsyncReaderTimestampScaling.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTimestampMode := CallbackCreate(GetMethod(implObj, "GetTimestampMode"), flags, 2)
        this.vtbl.SetTimestampMode := CallbackCreate(GetMethod(implObj, "SetTimestampMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTimestampMode)
        CallbackFree(this.vtbl.SetTimestampMode)
    }
}
