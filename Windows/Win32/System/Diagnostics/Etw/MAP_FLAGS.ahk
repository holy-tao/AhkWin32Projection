#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constant values that indicate if the map is a value map, bitmap, or pattern map.
 * @remarks
 * 
 * The following MOF example shows the flags that are set based on the WMI property attributes used. 
 * 
 * <pre class="syntax" xml:space="preserve"><code>Sets the EVENTMAP_INFO_FLAG_WBEM_VALUEMAP and EVENTMAP_INFO_FLAG_WBEM_NO_MAP flags.
 * [WmiDataId(1),
 * Values {"ValueIndex1", "ValueIndex2", "ValueIndex3"}] 
 * uint32  Data1;
 * 
 * Sets the EVENTMAP_INFO_FLAG_WBEM_VALUEMAP flag.
 * [WmiDataId(2),
 * ValueMap {"1", "3", "5", "0", "-1"},
 * Values {"ValueMap1", "ValueMap3", "ValueMap5", "ValueMap0", "ValueMap-1", "Other"}] 
 * sint32  Data2;
 * 
 * Sets the EVENTMAP_INFO_FLAG_WBEM_VALUEMAP and EVENTMAP_INFO_FLAG_WBEM_FLAG flags.
 * [WmiDataId(3),
 * ValueType("flag"),
 * ValueMap {"0x01", "0x02", "0x04", "0x08"},
 * Values {"ValueMapFlag1", "ValueMapFlag2", "ValueMapFlag4", "ValueMapFlag8"}]
 * uint32  Data3;
 * 
 * Sets the EVENTMAP_INFO_FLAG_WBEM_VALUEMAP flag.
 * [WmiDataId(4),
 * ValueType("index"),
 * ValueMap {"1", "3", "5", "0", "-1"},
 * Values {"ValueMapIndex1", "ValueMapIndex3", "ValueMapIndex5", "ValueMapIndex0", "ValueMapIndex-1"}]
 * sint32  Data4;
 * 
 * Sets the EVENTMAP_INFO_FLAG_WBEM_BITMAP and EVENTMAP_INFO_FLAG_WBEM_NO_MAP flags.
 * [WmiDataId(5),
 * BitValues {"BitValueIndex1", "BitValueIndex2", "BitValueIndex3"}]
 * uint32  Data5;
 * 
 * Sets the EVENTMAP_INFO_FLAG_WBEM_BITMAP flag
 * [WmiDataId(6),
 * BitMap {"1", "3", "5", "0"},
 * BitValues {"BitMap1", "BitMap3", "BitMap5", "BitMap0", "Other"}]
 * uint32  Data6;</code></pre>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tdh/ne-tdh-map_flags
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class MAP_FLAGS{

    /**
     * The manifest value map maps integer values to strings. For details, see the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-maptype-complextype">MapType</a> complex type.
     * @type {Integer (Int32)}
     */
    static EVENTMAP_INFO_FLAG_MANIFEST_VALUEMAP => 1

    /**
     * The manifest value map maps bit values to strings. For details, see the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-maptype-complextype">MapType</a> complex type.
     * @type {Integer (Int32)}
     */
    static EVENTMAP_INFO_FLAG_MANIFEST_BITMAP => 2

    /**
     * The manifest value map uses regular expressions to map one name to another name. For details, see the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-patternmaptype-complextype">PatternMapType</a> complex type.
     * @type {Integer (Int32)}
     */
    static EVENTMAP_INFO_FLAG_MANIFEST_PATTERNMAP => 4

    /**
     * The WMI value map maps integer values to strings. For details, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/value-map">ValueMap and Value Qualifiers</a>.
     * @type {Integer (Int32)}
     */
    static EVENTMAP_INFO_FLAG_WBEM_VALUEMAP => 8

    /**
     * The WMI value map maps bit values to strings. For details, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/bitmap-and-bitvalues">BitMap and BitValue Qualifiers</a>.
     * @type {Integer (Int32)}
     */
    static EVENTMAP_INFO_FLAG_WBEM_BITMAP => 16

    /**
     * This flag can be combined with the EVENTMAP_INFO_FLAG_WBEM_VALUEMAP flag to indicate that the ValueMap qualifier contains bit (flag) values instead of index values.
     * @type {Integer (Int32)}
     */
    static EVENTMAP_INFO_FLAG_WBEM_FLAG => 32

    /**
     * This flag can be combined with the EVENTMAP_INFO_FLAG_WBEM_VALUEMAP or EVENTMAP_INFO_FLAG_WBEM_BITMAP flag to indicate that the MOF class property contains a BitValues or Values qualifier but does not contain the BitMap or ValueMap qualifier.
     * @type {Integer (Int32)}
     */
    static EVENTMAP_INFO_FLAG_WBEM_NO_MAP => 64
}
