#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * An SP_DEVINFO_LIST_DETAIL_DATA structure contains information about a device information set, such as its associated setup class GUID (if it has an associated setup class). (Unicode)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines SP_DEVINFO_LIST_DETAIL_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_devinfo_list_detail_data_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct SP_DEVINFO_LIST_DETAIL_DATA_W {
    #StructPack 8

    /**
     * The size, in bytes, of the SP_DEVINFO_LIST_DETAIL_DATA structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The setup class GUID that is associated with the device information set or GUID_NULL if there is no associated setup class.
     */
    ClassGuid : Guid

    /**
     * If the device information set is for a remote computer, this member is a configuration manager machine handle for the remote computer. If the device information set is for the local computer, this member is <b>NULL</b>. 
     * 
     * This is typically the parameter that components use to access the remote computer. The <b>RemoteMachineName</b> contains a string, in case the component requires the name of the remote computer.
     */
    RemoteMachineHandle : HANDLE

    /**
     * A NULL-terminated string that contains the name of the remote computer. If the device information set is for the local computer, this member is an empty string.
     */
    RemoteMachineName : WCHAR[263]

}
