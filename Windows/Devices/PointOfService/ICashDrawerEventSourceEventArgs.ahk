#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CashDrawer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the arguments common to cash drawer event sources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icashdrawereventsourceeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ICashDrawerEventSourceEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICashDrawerEventSourceEventArgs
     * @type {Guid}
     */
    static IID => Guid("{69cb3bc1-147f-421c-9c23-090123bb786c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CashDrawer"]

    /**
     * Gets the cash drawer associated with the event source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icashdrawereventsourceeventargs.cashdrawer
     * @type {CashDrawer} 
     */
    CashDrawer {
        get => this.get_CashDrawer()
    }

    /**
     * 
     * @returns {CashDrawer} 
     */
    get_CashDrawer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CashDrawer(value)
    }
}
