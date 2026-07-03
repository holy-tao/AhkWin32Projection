#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * A callback function prototype that is called once for each attribute found in the pSDPStream parameter passed to the BluetoothSdpEnumAttributes function call.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nc-bluetoothapis-pfn_bluetooth_enum_attributes_callback
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} uAttribId The current attribute identifier in the SDP stream.
     * @param {Integer} pValueStream The raw SDP stream for the attribute value associated with <b>uAttribId</b>. Use the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothsdpgetelementdata">BluetoothSdpGetElementData</a> function to parse the raw results into computer-readable data.
     * @param {Integer} cbStreamSize The size, in bytes, of <b>pValueStream</b>.
     * @param {Pointer<Void>} pvParam The context passed in from a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothsdpenumattributes">BluetoothSdpEnumAttributes</a> function.
     * @returns {BOOL} Should return <b>TRUE</b> when the enumeration continues to the next attribute identifier found in the stream. Should return <b>FALSE</b> when  enumeration of the record attribute identifiers should immediately stop.
     */
    Call(uAttribId, pValueStream, cbStreamSize, pvParam) {
        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, uAttribId, IntPtr, pValueStream, UInt32, cbStreamSize, pvParamMarshal, pvParam, BOOL)
        return result
    }

    /**
     * A PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK {
        /**
         * Creates a PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, IntPtr, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, IntPtr, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
