#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PenDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class IPenDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPenDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{9dfbbe01-0966-5180-bcb4-b85060e39479}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFromPointerId"]

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {PenDevice} 
     */
    GetFromPointerId(pointerId) {
        result := ComCall(6, this, "uint", pointerId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PenDevice(result_)
    }
}
