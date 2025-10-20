#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IMsmDependency interface retrieves details for a single module dependency.
 * @see https://docs.microsoft.com/windows/win32/api//mergemod/nn-mergemod-imsmdependency
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmDependency extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMsmDependency
     * @type {Guid}
     */
    static IID => Guid("{0adda82b-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Module", "get_Language", "get_Version"]

    /**
     * 
     * @param {Pointer<BSTR>} Module 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmdependency-get_module
     */
    get_Module(Module) {
        result := ComCall(7, this, "ptr", Module, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Language 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmdependency-get_language
     */
    get_Language(Language) {
        result := ComCall(8, this, "short*", Language, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Version 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmdependency-get_version
     */
    get_Version(Version) {
        result := ComCall(9, this, "ptr", Version, "HRESULT")
        return result
    }
}
