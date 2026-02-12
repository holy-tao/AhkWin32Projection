#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattDescriptorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattDescriptorStatics
     * @type {Guid}
     */
    static IID => Guid("{92055f2d-8084-4344-b4c2-284de19a8506}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertShortIdToUuid"]

    /**
     * 
     * @param {Integer} shortId 
     * @returns {Guid} 
     */
    ConvertShortIdToUuid(shortId) {
        descriptorUuid := Guid()
        result := ComCall(6, this, "ushort", shortId, "ptr", descriptorUuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return descriptorUuid
    }
}
