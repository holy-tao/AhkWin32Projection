#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageProvider2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProvider2
     * @type {Guid}
     */
    static IID => Guid("{010d1917-3404-414b-9fd7-cd44472eaa39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPropertySupportedForPartialFileAsync"]

    /**
     * 
     * @param {HSTRING} propertyCanonicalName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsPropertySupportedForPartialFileAsync(propertyCanonicalName) {
        if(propertyCanonicalName is String) {
            pin := HSTRING.Create(propertyCanonicalName)
            propertyCanonicalName := pin.Value
        }
        propertyCanonicalName := propertyCanonicalName is Win32Handle ? NumGet(propertyCanonicalName, "ptr") : propertyCanonicalName

        result := ComCall(6, this, "ptr", propertyCanonicalName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
