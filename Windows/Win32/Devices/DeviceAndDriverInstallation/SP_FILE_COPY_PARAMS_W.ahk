#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The SP_FILE_COPY_PARAMS structure describes a single file copy operation. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines SP_FILE_COPY_PARAMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_file_copy_params_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct SP_FILE_COPY_PARAMS_W {
    #StructPack 8

    /**
     * Size of the structure, in bytes. Set to the value: <c>sizeof(SP_FILE_COPY_PARAMS)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * Handle to a setup file queue, as returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupopenfilequeue">SetupOpenFileQueue</a>.
     */
    QueueHandle : IntPtr

    /**
     * Optional pointer to the root of the source for this copy, such as A:\.
     */
    SourceRootPath : PWSTR

    /**
     * Optional pointer to the path relative to <b>SourceRootPath</b> where the file can be found.
     */
    SourcePath : PWSTR

    /**
     * File name part of the file to be copied.
     */
    SourceFilename : PWSTR

    /**
     * Optional pointer to a description of the source media to be used during disk prompts.
     */
    SourceDescription : PWSTR

    /**
     * Optional pointer to a tag file whose presence at <b>SourceRootPath</b> indicates the presence of the source media. If not specified, the file itself will be used as the tag file if required.
     */
    SourceTagfile : PWSTR

    /**
     * Directory where the file is to be copied.
     */
    TargetDirectory : PWSTR

    /**
     * Optional pointer to the name of the target file. If not specified, the target file will have the same name as the source file.
     */
    TargetFilename : PWSTR

    CopyStyle : UInt32

    /**
     * Handle to the INF to use to obtain source information.
     */
    LayoutInf : IntPtr

    /**
     * An optional Security Descriptor String specifying the ACL to apply to the file.
     */
    SecurityDescriptor : PWSTR

}
