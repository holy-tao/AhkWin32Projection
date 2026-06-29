#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\CAUL.ahk" { CAUL }
#Import "..\..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\IStream.ahk" { IStream }
#Import ".\CADATE.ahk" { CADATE }
#Import ".\CAFLT.ahk" { CAFLT }
#Import ".\CABSTR.ahk" { CABSTR }
#Import ".\CAFILETIME.ahk" { CAFILETIME }
#Import ".\BSTRBLOB.ahk" { BSTRBLOB }
#Import "..\BLOB.ahk" { BLOB }
#Import ".\CALPWSTR.ahk" { CALPWSTR }
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\CY.ahk" { CY }
#Import ".\CLIPDATA.ahk" { CLIPDATA }
#Import "..\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }
#Import ".\CAL.ahk" { CAL }
#Import ".\CABSTRBLOB.ahk" { CABSTRBLOB }
#Import ".\CAH.ahk" { CAH }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\CAC.ahk" { CAC }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Variant\VARENUM.ahk" { VARENUM }
#Import ".\CASCODE.ahk" { CASCODE }
#Import ".\CADBL.ahk" { CADBL }
#Import ".\CALPSTR.ahk" { CALPSTR }
#Import ".\CAUH.ahk" { CAUH }
#Import ".\CAPROPVARIANT.ahk" { CAPROPVARIANT }
#Import ".\CACLIPDATA.ahk" { CACLIPDATA }
#Import ".\IStorage.ahk" { IStorage }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\CAUB.ahk" { CAUB }
#Import "..\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\VERSIONEDSTREAM.ahk" { VERSIONEDSTREAM }
#Import ".\CAI.ahk" { CAI }
#Import ".\CACY.ahk" { CACY }
#Import "..\IDispatch.ahk" { IDispatch }
#Import ".\CAUI.ahk" { CAUI }
#Import ".\CACLSID.ahk" { CACLSID }
#Import ".\CABOOL.ahk" { CABOOL }

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
 */
export default struct PROPVARIANT {
    #StructPack 8

    vt : VARENUM

    wReserved1 : UInt16

    wReserved2 : UInt16

    wReserved3 : UInt16

    cVal : CHAR

    static __New() {
        DefineProp(this.Prototype, 'bVal', { type: Int8, offset: 8 })
        DefineProp(this.Prototype, 'iVal', { type: Int16, offset: 8 })
        DefineProp(this.Prototype, 'uiVal', { type: UInt16, offset: 8 })
        DefineProp(this.Prototype, 'lVal', { type: Int32, offset: 8 })
        DefineProp(this.Prototype, 'ulVal', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'intVal', { type: Int32, offset: 8 })
        DefineProp(this.Prototype, 'uintVal', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'hVal', { type: Int64, offset: 8 })
        DefineProp(this.Prototype, 'uhVal', { type: Int64, offset: 8 })
        DefineProp(this.Prototype, 'fltVal', { type: Float32, offset: 8 })
        DefineProp(this.Prototype, 'dblVal', { type: Float64, offset: 8 })
        DefineProp(this.Prototype, 'boolVal', { type: VARIANT_BOOL, offset: 8 })
        DefineProp(this.Prototype, '__OBSOLETE__VARIANT_BOOL', { type: VARIANT_BOOL, offset: 8 })
        DefineProp(this.Prototype, 'scode', { type: Int32, offset: 8 })
        DefineProp(this.Prototype, 'cyVal', { type: CY, offset: 8 })
        DefineProp(this.Prototype, 'date', { type: Float64, offset: 8 })
        DefineProp(this.Prototype, 'filetime', { type: FILETIME, offset: 8 })
        DefineProp(this.Prototype, 'puuid', { type: Guid.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pclipdata', { type: CLIPDATA.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'bstrVal', { type: BSTR, offset: 8 })
        DefineProp(this.Prototype, 'bstrblobVal', { type: BSTRBLOB, offset: 8 })
        DefineProp(this.Prototype, 'blob', { type: BLOB, offset: 8 })
        DefineProp(this.Prototype, 'pszVal', { type: PSTR, offset: 8 })
        DefineProp(this.Prototype, 'pwszVal', { type: PWSTR, offset: 8 })
        DefineProp(this.Prototype, 'punkVal', { type: IUnknown, offset: 8 })
        DefineProp(this.Prototype, 'pdispVal', { type: IDispatch, offset: 8 })
        DefineProp(this.Prototype, 'pStream', { type: IStream, offset: 8 })
        DefineProp(this.Prototype, 'pStorage', { type: IStorage, offset: 8 })
        DefineProp(this.Prototype, 'pVersionedStream', { type: VERSIONEDSTREAM.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'parray', { type: SAFEARRAY.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'cac', { type: CAC, offset: 8 })
        DefineProp(this.Prototype, 'caub', { type: CAUB, offset: 8 })
        DefineProp(this.Prototype, 'cai', { type: CAI, offset: 8 })
        DefineProp(this.Prototype, 'caui', { type: CAUI, offset: 8 })
        DefineProp(this.Prototype, 'cal', { type: CAL, offset: 8 })
        DefineProp(this.Prototype, 'caul', { type: CAUL, offset: 8 })
        DefineProp(this.Prototype, 'cah', { type: CAH, offset: 8 })
        DefineProp(this.Prototype, 'cauh', { type: CAUH, offset: 8 })
        DefineProp(this.Prototype, 'caflt', { type: CAFLT, offset: 8 })
        DefineProp(this.Prototype, 'cadbl', { type: CADBL, offset: 8 })
        DefineProp(this.Prototype, 'cabool', { type: CABOOL, offset: 8 })
        DefineProp(this.Prototype, 'cascode', { type: CASCODE, offset: 8 })
        DefineProp(this.Prototype, 'cacy', { type: CACY, offset: 8 })
        DefineProp(this.Prototype, 'cadate', { type: CADATE, offset: 8 })
        DefineProp(this.Prototype, 'cafiletime', { type: CAFILETIME, offset: 8 })
        DefineProp(this.Prototype, 'cauuid', { type: CACLSID, offset: 8 })
        DefineProp(this.Prototype, 'caclipdata', { type: CACLIPDATA, offset: 8 })
        DefineProp(this.Prototype, 'cabstr', { type: CABSTR, offset: 8 })
        DefineProp(this.Prototype, 'cabstrblob', { type: CABSTRBLOB, offset: 8 })
        DefineProp(this.Prototype, 'calpstr', { type: CALPSTR, offset: 8 })
        DefineProp(this.Prototype, 'calpwstr', { type: CALPWSTR, offset: 8 })
        DefineProp(this.Prototype, 'capropvar', { type: CAPROPVARIANT, offset: 8 })
        DefineProp(this.Prototype, 'pcVal', { type: PSTR, offset: 8 })
        DefineProp(this.Prototype, 'pbVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'piVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'puiVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'plVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pulVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pintVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'puintVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pfltVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pdblVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pboolVal', { type: VARIANT_BOOL.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pdecVal', { type: DECIMAL.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pscode', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pcyVal', { type: CY.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pdate', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pbstrVal', { type: BSTR.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'ppunkVal', { type: IUnknown.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'ppdispVal', { type: IDispatch.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pparray', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pvarVal', { type: PROPVARIANT.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'decVal', { type: DECIMAL, offset: 0 })
        this.DeleteProp("__New")
    }
}
