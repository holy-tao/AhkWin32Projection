#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Resources
 * @version WindowsRuntime 1.4
 */
class ICustomXamlResourceLoaderOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomXamlResourceLoaderOverrides
     * @type {Guid}
     */
    static IID => Guid("{f851e991-af02-46e8-9af8-427b7ebfe9f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResource"]

    /**
     * 
     * @param {HSTRING} resourceId 
     * @param {HSTRING} objectType_ 
     * @param {HSTRING} propertyName 
     * @param {HSTRING} propertyType_ 
     * @returns {IInspectable} 
     */
    GetResource(resourceId, objectType_, propertyName, propertyType_) {
        if(resourceId is String) {
            pin := HSTRING.Create(resourceId)
            resourceId := pin.Value
        }
        resourceId := resourceId is Win32Handle ? NumGet(resourceId, "ptr") : resourceId
        if(objectType_ is String) {
            pin := HSTRING.Create(objectType_)
            objectType_ := pin.Value
        }
        objectType_ := objectType_ is Win32Handle ? NumGet(objectType_, "ptr") : objectType_
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName
        if(propertyType_ is String) {
            pin := HSTRING.Create(propertyType_)
            propertyType_ := pin.Value
        }
        propertyType_ := propertyType_ is Win32Handle ? NumGet(propertyType_, "ptr") : propertyType_

        result := ComCall(6, this, "ptr", resourceId, "ptr", objectType_, "ptr", propertyName, "ptr", propertyType_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }
}
