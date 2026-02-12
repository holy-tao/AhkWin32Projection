#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ISlipPrinterCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISlipPrinterCapabilities
     * @type {Guid}
     */
    static IID => Guid("{99b16399-488c-4157-8ac2-9f57f708d3db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsFullLengthSupported", "get_IsBothSidesPrintingSupported"]

    /**
     * @type {Boolean} 
     */
    IsFullLengthSupported {
        get => this.get_IsFullLengthSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsBothSidesPrintingSupported {
        get => this.get_IsBothSidesPrintingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullLengthSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBothSidesPrintingSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
