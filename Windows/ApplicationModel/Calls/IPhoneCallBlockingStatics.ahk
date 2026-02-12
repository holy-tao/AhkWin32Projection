#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallBlockingStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallBlockingStatics
     * @type {Guid}
     */
    static IID => Guid("{19646f84-2b79-26f1-a46f-694be043f313}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BlockUnknownNumbers", "put_BlockUnknownNumbers", "get_BlockPrivateNumbers", "put_BlockPrivateNumbers", "SetCallBlockingListAsync"]

    /**
     * @type {Boolean} 
     */
    BlockUnknownNumbers {
        get => this.get_BlockUnknownNumbers()
        set => this.put_BlockUnknownNumbers(value)
    }

    /**
     * @type {Boolean} 
     */
    BlockPrivateNumbers {
        get => this.get_BlockPrivateNumbers()
        set => this.put_BlockPrivateNumbers(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BlockUnknownNumbers() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BlockUnknownNumbers(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BlockPrivateNumbers() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BlockPrivateNumbers(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<HSTRING>} phoneNumberList 
     * @returns {IAsyncOperation<Boolean>} 
     */
    SetCallBlockingListAsync(phoneNumberList) {
        result := ComCall(10, this, "ptr", phoneNumberList, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }
}
