#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ResourceManager.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class IResourceManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{1cc0fdfc-69ee-4e43-9901-47f12687baf7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current", "IsResourceReference"]

    /**
     * @type {ResourceManager} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {ResourceManager} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceManager(value)
    }

    /**
     * 
     * @param {HSTRING} resourceReference 
     * @returns {Boolean} 
     */
    IsResourceReference(resourceReference) {
        if(resourceReference is String) {
            pin := HSTRING.Create(resourceReference)
            resourceReference := pin.Value
        }
        resourceReference := resourceReference is Win32Handle ? NumGet(resourceReference, "ptr") : resourceReference

        result := ComCall(7, this, "ptr", resourceReference, "int*", &isReference := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isReference
    }
}
