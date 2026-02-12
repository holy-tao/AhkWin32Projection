#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IReceiptPrinterCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReceiptPrinterCapabilities
     * @type {Guid}
     */
    static IID => Guid("{b8f0b58f-51a8-43fc-9bd5-8de272a6415b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanCutPaper", "get_IsStampSupported", "get_MarkFeedCapabilities"]

    /**
     * @type {Boolean} 
     */
    CanCutPaper {
        get => this.get_CanCutPaper()
    }

    /**
     * @type {Boolean} 
     */
    IsStampSupported {
        get => this.get_IsStampSupported()
    }

    /**
     * @type {Integer} 
     */
    MarkFeedCapabilities {
        get => this.get_MarkFeedCapabilities()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCutPaper() {
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
    get_IsStampSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MarkFeedCapabilities() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
