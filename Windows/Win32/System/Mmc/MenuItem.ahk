#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MenuItem extends IDispatch{
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
     * 
     * @param {Pointer<BSTR>} DisplayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(DisplayName) {
        result := ComCall(7, this, "ptr", DisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} LanguageIndependentName 
     * @returns {HRESULT} 
     */
    get_LanguageIndependentName(LanguageIndependentName) {
        result := ComCall(8, this, "ptr", LanguageIndependentName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Path 
     * @returns {HRESULT} 
     */
    get_Path(Path) {
        result := ComCall(9, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} LanguageIndependentPath 
     * @returns {HRESULT} 
     */
    get_LanguageIndependentPath(LanguageIndependentPath) {
        result := ComCall(10, this, "ptr", LanguageIndependentPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Execute() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} Enabled 
     * @returns {HRESULT} 
     */
    get_Enabled(Enabled) {
        result := ComCall(12, this, "ptr", Enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
