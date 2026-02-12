#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources
 * @version WindowsRuntime 1.4
 */
class IResourceLoader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceLoader
     * @type {Guid}
     */
    static IID => Guid("{08524908-16ef-45ad-a602-293637d7e61a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetString"]

    /**
     * GetString Method Example (VC++)
     * @param {HSTRING} resource 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getstring-method-example-vc
     */
    GetString(resource) {
        if(resource is String) {
            pin := HSTRING.Create(resource)
            resource := pin.Value
        }
        resource := resource is Win32Handle ? NumGet(resource, "ptr") : resource

        value := HSTRING()
        result := ComCall(6, this, "ptr", resource, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
