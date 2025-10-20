#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Base interface containing properties common to both file and directory items.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifsiitem
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFsiItem extends IDispatch{
    /**
     * The interface identifier for IFsiItem
     * @type {Guid}
     */
    static IID => Guid("{2c941fd9-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Name(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_FullPath(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pVal 
     * @returns {HRESULT} 
     */
    get_CreationTime(pVal) {
        result := ComCall(9, this, "double*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} newVal 
     * @returns {HRESULT} 
     */
    put_CreationTime(newVal) {
        result := ComCall(10, this, "double", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pVal 
     * @returns {HRESULT} 
     */
    get_LastAccessedTime(pVal) {
        result := ComCall(11, this, "double*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} newVal 
     * @returns {HRESULT} 
     */
    put_LastAccessedTime(newVal) {
        result := ComCall(12, this, "double", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pVal 
     * @returns {HRESULT} 
     */
    get_LastModifiedTime(pVal) {
        result := ComCall(13, this, "double*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} newVal 
     * @returns {HRESULT} 
     */
    put_LastModifiedTime(newVal) {
        result := ComCall(14, this, "double", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_IsHidden(pVal) {
        result := ComCall(15, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_IsHidden(newVal) {
        result := ComCall(16, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fileSystem 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    FileSystemName(fileSystem, pVal) {
        result := ComCall(17, this, "int", fileSystem, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fileSystem 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    FileSystemPath(fileSystem, pVal) {
        result := ComCall(18, this, "int", fileSystem, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
