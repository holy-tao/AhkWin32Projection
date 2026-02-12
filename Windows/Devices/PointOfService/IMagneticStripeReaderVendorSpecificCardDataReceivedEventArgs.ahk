#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MagneticStripeReaderReport.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{af0a5514-59cc-4a60-99e8-99a53dace5aa}")

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
     * @type {MagneticStripeReaderReport} 
     */
    Report {
        get => this.get_Report()
    }

    /**
     * 
     * @returns {MagneticStripeReaderReport} 
     */
    get_Report() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MagneticStripeReaderReport(value)
    }
}
