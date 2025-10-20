#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPropertyDescription.ahk

/**
 * Exposes search-related information for a property.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertydescriptionsearchinfo
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyDescriptionSearchInfo extends IPropertyDescription{
    /**
     * The interface identifier for IPropertyDescriptionSearchInfo
     * @type {Guid}
     */
    static IID => Guid("{078f91bd-29a2-440f-924e-46a291524520}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * 
     * @param {Pointer<Int32>} ppdsiFlags 
     * @returns {HRESULT} 
     */
    GetSearchInfoFlags(ppdsiFlags) {
        result := ComCall(24, this, "int*", ppdsiFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ppdciType 
     * @returns {HRESULT} 
     */
    GetColumnIndexType(ppdciType) {
        result := ComCall(25, this, "int*", ppdciType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszProjection 
     * @returns {HRESULT} 
     */
    GetProjectionString(ppszProjection) {
        result := ComCall(26, this, "ptr", ppszProjection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbMaxSize 
     * @returns {HRESULT} 
     */
    GetMaxSize(pcbMaxSize) {
        result := ComCall(27, this, "uint*", pcbMaxSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
