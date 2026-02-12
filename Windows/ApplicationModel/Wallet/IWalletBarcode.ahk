#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class IWalletBarcode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWalletBarcode
     * @type {Guid}
     */
    static IID => Guid("{4f857b29-de80-4ea4-a1cd-81cd084dac27}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Symbology", "get_Value", "GetImageAsync"]

    /**
     * @type {Integer} 
     */
    Symbology {
        get => this.get_Symbology()
    }

    /**
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Symbology() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<IRandomAccessStreamReference>} 
     */
    GetImageAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStreamReference, operation)
    }
}
