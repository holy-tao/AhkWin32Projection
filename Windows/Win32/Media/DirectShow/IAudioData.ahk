#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMemoryData.ahk" { IMemoryData }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * Note  This interface is deprecated.
 * @see https://learn.microsoft.com/windows/win32/api/austream/nn-austream-iaudiodata
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAudioData extends IMemoryData {
    /**
     * The interface identifier for IAudioData
     * @type {Guid}
     */
    static IID := Guid("{54c719c0-af60-11d0-8212-00c04fc32c45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioData interfaces
    */
    struct Vtbl extends IMemoryData.Vtbl {
        GetFormat : IntPtr
        SetFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetFormat method retrieves the current data format.
     * @remarks
     * Currently, Microsoft DirectShow supports only PCM wave data.
     * @returns {WAVEFORMATEX} Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that contains the current data format.
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiodata-getformat
     */
    GetFormat() {
        pWaveFormatCurrent := WAVEFORMATEX()
        result := ComCall(6, this, WAVEFORMATEX.Ptr, pWaveFormatCurrent, "HRESULT")
        return pWaveFormatCurrent
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetFormat method sets the current data format.
     * @param {Pointer<WAVEFORMATEX>} lpWaveFormat Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that will contain the current data format.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value, which can include the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer argument.
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
     * Invalid format.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiodata-setformat
     */
    SetFormat(lpWaveFormat) {
        result := ComCall(7, this, WAVEFORMATEX.Ptr, lpWaveFormat, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 2)
        this.vtbl.SetFormat := CallbackCreate(GetMethod(implObj, "SetFormat"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFormat)
        CallbackFree(this.vtbl.SetFormat)
    }
}
