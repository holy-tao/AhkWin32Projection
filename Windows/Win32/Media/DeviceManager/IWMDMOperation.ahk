#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This optional, application-implemented IWMDMOperation interface allows the application to control how data is read from or written to the computer during a file transfer.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmoperation
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMOperation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMOperation
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a0b-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginRead", "BeginWrite", "GetObjectName", "SetObjectName", "GetObjectAttributes", "SetObjectAttributes", "GetObjectTotalSize", "SetObjectTotalSize", "TransferObjectData", "End"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation-beginread
     */
    BeginRead() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation-beginwrite
     */
    BeginWrite() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation-getobjectname
     */
    GetObjectName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(5, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation-setobjectname
     */
    SetObjectName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation-getobjectattributes
     */
    GetObjectAttributes(pdwAttributes, pFormat) {
        result := ComCall(7, this, "uint*", pdwAttributes, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation-setobjectattributes
     */
    SetObjectAttributes(dwAttributes, pFormat) {
        result := ComCall(8, this, "uint", dwAttributes, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Integer>} pdwSizeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation-getobjecttotalsize
     */
    GetObjectTotalSize(pdwSize, pdwSizeHigh) {
        result := ComCall(9, this, "uint*", pdwSize, "uint*", pdwSizeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @param {Integer} dwSizeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation-setobjecttotalsize
     */
    SetObjectTotalSize(dwSize, dwSizeHigh) {
        result := ComCall(10, this, "uint", dwSize, "uint", dwSizeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation-transferobjectdata
     */
    TransferObjectData(pData, pdwSize, abMac) {
        result := ComCall(11, this, "char*", pData, "uint*", pdwSize, "char*", abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phCompletionCode 
     * @param {IUnknown} pNewObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation-end
     */
    End(phCompletionCode, pNewObject) {
        result := ComCall(12, this, "ptr", phCompletionCode, "ptr", pNewObject, "HRESULT")
        return result
    }
}
