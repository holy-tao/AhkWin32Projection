#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESUTIL_FILETIME_DATA.ahk" { RESUTIL_FILETIME_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\RESUTIL_LARGEINT_DATA.ahk" { RESUTIL_LARGEINT_DATA }
#Import ".\RESUTIL_ULARGEINT_DATA.ahk" { RESUTIL_ULARGEINT_DATA }

/**
 * Contains information about a cluster object property. An array of RESUTIL_PROPERTY_ITEM structures forms a property table which can be used in property operations.
 * @remarks
 * For more information about building parameter blocks and property tables, see 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/using-lists-and-tables">Using Lists and Tables</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-resutil_property_item
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct RESUTIL_PROPERTY_ITEM {
    #StructPack 8

    /**
     * The name of the property.
     */
    Name : PWSTR

    /**
     * Optional name of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">cluster database</a> subkey for 
     *       the property. This parameter can be <b>NULL</b>.
     */
    KeyName : PWSTR

    /**
     * Describes the format of the property such as <b>CLUSPROP_FORMAT_BINARY</b> or 
     *       <b>CLUSPROP_FORMAT_DWORD</b>. For a list of valid format values, see the 
     *       <b>wFormat</b> member of 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_syntax">CLUSPROP_SYNTAX</a>.
     */
    Format : UInt32

    DefaultPtr : IntPtr

    /**
     * Minimum data value for the property. For data values with the 
     *       <b>CLUSPROP_FORMAT_BINARY</b> and <b>CLUSPROP_FORMAT_MULTI_SZ</b> 
     *       formats, the <b>Minimum</b> member contains the byte size of the default data value 
     *       specified by <b>Default</b>.
     */
    Minimum : UInt32

    /**
     * Maximum data value for the property.
     */
    Maximum : UInt32

    /**
     * Bitmask that describes the property.
     */
    Flags : UInt32

    /**
     * Byte offset to the actual property data. The data is stored in a buffer known as a parameter block.
     */
    Offset : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Default', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'lpDefault', { type: IntPtr, offset: 24 })
        DefineProp(this.Prototype, 'LargeIntData', { type: RESUTIL_LARGEINT_DATA.Ptr, offset: 24 })
        DefineProp(this.Prototype, 'ULargeIntData', { type: RESUTIL_ULARGEINT_DATA.Ptr, offset: 24 })
        DefineProp(this.Prototype, 'FileTimeData', { type: RESUTIL_FILETIME_DATA.Ptr, offset: 24 })
        this.DeleteProp("__New")
    }
}
