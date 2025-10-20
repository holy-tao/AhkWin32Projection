#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MenuItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for MenuItem
     * @type {Guid}
     */
    static IID => Guid("{0178fad1-b361-4b27-96ad-67c57ebf2e1d}")

    /**
     * The class identifier for MenuItem
     * @type {Guid}
     */
    static CLSID => Guid("{0178fad1-b361-4b27-96ad-67c57ebf2e1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "get_LanguageIndependentName", "get_Path", "get_LanguageIndependentPath", "Execute", "get_Enabled"]

    /**
     * 
     * @param {Pointer<BSTR>} DisplayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(DisplayName) {
        result := ComCall(7, this, "ptr", DisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} LanguageIndependentName 
     * @returns {HRESULT} 
     */
    get_LanguageIndependentName(LanguageIndependentName) {
        result := ComCall(8, this, "ptr", LanguageIndependentName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Path 
     * @returns {HRESULT} 
     */
    get_Path(Path) {
        result := ComCall(9, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} LanguageIndependentPath 
     * @returns {HRESULT} 
     */
    get_LanguageIndependentPath(LanguageIndependentPath) {
        result := ComCall(10, this, "ptr", LanguageIndependentPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Execute() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} Enabled 
     * @returns {HRESULT} 
     */
    get_Enabled(Enabled) {
        result := ComCall(12, this, "ptr", Enabled, "HRESULT")
        return result
    }
}
