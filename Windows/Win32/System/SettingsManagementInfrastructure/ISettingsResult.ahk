#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * Returns the description of the error.
     * @returns {BSTR} The text that describes the error.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsresult-getdescription
     */
    GetDescription() {
        description := BSTR()
        result := ComCall(3, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * Returns the HRESULT error code value.
     * @returns {HRESULT} The error code value.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsresult-geterrorcode
     */
    GetErrorCode() {
        result := ComCall(4, this, "int*", &hrOut := 0, "HRESULT")
        return hrOut
    }

    /**
     * Returns the description of the context that surrounds the error.
     * @returns {BSTR} The text that describes the context.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsresult-getcontextdescription
     */
    GetContextDescription() {
        description := BSTR()
        result := ComCall(5, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * Returns the line number where the error has occurred.
     * @returns {Integer} The line number where the error has occurred.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsresult-getline
     */
    GetLine() {
        result := ComCall(6, this, "uint*", &dwLine := 0, "HRESULT")
        return dwLine
    }

    /**
     * Returns the column number where the error occurred.
     * @returns {Integer} The column which is the source of the error.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsresult-getcolumn
     */
    GetColumn() {
        result := ComCall(7, this, "uint*", &dwColumn := 0, "HRESULT")
        return dwColumn
    }

    /**
     * Returns the file or path where the error has occurred.
     * @returns {BSTR} The file or path where the error has occurred.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsresult-getsource
     */
    GetSource() {
        file := BSTR()
        result := ComCall(8, this, "ptr", file, "HRESULT")
        return file
    }
}
