#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An SP_DEVINFO_LIST_DETAIL_DATA structure contains information about a device information set, such as its associated setup class GUID (if it has an associated setup class). (ANSI)
 * @remarks
 * > [!NOTE]
  * > The setupapi.h header defines SP_DEVINFO_LIST_DETAIL_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_devinfo_list_detail_data_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_DEVINFO_LIST_DETAIL_DATA_A extends Win32Struct
{
    static sizeof => 283

    static packingSize => 1

    /**
     * The size, in bytes, of the SP_DEVINFO_LIST_DETAIL_DATA structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The setup class GUID that is associated with the device information set or GUID_NULL if there is no associated setup class.
     * @type {Pointer<Guid>}
     */
    ClassGuid {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * If the device information set is for a remote computer, this member is a configuration manager machine handle for the remote computer. If the device information set is for the local computer, this member is <b>NULL</b>. 
     * 
     * This is typically the parameter that components use to access the remote computer. The <b>RemoteMachineName</b> contains a string, in case the component requires the name of the remote computer.
     * @type {Pointer<HANDLE>}
     */
    RemoteMachineHandle {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * A NULL-terminated string that contains the name of the remote computer. If the device information set is for the local computer, this member is an empty string.
     * @type {Array<SByte>}
     */
    RemoteMachineName{
        get {
            if(!this.HasProp("__RemoteMachineNameProxyArray"))
                this.__RemoteMachineNameProxyArray := Win32FixedArray(this.ptr + 20, 263, Primitive, "char")
            return this.__RemoteMachineNameProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 283
    }
}
