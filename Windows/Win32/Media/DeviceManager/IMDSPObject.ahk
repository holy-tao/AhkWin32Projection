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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Read", "Write", "Delete", "Seek", "Rename", "Move", "Close"]

    /**
     * 
     * @param {Integer} fuMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobject-open
     */
    Open(fuMode) {
        result := ComCall(3, this, "uint", fuMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Integer>} abMac 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobject-read
     */
    Read(pdwSize, abMac) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "char*", &pData := 0, pdwSizeMarshal, pdwSize, abMacMarshal, abMac, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobject-write
     */
    Write(pData, pdwSize, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pDataMarshal, pData, pdwSizeMarshal, pdwSize, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {IWMDMProgress} pProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobject-delete
     */
    Delete(fuMode, pProgress) {
        result := ComCall(6, this, "uint", fuMode, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fuFlags 
     * @param {Integer} dwOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobject-seek
     */
    Seek(fuFlags, dwOffset) {
        result := ComCall(7, this, "uint", fuFlags, "uint", dwOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszNewName 
     * @param {IWMDMProgress} pProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobject-rename
     */
    Rename(pwszNewName, pProgress) {
        pwszNewName := pwszNewName is String ? StrPtr(pwszNewName) : pwszNewName

        result := ComCall(8, this, "ptr", pwszNewName, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {IWMDMProgress} pProgress 
     * @param {IMDSPStorage} pTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobject-move
     */
    Move(fuMode, pProgress, pTarget) {
        result := ComCall(9, this, "uint", fuMode, "ptr", pProgress, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobject-close
     */
    Close() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
