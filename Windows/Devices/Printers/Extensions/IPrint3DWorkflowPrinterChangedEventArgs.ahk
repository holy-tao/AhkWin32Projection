#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class IPrint3DWorkflowPrinterChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrint3DWorkflowPrinterChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{45226402-95fc-4847-93b3-134dbf5c60f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NewDeviceId"]

    /**
     * @type {HSTRING} 
     */
    NewDeviceId {
        get => this.get_NewDeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NewDeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
