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
     * 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-getplaylength
     */
    GetPlayLength(pdwLength) {
        result := ComCall(3, this, "uint*", pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-setplaylength
     */
    SetPlayLength(dwLength) {
        result := ComCall(4, this, "uint", dwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-getplayoffset
     */
    GetPlayOffset(pdwOffset) {
        result := ComCall(5, this, "uint*", pdwOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-setplayoffset
     */
    SetPlayOffset(dwOffset) {
        result := ComCall(6, this, "uint", dwOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-gettotallength
     */
    GetTotalLength(pdwLength) {
        result := ComCall(7, this, "uint*", pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLastPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-getlastplayposition
     */
    GetLastPlayPosition(pdwLastPos) {
        result := ComCall(8, this, "uint*", pdwLastPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLongestPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobjectinfo-getlongestplayposition
     */
    GetLongestPlayPosition(pdwLongestPos) {
        result := ComCall(9, this, "uint*", pdwLongestPos, "HRESULT")
        return result
    }
}
