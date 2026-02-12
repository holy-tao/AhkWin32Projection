#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ResourceContext.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class IResourceContextStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceContextStatics2
     * @type {Guid}
     */
    static IID => Guid("{41f752ef-12af-41b9-ab36-b1eb4b512460}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView", "SetGlobalQualifierValue", "ResetGlobalQualifierValues", "ResetGlobalQualifierValuesForSpecifiedQualifiers", "GetForViewIndependentUse"]

    /**
     * 
     * @returns {ResourceContext} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceContext(value)
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetGlobalQualifierValue(key, value) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetGlobalQualifierValues() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<HSTRING>} qualifierNames 
     * @returns {HRESULT} 
     */
    ResetGlobalQualifierValuesForSpecifiedQualifiers(qualifierNames) {
        result := ComCall(9, this, "ptr", qualifierNames, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ResourceContext} 
     */
    GetForViewIndependentUse() {
        result := ComCall(10, this, "ptr*", &loader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceContext(loader)
    }
}
