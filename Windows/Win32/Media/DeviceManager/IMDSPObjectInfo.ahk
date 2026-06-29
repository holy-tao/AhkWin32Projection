#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMDSPObjectInfo interface provides methods for getting and setting parameters that describe how playable objects on a storage medium are referenced or accessed by the IMDSPDeviceControl interface.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdspobjectinfo
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IMDSPObjectInfo extends IUnknown {
    /**
     * The interface identifier for IMDSPObjectInfo
     * @type {Guid}
     */
    static IID := Guid("{1dcb3a19-33ed-11d3-8470-00c04f79dbc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDSPObjectInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPlayLength          : IntPtr
        SetPlayLength          : IntPtr
        GetPlayOffset          : IntPtr
        SetPlayOffset          : IntPtr
        GetTotalLength         : IntPtr
        GetLastPlayPosition    : IntPtr
        GetLongestPlayPosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDSPObjectInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPlayLength method retrieves the play length of the object in units pertinent to the object. This is the remaining length that the object can play, not its total length.
     * @remarks
     * The value of the play length retrieved is either the total length of the object minus the current play position (if the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspobjectinfo-setplaylength">IMDSPObjectInfo::SetPlayLength</a> method has not been called), or the value set by <b>IMDSPObjectInfo::SetPlayLength</b> clipped to be no greater than the total play length of the object minus the current play position.
     * 
     * For playable files, the value returned is specified in milliseconds. The play length information can change either when the user starts playing a file on the media device or when an application invokes the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspdevicecontrol-play">IMDSPDeviceControl::Play</a> method.
     * 
     * For folders or file systems containing playable files, the value returned is in tracks or numbers of playable files in that folder or in the root of that file system.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the remaining play length of the object.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-getplaylength
     */
    GetPlayLength() {
        result := ComCall(3, this, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * The SetPlayLength method sets the play length of the object, in units pertinent to the object. This is the maximum length that the object plays regardless of its actual length.
     * @remarks
     * If the value passed in is greater than the total length of the object, it is clipped to the length of the object minus the object's current play position minus one unit.
     * 
     * For playable files, the value to set is specified in milliseconds. The value is clipped to no more than the total length of the file minus the object's current play offset position. The play position information can change either when the user starts playing a file on the media device or when an application invokes the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspdevicecontrol-play">IMDSPDeviceControl::Play</a> method.
     * 
     * For folders or file systems containing playable files, the value passed is the number of playable files in that folder or in the root of that file system.
     * @param {Integer} dwLength <b>DWORD</b> containing the play length to set for the object, in units pertinent to the object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-setplaylength
     */
    SetPlayLength(dwLength) {
        result := ComCall(4, this, "uint", dwLength, "HRESULT")
        return result
    }

    /**
     * The GetPlayOffset method retrieves the play offset of the object, in units pertinent to the object. This is the starting point for the next invocation of IMDSPDeviceControl::Play.
     * @remarks
     * The value retrieved is either zero (if the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspobjectinfo-setplayoffset">SetPlayOffset</a> method has not been called) or the value set by <b>SetPlayOffset</b> clipped to be no greater than the total play length of the object minus one unit.
     * 
     * For playable files, the value returned is specified in milliseconds. The play offset value does not change when the user starts playing a file on the media device or when an application invokes the <b>IMDSPDeviceControl::Play</b> method.
     * 
     * For folders or file systems containing playable files, the value returned indicates the first track that is played when an application invokes the <b>IMDSPDeviceControl::Play</b> method.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the play offset of the object, in units pertinent to the object.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-getplayoffset
     */
    GetPlayOffset() {
        result := ComCall(5, this, "uint*", &pdwOffset := 0, "HRESULT")
        return pdwOffset
    }

    /**
     * The SetPlayOffset method sets the play offset of the object, in the units pertinent to the object. This specifies the starting point for the next invocation of IMDSPDeviceControl::Play.
     * @remarks
     * If the value passed is greater than the total length of the object minus the current play length, it is clipped to the length of the object minus the play length.
     * 
     * For playable files, the value is specified in milliseconds. The play offset position value does not change when the user starts playing a file on the media device or when an application invokes the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspdevicecontrol-play">IMDSPDeviceControl::Play</a> method.
     * 
     * For folders or file systems containing playable files, the value indicates the first track that is played when an application invokes the <b>IMDSPDeviceControl::Play</b> method.
     * @param {Integer} dwOffset <b>DWORD</b> containing the play offset to set for the object, in units pertinent to the object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-setplayoffset
     */
    SetPlayOffset(dwOffset) {
        result := ComCall(6, this, "uint", dwOffset, "HRESULT")
        return result
    }

    /**
     * The GetTotalLength method retrieves the total play length of the object in units pertinent to the object. The value returned is the total length regardless of the current settings of the play length and offset.
     * @remarks
     * The value returned in the <i>pdwLength</i> parameter is the total length of the object regardless of the current settings of the play length and play offsets.
     * 
     * For playable files, the total length is specified in milliseconds.
     * 
     * For folders or file systems containing playable files, the value returned indicates the total number of playable files in a folder or in the root of a file system.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the total length of the object, in units pertinent to the object.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-gettotallength
     */
    GetTotalLength() {
        result := ComCall(7, this, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * The GetLastPlayPosition method retrieves the last play position of the object. The object must be a music file on the media device.
     * @remarks
     * The object must be an audio data file. For all other object types, this function returns E_INVALIDTYPE.
     * 
     * The last play position changes when either the user starts playing a file on the media device or when an application invokes the <b>IMDSPDeviceControl::Play</b> method.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the last play position of the object, in milliseconds.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-getlastplayposition
     */
    GetLastPlayPosition() {
        result := ComCall(8, this, "uint*", &pdwLastPos := 0, "HRESULT")
        return pdwLastPos
    }

    /**
     * The GetLongestPlayPosition method retrieves the longest play position of the object. The object must be a music file on the media device.
     * @remarks
     * The object must be an audio data file. For all other object types, this function returns E_INVALIDTYPE.
     * 
     * The last play position changes when either the user starts playing a file on the media device, or when an application invokes the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspdevicecontrol-play">IMDSPDeviceControl::Play</a> method and that play exceeds the position of the last longest play position.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the longest play position of the object, in milliseconds.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-getlongestplayposition
     */
    GetLongestPlayPosition() {
        result := ComCall(9, this, "uint*", &pdwLongestPos := 0, "HRESULT")
        return pdwLongestPos
    }

    Query(iid) {
        if (IMDSPObjectInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPlayLength := CallbackCreate(GetMethod(implObj, "GetPlayLength"), flags, 2)
        this.vtbl.SetPlayLength := CallbackCreate(GetMethod(implObj, "SetPlayLength"), flags, 2)
        this.vtbl.GetPlayOffset := CallbackCreate(GetMethod(implObj, "GetPlayOffset"), flags, 2)
        this.vtbl.SetPlayOffset := CallbackCreate(GetMethod(implObj, "SetPlayOffset"), flags, 2)
        this.vtbl.GetTotalLength := CallbackCreate(GetMethod(implObj, "GetTotalLength"), flags, 2)
        this.vtbl.GetLastPlayPosition := CallbackCreate(GetMethod(implObj, "GetLastPlayPosition"), flags, 2)
        this.vtbl.GetLongestPlayPosition := CallbackCreate(GetMethod(implObj, "GetLongestPlayPosition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPlayLength)
        CallbackFree(this.vtbl.SetPlayLength)
        CallbackFree(this.vtbl.GetPlayOffset)
        CallbackFree(this.vtbl.SetPlayOffset)
        CallbackFree(this.vtbl.GetTotalLength)
        CallbackFree(this.vtbl.GetLastPlayPosition)
        CallbackFree(this.vtbl.GetLongestPlayPosition)
    }
}
