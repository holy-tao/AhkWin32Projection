#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
    static sizeof => 88

    static packingSize => 1

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
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * Optional pointer to the root of the source for this copy, such as A:\.
     * @type {PWSTR}
     */
    SourceRootPath{
        get {
            if(!this.HasProp("__SourceRootPath"))
                this.__SourceRootPath := PWSTR(this.ptr + 12)
            return this.__SourceRootPath
        }
    }

    /**
     * Optional pointer to the path relative to <b>SourceRootPath</b> where the file can be found.
     * @type {PWSTR}
     */
    SourcePath{
        get {
            if(!this.HasProp("__SourcePath"))
                this.__SourcePath := PWSTR(this.ptr + 20)
            return this.__SourcePath
        }
    }

    /**
     * File name part of the file to be copied.
     * @type {PWSTR}
     */
    SourceFilename{
        get {
            if(!this.HasProp("__SourceFilename"))
                this.__SourceFilename := PWSTR(this.ptr + 28)
            return this.__SourceFilename
        }
    }

    /**
     * Optional pointer to a description of the source media to be used during disk prompts.
     * @type {PWSTR}
     */
    SourceDescription{
        get {
            if(!this.HasProp("__SourceDescription"))
                this.__SourceDescription := PWSTR(this.ptr + 36)
            return this.__SourceDescription
        }
    }

    /**
     * Optional pointer to a tag file whose presence at <b>SourceRootPath</b> indicates the presence of the source media. If not specified, the file itself will be used as the tag file if required.
     * @type {PWSTR}
     */
    SourceTagfile{
        get {
            if(!this.HasProp("__SourceTagfile"))
                this.__SourceTagfile := PWSTR(this.ptr + 44)
            return this.__SourceTagfile
        }
    }

    /**
     * Directory where the file is to be copied.
     * @type {PWSTR}
     */
    TargetDirectory{
        get {
            if(!this.HasProp("__TargetDirectory"))
                this.__TargetDirectory := PWSTR(this.ptr + 52)
            return this.__TargetDirectory
        }
    }

    /**
     * Optional pointer to the name of the target file. If not specified, the target file will have the same name as the source file.
     * @type {PWSTR}
     */
    TargetFilename{
        get {
            if(!this.HasProp("__TargetFilename"))
                this.__TargetFilename := PWSTR(this.ptr + 60)
            return this.__TargetFilename
        }
    }

    /**
     * 
     * @type {Integer}
     */
    CopyStyle {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Handle to the INF to use to obtain source information.
     * @type {Pointer<Void>}
     */
    LayoutInf {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * An optional Security Descriptor String specifying the ACL to apply to the file.
     * @type {PWSTR}
     */
    SecurityDescriptor{
        get {
            if(!this.HasProp("__SecurityDescriptor"))
                this.__SecurityDescriptor := PWSTR(this.ptr + 80)
            return this.__SecurityDescriptor
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 88
    }
}
