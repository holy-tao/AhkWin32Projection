#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PropertyMetadata.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IPropertyMetadataStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyMetadataStatics
     * @type {Guid}
     */
    static IID => Guid("{3b01077a-6e06-45e9-8b5c-af243458c062}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithDefaultValue", "CreateWithDefaultValueAndCallback", "CreateWithFactory", "CreateWithFactoryAndCallback"]

    /**
     * Create Extended Stored Procedures
     * @param {IInspectable} defaultValue 
     * @returns {PropertyMetadata} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    CreateWithDefaultValue(defaultValue) {
        result := ComCall(6, this, "ptr", defaultValue, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyMetadata(result_)
    }

    /**
     * Create Extended Stored Procedures
     * @param {IInspectable} defaultValue 
     * @param {PropertyChangedCallback} propertyChangedCallback_ 
     * @returns {PropertyMetadata} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    CreateWithDefaultValueAndCallback(defaultValue, propertyChangedCallback_) {
        result := ComCall(7, this, "ptr", defaultValue, "ptr", propertyChangedCallback_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyMetadata(result_)
    }

    /**
     * Create Extended Stored Procedures
     * @param {CreateDefaultValueCallback} createDefaultValueCallback_ 
     * @returns {PropertyMetadata} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    CreateWithFactory(createDefaultValueCallback_) {
        result := ComCall(8, this, "ptr", createDefaultValueCallback_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyMetadata(result_)
    }

    /**
     * Create Extended Stored Procedures
     * @param {CreateDefaultValueCallback} createDefaultValueCallback_ 
     * @param {PropertyChangedCallback} propertyChangedCallback_ 
     * @returns {PropertyMetadata} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    CreateWithFactoryAndCallback(createDefaultValueCallback_, propertyChangedCallback_) {
        result := ComCall(9, this, "ptr", createDefaultValueCallback_, "ptr", propertyChangedCallback_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyMetadata(result_)
    }
}
