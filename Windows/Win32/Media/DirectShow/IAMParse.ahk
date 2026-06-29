#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMParse interface sets and retrieves the parse time for an MPEG-2 stream.
 * @see https://learn.microsoft.com/windows/win32/api/amparse/nn-amparse-iamparse
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMParse extends IUnknown {
    /**
     * The interface identifier for IAMParse
     * @type {Guid}
     */
    static IID := Guid("{c47a3420-005c-11d2-9038-00a0c9697298}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMParse interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetParseTime : IntPtr
        SetParseTime : IntPtr
        Flush        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMParse.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetParseTime method retrieves the current stream parse time. For MPEG-2, this corresponds to the system clock time computed for the current stream position.
     * @remarks
     * The parse time for the MPEG-2 Splitter filter is the current stream position in system clock units. The initial value of the parse time is zero.
     * @returns {Integer} Pointer to the current parse time.
     * @see https://learn.microsoft.com/windows/win32/api/amparse/nf-amparse-iamparse-getparsetime
     */
    GetParseTime() {
        result := ComCall(3, this, "int64*", &prtCurrent := 0, "HRESULT")
        return prtCurrent
    }

    /**
     * The SetParseTime method sets the current stream parse time. For MPEG-2, this corresponds to the system clock time computed for the current stream position.
     * @remarks
     * The parse time for the MPEG-2 Splitter filter is the current stream position in system clock units. The initial value of the parse time is zero.
     * @param {Integer} rtCurrent Current stream parse time.
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
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parse time is not available, because the input pin is not connected
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/amparse/nf-amparse-iamparse-setparsetime
     */
    SetParseTime(rtCurrent) {
        result := ComCall(4, this, "int64", rtCurrent, "HRESULT")
        return result
    }

    /**
     * The Flush method clears the current file data to allow for a more rapid switch to a new file.
     * @remarks
     * Although this method can make transitions much more immediate, it can also make them appear less seamless.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amparse/nf-amparse-iamparse-flush
     */
    Flush() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMParse.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParseTime := CallbackCreate(GetMethod(implObj, "GetParseTime"), flags, 2)
        this.vtbl.SetParseTime := CallbackCreate(GetMethod(implObj, "SetParseTime"), flags, 2)
        this.vtbl.Flush := CallbackCreate(GetMethod(implObj, "Flush"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParseTime)
        CallbackFree(this.vtbl.SetParseTime)
        CallbackFree(this.vtbl.Flush)
    }
}
