#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides methods for registering and unregistering component category information in the registry. This includes both the human-readable names of categories and the categories implemented/required by a given component or class.
 * @see https://docs.microsoft.com/windows/win32/api//comcat/nn-comcat-icatregister
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ICatRegister extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICatRegister
     * @type {Guid}
     */
    static IID => Guid("{0002e012-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterCategories", "UnRegisterCategories", "RegisterClassImplCategories", "UnRegisterClassImplCategories", "RegisterClassReqCategories", "UnRegisterClassReqCategories"]

    /**
     * 
     * @param {Integer} cCategories 
     * @param {Pointer<CATEGORYINFO>} rgCategoryInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-registercategories
     */
    RegisterCategories(cCategories, rgCategoryInfo) {
        result := ComCall(3, this, "uint", cCategories, "ptr", rgCategoryInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCategories 
     * @param {Pointer<Guid>} rgcatid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-unregistercategories
     */
    UnRegisterCategories(cCategories, rgcatid) {
        result := ComCall(4, this, "uint", cCategories, "ptr", rgcatid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} cCategories 
     * @param {Pointer<Guid>} rgcatid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-registerclassimplcategories
     */
    RegisterClassImplCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(5, this, "ptr", rclsid, "uint", cCategories, "ptr", rgcatid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} cCategories 
     * @param {Pointer<Guid>} rgcatid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-unregisterclassimplcategories
     */
    UnRegisterClassImplCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(6, this, "ptr", rclsid, "uint", cCategories, "ptr", rgcatid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} cCategories 
     * @param {Pointer<Guid>} rgcatid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-registerclassreqcategories
     */
    RegisterClassReqCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(7, this, "ptr", rclsid, "uint", cCategories, "ptr", rgcatid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} cCategories 
     * @param {Pointer<Guid>} rgcatid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-unregisterclassreqcategories
     */
    UnRegisterClassReqCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(8, this, "ptr", rclsid, "uint", cCategories, "ptr", rgcatid, "HRESULT")
        return result
    }
}
