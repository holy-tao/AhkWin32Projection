#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HDEVINFO.ahk" { HDEVINFO }
#Import ".\SP_DEVINFO_DATA.ahk" { SP_DEVINFO_DATA }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct PSP_DETSIG_CMPPROC {
    value : IntPtr

    __value {
        set {
            if (value is PSP_DETSIG_CMPPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HDEVINFO} DeviceInfoSet 
     * @param {Pointer<SP_DEVINFO_DATA>} NewDeviceData 
     * @param {Pointer<SP_DEVINFO_DATA>} ExistingDeviceData 
     * @param {Pointer<Void>} CompareContext 
     * @returns {Integer} 
     */
    Call(DeviceInfoSet, NewDeviceData, ExistingDeviceData, CompareContext) {
        CompareContextMarshal := CompareContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HDEVINFO, DeviceInfoSet, SP_DEVINFO_DATA.Ptr, NewDeviceData, SP_DEVINFO_DATA.Ptr, ExistingDeviceData, CompareContextMarshal, CompareContext, UInt32)
        return result
    }

    /**
     * A PSP_DETSIG_CMPPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSP_DETSIG_CMPPROC {
        /**
         * Creates a PSP_DETSIG_CMPPROC pointer that invokes the given AHK function when called.
         * @param {Func(HDEVINFO, SP_DEVINFO_DATA, SP_DEVINFO_DATA, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HDEVINFO, SP_DEVINFO_DATA.Ptr, SP_DEVINFO_DATA.Ptr, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
