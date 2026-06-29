#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The NTMS_ALLOCATION_INFORMATION structure contains information about the source media pool from which a medium was taken.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_allocation_information
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_ALLOCATION_INFORMATION {
    #StructPack 8

    /**
     * Size of the structure.
     */
    dwSize : UInt32

    /**
     * Reserved.
     */
    lpReserved : IntPtr

    /**
     * Unique identifier of the original source of the media.
     */
    AllocatedFrom : Guid

}
