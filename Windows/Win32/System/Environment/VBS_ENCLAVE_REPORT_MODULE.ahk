#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VBS_ENCLAVE_REPORT_VARDATA_HEADER.ahk

/**
 * Describes a module loaded for the enclave.
 * @see https://learn.microsoft.com/windows/win32/api/ntenclv/ns-ntenclv-vbs_enclave_report_module
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class VBS_ENCLAVE_REPORT_MODULE extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The variable data header for the report.
     * @type {VBS_ENCLAVE_REPORT_VARDATA_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := VBS_ENCLAVE_REPORT_VARDATA_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * The enclave unique identifier of the module.
     * @type {Array<Byte>}
     */
    UniqueId{
        get {
            if(!this.HasProp("__UniqueIdProxyArray"))
                this.__UniqueIdProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "char")
            return this.__UniqueIdProxyArray
        }
    }

    /**
     * The author identifier of the module.
     * @type {Array<Byte>}
     */
    AuthorId{
        get {
            if(!this.HasProp("__AuthorIdProxyArray"))
                this.__AuthorIdProxyArray := Win32FixedArray(this.ptr + 40, 32, Primitive, "char")
            return this.__AuthorIdProxyArray
        }
    }

    /**
     * The family identifier of the module.
     * @type {Array<Byte>}
     */
    FamilyId{
        get {
            if(!this.HasProp("__FamilyIdProxyArray"))
                this.__FamilyIdProxyArray := Win32FixedArray(this.ptr + 72, 16, Primitive, "char")
            return this.__FamilyIdProxyArray
        }
    }

    /**
     * The image identifier of the module.
     * @type {Array<Byte>}
     */
    ImageId{
        get {
            if(!this.HasProp("__ImageIdProxyArray"))
                this.__ImageIdProxyArray := Win32FixedArray(this.ptr + 88, 16, Primitive, "char")
            return this.__ImageIdProxyArray
        }
    }

    /**
     * The security version number of the module.
     * @type {Integer}
     */
    Svn {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * A NULL-terminated string that contains the name of the module as it was loaded into the enclave.
     * @type {String}
     */
    ModuleName {
        get => StrGet(this.ptr + 108, 0, "UTF-16")
        set => StrPut(value, this.ptr + 108, 0, "UTF-16")
    }
}
