#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include .\LampInfo.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Lights
 * @version WindowsRuntime 1.4
 */
class ILampArray extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILampArray
     * @type {Guid}
     */
    static IID => Guid("{7ace9787-c8a0-4e95-a1e0-d58676538649}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_HardwareVendorId", "get_HardwareProductId", "get_HardwareVersion", "get_LampArrayKind", "get_LampCount", "get_MinUpdateInterval", "get_BoundingBox", "get_IsEnabled", "put_IsEnabled", "get_BrightnessLevel", "put_BrightnessLevel", "get_IsConnected", "get_SupportsVirtualKeys", "GetLampInfo", "GetIndicesForKey", "GetIndicesForPurposes", "SetColor", "SetColorForIndex", "SetSingleColorForIndices", "SetColorsForIndices", "SetColorsForKey", "SetColorsForKeys", "SetColorsForPurposes", "SendMessageAsync", "RequestMessageAsync"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Integer} 
     */
    HardwareVendorId {
        get => this.get_HardwareVendorId()
    }

    /**
     * @type {Integer} 
     */
    HardwareProductId {
        get => this.get_HardwareProductId()
    }

    /**
     * @type {Integer} 
     */
    HardwareVersion {
        get => this.get_HardwareVersion()
    }

    /**
     * @type {Integer} 
     */
    LampArrayKind {
        get => this.get_LampArrayKind()
    }

    /**
     * @type {Integer} 
     */
    LampCount {
        get => this.get_LampCount()
    }

    /**
     * @type {TimeSpan} 
     */
    MinUpdateInterval {
        get => this.get_MinUpdateInterval()
    }

    /**
     * @type {Vector3} 
     */
    BoundingBox {
        get => this.get_BoundingBox()
    }

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * @type {Float} 
     */
    BrightnessLevel {
        get => this.get_BrightnessLevel()
        set => this.put_BrightnessLevel(value)
    }

    /**
     * @type {Boolean} 
     */
    IsConnected {
        get => this.get_IsConnected()
    }

    /**
     * @type {Boolean} 
     */
    SupportsVirtualKeys {
        get => this.get_SupportsVirtualKeys()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareVendorId() {
        result := ComCall(7, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareProductId() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareVersion() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LampArrayKind() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LampCount() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinUpdateInterval() {
        value := TimeSpan()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_BoundingBox() {
        value := Vector3()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_IsEnabled(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BrightnessLevel() {
        result := ComCall(16, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_BrightnessLevel(value) {
        result := ComCall(17, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnected() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsVirtualKeys() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} lampIndex 
     * @returns {LampInfo} 
     */
    GetLampInfo(lampIndex) {
        result := ComCall(20, this, "int", lampIndex, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LampInfo(result_)
    }

    /**
     * 
     * @param {Integer} key 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetIndicesForKey(key, result_) {
        result := ComCall(21, this, "int", key, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} purposes 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetIndicesForPurposes(purposes, result_) {
        result := ComCall(22, this, "uint", purposes, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetColorAdjustment function sets the color adjustment values for a device context (DC) using the specified values.
     * @remarks
     * The color adjustment values are used to adjust the input color of the source bitmap for calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-stretchblt">StretchBlt</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a> functions when HALFTONE mode is set.
     * @param {Color} desiredColor 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-setcoloradjustment
     */
    SetColor(desiredColor) {
        result := ComCall(23, this, "ptr", desiredColor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} lampIndex 
     * @param {Color} desiredColor 
     * @returns {HRESULT} 
     */
    SetColorForIndex(lampIndex, desiredColor) {
        result := ComCall(24, this, "int", lampIndex, "ptr", desiredColor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Color} desiredColor 
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes 
     * @returns {HRESULT} 
     */
    SetSingleColorForIndices(desiredColor, lampIndexes_length, lampIndexes) {
        lampIndexesMarshal := lampIndexes is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, "ptr", desiredColor, "uint", lampIndexes_length, lampIndexesMarshal, lampIndexes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} desiredColors_length 
     * @param {Pointer<Color>} desiredColors 
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes 
     * @returns {HRESULT} 
     */
    SetColorsForIndices(desiredColors_length, desiredColors, lampIndexes_length, lampIndexes) {
        lampIndexesMarshal := lampIndexes is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, "uint", desiredColors_length, "ptr", desiredColors, "uint", lampIndexes_length, lampIndexesMarshal, lampIndexes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Color} desiredColor 
     * @param {Integer} key 
     * @returns {HRESULT} 
     */
    SetColorsForKey(desiredColor, key) {
        result := ComCall(27, this, "ptr", desiredColor, "int", key, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} desiredColors_length 
     * @param {Pointer<Color>} desiredColors 
     * @param {Integer} keys_length 
     * @param {Pointer<Integer>} keys 
     * @returns {HRESULT} 
     */
    SetColorsForKeys(desiredColors_length, desiredColors, keys_length, keys) {
        keysMarshal := keys is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, "uint", desiredColors_length, "ptr", desiredColors, "uint", keys_length, keysMarshal, keys, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Color} desiredColor 
     * @param {Integer} purposes 
     * @returns {HRESULT} 
     */
    SetColorsForPurposes(desiredColor, purposes) {
        result := ComCall(29, this, "ptr", desiredColor, "uint", purposes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} messageId 
     * @param {IBuffer} message 
     * @returns {IAsyncAction} 
     */
    SendMessageAsync(messageId, message) {
        result := ComCall(30, this, "int", messageId, "ptr", message, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} messageId 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    RequestMessageAsync(messageId) {
        result := ComCall(31, this, "int", messageId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, operation)
    }
}
