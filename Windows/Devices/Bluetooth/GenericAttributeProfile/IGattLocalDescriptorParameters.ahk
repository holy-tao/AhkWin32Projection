#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattLocalDescriptorParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattLocalDescriptorParameters
     * @type {Guid}
     */
    static IID => Guid("{5fdede6a-f3c1-4b66-8c4b-e3d2293b40e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_StaticValue", "get_StaticValue", "put_ReadProtectionLevel", "get_ReadProtectionLevel", "put_WriteProtectionLevel", "get_WriteProtectionLevel"]

    /**
     * @type {IBuffer} 
     */
    StaticValue {
        get => this.get_StaticValue()
        set => this.put_StaticValue(value)
    }

    /**
     * @type {Integer} 
     */
    ReadProtectionLevel {
        get => this.get_ReadProtectionLevel()
        set => this.put_ReadProtectionLevel(value)
    }

    /**
     * @type {Integer} 
     */
    WriteProtectionLevel {
        get => this.get_WriteProtectionLevel()
        set => this.put_WriteProtectionLevel(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_StaticValue(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_StaticValue() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadProtectionLevel(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadProtectionLevel() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_WriteProtectionLevel(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteProtectionLevel() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
