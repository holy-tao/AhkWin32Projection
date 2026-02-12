#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAdvancedVideoCaptureDeviceController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedVideoCaptureDeviceController
     * @type {Guid}
     */
    static IID => Guid("{de6ff4d3-2b96-4583-80ab-b5b01dc6a8d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDeviceProperty", "GetDeviceProperty"]

    /**
     * 
     * @param {HSTRING} propertyId 
     * @param {IInspectable} propertyValue_ 
     * @returns {HRESULT} 
     */
    SetDeviceProperty(propertyId, propertyValue_) {
        if(propertyId is String) {
            pin := HSTRING.Create(propertyId)
            propertyId := pin.Value
        }
        propertyId := propertyId is Win32Handle ? NumGet(propertyId, "ptr") : propertyId

        result := ComCall(6, this, "ptr", propertyId, "ptr", propertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} propertyId 
     * @returns {IInspectable} 
     */
    GetDeviceProperty(propertyId) {
        if(propertyId is String) {
            pin := HSTRING.Create(propertyId)
            propertyId := pin.Value
        }
        propertyId := propertyId is Win32Handle ? NumGet(propertyId, "ptr") : propertyId

        result := ComCall(7, this, "ptr", propertyId, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }
}
