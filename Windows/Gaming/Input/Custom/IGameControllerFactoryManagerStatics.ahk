#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IGameControllerFactoryManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameControllerFactoryManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{36cb66e3-d0a1-4986-a24c-40b137deba9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterCustomFactoryForGipInterface", "RegisterCustomFactoryForHardwareId", "RegisterCustomFactoryForXusbType"]

    /**
     * 
     * @param {ICustomGameControllerFactory} factory 
     * @param {Guid} interfaceId 
     * @returns {HRESULT} 
     */
    RegisterCustomFactoryForGipInterface(factory, interfaceId) {
        result := ComCall(6, this, "ptr", factory, "ptr", interfaceId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ICustomGameControllerFactory} factory 
     * @param {Integer} hardwareVendorId 
     * @param {Integer} hardwareProductId 
     * @returns {HRESULT} 
     */
    RegisterCustomFactoryForHardwareId(factory, hardwareVendorId, hardwareProductId) {
        result := ComCall(7, this, "ptr", factory, "ushort", hardwareVendorId, "ushort", hardwareProductId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ICustomGameControllerFactory} factory 
     * @param {Integer} xusbType 
     * @param {Integer} xusbSubtype 
     * @returns {HRESULT} 
     */
    RegisterCustomFactoryForXusbType(factory, xusbType, xusbSubtype) {
        result := ComCall(8, this, "ptr", factory, "int", xusbType, "int", xusbSubtype, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
