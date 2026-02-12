#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\BarcodeSymbologyAttributes.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedBarcodeScanner2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedBarcodeScanner2
     * @type {Guid}
     */
    static IID => Guid("{e3b59e8c-2d8b-4f70-8af3-3448bedd5fe2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSymbologyAttributesAsync", "SetSymbologyAttributesAsync"]

    /**
     * 
     * @param {Integer} barcodeSymbology 
     * @returns {IAsyncOperation<BarcodeSymbologyAttributes>} 
     */
    GetSymbologyAttributesAsync(barcodeSymbology) {
        result := ComCall(6, this, "uint", barcodeSymbology, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BarcodeSymbologyAttributes, result_)
    }

    /**
     * 
     * @param {Integer} barcodeSymbology 
     * @param {BarcodeSymbologyAttributes} attributes 
     * @returns {IAsyncOperation<Boolean>} 
     */
    SetSymbologyAttributesAsync(barcodeSymbology, attributes) {
        result := ComCall(7, this, "uint", barcodeSymbology, "ptr", attributes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }
}
