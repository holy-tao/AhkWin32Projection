#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IPosPrinterStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPosPrinterStatics2
     * @type {Guid}
     */
    static IID => Guid("{eecd2c1c-b0d0-42e7-b137-b89b16244d41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelectorWithConnectionTypes"]

    /**
     * 
     * @param {Integer} connectionTypes 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorWithConnectionTypes(connectionTypes) {
        value := HSTRING()
        result := ComCall(6, this, "uint", connectionTypes, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
