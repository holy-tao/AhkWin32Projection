#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Metadata
 * @version WindowsRuntime 1.4
 */
class IApiInformationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApiInformationStatics
     * @type {Guid}
     */
    static IID => Guid("{997439fe-f681-4a11-b416-c13a47e8ba36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsTypePresent", "IsMethodPresent", "IsMethodPresentWithArity", "IsEventPresent", "IsPropertyPresent", "IsReadOnlyPropertyPresent", "IsWriteablePropertyPresent", "IsEnumNamedValuePresent", "IsApiContractPresentByMajor", "IsApiContractPresentByMajorAndMinor"]

    /**
     * 
     * @param {HSTRING} typeName_ 
     * @returns {Boolean} 
     */
    IsTypePresent(typeName_) {
        if(typeName_ is String) {
            pin := HSTRING.Create(typeName_)
            typeName_ := pin.Value
        }
        typeName_ := typeName_ is Win32Handle ? NumGet(typeName_, "ptr") : typeName_

        result := ComCall(6, this, "ptr", typeName_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} typeName_ 
     * @param {HSTRING} methodName 
     * @returns {Boolean} 
     */
    IsMethodPresent(typeName_, methodName) {
        if(typeName_ is String) {
            pin := HSTRING.Create(typeName_)
            typeName_ := pin.Value
        }
        typeName_ := typeName_ is Win32Handle ? NumGet(typeName_, "ptr") : typeName_
        if(methodName is String) {
            pin := HSTRING.Create(methodName)
            methodName := pin.Value
        }
        methodName := methodName is Win32Handle ? NumGet(methodName, "ptr") : methodName

        result := ComCall(7, this, "ptr", typeName_, "ptr", methodName, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} typeName_ 
     * @param {HSTRING} methodName 
     * @param {Integer} inputParameterCount 
     * @returns {Boolean} 
     */
    IsMethodPresentWithArity(typeName_, methodName, inputParameterCount) {
        if(typeName_ is String) {
            pin := HSTRING.Create(typeName_)
            typeName_ := pin.Value
        }
        typeName_ := typeName_ is Win32Handle ? NumGet(typeName_, "ptr") : typeName_
        if(methodName is String) {
            pin := HSTRING.Create(methodName)
            methodName := pin.Value
        }
        methodName := methodName is Win32Handle ? NumGet(methodName, "ptr") : methodName

        result := ComCall(8, this, "ptr", typeName_, "ptr", methodName, "uint", inputParameterCount, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} typeName_ 
     * @param {HSTRING} eventName 
     * @returns {Boolean} 
     */
    IsEventPresent(typeName_, eventName) {
        if(typeName_ is String) {
            pin := HSTRING.Create(typeName_)
            typeName_ := pin.Value
        }
        typeName_ := typeName_ is Win32Handle ? NumGet(typeName_, "ptr") : typeName_
        if(eventName is String) {
            pin := HSTRING.Create(eventName)
            eventName := pin.Value
        }
        eventName := eventName is Win32Handle ? NumGet(eventName, "ptr") : eventName

        result := ComCall(9, this, "ptr", typeName_, "ptr", eventName, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} typeName_ 
     * @param {HSTRING} propertyName 
     * @returns {Boolean} 
     */
    IsPropertyPresent(typeName_, propertyName) {
        if(typeName_ is String) {
            pin := HSTRING.Create(typeName_)
            typeName_ := pin.Value
        }
        typeName_ := typeName_ is Win32Handle ? NumGet(typeName_, "ptr") : typeName_
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(10, this, "ptr", typeName_, "ptr", propertyName, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} typeName_ 
     * @param {HSTRING} propertyName 
     * @returns {Boolean} 
     */
    IsReadOnlyPropertyPresent(typeName_, propertyName) {
        if(typeName_ is String) {
            pin := HSTRING.Create(typeName_)
            typeName_ := pin.Value
        }
        typeName_ := typeName_ is Win32Handle ? NumGet(typeName_, "ptr") : typeName_
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(11, this, "ptr", typeName_, "ptr", propertyName, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} typeName_ 
     * @param {HSTRING} propertyName 
     * @returns {Boolean} 
     */
    IsWriteablePropertyPresent(typeName_, propertyName) {
        if(typeName_ is String) {
            pin := HSTRING.Create(typeName_)
            typeName_ := pin.Value
        }
        typeName_ := typeName_ is Win32Handle ? NumGet(typeName_, "ptr") : typeName_
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(12, this, "ptr", typeName_, "ptr", propertyName, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} enumTypeName 
     * @param {HSTRING} valueName_ 
     * @returns {Boolean} 
     */
    IsEnumNamedValuePresent(enumTypeName, valueName_) {
        if(enumTypeName is String) {
            pin := HSTRING.Create(enumTypeName)
            enumTypeName := pin.Value
        }
        enumTypeName := enumTypeName is Win32Handle ? NumGet(enumTypeName, "ptr") : enumTypeName
        if(valueName_ is String) {
            pin := HSTRING.Create(valueName_)
            valueName_ := pin.Value
        }
        valueName_ := valueName_ is Win32Handle ? NumGet(valueName_, "ptr") : valueName_

        result := ComCall(13, this, "ptr", enumTypeName, "ptr", valueName_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} contractName 
     * @param {Integer} majorVersion 
     * @returns {Boolean} 
     */
    IsApiContractPresentByMajor(contractName, majorVersion) {
        if(contractName is String) {
            pin := HSTRING.Create(contractName)
            contractName := pin.Value
        }
        contractName := contractName is Win32Handle ? NumGet(contractName, "ptr") : contractName

        result := ComCall(14, this, "ptr", contractName, "ushort", majorVersion, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} contractName 
     * @param {Integer} majorVersion 
     * @param {Integer} minorVersion 
     * @returns {Boolean} 
     */
    IsApiContractPresentByMajorAndMinor(contractName, majorVersion, minorVersion) {
        if(contractName is String) {
            pin := HSTRING.Create(contractName)
            contractName := pin.Value
        }
        contractName := contractName is Win32Handle ? NumGet(contractName, "ptr") : contractName

        result := ComCall(15, this, "ptr", contractName, "ushort", majorVersion, "ushort", minorVersion, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
