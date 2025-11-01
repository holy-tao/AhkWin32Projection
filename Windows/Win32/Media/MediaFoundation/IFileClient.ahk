#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IFileClient extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectDiskSize", "Write", "Read"]

    /**
     * 
     * @param {Pointer<Integer>} pqwSize 
     * @returns {HRESULT} 
     */
    GetObjectDiskSize(pqwSize) {
        result := ComCall(3, this, "uint*", pqwSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFileIo} pFio 
     * @returns {HRESULT} 
     */
    Write(pFio) {
        result := ComCall(4, this, "ptr", pFio, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFileIo} pFio 
     * @returns {HRESULT} 
     */
    Read(pFio) {
        result := ComCall(5, this, "ptr", pFio, "HRESULT")
        return result
    }
}
