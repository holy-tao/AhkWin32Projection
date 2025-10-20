#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IMsmError interface retrieves details about a single merge error.
 * @see https://docs.microsoft.com/windows/win32/api//mergemod/nn-mergemod-imsmerror
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmError extends IDispatch{
    /**
     * The interface identifier for IMsmError
     * @type {Guid}
     */
    static IID => Guid("{0adda828-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} ErrorType 
     * @returns {HRESULT} 
     */
    get_Type(ErrorType) {
        result := ComCall(7, this, "int*", ErrorType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ErrorPath 
     * @returns {HRESULT} 
     */
    get_Path(ErrorPath) {
        result := ComCall(8, this, "ptr", ErrorPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} ErrorLanguage 
     * @returns {HRESULT} 
     */
    get_Language(ErrorLanguage) {
        result := ComCall(9, this, "short*", ErrorLanguage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ErrorTable 
     * @returns {HRESULT} 
     */
    get_DatabaseTable(ErrorTable) {
        result := ComCall(10, this, "ptr", ErrorTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMsmStrings>} ErrorKeys 
     * @returns {HRESULT} 
     */
    get_DatabaseKeys(ErrorKeys) {
        result := ComCall(11, this, "ptr", ErrorKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ErrorTable 
     * @returns {HRESULT} 
     */
    get_ModuleTable(ErrorTable) {
        result := ComCall(12, this, "ptr", ErrorTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMsmStrings>} ErrorKeys 
     * @returns {HRESULT} 
     */
    get_ModuleKeys(ErrorKeys) {
        result := ComCall(13, this, "ptr", ErrorKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
