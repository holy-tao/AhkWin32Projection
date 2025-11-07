#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes attributes of the typeInfo element in the property's .propdesc file.
 * @remarks
 * 
 * These values are defined in propsys.h and propsys.idl.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/ne-propsys-propdesc_type_flags
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_TYPE_FLAGS{

    /**
     * The property uses the default values for all attributes.
     * @type {Integer (UInt32)}
     */
    static PDTF_DEFAULT => 0

    /**
     * The property can have multiple values. These values are stored as a VT_VECTOR in the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. This value is set by the <i>multipleValues</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @type {Integer (UInt32)}
     */
    static PDTF_MULTIPLEVALUES => 1

    /**
     * This flag indicates that a property is read-only, and cannot be written to. This value is set by the <i>isInnate</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @type {Integer (UInt32)}
     */
    static PDTF_ISINNATE => 2

    /**
     * The property is a group heading. This value is set by the <i>isGroup</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @type {Integer (UInt32)}
     */
    static PDTF_ISGROUP => 4

    /**
     * The user can group by this property. This value is set by the <i>canGroupBy</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @type {Integer (UInt32)}
     */
    static PDTF_CANGROUPBY => 8

    /**
     * The user can stack by this property. This value is set by the <i>canStackBy</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @type {Integer (UInt32)}
     */
    static PDTF_CANSTACKBY => 16

    /**
     * This property contains a hierarchy. This value is set by the <i>isTreeProperty</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @type {Integer (UInt32)}
     */
    static PDTF_ISTREEPROPERTY => 32

    /**
     * <b>Deprecated in Windows 7 and later</b>. Include this property in any full text query that is performed. This value is set by the <i>includeInFullTextQuery</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @type {Integer (UInt32)}
     */
    static PDTF_INCLUDEINFULLTEXTQUERY => 64

    /**
     * This property is meant to be viewed by the user. This influences whether the property shows up in the "Choose Columns" dialog box, for example. This value is set by the <i>isViewable</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @type {Integer (UInt32)}
     */
    static PDTF_ISVIEWABLE => 128

    /**
     * <b>Deprecated in Windows 7 and later</b>. This property is included in the list of properties that can be queried. A queryable property must also be viewable. This influences whether the property shows up in the query builder UI. This value is set by the <i>isQueryable</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @type {Integer (UInt32)}
     */
    static PDTF_ISQUERYABLE => 256

    /**
     * <b>Windows Vista with Service Pack 1 (SP1) and later</b>. Used with an innate property (that is, a value calculated from other property values) to indicate that it can be deleted. This value is used by the <b>Remove Properties</b> UI to determine whether to display a check box next to a property that enables that property to be selected for removal. Note that a property that is not innate can always be purged regardless of the presence or absence of this flag.
     * @type {Integer (UInt32)}
     */
    static PDTF_CANBEPURGED => 512

    /**
     * <b>Windows 7 and later</b>. The unformatted (raw) property value should be used for searching.
     * @type {Integer (UInt32)}
     */
    static PDTF_SEARCHRAWVALUE => 1024

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static PDTF_DONTCOERCEEMPTYSTRINGS => 2048

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static PDTF_ALWAYSINSUPPLEMENTALSTORE => 4096

    /**
     * This property is owned by the system.
     * @type {Integer (UInt32)}
     */
    static PDTF_ISSYSTEMPROPERTY => 2147483648

    /**
     * A mask used to retrieve all flags.
     * @type {Integer (UInt32)}
     */
    static PDTF_MASK_ALL => 2147491839
}
