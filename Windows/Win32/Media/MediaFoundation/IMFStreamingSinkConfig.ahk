#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Passes configuration information to the media sinks that are used for streaming the content.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfstreamingsinkconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFStreamingSinkConfig extends IUnknown {
    /**
     * The interface identifier for IMFStreamingSinkConfig
     * @type {Guid}
     */
    static IID := Guid("{9db7aa41-3cc5-40d4-8509-555804ad34cc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFStreamingSinkConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartStreaming : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFStreamingSinkConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the streaming media client before the Media Session starts streaming to specify the byte offset or the time offset.
     * @param {BOOL} fSeekOffsetIsByteOffset A Boolean value that specifies whether <i>qwSeekOffset</i> gives a byte offset of a time offset.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>qwSeekOffset</i> parameter specifies a byte offset.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>qwSeekOffset</i> parameter specifies the time position in 100-nanosecond units.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} qwSeekOffset A byte offset or a time offset, depending on the value passed in <i>fSeekOffsetIsByteOffset</i>.  Time offsets are specified in
     *     100-nanosecond units.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamingsinkconfig-startstreaming
     */
    StartStreaming(fSeekOffsetIsByteOffset, qwSeekOffset) {
        result := ComCall(3, this, BOOL, fSeekOffsetIsByteOffset, "uint", qwSeekOffset, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFStreamingSinkConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartStreaming := CallbackCreate(GetMethod(implObj, "StartStreaming"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartStreaming)
    }
}
