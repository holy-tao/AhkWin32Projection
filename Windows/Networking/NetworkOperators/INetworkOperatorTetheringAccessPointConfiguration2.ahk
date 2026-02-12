#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class INetworkOperatorTetheringAccessPointConfiguration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkOperatorTetheringAccessPointConfiguration2
     * @type {Guid}
     */
    static IID => Guid("{b1809142-7238-59a0-928b-74ab46fd64b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsBandSupported", "IsBandSupportedAsync", "get_Band", "put_Band"]

    /**
     * @type {Integer} 
     */
    Band {
        get => this.get_Band()
        set => this.put_Band(value)
    }

    /**
     * 
     * @param {Integer} band 
     * @returns {Boolean} 
     */
    IsBandSupported(band) {
        result := ComCall(6, this, "int", band, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} band 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsBandSupportedAsync(band) {
        result := ComCall(7, this, "int", band, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Band() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Band(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
