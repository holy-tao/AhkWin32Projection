#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SP_FILE_COPY_PARAMS structure describes a single file copy operation. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines SP_FILE_COPY_PARAMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_file_copy_params_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_FILE_COPY_PARAMS_W extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Size of the structure, in bytes. Set to the value: <c>sizeof(SP_FILE_COPY_PARAMS)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Handle to a setup file queue, as returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupopenfilequeue">SetupOpenFileQueue</a>.
     * @type {Pointer<Void>}
     */
    QueueHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional pointer to the root of the source for this copy, such as A:\.
     * @type {PWSTR}
     */
    SourceRootPath {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Optional pointer to the path relative to <b>SourceRootPath</b> where the file can be found.
     * @type {PWSTR}
     */
    SourcePath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * File name part of the file to be copied.
     * @type {PWSTR}
     */
    SourceFilename {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Optional pointer to a description of the source media to be used during disk prompts.
     * @type {PWSTR}
     */
    SourceDescription {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Optional pointer to a tag file whose presence at <b>SourceRootPath</b> indicates the presence of the source media. If not specified, the file itself will be used as the tag file if required.
     * @type {PWSTR}
     */
    SourceTagfile {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Directory where the file is to be copied.
     * @type {PWSTR}
     */
    TargetDirectory {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Optional pointer to the name of the target file. If not specified, the target file will have the same name as the source file.
     * @type {PWSTR}
     */
    TargetFilename {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * 
     * @type {Integer}
     */
    CopyStyle {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Handle to the INF to use to obtain source information.
     * @type {Pointer<Void>}
     */
    LayoutInf {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * An optional Security Descriptor String specifying the ACL to apply to the file.
     * @type {PWSTR}
     */
    SecurityDescriptor {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 96
    }
}
