#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApiInformationStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables you to detect whether a specified member, type, or API contract is present so that you can safely make API calls across a variety of devices.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation
 * @namespace Windows.Foundation.Metadata
 * @version WindowsRuntime 1.4
 */
class ApiInformation extends IInspectable {
;@region Static Methods
    /**
     * Returns true or false to indicate whether a specified type is present.
     * @param {HSTRING} typeName_ The namespace-qualified name of the type.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation.istypepresent
     */
    static IsTypePresent(typeName_) {
        if (!ApiInformation.HasProp("__IApiInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Metadata.ApiInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApiInformationStatics.IID)
            ApiInformation.__IApiInformationStatics := IApiInformationStatics(factoryPtr)
        }

        return ApiInformation.__IApiInformationStatics.IsTypePresent(typeName_)
    }

    /**
     * Returns true or false to indicate whether a specified method overload with the specified number of input parameters is present for a specified type.
     * @param {HSTRING} typeName_ The namespace-qualified name of the type.
     * @param {HSTRING} methodName The name of the method.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation.ismethodpresent
     */
    static IsMethodPresent(typeName_, methodName) {
        if (!ApiInformation.HasProp("__IApiInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Metadata.ApiInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApiInformationStatics.IID)
            ApiInformation.__IApiInformationStatics := IApiInformationStatics(factoryPtr)
        }

        return ApiInformation.__IApiInformationStatics.IsMethodPresent(typeName_, methodName)
    }

    /**
     * Returns true or false to indicate whether a specified method is present for a specified type.
     * @param {HSTRING} typeName_ The namespace-qualified name of the type.
     * @param {HSTRING} methodName The name of the method.
     * @param {Integer} inputParameterCount 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation.ismethodpresent
     */
    static IsMethodPresentWithArity(typeName_, methodName, inputParameterCount) {
        if (!ApiInformation.HasProp("__IApiInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Metadata.ApiInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApiInformationStatics.IID)
            ApiInformation.__IApiInformationStatics := IApiInformationStatics(factoryPtr)
        }

        return ApiInformation.__IApiInformationStatics.IsMethodPresentWithArity(typeName_, methodName, inputParameterCount)
    }

    /**
     * Returns true or false to indicate whether a specified event is present for a specified type.
     * @param {HSTRING} typeName_ The namespace-qualified name of the type.
     * @param {HSTRING} eventName The name of the event.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation.iseventpresent
     */
    static IsEventPresent(typeName_, eventName) {
        if (!ApiInformation.HasProp("__IApiInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Metadata.ApiInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApiInformationStatics.IID)
            ApiInformation.__IApiInformationStatics := IApiInformationStatics(factoryPtr)
        }

        return ApiInformation.__IApiInformationStatics.IsEventPresent(typeName_, eventName)
    }

    /**
     * Returns true or false to indicate whether a specified property (writeable or read-only) is present for a specified type.
     * @param {HSTRING} typeName_ The namespace-qualified name of the type.
     * @param {HSTRING} propertyName The name of the property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation.ispropertypresent
     */
    static IsPropertyPresent(typeName_, propertyName) {
        if (!ApiInformation.HasProp("__IApiInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Metadata.ApiInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApiInformationStatics.IID)
            ApiInformation.__IApiInformationStatics := IApiInformationStatics(factoryPtr)
        }

        return ApiInformation.__IApiInformationStatics.IsPropertyPresent(typeName_, propertyName)
    }

    /**
     * Returns true or false to indicate whether a specified read-only property is present for a specified type.
     * @param {HSTRING} typeName_ The namespace-qualified name of the type.
     * @param {HSTRING} propertyName The name of the property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation.isreadonlypropertypresent
     */
    static IsReadOnlyPropertyPresent(typeName_, propertyName) {
        if (!ApiInformation.HasProp("__IApiInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Metadata.ApiInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApiInformationStatics.IID)
            ApiInformation.__IApiInformationStatics := IApiInformationStatics(factoryPtr)
        }

        return ApiInformation.__IApiInformationStatics.IsReadOnlyPropertyPresent(typeName_, propertyName)
    }

    /**
     * Returns true or false to indicate whether a specified writeable property is present for a specified type.
     * @param {HSTRING} typeName_ The namespace-qualified name of the type.
     * @param {HSTRING} propertyName The name of the property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation.iswriteablepropertypresent
     */
    static IsWriteablePropertyPresent(typeName_, propertyName) {
        if (!ApiInformation.HasProp("__IApiInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Metadata.ApiInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApiInformationStatics.IID)
            ApiInformation.__IApiInformationStatics := IApiInformationStatics(factoryPtr)
        }

        return ApiInformation.__IApiInformationStatics.IsWriteablePropertyPresent(typeName_, propertyName)
    }

    /**
     * Returns true or false to indicate whether a specified named constant is present for a specified enumeration.
     * @param {HSTRING} enumTypeName The namespace-qualified name of the type.
     * @param {HSTRING} valueName_ The name of the constant.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation.isenumnamedvaluepresent
     */
    static IsEnumNamedValuePresent(enumTypeName, valueName_) {
        if (!ApiInformation.HasProp("__IApiInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Metadata.ApiInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApiInformationStatics.IID)
            ApiInformation.__IApiInformationStatics := IApiInformationStatics(factoryPtr)
        }

        return ApiInformation.__IApiInformationStatics.IsEnumNamedValuePresent(enumTypeName, valueName_)
    }

    /**
     * Returns true or false to indicate whether the API contract with the specified name and major and minor version number is present.
     * @remarks
     * For details on finding and using API contracts, see [Programming with extension SDKs](/uwp/extension-sdks/device-families-overview#api-contracts-and-how-to-look-them-up).
     * @param {HSTRING} contractName The name of the API contract.
     * @param {Integer} majorVersion The major version number of the API contract.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation.isapicontractpresent
     */
    static IsApiContractPresentByMajor(contractName, majorVersion) {
        if (!ApiInformation.HasProp("__IApiInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Metadata.ApiInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApiInformationStatics.IID)
            ApiInformation.__IApiInformationStatics := IApiInformationStatics(factoryPtr)
        }

        return ApiInformation.__IApiInformationStatics.IsApiContractPresentByMajor(contractName, majorVersion)
    }

    /**
     * Returns true or false to indicate whether the API contract with the specified name and major version number is present.
     * @remarks
     * For details on finding and using API contracts, see [Programming with extension SDKs](/uwp/extension-sdks/device-families-overview#api-contracts-and-how-to-look-them-up).
     * @param {HSTRING} contractName The name of the API contract.
     * @param {Integer} majorVersion The major version number of the API contract.
     * @param {Integer} minorVersion 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.apiinformation.isapicontractpresent
     */
    static IsApiContractPresentByMajorAndMinor(contractName, majorVersion, minorVersion) {
        if (!ApiInformation.HasProp("__IApiInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Metadata.ApiInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApiInformationStatics.IID)
            ApiInformation.__IApiInformationStatics := IApiInformationStatics(factoryPtr)
        }

        return ApiInformation.__IApiInformationStatics.IsApiContractPresentByMajorAndMinor(contractName, majorVersion, minorVersion)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
