#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Defines the partition parameters of a partition style.
 * @remarks
 * 
  * The 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-changeattributes">IVdsAdvancedDisk::ChangeAttributes</a> 
  *     method takes this structure as a parameter.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-change_attributes_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class CHANGE_ATTRIBUTES_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Determines the partition parameters. Supported values are <b>VDS_PST_MBR</b> or 
     *       <b>VDS_PST_GPT</b>.
     * @type {Integer}
     */
    style {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _MbrPartInfo extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {BOOLEAN}
         */
        bootIndicator{
            get {
                if(!this.HasProp("__bootIndicator"))
                    this.__bootIndicator := BOOLEAN(this.ptr + 0)
                return this.__bootIndicator
            }
        }
    
    }

    class _GptPartInfo extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        attributes {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {_MbrPartInfo}
     */
    MbrPartInfo{
        get {
            if(!this.HasProp("__MbrPartInfo"))
                this.__MbrPartInfo := %this.__Class%._MbrPartInfo(this.ptr + 8)
            return this.__MbrPartInfo
        }
    }

    /**
     * @type {_GptPartInfo}
     */
    GptPartInfo{
        get {
            if(!this.HasProp("__GptPartInfo"))
                this.__GptPartInfo := %this.__Class%._GptPartInfo(this.ptr + 8)
            return this.__GptPartInfo
        }
    }
}
