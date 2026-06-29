#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\GPT_ATTRIBUTES.ahk" { GPT_ATTRIBUTES }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains GUID partition table (GPT) partition information.
 * @remarks
 * The GPT partition format is required for disks that are used to boot computers that use 
 *     Extended Firmware Interface (EFI) firmware. GPT data disks can reside on x86, x64, and Itanium-based 
 *     architectures.
 * 
 * Starting with 
 *     Windows Server 2003 with SP1, GPT is supported on all Windows platforms, not only platforms that use 
 *     EFI.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-partition_information_gpt
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PARTITION_INFORMATION_GPT {
    #StructPack 8

    /**
     * A <b>GUID</b> that identifies the partition type.
     * 
     * Each partition type that the EFI specification supports is identified by its own 
     *        <b>GUID</b>, which is published by the developer of the partition.
     */
    PartitionType : Guid

    /**
     * The GUID of the partition.
     */
    PartitionId : Guid

    /**
     * The Extensible Firmware Interface (EFI) attributes of the partition.
     */
    Attributes : GPT_ATTRIBUTES

    /**
     * A wide-character string that describes the partition.
     */
    Name : WCHAR[36]

}
