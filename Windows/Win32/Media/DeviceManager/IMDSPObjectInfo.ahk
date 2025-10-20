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
     * 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetPlayLength(pdwLength) {
        result := ComCall(3, this, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLength 
     * @returns {HRESULT} 
     */
    SetPlayLength(dwLength) {
        result := ComCall(4, this, "uint", dwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwOffset 
     * @returns {HRESULT} 
     */
    GetPlayOffset(pdwOffset) {
        result := ComCall(5, this, "uint*", pdwOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOffset 
     * @returns {HRESULT} 
     */
    SetPlayOffset(dwOffset) {
        result := ComCall(6, this, "uint", dwOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetTotalLength(pdwLength) {
        result := ComCall(7, this, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwLastPos 
     * @returns {HRESULT} 
     */
    GetLastPlayPosition(pdwLastPos) {
        result := ComCall(8, this, "uint*", pdwLastPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwLongestPos 
     * @returns {HRESULT} 
     */
    GetLongestPlayPosition(pdwLongestPos) {
        result := ComCall(9, this, "uint*", pdwLongestPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
