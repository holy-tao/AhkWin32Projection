#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PRJ_FILE_BASIC_INFO.ahk
#Include .\PRJ_PLACEHOLDER_VERSION_INFO.ahk

/**
 * A buffer of metadata for the placeholder file or directory.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_placeholder_info
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_PLACEHOLDER_INFO extends Win32Struct
{
    static sizeof => 344

    static packingSize => 8

    class _EaInformation extends Win32Struct {
        static sizeof => 344
        static packingSize => 8

        /**
         * @type {Integer}
         */
        EaBufferSize {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        OffsetToFirstEa {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _SecurityInformation extends Win32Struct {
        static sizeof => 344
        static packingSize => 8

        /**
         * @type {Integer}
         */
        SecurityBufferSize {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        OffsetToSecurityDescriptor {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _StreamsInformation extends Win32Struct {
        static sizeof => 344
        static packingSize => 8

        /**
         * @type {Integer}
         */
        StreamsInfoBufferSize {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        OffsetToFirstStreamInfo {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    /**
     * A structure that supplies basic information about the item: the size of the file in bytes (should be zero if the IsDirectory field is set to TRUE), the item’s timestamps, and its attributes.
     * @type {PRJ_FILE_BASIC_INFO}
     */
    FileBasicInfo{
        get {
            if(!this.HasProp("__FileBasicInfo"))
                this.__FileBasicInfo := PRJ_FILE_BASIC_INFO(this.ptr + 0)
            return this.__FileBasicInfo
        }
    }

    /**
     * A structure that supplies extended attribute (EA) information about the item.
     * @type {_EaInformation}
     */
    EaInformation{
        get {
            if(!this.HasProp("__EaInformation"))
                this.__EaInformation := %this.__Class%._EaInformation(this.ptr + 56)
            return this.__EaInformation
        }
    }

    /**
     * Supplies custom security descriptor information about the item.
     * @type {_SecurityInformation}
     */
    SecurityInformation{
        get {
            if(!this.HasProp("__SecurityInformation"))
                this.__SecurityInformation := %this.__Class%._SecurityInformation(this.ptr + 64)
            return this.__SecurityInformation
        }
    }

    /**
     * Supplies information about alternate data streams for the item.
     * @type {_StreamsInformation}
     */
    StreamsInformation{
        get {
            if(!this.HasProp("__StreamsInformation"))
                this.__StreamsInformation := %this.__Class%._StreamsInformation(this.ptr + 72)
            return this.__StreamsInformation
        }
    }

    /**
     * @type {PRJ_PLACEHOLDER_VERSION_INFO}
     */
    VersionInfo{
        get {
            if(!this.HasProp("__VersionInfo"))
                this.__VersionInfo := PRJ_PLACEHOLDER_VERSION_INFO(this.ptr + 80)
            return this.__VersionInfo
        }
    }

    /**
     * Start of the variable-length buffer to hold EAs, a custom security descriptor, and alternate data stream information.
     * @type {Array<Byte>}
     */
    VariableData{
        get {
            if(!this.HasProp("__VariableDataProxyArray"))
                this.__VariableDataProxyArray := Win32FixedArray(this.ptr + 336, 1, Primitive, "char")
            return this.__VariableDataProxyArray
        }
    }
}
