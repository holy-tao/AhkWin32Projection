#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\CY.ahk
#Include ..\..\..\Foundation\FILETIME.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\BSTRBLOB.ahk
#Include ..\BLOB.ahk
#Include ..\..\..\Foundation\PSTR.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
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
    static sizeof => 16

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
     * @type {Integer}
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
     * @type {Integer}
     */
    boolVal {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * @type {Integer}
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
                this.__cyVal := CY(this.ptr + 8)
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
                this.__filetime := FILETIME(this.ptr + 8)
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
                this.__bstrVal := BSTR(this.ptr + 8)
            return this.__bstrVal
        }
    }

    /**
     * @type {BSTRBLOB}
     */
    bstrblobVal{
        get {
            if(!this.HasProp("__bstrblobVal"))
                this.__bstrblobVal := BSTRBLOB(this.ptr + 8)
            return this.__bstrblobVal
        }
    }

    /**
     * @type {BLOB}
     */
    blob{
        get {
            if(!this.HasProp("__blob"))
                this.__blob := BLOB(this.ptr + 8)
            return this.__blob
        }
    }

    /**
     * @type {PSTR}
     */
    pszVal{
        get {
            if(!this.HasProp("__pszVal"))
                this.__pszVal := PSTR(this.ptr + 8)
            return this.__pszVal
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszVal{
        get {
            if(!this.HasProp("__pwszVal"))
                this.__pwszVal := PWSTR(this.ptr + 8)
            return this.__pwszVal
        }
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    punkVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IDispatch>}
     */
    pdispVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IStream>}
     */
    pStream {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IStorage>}
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
                this.__cac := CAC(this.ptr + 8)
            return this.__cac
        }
    }

    /**
     * @type {CAUB}
     */
    caub{
        get {
            if(!this.HasProp("__caub"))
                this.__caub := CAUB(this.ptr + 8)
            return this.__caub
        }
    }

    /**
     * @type {CAI}
     */
    cai{
        get {
            if(!this.HasProp("__cai"))
                this.__cai := CAI(this.ptr + 8)
            return this.__cai
        }
    }

    /**
     * @type {CAUI}
     */
    caui{
        get {
            if(!this.HasProp("__caui"))
                this.__caui := CAUI(this.ptr + 8)
            return this.__caui
        }
    }

    /**
     * @type {CAL}
     */
    cal{
        get {
            if(!this.HasProp("__cal"))
                this.__cal := CAL(this.ptr + 8)
            return this.__cal
        }
    }

    /**
     * @type {CAUL}
     */
    caul{
        get {
            if(!this.HasProp("__caul"))
                this.__caul := CAUL(this.ptr + 8)
            return this.__caul
        }
    }

    /**
     * @type {CAH}
     */
    cah{
        get {
            if(!this.HasProp("__cah"))
                this.__cah := CAH(this.ptr + 8)
            return this.__cah
        }
    }

    /**
     * @type {CAUH}
     */
    cauh{
        get {
            if(!this.HasProp("__cauh"))
                this.__cauh := CAUH(this.ptr + 8)
            return this.__cauh
        }
    }

    /**
     * @type {CAFLT}
     */
    caflt{
        get {
            if(!this.HasProp("__caflt"))
                this.__caflt := CAFLT(this.ptr + 8)
            return this.__caflt
        }
    }

    /**
     * @type {CADBL}
     */
    cadbl{
        get {
            if(!this.HasProp("__cadbl"))
                this.__cadbl := CADBL(this.ptr + 8)
            return this.__cadbl
        }
    }

    /**
     * @type {CABOOL}
     */
    cabool{
        get {
            if(!this.HasProp("__cabool"))
                this.__cabool := CABOOL(this.ptr + 8)
            return this.__cabool
        }
    }

    /**
     * @type {CASCODE}
     */
    cascode{
        get {
            if(!this.HasProp("__cascode"))
                this.__cascode := CASCODE(this.ptr + 8)
            return this.__cascode
        }
    }

    /**
     * @type {CACY}
     */
    cacy{
        get {
            if(!this.HasProp("__cacy"))
                this.__cacy := CACY(this.ptr + 8)
            return this.__cacy
        }
    }

    /**
     * @type {CADATE}
     */
    cadate{
        get {
            if(!this.HasProp("__cadate"))
                this.__cadate := CADATE(this.ptr + 8)
            return this.__cadate
        }
    }

    /**
     * @type {CAFILETIME}
     */
    cafiletime{
        get {
            if(!this.HasProp("__cafiletime"))
                this.__cafiletime := CAFILETIME(this.ptr + 8)
            return this.__cafiletime
        }
    }

    /**
     * @type {CACLSID}
     */
    cauuid{
        get {
            if(!this.HasProp("__cauuid"))
                this.__cauuid := CACLSID(this.ptr + 8)
            return this.__cauuid
        }
    }

    /**
     * @type {CACLIPDATA}
     */
    caclipdata{
        get {
            if(!this.HasProp("__caclipdata"))
                this.__caclipdata := CACLIPDATA(this.ptr + 8)
            return this.__caclipdata
        }
    }

    /**
     * @type {CABSTR}
     */
    cabstr{
        get {
            if(!this.HasProp("__cabstr"))
                this.__cabstr := CABSTR(this.ptr + 8)
            return this.__cabstr
        }
    }

    /**
     * @type {CABSTRBLOB}
     */
    cabstrblob{
        get {
            if(!this.HasProp("__cabstrblob"))
                this.__cabstrblob := CABSTRBLOB(this.ptr + 8)
            return this.__cabstrblob
        }
    }

    /**
     * @type {CALPSTR}
     */
    calpstr{
        get {
            if(!this.HasProp("__calpstr"))
                this.__calpstr := CALPSTR(this.ptr + 8)
            return this.__calpstr
        }
    }

    /**
     * @type {CALPWSTR}
     */
    calpwstr{
        get {
            if(!this.HasProp("__calpwstr"))
                this.__calpwstr := CALPWSTR(this.ptr + 8)
            return this.__calpwstr
        }
    }

    /**
     * @type {CAPROPVARIANT}
     */
    capropvar{
        get {
            if(!this.HasProp("__capropvar"))
                this.__capropvar := CAPROPVARIANT(this.ptr + 8)
            return this.__capropvar
        }
    }

    /**
     * @type {PSTR}
     */
    pcVal{
        get {
            if(!this.HasProp("__pcVal"))
                this.__pcVal := PSTR(this.ptr + 8)
            return this.__pcVal
        }
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Int16>}
     */
    piVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    puiVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Int32>}
     */
    plVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pulVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Int32>}
     */
    pintVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    puintVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Single>}
     */
    pfltVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Double>}
     */
    pdblVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Int16>}
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
     * @type {Pointer<Int32>}
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
     * @type {Pointer<Double>}
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
     * @type {Pointer<SAFEARRAY>}
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
                this.__decVal := DECIMAL(this.ptr + 0)
            return this.__decVal
        }
    }
}
