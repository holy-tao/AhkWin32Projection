#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPObjectInfo interface provides methods for getting and setting parameters that describe how playable objects on a storage medium are referenced or accessed by the IMDSPDeviceControl interface.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspobjectinfo
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPObjectInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPObjectInfo
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a19-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPlayLength", "SetPlayLength", "GetPlayOffset", "SetPlayOffset", "GetTotalLength", "GetLastPlayPosition", "GetLongestPlayPosition"]

    /**
     * The GetPlayLength method retrieves the play length of the object in units pertinent to the object. This is the remaining length that the object can play, not its total length.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the remaining play length of the object.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobjectinfo-getplaylength
     */
    GetPlayLength() {
        result := ComCall(3, this, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * The SetPlayLength method sets the play length of the object, in units pertinent to the object. This is the maximum length that the object plays regardless of its actual length.
     * @param {Integer} dwLength <b>DWORD</b> containing the play length to set for the object, in units pertinent to the object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobjectinfo-setplaylength
     */
    SetPlayLength(dwLength) {
        result := ComCall(4, this, "uint", dwLength, "HRESULT")
        return result
    }

    /**
     * The GetPlayOffset method retrieves the play offset of the object, in units pertinent to the object. This is the starting point for the next invocation of IMDSPDeviceControl::Play.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the play offset of the object, in units pertinent to the object.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobjectinfo-getplayoffset
     */
    GetPlayOffset() {
        result := ComCall(5, this, "uint*", &pdwOffset := 0, "HRESULT")
        return pdwOffset
    }

    /**
     * The SetPlayOffset method sets the play offset of the object, in the units pertinent to the object. This specifies the starting point for the next invocation of IMDSPDeviceControl::Play.
     * @param {Integer} dwOffset <b>DWORD</b> containing the play offset to set for the object, in units pertinent to the object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobjectinfo-setplayoffset
     */
    SetPlayOffset(dwOffset) {
        result := ComCall(6, this, "uint", dwOffset, "HRESULT")
        return result
    }

    /**
     * The GetTotalLength method retrieves the total play length of the object in units pertinent to the object. The value returned is the total length regardless of the current settings of the play length and offset.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the total length of the object, in units pertinent to the object.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobjectinfo-gettotallength
     */
    GetTotalLength() {
        result := ComCall(7, this, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * The GetLastPlayPosition method retrieves the last play position of the object. The object must be a music file on the media device.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the last play position of the object, in milliseconds.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobjectinfo-getlastplayposition
     */
    GetLastPlayPosition() {
        result := ComCall(8, this, "uint*", &pdwLastPos := 0, "HRESULT")
        return pdwLastPos
    }

    /**
     * The GetLongestPlayPosition method retrieves the longest play position of the object. The object must be a music file on the media device.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the longest play position of the object, in milliseconds.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobjectinfo-getlongestplayposition
     */
    GetLongestPlayPosition() {
        result := ComCall(9, this, "uint*", &pdwLongestPos := 0, "HRESULT")
        return pdwLongestPos
    }
}
