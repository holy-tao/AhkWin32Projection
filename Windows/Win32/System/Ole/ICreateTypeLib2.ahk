#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICreateTypeLib.ahk

/**
 * Provides the methods for creating and managing the component or file that contains type information.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-icreatetypelib2
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ICreateTypeLib2 extends ICreateTypeLib{
    /**
     * The interface identifier for ICreateTypeLib2
     * @type {Guid}
     */
    static IID => Guid("{0002040f-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     */
    DeleteTypeInfo(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(13, this, "ptr", szName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     */
    SetCustData(guid, pVarVal) {
        result := ComCall(14, this, "ptr", guid, "ptr", pVarVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwHelpStringContext 
     * @returns {HRESULT} 
     */
    SetHelpStringContext(dwHelpStringContext) {
        result := ComCall(15, this, "uint", dwHelpStringContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szFileName 
     * @returns {HRESULT} 
     */
    SetHelpStringDll(szFileName) {
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(16, this, "ptr", szFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
