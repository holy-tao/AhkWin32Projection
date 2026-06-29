#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMReaderTimecode interface provides access to information about SMPTE (Society of Motion Picture and Television Engineers) time code ranges.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmreadertimecode
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMReaderTimecode extends IUnknown {
    /**
     * The interface identifier for IWMReaderTimecode
     * @type {Guid}
     */
    static IID := Guid("{f369e2f0-e081-4fe6-8450-b810b2f410d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMReaderTimecode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTimecodeRangeCount  : IntPtr
        GetTimecodeRangeBounds : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMReaderTimecode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetTimecodeRangeCount method retrieves the total number of SMTPE time code ranges in a specified stream.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. This stream must be indexed by time code.
     * @returns {Integer} Pointer to a <b>WORD</b> containing the number of ranges. If this parameter is 0 on method return, no SMPTE ranges exist in the stream.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadertimecode-gettimecoderangecount
     */
    GetTimecodeRangeCount(wStreamNum) {
        result := ComCall(3, this, "ushort", wStreamNum, "ushort*", &pwRangeCount := 0, "HRESULT")
        return pwRangeCount
    }

    /**
     * The GetTimecodeRangeBounds method retrieves the starting and ending time codes for a specified SMPTE time code range.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {Integer} wRangeNum <b>WORD</b> containing the range number.
     * @param {Pointer<Integer>} pStartTimecode Pointer to a <b>DWORD</b> containing the first time code in the range.
     * @param {Pointer<Integer>} pEndTimecode Pointer to a <b>DWORD</b> containing the last time code in the range.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadertimecode-gettimecoderangebounds
     */
    GetTimecodeRangeBounds(wStreamNum, wRangeNum, pStartTimecode, pEndTimecode) {
        pStartTimecodeMarshal := pStartTimecode is VarRef ? "uint*" : "ptr"
        pEndTimecodeMarshal := pEndTimecode is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ushort", wStreamNum, "ushort", wRangeNum, pStartTimecodeMarshal, pStartTimecode, pEndTimecodeMarshal, pEndTimecode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMReaderTimecode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTimecodeRangeCount := CallbackCreate(GetMethod(implObj, "GetTimecodeRangeCount"), flags, 3)
        this.vtbl.GetTimecodeRangeBounds := CallbackCreate(GetMethod(implObj, "GetTimecodeRangeBounds"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTimecodeRangeCount)
        CallbackFree(this.vtbl.GetTimecodeRangeBounds)
    }
}
