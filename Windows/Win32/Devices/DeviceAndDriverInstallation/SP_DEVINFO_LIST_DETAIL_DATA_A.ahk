#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
    static sizeof => 288

    static packingSize => 8

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
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * If the device information set is for a remote computer, this member is a configuration manager machine handle for the remote computer. If the device information set is for the local computer, this member is <b>NULL</b>. 
     * 
     * This is typically the parameter that components use to access the remote computer. The <b>RemoteMachineName</b> contains a string, in case the component requires the name of the remote computer.
     * @type {HANDLE}
     */
    RemoteMachineHandle{
        get {
            if(!this.HasProp("__RemoteMachineHandle"))
                this.__RemoteMachineHandle := HANDLE(16, this)
            return this.__RemoteMachineHandle
        }
    }

    /**
     * A NULL-terminated string that contains the name of the remote computer. If the device information set is for the local computer, this member is an empty string.
     * @type {String}
     */
    RemoteMachineName {
        get => StrGet(this.ptr + 24, 262, "UTF-8")
        set => StrPut(value, this.ptr + 24, 262, "UTF-8")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 288
    }
}
