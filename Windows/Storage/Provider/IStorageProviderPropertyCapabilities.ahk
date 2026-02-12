#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to the property capabilities supported by the sync root.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderpropertycapabilities
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderPropertyCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderPropertyCapabilities
     * @type {Guid}
     */
    static IID => Guid("{658d2f0e-63b7-4567-acf9-51abe301dda5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPropertySupported"]

    /**
     * Determines whether a property is supported by the sync root.
     * @param {HSTRING} propertyCanonicalName The name of the property. E.g., "System.Photo.DateTaken"
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderpropertycapabilities.ispropertysupported
     */
    IsPropertySupported(propertyCanonicalName) {
        if(propertyCanonicalName is String) {
            pin := HSTRING.Create(propertyCanonicalName)
            propertyCanonicalName := pin.Value
        }
        propertyCanonicalName := propertyCanonicalName is Win32Handle ? NumGet(propertyCanonicalName, "ptr") : propertyCanonicalName

        result := ComCall(6, this, "ptr", propertyCanonicalName, "int*", &isSupported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isSupported
    }
}
