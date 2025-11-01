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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_DisplayName", "get_Description", "get_UniqueID"]

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinitionvalue-get_name
     */
    get_Name(name) {
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} displayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinitionvalue-get_displayname
     */
    get_DisplayName(displayName) {
        result := ComCall(8, this, "ptr", displayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinitionvalue-get_description
     */
    get_Description(description) {
        result := ComCall(9, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} uniqueID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinitionvalue-get_uniqueid
     */
    get_UniqueID(uniqueID) {
        result := ComCall(10, this, "ptr", uniqueID, "HRESULT")
        return result
    }
}
