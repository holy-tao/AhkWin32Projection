#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include .\DB_NUMERIC.ahk
#Include .\DBTIMESTAMP.ahk
#Include .\DBOBJECT.ahk

/**
 * SSVARIANT Structure in SQL Server Native Client
 * @remarks
 * When DataTypeCompat==80, several **SSVARIANT** subtypes become strings. For example, the following vt values will appear in **SSVARIANT** as VT_SS_WVARSTRING:  
 *   
 * -   VT_SS_DATETIMEOFFSET  
 *   
 * -   VT_SS_DATETIME2  
 *   
 * -   VT_SS_TIME2  
 *   
 * -   VT_SS_DATE  
 *   
 *  When DateTypeCompat == 0, these types will appear in their native form.  
 *   
 *  For more information about SSPROP_INIT_DATATYPECOMPATIBILITY, see [Using Connection String Keywords with SQL Server Native Client](../../relational-databases/native-client/applications/using-connection-string-keywords-with-sql-server-native-client.md).  
 *   
 *  The sqlncli.h file contains variant access macros that simplify dereferencing the member types in the **SSVARIANT** structure. An example is V_SS_DATETIMEOFFSET, which you can use as follows:  
 *   
 * ```  
 * memcpy(&V_SS_DATETIMEOFFSET(pssVar).tsoDateTimeOffsetVal, pDTO, cbNative);  
 * V_SS_DATETIMEOFFSET(pssVar).bScale = bScale;  
 * ```  
 *   
 *  For the complete set of access macros for each member of the **SSVARIANT** structure, refer to the sqlncli.hi file.  
 *   
 *  The following table describes the members of the **SSVARIANT** structure:  
 *   
 * |Member|OLE DB type indicator|OLE DB C data type|vt value|Comments|  
 * |------------|---------------------------|------------------------|--------------|--------------|  
 * |vt|SSVARTYPE|||Specifies the type of value contained in the **SSVARIANT** struct.|  
 * |bTinyIntVal|DBTYPE_UI1|**BYTE**|**VT_SS_UI1**|Supports the **tinyint**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.|  
 * |sShortIntVal|DBTYPE_I2|**SHORT**|**VT_SS_I2**|Supports the **smallint**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.|  
 * |lIntVal|DBTYPE_I4|**LONG**|**VT_SS_I4**|Supports the **int**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.|  
 * |llBigIntVal|DBTYPE_I8|**LARGE_INTEGER**|**VT_SS_I8**|Supports the **bigint**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.|  
 * |fltRealVal|DBTYPE_R4|**float**|**VT_SS_R4**|Supports the **real**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.|  
 * |dblFloatVal|DBTYPE_R8|**double**|**VT_SS_R8**|Supports the **float**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.|  
 * |cyMoneyVal|DBTYPE_CY|**LARGE_INTEGER**|**VT_SS_MONEY VT_SS_SMALLMONEY**|Supports the **money** and **smallmoney**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data types.|  
 * |fBitVal|DBTYPE_BOOL|**VARIANT_BOOL**|**VT_SS_BIT**|Supports the **bit**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.|  
 * |rgbGuidVal|DBTYPE_GUID|**GUID**|**VT_SS_GUID**|Supports the **uniqueidentifier**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.|  
 * |numNumericVal|DBTYPE_NUMERIC|**DB_NUMERIC**|**VT_SS_NUMERIC**|Supports the **numeric**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.|  
 * |dDateVal|DBTYPE_DATE|**DBDATE**|**VT_SS_DATE**|Supports the **date**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.|  
 * |tsDateTimeVal|DBTYPE_DBTIMESTAMP|**DBTIMESTAMP**|**VT_SS_SMALLDATETIME VT_SS_DATETIME VT_SS_DATETIME2**|Supports the **smalldatetime**, **datetime**, and **datetime2**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data types.|  
 * |Time2Val|DBTYPE_DBTIME2|**DBTIME2**|**VT_SS_TIME2**|Supports the **time**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.<br /><br /> Includes the following members:<br /><br /> *tTime2Val* (**DBTIME2**)<br /><br /> *bScale* (**BYTE**) Specifies the scale for *tTime2Val* value.|  
 * |DateTimeVal|DBTYPE_DBTIMESTAMP|**DBTIMESTAMP**|**VT_SS_DATETIME2**|Supports the **datetime2**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.<br /><br /> Includes the following members:<br /><br /> *tsDataTimeVal* (DBTIMESTAMP)<br /><br /> *bScale* (**BYTE**) Specifies the scale for *tsDataTimeVal* value.|  
 * |DateTimeOffsetVal|DBTYPE_DBTIMESTAMPOFSET|**DBTIMESTAMPOFFSET**|**VT_SS_DATETIMEOFFSET**|Supports the **datetimeoffset**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data type.<br /><br /> Includes the following members:<br /><br /> *tsoDateTimeOffsetVal* (**DBTIMESTAMPOFFSET**)<br /><br /> *bScale* (**BYTE**) Specifies the scale for *tsoDateTimeOffsetVal* value.|  
 * |NCharVal|No corresponding OLE DB type indicator.|**struct _NCharVal**|**VT_SS_WVARSTRING,**<br /><br /> **VT_SS_WSTRING**|Supports the **nchar** and **nvarchar**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data types.<br /><br /> Includes the following members:<br /><br /> *sActualLength* (**SHORT**) Specifies the actual length for the string to which *pwchNCharVal* points. Does not include terminating zero.<br /><br /> *sMaxLength* (**SHORT**) Specifies the maximum length for the string to which *pwchNCharVal* points.<br /><br /> *pwchNCharVal* (**WCHAR** \*) Pointer to the string.<br /><br /> Unused members: *rgbReserved*, *dwReserved*, and *pwchReserved*.|  
 * |CharVal|No corresponding OLE DB type indicator.|**struct _CharVal**|**VT_SS_STRING,**<br /><br /> **VT_SS_VARSTRING**|Supports the **char** and **varchar**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data types.<br /><br /> Includes the following members:<br /><br /> *sActualLength* (**SHORT**) Specifies the actual length for the string to which *pchCharVal* points. Does not include terminating zero.<br /><br /> *sMaxLength* (**SHORT**) Specifies the maximum length for the string to which *pchCharVal* points.<br /><br /> *pchCharVal* (**CHAR** \*) Pointer to the string.<br /><br /> Unused members:<br /><br /> *rgbReserved*, *dwReserved*, and *pwchReserved*.|  
 * |BinaryVal|No corresponding OLE DB type indicator.|**struct _BinaryVal**|**VT_SS_VARBINARY,**<br /><br /> **VT_SS_BINARY**|Supports the **binary** and **varbinary**[!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] data types.<br /><br /> Includes the following members:<br /><br /> *sActualLength* (**SHORT**) Specifies the actual length for the data to which *prgbBinaryVal* points.<br /><br /> *sMaxLength* (**SHORT**) Specifies the maximum length for the data to which *prgbBinaryVal* points.<br /><br /> *prgbBinaryVal* (**BYTE** \*) Pointer to the binary data.<br /><br /> Unused member: *dwReserved*.|  
 * |UnknownType|UNUSED|UNUSED|UNUSED|UNUSED|  
 * |BLOBType|UNUSED|UNUSED|UNUSED|UNUSED|
 * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-data-types/ssvariant-structure
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SSVARIANT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    vt {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    class _NCharVal extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        sActualLength {
            get => NumGet(this, 0, "short")
            set => NumPut("short", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        sMaxLength {
            get => NumGet(this, 2, "short")
            set => NumPut("short", value, this, 2)
        }
    
        /**
         * @type {PWSTR}
         */
        pwchNCharVal {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Array<Byte>}
         */
        rgbReserved{
            get {
                if(!this.HasProp("__rgbReservedProxyArray"))
                    this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 16, 5, Primitive, "char")
                return this.__rgbReservedProxyArray
            }
        }
    
        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {PWSTR}
         */
        pwchReserved {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
    }

    class _CharVal extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        sActualLength {
            get => NumGet(this, 0, "short")
            set => NumPut("short", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        sMaxLength {
            get => NumGet(this, 2, "short")
            set => NumPut("short", value, this, 2)
        }
    
        /**
         * @type {PSTR}
         */
        pchCharVal {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Array<Byte>}
         */
        rgbReserved{
            get {
                if(!this.HasProp("__rgbReservedProxyArray"))
                    this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 16, 5, Primitive, "char")
                return this.__rgbReservedProxyArray
            }
        }
    
        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {PWSTR}
         */
        pwchReserved {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
    }

    class _BinaryVal extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        sActualLength {
            get => NumGet(this, 0, "short")
            set => NumPut("short", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        sMaxLength {
            get => NumGet(this, 2, "short")
            set => NumPut("short", value, this, 2)
        }
    
        /**
         * @type {Pointer<Integer>}
         */
        prgbBinaryVal {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    class _UnknownType extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwActualLength {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        rgMetadata{
            get {
                if(!this.HasProp("__rgMetadataProxyArray"))
                    this.__rgMetadataProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
                return this.__rgMetadataProxyArray
            }
        }
    
        /**
         * @type {Pointer<Integer>}
         */
        pUnknownData {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
    }

    class _BLOBType extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {DBOBJECT}
         */
        dbobj{
            get {
                if(!this.HasProp("__dbobj"))
                    this.__dbobj := DBOBJECT(0, this)
                return this.__dbobj
            }
        }
    
        /**
         * @type {IUnknown}
         */
        pUnk {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    /**
     * @type {Integer}
     */
    bTinyIntVal {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    sShortIntVal {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    lIntVal {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    llBigIntVal {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Float}
     */
    fltRealVal {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    dblFloatVal {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * @type {CY}
     */
    cyMoneyVal{
        get {
            if(!this.HasProp("__cyMoneyVal"))
                this.__cyMoneyVal := CY(16, this)
            return this.__cyMoneyVal
        }
    }

    /**
     * @type {_NCharVal}
     */
    NCharVal{
        get {
            if(!this.HasProp("__NCharVal"))
                this.__NCharVal := %this.__Class%._NCharVal(16, this)
            return this.__NCharVal
        }
    }

    /**
     * @type {_CharVal}
     */
    CharVal{
        get {
            if(!this.HasProp("__CharVal"))
                this.__CharVal := %this.__Class%._CharVal(16, this)
            return this.__CharVal
        }
    }

    /**
     * @type {VARIANT_BOOL}
     */
    fBitVal {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbGuidVal{
        get {
            if(!this.HasProp("__rgbGuidValProxyArray"))
                this.__rgbGuidValProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__rgbGuidValProxyArray
        }
    }

    /**
     * @type {DB_NUMERIC}
     */
    numNumericVal{
        get {
            if(!this.HasProp("__numNumericVal"))
                this.__numNumericVal := DB_NUMERIC(16, this)
            return this.__numNumericVal
        }
    }

    /**
     * @type {_BinaryVal}
     */
    BinaryVal{
        get {
            if(!this.HasProp("__BinaryVal"))
                this.__BinaryVal := %this.__Class%._BinaryVal(16, this)
            return this.__BinaryVal
        }
    }

    /**
     * @type {DBTIMESTAMP}
     */
    tsDateTimeVal{
        get {
            if(!this.HasProp("__tsDateTimeVal"))
                this.__tsDateTimeVal := DBTIMESTAMP(16, this)
            return this.__tsDateTimeVal
        }
    }

    /**
     * @type {_UnknownType}
     */
    UnknownType{
        get {
            if(!this.HasProp("__UnknownType"))
                this.__UnknownType := %this.__Class%._UnknownType(16, this)
            return this.__UnknownType
        }
    }

    /**
     * @type {_BLOBType}
     */
    BLOBType{
        get {
            if(!this.HasProp("__BLOBType"))
                this.__BLOBType := %this.__Class%._BLOBType(16, this)
            return this.__BLOBType
        }
    }
}
