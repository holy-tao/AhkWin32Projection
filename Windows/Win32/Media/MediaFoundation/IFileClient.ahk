#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IFileClient extends IUnknown{
    /**
     * The interface identifier for IFileClient
     * @type {Guid}
     */
    static IID => Guid("{bfccd196-1244-4840-ab44-480975c4ffe4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt64>} pqwSize 
     * @returns {HRESULT} 
     */
    GetObjectDiskSize(pqwSize) {
        result := ComCall(3, this, "uint*", pqwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileIo>} pFio 
     * @returns {HRESULT} 
     */
    Write(pFio) {
        result := ComCall(4, this, "ptr", pFio, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileIo>} pFio 
     * @returns {HRESULT} 
     */
    Read(pFio) {
        result := ComCall(5, this, "ptr", pFio, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
