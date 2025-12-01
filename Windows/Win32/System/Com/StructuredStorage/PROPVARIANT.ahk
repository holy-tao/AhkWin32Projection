#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\CY.ahk
#Include ..\..\..\Foundation\FILETIME.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\BSTRBLOB.ahk
#Include ..\BLOB.ahk
#Include .\CAC.ahk
#Include .\CAUB.ahk
#Include .\CAI.ahk
#Include .\CAUI.ahk
#Include .\CAL.ahk
#Include .\CAUL.ahk
#Include .\CAH.ahk
#Include .\CAUH.ahk
#Include .\CAFLT.ahk
#Include .\CADBL.ahk
#Include .\CABOOL.ahk
#Include .\CASCODE.ahk
#Include .\CACY.ahk
#Include .\CADATE.ahk
#Include .\CAFILETIME.ahk
#Include .\CACLSID.ahk
#Include .\CACLIPDATA.ahk
#Include .\CABSTR.ahk
#Include .\CABSTRBLOB.ahk
#Include .\CALPSTR.ahk
#Include .\CALPWSTR.ahk
#Include .\CAPROPVARIANT.ahk
#Include ..\..\..\Foundation\DECIMAL.ahk

/**
 * The PROPVARIANT structure is used in the ReadMultiple and WriteMultiple methods of IPropertyStorage to define the type tag and the value of a property in a property set.
 * @remarks
 * The 
 * <b>PROPVARIANT</b> structure can also hold a value of <b>VT_DECIMAL</b>:
 * 
 * 
 * ``` syntax
 *     DECIMAL       decVal;        //VT_DECIMAL
 * ```
 * 
 * However, the value of the <b>DECIMAL</b> structure requires special handling. The <b>DECIMAL</b> structure is the same size as an entire 
 * <b>PROPVARIANT</b> structure and does not fit into the union that holds all other types of values. Instead, the value of the <b>DECIMAL</b> structure occupies the entire 
 * <b>PROPVARIANT</b> structure, including the reserved fields and the <b>vt</b> member. However, the first member of the <b>DECIMAL</b> structure is not used and is equal in size to the <b>vt</b> member of the 
 * <b>PROPVARIANT</b> structure. Therefore, the 
 * <b>PROPVARIANT</b> structure declaration in the Propidl.h header file of Win32 defines the <b>decVal</b> member in such a way that it corresponds to the beginning of the 
 * <b>PROPVARIANT</b> structure. Therefore, to put the value of the <b>DECIMAL</b> structure into a 
 * <b>PROPVARIANT</b> structure, the value must be loaded into the <b>decVal</b> member and the <b>vt</b> member is set to <b>VT_DECIMAL</b>, just as for any other value.
 * 
 * <b>PROPVARIANT</b> is the fundamental data type by which property values are read and written through the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface.
 * 
 * The data type 
 * <b>PROPVARIANT</b> is related to the data type <b>VARIANT</b>, defined as part of Automation in OLE2. Several definitions are reused from Automation, as follows:
 * 
 * 
 * ``` syntax
 * typedef struct  tagCY {
 *     unsigned long      Lo;
 *     long               Hi;
 *     } CY;
 *  
 * typedef struct  tagDEC {
 *     USHORT             wReserved;
 *     BYTE               scale;
 *     BYTE               sign;
 *     ULONG              Hi32;
 *     ULONGLONG          Lo64;
 *     } DECIMAL;
 *  
 * typedef struct  tagSAFEARRAYBOUND {
 *     ULONG              cElements;
 *     LONG               lLbound;
 *     } SAFEARRAYBOUND;
 *  
 * typedef struct  tagSAFEARRAY {
 *     USHORT             cDims;
 *     USHORT             fFeatures;
 *     ULONG              cbElements;
 *     ULONG              cLocks;
 *     PVOID              pvData;
 *     SAFEARRAYBOUND     rgsabound [ * ];
 *     } SAFEARRAY;
 *  
 * typedef CY             CURRENCY;
 * typedef short          VARIANT_BOOL;
 * typedef unsigned short VARTYPE;
 * typedef double         DATE;
 * typedef OLECHAR*       BSTR;
 * ```
 * 
 * In addition, some types are unique to the 
 * <b>PROPVARIANT</b> structure:
 * 
 * 
 * ``` syntax
 * typedef struct  tagCLIPDATA {
 *     // cbSize is the size of the buffer pointed to 
 *     // by pClipData, plus sizeof(ulClipFmt)
 *     ULONG              cbSize;
 *     long               ulClipFmt;
 *     BYTE*              pClipData;
 *     } CLIPDATA;
 * ```
 * 
 * Among the unique 
 * <b>PROPVARIANT</b> types are several data types that define counted arrays of other data types. The data types of all counted arrays begin with the letters <b>CA</b>, for example <b>CAUB</b>, and have an <b>OR</b> operator <b>vt</b> value (the VarType of the element and an <b>OR</b> operator with <b>VT_VECTOR</b>). The counted array structure has the following form (where <i>name</i> is the specific name of the counted array).
 * 
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/propidlbase/ns-propidlbase-propvariant
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class PROPVARIANT extends Win32Struct
{
    static sizeof => 24

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
    wReserved1 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    wReserved2 {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    wReserved3 {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {CHAR}
     */
    cVal {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bVal {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    iVal {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uiVal {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    lVal {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ulVal {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    intVal {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uintVal {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    hVal {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uhVal {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Float}
     */
    fltVal {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    dblVal {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {VARIANT_BOOL}
     */
    boolVal {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * @type {VARIANT_BOOL}
     */
    __OBSOLETE__VARIANT_BOOL {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    scode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {CY}
     */
    cyVal{
        get {
            if(!this.HasProp("__cyVal"))
                this.__cyVal := CY(8, this)
            return this.__cyVal
        }
    }

    /**
     * @type {Float}
     */
    date {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {FILETIME}
     */
    filetime{
        get {
            if(!this.HasProp("__filetime"))
                this.__filetime := FILETIME(8, this)
            return this.__filetime
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    puuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CLIPDATA>}
     */
    pclipdata {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {BSTR}
     */
    bstrVal{
        get {
            if(!this.HasProp("__bstrVal"))
                this.__bstrVal := BSTR(8, this)
            return this.__bstrVal
        }
    }

    /**
     * @type {BSTRBLOB}
     */
    bstrblobVal{
        get {
            if(!this.HasProp("__bstrblobVal"))
                this.__bstrblobVal := BSTRBLOB(8, this)
            return this.__bstrblobVal
        }
    }

    /**
     * @type {BLOB}
     */
    blob{
        get {
            if(!this.HasProp("__blob"))
                this.__blob := BLOB(8, this)
            return this.__blob
        }
    }

    /**
     * @type {PSTR}
     */
    pszVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pwszVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {IUnknown}
     */
    punkVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {IDispatch}
     */
    pdispVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {IStream}
     */
    pStream {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {IStorage}
     */
    pStorage {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<VERSIONEDSTREAM>}
     */
    pVersionedStream {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SAFEARRAY>}
     */
    parray {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {CAC}
     */
    cac{
        get {
            if(!this.HasProp("__cac"))
                this.__cac := CAC(8, this)
            return this.__cac
        }
    }

    /**
     * @type {CAUB}
     */
    caub{
        get {
            if(!this.HasProp("__caub"))
                this.__caub := CAUB(8, this)
            return this.__caub
        }
    }

    /**
     * @type {CAI}
     */
    cai{
        get {
            if(!this.HasProp("__cai"))
                this.__cai := CAI(8, this)
            return this.__cai
        }
    }

    /**
     * @type {CAUI}
     */
    caui{
        get {
            if(!this.HasProp("__caui"))
                this.__caui := CAUI(8, this)
            return this.__caui
        }
    }

    /**
     * @type {CAL}
     */
    cal{
        get {
            if(!this.HasProp("__cal"))
                this.__cal := CAL(8, this)
            return this.__cal
        }
    }

    /**
     * @type {CAUL}
     */
    caul{
        get {
            if(!this.HasProp("__caul"))
                this.__caul := CAUL(8, this)
            return this.__caul
        }
    }

    /**
     * @type {CAH}
     */
    cah{
        get {
            if(!this.HasProp("__cah"))
                this.__cah := CAH(8, this)
            return this.__cah
        }
    }

    /**
     * @type {CAUH}
     */
    cauh{
        get {
            if(!this.HasProp("__cauh"))
                this.__cauh := CAUH(8, this)
            return this.__cauh
        }
    }

    /**
     * @type {CAFLT}
     */
    caflt{
        get {
            if(!this.HasProp("__caflt"))
                this.__caflt := CAFLT(8, this)
            return this.__caflt
        }
    }

    /**
     * @type {CADBL}
     */
    cadbl{
        get {
            if(!this.HasProp("__cadbl"))
                this.__cadbl := CADBL(8, this)
            return this.__cadbl
        }
    }

    /**
     * @type {CABOOL}
     */
    cabool{
        get {
            if(!this.HasProp("__cabool"))
                this.__cabool := CABOOL(8, this)
            return this.__cabool
        }
    }

    /**
     * @type {CASCODE}
     */
    cascode{
        get {
            if(!this.HasProp("__cascode"))
                this.__cascode := CASCODE(8, this)
            return this.__cascode
        }
    }

    /**
     * @type {CACY}
     */
    cacy{
        get {
            if(!this.HasProp("__cacy"))
                this.__cacy := CACY(8, this)
            return this.__cacy
        }
    }

    /**
     * @type {CADATE}
     */
    cadate{
        get {
            if(!this.HasProp("__cadate"))
                this.__cadate := CADATE(8, this)
            return this.__cadate
        }
    }

    /**
     * @type {CAFILETIME}
     */
    cafiletime{
        get {
            if(!this.HasProp("__cafiletime"))
                this.__cafiletime := CAFILETIME(8, this)
            return this.__cafiletime
        }
    }

    /**
     * @type {CACLSID}
     */
    cauuid{
        get {
            if(!this.HasProp("__cauuid"))
                this.__cauuid := CACLSID(8, this)
            return this.__cauuid
        }
    }

    /**
     * @type {CACLIPDATA}
     */
    caclipdata{
        get {
            if(!this.HasProp("__caclipdata"))
                this.__caclipdata := CACLIPDATA(8, this)
            return this.__caclipdata
        }
    }

    /**
     * @type {CABSTR}
     */
    cabstr{
        get {
            if(!this.HasProp("__cabstr"))
                this.__cabstr := CABSTR(8, this)
            return this.__cabstr
        }
    }

    /**
     * @type {CABSTRBLOB}
     */
    cabstrblob{
        get {
            if(!this.HasProp("__cabstrblob"))
                this.__cabstrblob := CABSTRBLOB(8, this)
            return this.__cabstrblob
        }
    }

    /**
     * @type {CALPSTR}
     */
    calpstr{
        get {
            if(!this.HasProp("__calpstr"))
                this.__calpstr := CALPSTR(8, this)
            return this.__calpstr
        }
    }

    /**
     * @type {CALPWSTR}
     */
    calpwstr{
        get {
            if(!this.HasProp("__calpwstr"))
                this.__calpwstr := CALPWSTR(8, this)
            return this.__calpwstr
        }
    }

    /**
     * @type {CAPROPVARIANT}
     */
    capropvar{
        get {
            if(!this.HasProp("__capropvar"))
                this.__capropvar := CAPROPVARIANT(8, this)
            return this.__capropvar
        }
    }

    /**
     * @type {PSTR}
     */
    pcVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    piVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    puiVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    plVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pulVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pintVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    puintVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Float>}
     */
    pfltVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Float>}
     */
    pdblVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<VARIANT_BOOL>}
     */
    pboolVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DECIMAL>}
     */
    pdecVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pscode {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CY>}
     */
    pcyVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Float>}
     */
    pdate {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<BSTR>}
     */
    pbstrVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    ppunkVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IDispatch>}
     */
    ppdispVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Pointer<SAFEARRAY>>}
     */
    pparray {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PROPVARIANT>}
     */
    pvarVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {DECIMAL}
     */
    decVal{
        get {
            if(!this.HasProp("__decVal"))
                this.__decVal := DECIMAL(0, this)
            return this.__decVal
        }
    }
}
