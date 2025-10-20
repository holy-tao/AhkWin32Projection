#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmPropertyDefinition.ahk

/**
 * Defines a property that you want to use to classify files.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpropertydefinition2
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPropertyDefinition2 extends IFsrmPropertyDefinition{
    /**
     * The interface identifier for IFsrmPropertyDefinition2
     * @type {Guid}
     */
    static IID => Guid("{47782152-d16c-4229-b4e1-0ddfe308b9f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * 
     * @param {Pointer<Int32>} propertyDefinitionFlags 
     * @returns {HRESULT} 
     */
    get_PropertyDefinitionFlags(propertyDefinitionFlags) {
        result := ComCall(22, this, "int*", propertyDefinitionFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_DisplayName(name) {
        result := ComCall(23, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(24, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} appliesTo 
     * @returns {HRESULT} 
     */
    get_AppliesTo(appliesTo) {
        result := ComCall(25, this, "int*", appliesTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmCollection>} valueDefinitions 
     * @returns {HRESULT} 
     */
    get_ValueDefinitions(valueDefinitions) {
        result := ComCall(26, this, "ptr", valueDefinitions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
