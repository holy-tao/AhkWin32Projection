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
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     */
    GetDescription(description) {
        result := ComCall(3, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} hrOut 
     * @returns {HRESULT} 
     */
    GetErrorCode(hrOut) {
        result := ComCall(4, this, "ptr", hrOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     */
    GetContextDescription(description) {
        result := ComCall(5, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} dwLine 
     * @returns {HRESULT} 
     */
    GetLine(dwLine) {
        result := ComCall(6, this, "uint*", dwLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} dwColumn 
     * @returns {HRESULT} 
     */
    GetColumn(dwColumn) {
        result := ComCall(7, this, "uint*", dwColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} file 
     * @returns {HRESULT} 
     */
    GetSource(file) {
        result := ComCall(8, this, "ptr", file, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
