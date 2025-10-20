#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITypeLib.ahk

/**
 * Represents a type library, the data that describes a set of objects.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypelib2
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeLib2 extends ITypeLib{
    /**
     * The interface identifier for ITypeLib2
     * @type {Guid}
     */
    static IID => Guid("{00020411-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     */
    GetCustData(guid, pVarVal) {
        result := ComCall(13, this, "ptr", guid, "ptr", pVarVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcUniqueNames 
     * @param {Pointer<UInt32>} pcchUniqueNames 
     * @returns {HRESULT} 
     */
    GetLibStatistics(pcUniqueNames, pcchUniqueNames) {
        result := ComCall(14, this, "uint*", pcUniqueNames, "uint*", pcchUniqueNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pbstrHelpString 
     * @param {Pointer<UInt32>} pdwHelpStringContext 
     * @param {Pointer<BSTR>} pbstrHelpStringDll 
     * @returns {HRESULT} 
     */
    GetDocumentation2(index, lcid, pbstrHelpString, pdwHelpStringContext, pbstrHelpStringDll) {
        result := ComCall(15, this, "int", index, "uint", lcid, "ptr", pbstrHelpString, "uint*", pdwHelpStringContext, "ptr", pbstrHelpStringDll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     */
    GetAllCustData(pCustData) {
        result := ComCall(16, this, "ptr", pCustData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
