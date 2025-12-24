#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_DATA_DIRECTORY.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_COR20_HEADER extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MajorRuntimeVersion {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MinorRuntimeVersion {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {IMAGE_DATA_DIRECTORY}
     */
    MetaData{
        get {
            if(!this.HasProp("__MetaData"))
                this.__MetaData := IMAGE_DATA_DIRECTORY(8, this)
            return this.__MetaData
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    EntryPointToken {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    EntryPointRVA {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {IMAGE_DATA_DIRECTORY}
     */
    Resources{
        get {
            if(!this.HasProp("__Resources"))
                this.__Resources := IMAGE_DATA_DIRECTORY(24, this)
            return this.__Resources
        }
    }

    /**
     * @type {IMAGE_DATA_DIRECTORY}
     */
    StrongNameSignature{
        get {
            if(!this.HasProp("__StrongNameSignature"))
                this.__StrongNameSignature := IMAGE_DATA_DIRECTORY(32, this)
            return this.__StrongNameSignature
        }
    }

    /**
     * @type {IMAGE_DATA_DIRECTORY}
     */
    CodeManagerTable{
        get {
            if(!this.HasProp("__CodeManagerTable"))
                this.__CodeManagerTable := IMAGE_DATA_DIRECTORY(40, this)
            return this.__CodeManagerTable
        }
    }

    /**
     * @type {IMAGE_DATA_DIRECTORY}
     */
    VTableFixups{
        get {
            if(!this.HasProp("__VTableFixups"))
                this.__VTableFixups := IMAGE_DATA_DIRECTORY(48, this)
            return this.__VTableFixups
        }
    }

    /**
     * @type {IMAGE_DATA_DIRECTORY}
     */
    ExportAddressTableJumps{
        get {
            if(!this.HasProp("__ExportAddressTableJumps"))
                this.__ExportAddressTableJumps := IMAGE_DATA_DIRECTORY(56, this)
            return this.__ExportAddressTableJumps
        }
    }

    /**
     * @type {IMAGE_DATA_DIRECTORY}
     */
    ManagedNativeHeader{
        get {
            if(!this.HasProp("__ManagedNativeHeader"))
                this.__ManagedNativeHeader := IMAGE_DATA_DIRECTORY(64, this)
            return this.__ManagedNativeHeader
        }
    }
}
