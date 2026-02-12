#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderQuotaUI extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderQuotaUI
     * @type {Guid}
     */
    static IID => Guid("{ba6295c3-312e-544f-9fd5-1f81b21f3649}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QuotaTotalInBytes", "put_QuotaTotalInBytes", "get_QuotaUsedInBytes", "put_QuotaUsedInBytes", "get_QuotaUsedLabel", "put_QuotaUsedLabel", "get_QuotaUsedColor", "put_QuotaUsedColor"]

    /**
     * @type {Integer} 
     */
    QuotaTotalInBytes {
        get => this.get_QuotaTotalInBytes()
        set => this.put_QuotaTotalInBytes(value)
    }

    /**
     * @type {Integer} 
     */
    QuotaUsedInBytes {
        get => this.get_QuotaUsedInBytes()
        set => this.put_QuotaUsedInBytes(value)
    }

    /**
     * @type {HSTRING} 
     */
    QuotaUsedLabel {
        get => this.get_QuotaUsedLabel()
        set => this.put_QuotaUsedLabel(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    QuotaUsedColor {
        get => this.get_QuotaUsedColor()
        set => this.put_QuotaUsedColor(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QuotaTotalInBytes() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
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
    put_QuotaTotalInBytes(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QuotaUsedInBytes() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
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
    put_QuotaUsedInBytes(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QuotaUsedLabel() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_QuotaUsedLabel(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_QuotaUsedColor() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_QuotaUsedColor(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
