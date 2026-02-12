#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppointmentStoreChangedDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentStoreChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentStoreChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2285f8b9-0791-417e-bfea-cc6d41636c8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral"]

    /**
     * 
     * @returns {AppointmentStoreChangedDeferral} 
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppointmentStoreChangedDeferral(result_)
    }
}
