#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Base class for all FSRM objects.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmobject
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmObject extends IDispatch{
    /**
     * The interface identifier for IFsrmObject
     * @type {Guid}
     */
    static IID => Guid("{22bcef93-4a3f-4183-89f9-2f8b8a628aee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Guid>} id 
     * @returns {HRESULT} 
     */
    get_Id(id) {
        result := ComCall(7, this, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     */
    get_Description(description) {
        result := ComCall(8, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(9, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
