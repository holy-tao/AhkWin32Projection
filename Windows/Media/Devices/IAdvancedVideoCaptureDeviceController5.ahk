#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\VideoDeviceControllerGetDevicePropertyResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAdvancedVideoCaptureDeviceController5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedVideoCaptureDeviceController5
     * @type {Guid}
     */
    static IID => Guid("{33512b17-b9cb-4a23-b875-f9eaab535492}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "GetDevicePropertyById", "SetDevicePropertyById", "GetDevicePropertyByExtendedId", "SetDevicePropertyByExtendedId"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} propertyId 
     * @param {IReference<Integer>} maxPropertyValueSize 
     * @returns {VideoDeviceControllerGetDevicePropertyResult} 
     */
    GetDevicePropertyById(propertyId, maxPropertyValueSize) {
        if(propertyId is String) {
            pin := HSTRING.Create(propertyId)
            propertyId := pin.Value
        }
        propertyId := propertyId is Win32Handle ? NumGet(propertyId, "ptr") : propertyId

        result := ComCall(7, this, "ptr", propertyId, "ptr", maxPropertyValueSize, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoDeviceControllerGetDevicePropertyResult(value)
    }

    /**
     * 
     * @param {HSTRING} propertyId 
     * @param {IInspectable} propertyValue_ 
     * @returns {Integer} 
     */
    SetDevicePropertyById(propertyId, propertyValue_) {
        if(propertyId is String) {
            pin := HSTRING.Create(propertyId)
            propertyId := pin.Value
        }
        propertyId := propertyId is Win32Handle ? NumGet(propertyId, "ptr") : propertyId

        result := ComCall(8, this, "ptr", propertyId, "ptr", propertyValue_, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} extendedPropertyId_length 
     * @param {Pointer<Integer>} extendedPropertyId 
     * @param {IReference<Integer>} maxPropertyValueSize 
     * @returns {VideoDeviceControllerGetDevicePropertyResult} 
     */
    GetDevicePropertyByExtendedId(extendedPropertyId_length, extendedPropertyId, maxPropertyValueSize) {
        extendedPropertyIdMarshal := extendedPropertyId is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", extendedPropertyId_length, extendedPropertyIdMarshal, extendedPropertyId, "ptr", maxPropertyValueSize, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoDeviceControllerGetDevicePropertyResult(value)
    }

    /**
     * 
     * @param {Integer} extendedPropertyId_length 
     * @param {Pointer<Integer>} extendedPropertyId 
     * @param {Integer} propertyValue_length 
     * @param {Pointer<Integer>} propertyValue 
     * @returns {Integer} 
     */
    SetDevicePropertyByExtendedId(extendedPropertyId_length, extendedPropertyId, propertyValue_length, propertyValue) {
        extendedPropertyIdMarshal := extendedPropertyId is VarRef ? "char*" : "ptr"
        propertyValueMarshal := propertyValue is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "uint", extendedPropertyId_length, extendedPropertyIdMarshal, extendedPropertyId, "uint", propertyValue_length, propertyValueMarshal, propertyValue, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
