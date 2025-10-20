#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IVisualTreeService2.ahk

/**
 * Represents additional capabilities of an IVisualTreeService2 object.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/nn-xamlom-ivisualtreeservice3
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class IVisualTreeService3 extends IVisualTreeService2{
    /**
     * The interface identifier for IVisualTreeService3
     * @type {Guid}
     */
    static IID => Guid("{0e79c6e0-85a0-4be8-b41a-655cf1fd19bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {Integer} resourceContext 
     * @param {PWSTR} resourceName 
     * @param {Integer} resourceType 
     * @param {Integer} propertyIndex 
     * @returns {HRESULT} 
     */
    ResolveResource(resourceContext, resourceName, resourceType, propertyIndex) {
        resourceName := resourceName is String ? StrPtr(resourceName) : resourceName

        result := ComCall(19, this, "uint", resourceContext, "ptr", resourceName, "int", resourceType, "uint", propertyIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dictionaryHandle 
     * @param {PWSTR} resourceName 
     * @param {BOOL} resourceIsImplicitStyle 
     * @param {Pointer<UInt64>} resourceHandle 
     * @returns {HRESULT} 
     */
    GetDictionaryItem(dictionaryHandle, resourceName, resourceIsImplicitStyle, resourceHandle) {
        resourceName := resourceName is String ? StrPtr(resourceName) : resourceName

        result := ComCall(20, this, "uint", dictionaryHandle, "ptr", resourceName, "int", resourceIsImplicitStyle, "uint*", resourceHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dictionaryHandle 
     * @param {Integer} resourceKey 
     * @param {Integer} resourceHandle 
     * @returns {HRESULT} 
     */
    AddDictionaryItem(dictionaryHandle, resourceKey, resourceHandle) {
        result := ComCall(21, this, "uint", dictionaryHandle, "uint", resourceKey, "uint", resourceHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dictionaryHandle 
     * @param {Integer} resourceKey 
     * @returns {HRESULT} 
     */
    RemoveDictionaryItem(dictionaryHandle, resourceKey) {
        result := ComCall(22, this, "uint", dictionaryHandle, "uint", resourceKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
