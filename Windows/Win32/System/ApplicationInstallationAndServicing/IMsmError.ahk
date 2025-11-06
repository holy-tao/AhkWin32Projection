#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMsmStrings.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IMsmError interface retrieves details about a single merge error.
 * @see https://docs.microsoft.com/windows/win32/api//mergemod/nn-mergemod-imsmerror
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmError extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Path", "get_Language", "get_DatabaseTable", "get_DatabaseKeys", "get_ModuleTable", "get_ModuleKeys"]

    /**
     * 
     * @param {Pointer<Integer>} ErrorType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmerror-get_type
     */
    get_Type(ErrorType) {
        ErrorTypeMarshal := ErrorType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, ErrorTypeMarshal, ErrorType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ErrorPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmerror-get_path
     */
    get_Path(ErrorPath) {
        result := ComCall(8, this, "ptr", ErrorPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ErrorLanguage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmerror-get_language
     */
    get_Language(ErrorLanguage) {
        ErrorLanguageMarshal := ErrorLanguage is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, ErrorLanguageMarshal, ErrorLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ErrorTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmerror-get_databasetable
     */
    get_DatabaseTable(ErrorTable) {
        result := ComCall(10, this, "ptr", ErrorTable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMsmStrings} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmerror-get_databasekeys
     */
    get_DatabaseKeys() {
        result := ComCall(11, this, "ptr*", &ErrorKeys := 0, "HRESULT")
        return IMsmStrings(ErrorKeys)
    }

    /**
     * 
     * @param {Pointer<BSTR>} ErrorTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmerror-get_moduletable
     */
    get_ModuleTable(ErrorTable) {
        result := ComCall(12, this, "ptr", ErrorTable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMsmStrings} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmerror-get_modulekeys
     */
    get_ModuleKeys() {
        result := ComCall(13, this, "ptr*", &ErrorKeys := 0, "HRESULT")
        return IMsmStrings(ErrorKeys)
    }
}
