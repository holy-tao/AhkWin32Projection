#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\ResourceQualifier.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Storage\StorageFile.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class IResourceCandidate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceCandidate
     * @type {Guid}
     */
    static IID => Guid("{af5207d9-c433-4764-b3fd-8fa6bfbcbadc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Qualifiers", "get_IsMatch", "get_IsMatchAsDefault", "get_IsDefault", "get_ValueAsString", "GetValueAsFileAsync", "GetQualifierValue"]

    /**
     * @type {IVectorView<ResourceQualifier>} 
     */
    Qualifiers {
        get => this.get_Qualifiers()
    }

    /**
     * @type {Boolean} 
     */
    IsMatch {
        get => this.get_IsMatch()
    }

    /**
     * @type {Boolean} 
     */
    IsMatchAsDefault {
        get => this.get_IsMatchAsDefault()
    }

    /**
     * @type {Boolean} 
     */
    IsDefault {
        get => this.get_IsDefault()
    }

    /**
     * @type {HSTRING} 
     */
    ValueAsString {
        get => this.get_ValueAsString()
    }

    /**
     * 
     * @returns {IVectorView<ResourceQualifier>} 
     */
    get_Qualifiers() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ResourceQualifier, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMatch() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMatchAsDefault() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDefault() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ValueAsString() {
        result_ := HSTRING()
        result := ComCall(10, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    GetValueAsFileAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {HSTRING} qualifierName 
     * @returns {HSTRING} 
     */
    GetQualifierValue(qualifierName) {
        if(qualifierName is String) {
            pin := HSTRING.Create(qualifierName)
            qualifierName := pin.Value
        }
        qualifierName := qualifierName is Win32Handle ? NumGet(qualifierName, "ptr") : qualifierName

        value := HSTRING()
        result := ComCall(12, this, "ptr", qualifierName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
