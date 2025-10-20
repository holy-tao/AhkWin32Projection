#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Contains properties that describe a classification property definition value.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpropertydefinitionvalue
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPropertyDefinitionValue extends IDispatch{
    /**
     * The interface identifier for IFsrmPropertyDefinitionValue
     * @type {Guid}
     */
    static IID => Guid("{e946d148-bd67-4178-8e22-1c44925ed710}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(7, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} displayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(displayName) {
        result := ComCall(8, this, "ptr", displayName, "int")
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
        result := ComCall(9, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} uniqueID 
     * @returns {HRESULT} 
     */
    get_UniqueID(uniqueID) {
        result := ComCall(10, this, "ptr", uniqueID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
