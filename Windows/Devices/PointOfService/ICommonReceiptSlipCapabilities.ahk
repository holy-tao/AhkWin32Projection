#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the capabilities common to receipt and slip printer stations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonreceiptslipcapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ICommonReceiptSlipCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommonReceiptSlipCapabilities
     * @type {Guid}
     */
    static IID => Guid("{09286b8b-9873-4d05-bfbe-4727a6038f69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsBarcodeSupported", "get_IsBitmapSupported", "get_IsLeft90RotationSupported", "get_IsRight90RotationSupported", "get_Is180RotationSupported", "get_IsPrintAreaSupported", "get_RuledLineCapabilities", "get_SupportedBarcodeRotations", "get_SupportedBitmapRotations"]

    /**
     * Gets whether the receipt or slip printer station can print barcodes.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonreceiptslipcapabilities.isbarcodesupported
     * @type {Boolean} 
     */
    IsBarcodeSupported {
        get => this.get_IsBarcodeSupported()
    }

    /**
     * Gets whether the receipt or slip printer station can print bitmaps.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonreceiptslipcapabilities.isbitmapsupported
     * @type {Boolean} 
     */
    IsBitmapSupported {
        get => this.get_IsBitmapSupported()
    }

    /**
     * Gets whether the receipt or slip printer station can print information rotated 90 degrees to the left.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonreceiptslipcapabilities.isleft90rotationsupported
     * @type {Boolean} 
     */
    IsLeft90RotationSupported {
        get => this.get_IsLeft90RotationSupported()
    }

    /**
     * Gets whether the receipt or slip printer station can print information rotated 90 degrees to the right.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonreceiptslipcapabilities.isright90rotationsupported
     * @type {Boolean} 
     */
    IsRight90RotationSupported {
        get => this.get_IsRight90RotationSupported()
    }

    /**
     * Gets whether the receipt or slip printer station can print in a rotated upside-down mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonreceiptslipcapabilities.is180rotationsupported
     * @type {Boolean} 
     */
    Is180RotationSupported {
        get => this.get_Is180RotationSupported()
    }

    /**
     * Gets whether the receipt or slip printer station supports setting a custom size for the area of the page on which the printer station should print.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonreceiptslipcapabilities.isprintareasupported
     * @type {Boolean} 
     */
    IsPrintAreaSupported {
        get => this.get_IsPrintAreaSupported()
    }

    /**
     * Gets information about the capabilities of the receipt or slip printer station to draw ruled lines.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonreceiptslipcapabilities.ruledlinecapabilities
     * @type {Integer} 
     */
    RuledLineCapabilities {
        get => this.get_RuledLineCapabilities()
    }

    /**
     * Gets a list of the directions in which the receipt or slip printer station can rotate a barcode when printing.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonreceiptslipcapabilities.supportedbarcoderotations
     * @type {IVectorView<Integer>} 
     */
    SupportedBarcodeRotations {
        get => this.get_SupportedBarcodeRotations()
    }

    /**
     * Gets a list of the directions in which the receipt or slip printer station can rotate a bitmap when printing.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icommonreceiptslipcapabilities.supportedbitmaprotations
     * @type {IVectorView<Integer>} 
     */
    SupportedBitmapRotations {
        get => this.get_SupportedBitmapRotations()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBarcodeSupported() {
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
    get_IsBitmapSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLeft90RotationSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRight90RotationSupported() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Is180RotationSupported() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrintAreaSupported() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RuledLineCapabilities() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedBarcodeRotations() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedBitmapRotations() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
