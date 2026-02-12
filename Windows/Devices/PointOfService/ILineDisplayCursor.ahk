#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LineDisplayCursorAttributes.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayCursor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayCursor
     * @type {Guid}
     */
    static IID => Guid("{ecdffc45-754a-4e3b-ab2b-151181085605}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanCustomize", "get_IsBlinkSupported", "get_IsBlockSupported", "get_IsHalfBlockSupported", "get_IsUnderlineSupported", "get_IsReverseSupported", "get_IsOtherSupported", "GetAttributes", "TryUpdateAttributesAsync"]

    /**
     * @type {Boolean} 
     */
    CanCustomize {
        get => this.get_CanCustomize()
    }

    /**
     * @type {Boolean} 
     */
    IsBlinkSupported {
        get => this.get_IsBlinkSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsBlockSupported {
        get => this.get_IsBlockSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsHalfBlockSupported {
        get => this.get_IsHalfBlockSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsUnderlineSupported {
        get => this.get_IsUnderlineSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsReverseSupported {
        get => this.get_IsReverseSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsOtherSupported {
        get => this.get_IsOtherSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCustomize() {
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
    get_IsBlinkSupported() {
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
    get_IsBlockSupported() {
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
    get_IsHalfBlockSupported() {
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
    get_IsUnderlineSupported() {
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
    get_IsReverseSupported() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOtherSupported() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {LineDisplayCursorAttributes} 
     */
    GetAttributes() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LineDisplayCursorAttributes(result_)
    }

    /**
     * 
     * @param {LineDisplayCursorAttributes} attributes 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryUpdateAttributesAsync(attributes) {
        result := ComCall(14, this, "ptr", attributes, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
