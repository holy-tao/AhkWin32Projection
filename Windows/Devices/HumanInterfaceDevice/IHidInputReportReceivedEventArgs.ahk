#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HidInputReport.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class IHidInputReportReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHidInputReportReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7059c5cb-59b2-4dc2-985c-0adc6136fa2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Report"]

    /**
     * @type {HidInputReport} 
     */
    Report {
        get => this.get_Report()
    }

    /**
     * 
     * @returns {HidInputReport} 
     */
    get_Report() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidInputReport(value)
    }
}
