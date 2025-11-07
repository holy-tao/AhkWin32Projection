#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_DATA_DIRECTORY.ahk

/**
 * Represents the optional header format.
 * @remarks
 * 
 * The number of directories is not fixed. Check the <b>NumberOfRvaAndSizes</b> member before 
 *     looking for a specific directory.
 * 
 * The actual structure in WinNT.h is named <b>IMAGE_OPTIONAL_HEADER32</b> 
 *    and <b>IMAGE_OPTIONAL_HEADER</b> is defined as 
 *    <b>IMAGE_OPTIONAL_HEADER32</b>. However, if <b>_WIN64</b> is 
 *    defined, then <b>IMAGE_OPTIONAL_HEADER</b> is defined as 
 *    <b>IMAGE_OPTIONAL_HEADER64</b>.
 *    
 * 
 * 
 * ```cpp
 * typedef struct _IMAGE_OPTIONAL_HEADER64 {
 *  WORD        Magic;
 *  BYTE        MajorLinkerVersion;
 *  BYTE        MinorLinkerVersion;
 *  DWORD       SizeOfCode;
 *  DWORD       SizeOfInitializedData;
 *  DWORD       SizeOfUninitializedData;
 *  DWORD       AddressOfEntryPoint;
 *  DWORD       BaseOfCode;
 *  ULONGLONG   ImageBase;
 *  DWORD       SectionAlignment;
 *  DWORD       FileAlignment;
 *  WORD        MajorOperatingSystemVersion;
 *  WORD        MinorOperatingSystemVersion;
 *  WORD        MajorImageVersion;
 *  WORD        MinorImageVersion;
 *  WORD        MajorSubsystemVersion;
 *  WORD        MinorSubsystemVersion;
 *  DWORD       Win32VersionValue;
 *  DWORD       SizeOfImage;
 *  DWORD       SizeOfHeaders;
 *  DWORD       CheckSum;
 *  WORD        Subsystem;
 *  WORD        DllCharacteristics;
 *  ULONGLONG   SizeOfStackReserve;
 *  ULONGLONG   SizeOfStackCommit;
 *  ULONGLONG   SizeOfHeapReserve;
 *  ULONGLONG   SizeOfHeapCommit;
 *  DWORD       LoaderFlags;
 *  DWORD       NumberOfRvaAndSizes;
 *  IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
 * } IMAGE_OPTIONAL_HEADER64, *PIMAGE_OPTIONAL_HEADER64;
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-image_optional_header32
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_OPTIONAL_HEADER32 extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    Magic {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The major version number of the linker.
     * @type {Integer}
     */
    MajorLinkerVersion {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * The minor version number of the linker.
     * @type {Integer}
     */
    MinorLinkerVersion {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * The size of the code section, in bytes, or the sum of all such sections if there are multiple code 
     *       sections.
     * @type {Integer}
     */
    SizeOfCode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of the initialized data section, in bytes, or the sum of all such sections if there are multiple 
     *       initialized data sections.
     * @type {Integer}
     */
    SizeOfInitializedData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the uninitialized data section, in bytes, or the sum of all such sections if there are multiple 
     *       uninitialized data sections.
     * @type {Integer}
     */
    SizeOfUninitializedData {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A pointer to the entry point function, relative to the image base address. For executable files, this is 
     *       the starting address. For device drivers, this is the address of the initialization function. The entry point 
     *       function is optional for DLLs. When no entry point is present, this member is zero.
     * @type {Integer}
     */
    AddressOfEntryPoint {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to the beginning of the code section, relative to the image base.
     * @type {Integer}
     */
    BaseOfCode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A pointer to the beginning of the data section, relative to the image base.
     * @type {Integer}
     */
    BaseOfData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The preferred address of the first byte of the image when it is loaded in memory. This value is a multiple 
     *       of 64K bytes. The default value for DLLs is 0x10000000. The default value for applications is 0x00400000, except 
     *       on Windows CE where it is 0x00010000.
     * @type {Integer}
     */
    ImageBase {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The alignment of sections loaded in memory, in bytes. This value must be greater than or equal to the 
     *       <b>FileAlignment</b> member. The default value is the page size for the system.
     * @type {Integer}
     */
    SectionAlignment {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The alignment of the raw data of sections in the image file, in bytes. The value should be a power of 2 
     *       between 512 and 64K (inclusive). The default is 512. If the <b>SectionAlignment</b> member 
     *       is less than the system page size, this member must be the same as 
     *       <b>SectionAlignment</b>.
     * @type {Integer}
     */
    FileAlignment {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The major version number of the required operating system.
     * @type {Integer}
     */
    MajorOperatingSystemVersion {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * The minor version number of the required operating system.
     * @type {Integer}
     */
    MinorOperatingSystemVersion {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * The major version number of the image.
     * @type {Integer}
     */
    MajorImageVersion {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * The minor version number of the image.
     * @type {Integer}
     */
    MinorImageVersion {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * The major version number of the subsystem.
     * @type {Integer}
     */
    MajorSubsystemVersion {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * The minor version number of the subsystem.
     * @type {Integer}
     */
    MinorSubsystemVersion {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * This member is reserved and must be 0.
     * @type {Integer}
     */
    Win32VersionValue {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The size of the image, in bytes, including all headers. Must be a multiple of 
     *       <b>SectionAlignment</b>.
     * @type {Integer}
     */
    SizeOfImage {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The combined size of the following items, rounded to a multiple of the value specified in the 
     *       <b>FileAlignment</b> member.
     *       
     * 
     * <ul>
     * <li><b>e_lfanew</b> member of <b>IMAGE_DOS_HEADER</b></li>
     * <li>4 byte signature</li>
     * <li>size of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_file_header">IMAGE_FILE_HEADER</a>
     * </li>
     * <li>size of optional header</li>
     * <li>size of all section headers</li>
     * </ul>
     * @type {Integer}
     */
    SizeOfHeaders {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The image file checksum. The following files are validated at load time: all drivers, any DLL loaded at 
     *       boot time, and any DLL loaded into a critical system process.
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The subsystem required to run this image. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_UNKNOWN"></a><a id="image_subsystem_unknown"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_UNKNOWN</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown subsystem.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_NATIVE"></a><a id="image_subsystem_native"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_NATIVE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No subsystem required (device drivers and native system processes).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_WINDOWS_GUI"></a><a id="image_subsystem_windows_gui"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_WINDOWS_GUI</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows graphical user interface (GUI) subsystem.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_WINDOWS_CUI"></a><a id="image_subsystem_windows_cui"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_WINDOWS_CUI</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows character-mode user interface (CUI) subsystem.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_OS2_CUI"></a><a id="image_subsystem_os2_cui"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_OS2_CUI</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * OS/2 CUI subsystem.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_POSIX_CUI"></a><a id="image_subsystem_posix_cui"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_POSIX_CUI</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * POSIX CUI subsystem.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_WINDOWS_CE_GUI"></a><a id="image_subsystem_windows_ce_gui"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_WINDOWS_CE_GUI</b></dt>
     * <dt>9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows CE system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_EFI_APPLICATION"></a><a id="image_subsystem_efi_application"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_EFI_APPLICATION</b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Extensible Firmware Interface (EFI) application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER"></a><a id="image_subsystem_efi_boot_service_driver"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EFI driver with boot services.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER"></a><a id="image_subsystem_efi_runtime_driver"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER</b></dt>
     * <dt>12</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EFI driver with run-time services.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_EFI_ROM"></a><a id="image_subsystem_efi_rom"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_EFI_ROM</b></dt>
     * <dt>13</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EFI ROM image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_XBOX"></a><a id="image_subsystem_xbox"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_XBOX</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Xbox system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION"></a><a id="image_subsystem_windows_boot_application"></a><dl>
     * <dt><b>IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION</b></dt>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Boot application.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Subsystem {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }

    /**
     * The DLL characteristics of the image. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLL_CHARACTERISTICS_HIGH_ENTROPY_VA"></a><a id="image_dll_characteristics_high_entropy_va"></a><dl>
     * <dt><b>IMAGE_DLL_CHARACTERISTICS_HIGH_ENTROPY_VA</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ASLR with 64 bit address space.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE"></a><a id="image_dllcharacteristics_dynamic_base"></a><dl>
     * <dt><b>IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE</b></dt>
     * <dt>0x0040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DLL can be relocated at load time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY"></a><a id="image_dllcharacteristics_force_integrity"></a><dl>
     * <dt><b>IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY</b></dt>
     * <dt>0x0080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Code integrity checks are forced. If you set this flag and a section contains only uninitialized data, 
     *         set the <b>PointerToRawData</b> member of 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_section_header">IMAGE_SECTION_HEADER</a> for that section to 
     *         zero; otherwise, the image will fail to load because the digital signature cannot be verified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLLCHARACTERISTICS_NX_COMPAT"></a><a id="image_dllcharacteristics_nx_compat"></a><dl>
     * <dt><b>IMAGE_DLLCHARACTERISTICS_NX_COMPAT</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is compatible with data execution prevention (DEP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLLCHARACTERISTICS_NO_ISOLATION"></a><a id="image_dllcharacteristics_no_isolation"></a><dl>
     * <dt><b>IMAGE_DLLCHARACTERISTICS_NO_ISOLATION</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is isolation aware, but should not be isolated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLLCHARACTERISTICS_NO_SEH"></a><a id="image_dllcharacteristics_no_seh"></a><dl>
     * <dt><b>IMAGE_DLLCHARACTERISTICS_NO_SEH</b></dt>
     * <dt>0x0400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image does not use structured exception handling (SEH). No handlers can be called in this 
     *         image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLLCHARACTERISTICS_NO_BIND"></a><a id="image_dllcharacteristics_no_bind"></a><dl>
     * <dt><b>IMAGE_DLLCHARACTERISTICS_NO_BIND</b></dt>
     * <dt>0x0800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not bind the image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLL_CHARACTERISTICS_APPCONTAINER"></a><a id="image_dll_characteristics_appcontainer"></a><dl>
     * <dt><b>IMAGE_DLL_CHARACTERISTICS_APPCONTAINER</b></dt>
     * <dt>0x1000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Image should execute in an AppContainer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLLCHARACTERISTICS_WDM_DRIVER"></a><a id="image_dllcharacteristics_wdm_driver"></a><dl>
     * <dt><b>IMAGE_DLLCHARACTERISTICS_WDM_DRIVER</b></dt>
     * <dt>0x2000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A WDM driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLL_CHARACTERISTICS_GUARD_CF"></a><a id="image_dll_characteristics_guard_cf"></a><dl>
     * <dt><b>IMAGE_DLL_CHARACTERISTICS_GUARD_CF</b></dt>
     * <dt>0x4000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Image supports Control Flow Guard.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE"></a><a id="image_dllcharacteristics_terminal_server_aware"></a><dl>
     * <dt><b>IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE</b></dt>
     * <dt>0x8000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is terminal server aware.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DllCharacteristics {
        get => NumGet(this, 70, "ushort")
        set => NumPut("ushort", value, this, 70)
    }

    /**
     * The number of bytes to reserve for the stack. Only the memory specified by the 
     *       <b>SizeOfStackCommit</b> member is committed at load time; the rest is made available one 
     *       page at a time until this reserve size is reached.
     * @type {Integer}
     */
    SizeOfStackReserve {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The number of bytes to commit for the stack.
     * @type {Integer}
     */
    SizeOfStackCommit {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The number of bytes to reserve for the local heap. Only the memory specified by the 
     *       <b>SizeOfHeapCommit</b> member is committed at load time; the rest is made available one 
     *       page at a time until this reserve size is reached.
     * @type {Integer}
     */
    SizeOfHeapReserve {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The number of bytes to commit for the local heap.
     * @type {Integer}
     */
    SizeOfHeapCommit {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * This member is obsolete.
     * @deprecated
     * @type {Integer}
     */
    LoaderFlags {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The number of directory entries in the remainder of the optional header. Each entry describes a location 
     *       and size.
     * @type {Integer}
     */
    NumberOfRvaAndSizes {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * A pointer to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_data_directory">IMAGE_DATA_DIRECTORY</a> structure in the data 
     *  directory.
     * @type {Array<IMAGE_DATA_DIRECTORY>}
     */
    DataDirectory{
        get {
            if(!this.HasProp("__DataDirectoryProxyArray"))
                this.__DataDirectoryProxyArray := Win32FixedArray(this.ptr + 96, 16, IMAGE_DATA_DIRECTORY, "")
            return this.__DataDirectoryProxyArray
        }
    }
}
