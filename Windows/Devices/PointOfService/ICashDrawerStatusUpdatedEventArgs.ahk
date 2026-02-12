#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CashDrawerStatus.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ICashDrawerStatusUpdatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICashDrawerStatusUpdatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{30aae98a-0d70-459c-9553-87e124c52488}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status"]

    /**
     * @type {CashDrawerStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {CashDrawerStatus} 
     */
    get_Status() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CashDrawerStatus(value)
    }
}
