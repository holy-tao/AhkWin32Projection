#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves the code and description for errors and warnings returned by various operations.
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nn-wcmconfig-isettingsresult
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class ISettingsResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsResult
     * @type {Guid}
     */
    static IID => Guid("{9f7d7bbc-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDescription", "GetErrorCode", "GetContextDescription", "GetLine", "GetColumn", "GetSource"]

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-getdescription
     */
    GetDescription(description) {
        result := ComCall(3, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} hrOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-geterrorcode
     */
    GetErrorCode(hrOut) {
        result := ComCall(4, this, "ptr", hrOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-getcontextdescription
     */
    GetContextDescription(description) {
        result := ComCall(5, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dwLine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-getline
     */
    GetLine(dwLine) {
        dwLineMarshal := dwLine is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, dwLineMarshal, dwLine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dwColumn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-getcolumn
     */
    GetColumn(dwColumn) {
        dwColumnMarshal := dwColumn is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, dwColumnMarshal, dwColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} file 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsresult-getsource
     */
    GetSource(file) {
        result := ComCall(8, this, "ptr", file, "HRESULT")
        return result
    }
}
