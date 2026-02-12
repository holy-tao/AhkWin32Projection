#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Portable
 * @version WindowsRuntime 1.4
 */
class IServiceDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{a88214e1-59c7-4a20-aba6-9f6707937230}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "GetDeviceSelectorFromServiceId"]

    /**
     * 
     * @param {Integer} serviceType 
     * @returns {HSTRING} 
     */
    GetDeviceSelector(serviceType) {
        selector_ := HSTRING()
        result := ComCall(6, this, "int", serviceType, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @param {Guid} serviceId 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromServiceId(serviceId) {
        selector_ := HSTRING()
        result := ComCall(7, this, "ptr", serviceId, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }
}
