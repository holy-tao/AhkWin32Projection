#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GattReadResult.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattDescriptor
     * @type {Guid}
     */
    static IID => Guid("{92055f2b-8084-4344-b4c2-284de19a8506}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProtectionLevel", "put_ProtectionLevel", "get_Uuid", "get_AttributeHandle", "ReadValueAsync", "ReadValueWithCacheModeAsync", "WriteValueAsync"]

    /**
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
        set => this.put_ProtectionLevel(value)
    }

    /**
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * @type {Integer} 
     */
    AttributeHandle {
        get => this.get_AttributeHandle()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_ProtectionLevel(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttributeHandle() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<GattReadResult>} 
     */
    ReadValueAsync() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattReadResult, value)
    }

    /**
     * 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattReadResult>} 
     */
    ReadValueWithCacheModeAsync(cacheMode_) {
        result := ComCall(11, this, "int", cacheMode_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattReadResult, value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {IAsyncOperation<Integer>} 
     */
    WriteValueAsync(value) {
        result := ComCall(12, this, "ptr", value, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), action)
    }
}
