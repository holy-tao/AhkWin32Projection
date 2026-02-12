#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedBarcodeScanner3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedBarcodeScanner3
     * @type {Guid}
     */
    static IID => Guid("{e6ceb430-712e-45fc-8b86-cd55f5aef79d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowVideoPreviewAsync", "HideVideoPreview", "put_IsVideoPreviewShownOnEnable", "get_IsVideoPreviewShownOnEnable"]

    /**
     * @type {Boolean} 
     */
    IsVideoPreviewShownOnEnable {
        get => this.get_IsVideoPreviewShownOnEnable()
        set => this.put_IsVideoPreviewShownOnEnable(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ShowVideoPreviewAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    HideVideoPreview() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVideoPreviewShownOnEnable(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVideoPreviewShownOnEnable() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
