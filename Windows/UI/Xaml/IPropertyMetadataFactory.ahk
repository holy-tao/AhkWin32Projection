#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PropertyMetadata.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IPropertyMetadataFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyMetadataFactory
     * @type {Guid}
     */
    static IID => Guid("{c1b81cc0-57cd-4f2f-b0a9-e1801b28f76b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithDefaultValue", "CreateInstanceWithDefaultValueAndCallback"]

    /**
     * 
     * @param {IInspectable} defaultValue 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {PropertyMetadata} 
     */
    CreateInstanceWithDefaultValue(defaultValue, baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", defaultValue, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyMetadata(value)
    }

    /**
     * 
     * @param {IInspectable} defaultValue 
     * @param {PropertyChangedCallback} propertyChangedCallback_ 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {PropertyMetadata} 
     */
    CreateInstanceWithDefaultValueAndCallback(defaultValue, propertyChangedCallback_, baseInterface, innerInterface) {
        result := ComCall(7, this, "ptr", defaultValue, "ptr", propertyChangedCallback_, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyMetadata(value)
    }
}
