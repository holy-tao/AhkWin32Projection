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
     * 
     * @returns {HRESULT} 
     */
    BeginRead() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginWrite() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     */
    GetObjectName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(5, this, "ptr", pwszName, "uint", nMaxChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     */
    SetObjectName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "uint", nMaxChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     */
    GetObjectAttributes(pdwAttributes, pFormat) {
        result := ComCall(7, this, "uint*", pdwAttributes, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     */
    SetObjectAttributes(dwAttributes, pFormat) {
        result := ComCall(8, this, "uint", dwAttributes, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwSize 
     * @param {Pointer<UInt32>} pdwSizeHigh 
     * @returns {HRESULT} 
     */
    GetObjectTotalSize(pdwSize, pdwSizeHigh) {
        result := ComCall(9, this, "uint*", pdwSize, "uint*", pdwSizeHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @param {Integer} dwSizeHigh 
     * @returns {HRESULT} 
     */
    SetObjectTotalSize(dwSize, dwSizeHigh) {
        result := ComCall(10, this, "uint", dwSize, "uint", dwSizeHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pData 
     * @param {Pointer<UInt32>} pdwSize 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    TransferObjectData(pData, pdwSize, abMac) {
        result := ComCall(11, this, "char*", pData, "uint*", pdwSize, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phCompletionCode 
     * @param {Pointer<IUnknown>} pNewObject 
     * @returns {HRESULT} 
     */
    End(phCompletionCode, pNewObject) {
        result := ComCall(12, this, "ptr", phCompletionCode, "ptr", pNewObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
