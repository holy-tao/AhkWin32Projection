#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPObject interface manages the transfer of data to and from storage media.The Open, Read, Write, and Close methods are valid only if the storage object is a file.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspobject
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPObject extends IUnknown{
    /**
     * The interface identifier for IMDSPObject
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a18-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} fuMode 
     * @returns {HRESULT} 
     */
    Open(fuMode) {
        result := ComCall(3, this, "uint", fuMode, "int")
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
    Read(pData, pdwSize, abMac) {
        result := ComCall(4, this, "char*", pData, "uint*", pdwSize, "char*", abMac, "int")
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
    Write(pData, pdwSize, abMac) {
        result := ComCall(5, this, "char*", pData, "uint*", pdwSize, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {Pointer<IWMDMProgress>} pProgress 
     * @returns {HRESULT} 
     */
    Delete(fuMode, pProgress) {
        result := ComCall(6, this, "uint", fuMode, "ptr", pProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fuFlags 
     * @param {Integer} dwOffset 
     * @returns {HRESULT} 
     */
    Seek(fuFlags, dwOffset) {
        result := ComCall(7, this, "uint", fuFlags, "uint", dwOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszNewName 
     * @param {Pointer<IWMDMProgress>} pProgress 
     * @returns {HRESULT} 
     */
    Rename(pwszNewName, pProgress) {
        pwszNewName := pwszNewName is String ? StrPtr(pwszNewName) : pwszNewName

        result := ComCall(8, this, "ptr", pwszNewName, "ptr", pProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {Pointer<IWMDMProgress>} pProgress 
     * @param {Pointer<IMDSPStorage>} pTarget 
     * @returns {HRESULT} 
     */
    Move(fuMode, pProgress, pTarget) {
        result := ComCall(9, this, "uint", fuMode, "ptr", pProgress, "ptr", pTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
