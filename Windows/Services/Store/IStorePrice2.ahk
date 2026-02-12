#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStorePrice2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePrice2
     * @type {Guid}
     */
    static IID => Guid("{f711573c-40e6-5641-b063-f1df42b2b12a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnformattedBasePrice", "get_UnformattedPrice", "get_UnformattedRecurrencePrice"]

    /**
     * @type {HSTRING} 
     */
    UnformattedBasePrice {
        get => this.get_UnformattedBasePrice()
    }

    /**
     * @type {HSTRING} 
     */
    UnformattedPrice {
        get => this.get_UnformattedPrice()
    }

    /**
     * @type {HSTRING} 
     */
    UnformattedRecurrencePrice {
        get => this.get_UnformattedRecurrencePrice()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnformattedBasePrice() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnformattedPrice() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnformattedRecurrencePrice() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
