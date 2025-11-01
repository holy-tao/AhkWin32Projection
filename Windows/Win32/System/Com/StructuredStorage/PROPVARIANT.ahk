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
 * Used in the ReadMultiple and WriteMultiple methods of IPropertyStorage to define the type tag and the value of a property in a property set.
 * @remarks
 * 
  * The 
  * <b>PROPVARIANT</b> structure can also hold a value of <b>VT_DECIMAL</b>:
  * 
  * <pre class="syntax" xml:space="preserve"><c>    DECIMAL       decVal;        //VT_DECIMAL</c></pre>
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
  * <pre class="syntax" xml:space="preserve"><code>typedef struct  tagCY {
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
  * typedef OLECHAR*       BSTR;</code></pre>
  * In addition, some types are unique to the 
  * <b>PROPVARIANT</b> structure:
  * 
  * <pre class="syntax" xml:space="preserve"><code>typedef struct  tagCLIPDATA {
  *     // cbSize is the size of the buffer pointed to 
  *     // by pClipData, plus sizeof(ulClipFmt)
  *     ULONG              cbSize;
  *     long               ulClipFmt;
  *     BYTE*              pClipData;
  *     } CLIPDATA;</code></pre>
  * Among the unique 
  * <b>PROPVARIANT</b> types are several data types that define counted arrays of other data types. The data types of all counted arrays begin with the letters <b>CA</b>, for example <b>CAUB</b>, and have an <b>OR</b> operator <b>vt</b> value (the VarType of the element and an <b>OR</b> operator with <b>VT_VECTOR</b>). The counted array structure has the following form (where <i>name</i> is the specific name of the counted array).
  * 
  * <pre class="syntax" xml:space="preserve"><code>#define TYPEDEF_CA(type, name) 
  *  
  *     typedef struct tag ## name {\
  *         ULONG cElems;\
  *         type *pElems;\
  *         } name</code></pre>
  * <table>
  * <tr>
  * <th>Propvariant type</th>
  * <th>Code</th>
  * <th>Propvariant member</th>
  * <th>Value representation</th>
  * </tr>
  * <tr>
  * <td><b>VT_EMPTY</b></td>
  * <td>0</td>
  * <td>None</td>
  * <td>A property with a type indicator of <b>VT_EMPTY</b> has no data associated with it; that is, the size of the value is zero.</td>
  * </tr>
  * <tr>
  * <td><b>VT_NULL</b></td>
  * <td>1</td>
  * <td>None</td>
  * <td>This is like a pointer to <b>NULL</b>.</td>
  * </tr>
  * <tr>
  * <td><b>VT_I1</b></td>
  * <td>16</td>
  * <td><b>cVal</b></td>
  * <td>1-byte signed integer.</td>
  * </tr>
  * <tr>
  * <td><b>VT_UI1</b></td>
  * <td>17</td>
  * <td><b>bVal</b></td>
  * <td>1-byte unsigned integer.</td>
  * </tr>
  * <tr>
  * <td><b>VT_I2</b></td>
  * <td>2</td>
  * <td><b>iVal</b></td>
  * <td>Two bytes representing a 2-byte signed integer value.</td>
  * </tr>
  * <tr>
  * <td><b>VT_UI2</b></td>
  * <td>18</td>
  * <td><b>uiVal</b></td>
  * <td>2-byte unsigned integer.</td>
  * </tr>
  * <tr>
  * <td><b>VT_I4</b></td>
  * <td>3</td>
  * <td><b>lVal</b></td>
  * <td>4-byte signed integer value.</td>
  * </tr>
  * <tr>
  * <td><b>VT_UI4</b></td>
  * <td>19</td>
  * <td><b>ulVal</b></td>
  * <td>4-byte unsigned integer.</td>
  * </tr>
  * <tr>
  * <td><b>VT_INT</b></td>
  * <td>22</td>
  * <td><b>intVal</b></td>
  * <td>4-byte signed integer value (equivalent to <b>VT_I4</b>).</td>
  * </tr>
  * <tr>
  * <td><b>VT_UINT</b></td>
  * <td>23</td>
  * <td><b>uintVal</b></td>
  * <td>4-byte unsigned integer (equivalent to <b>VT_UI4</b>).</td>
  * </tr>
  * <tr>
  * <td><b>VT_I8</b></td>
  * <td>20</td>
  * <td><b>hVal</b></td>
  * <td>8-byte signed integer.</td>
  * </tr>
  * <tr>
  * <td><b>VT_UI8</b></td>
  * <td>21</td>
  * <td><b>uhVal</b></td>
  * <td>8-byte unsigned integer.</td>
  * </tr>
  * <tr>
  * <td><b>VT_R4</b></td>
  * <td>4</td>
  * <td><b>fltVal</b></td>
  * <td>32-bit IEEE floating point value.</td>
  * </tr>
  * <tr>
  * <td><b>VT_R8</b></td>
  * <td>5</td>
  * <td><b>dblVal</b></td>
  * <td>64-bit IEEE floating point value.</td>
  * </tr>
  * <tr>
  * <td><b>VT_BOOL</b></td>
  * <td>11</td>
  * <td><b>boolVal</b> (<b>bool</b> in earlier designs)</td>
  * <td>Boolean value, a <b>WORD</b> that contains 0 (<b>FALSE</b>) or -1 (<b>TRUE</b>).</td>
  * </tr>
  * <tr>
  * <td><b>VT_ERROR</b></td>
  * <td>10</td>
  * <td><b>scode</b></td>
  * <td>A <b>DWORD</b> that contains a status code.</td>
  * </tr>
  * <tr>
  * <td><b>VT_CY</b></td>
  * <td>6</td>
  * <td><b>cyVal</b></td>
  * <td>8-byte two's complement integer (scaled by 10,000). This type is commonly used for currency amounts.</td>
  * </tr>
  * <tr>
  * <td><b>VT_DATE</b></td>
  * <td>7</td>
  * <td><b>date</b></td>
  * <td>A 64-bit floating point number representing the number of days (not seconds) since December 31, 1899. For example, January 1, 1900, is 2.0, January 2, 1900, is 3.0, and so on). This is stored in the same representation as <b>VT_R8</b>.</td>
  * </tr>
  * <tr>
  * <td><b>VT_FILETIME</b></td>
  * <td>64</td>
  * <td><b>filetime</b></td>
  * <td>64-bit <b>FILETIME</b> structure as defined by Win32. It is recommended that all times be stored in Universal Coordinate Time (UTC).</td>
  * </tr>
  * <tr>
  * <td><b>VT_CLSID</b></td>
  * <td>72</td>
  * <td><b>puuid</b></td>
  * <td>Pointer to a class identifier (CLSID) (or other globally unique identifier (GUID)).</td>
  * </tr>
  * <tr>
  * <td><b>VT_CF</b></td>
  * <td>71</td>
  * <td><b>pclipdata</b></td>
  * <td>Pointer to a <b>CLIPDATA</b> structure, described above.</td>
  * </tr>
  * <tr>
  * <td><b>VT_BSTR</b></td>
  * <td>8</td>
  * <td><b>bstrVal</b></td>
  * <td>Pointer to a null-terminated Unicode string. The string is immediately preceded by a <b>DWORD</b> representing the byte count, but <b>bstrVal</b> points past this <b>DWORD</b> to the first character of the string. <b>BSTR</b>s must be allocated and freed using the Automation <b>SysAllocString</b> and <b>SysFreeString</b> calls.</td>
  * </tr>
  * <tr>
  * <td><b>VT_BSTR_BLOB</b></td>
  * <td>0xfff</td>
  * <td><b>bstrblobVal</b></td>
  * <td>For system use only.</td>
  * </tr>
  * <tr>
  * <td><b>VT_BLOB</b></td>
  * <td>65</td>
  * <td><b>blob</b></td>
  * <td><b>DWORD</b> count of bytes, followed by that many bytes of data. The byte count does not include the four bytes for the length of the count itself; an empty <b>blob</b> member would have a count of zero, followed by zero bytes. This is similar to the value <b>VT_BSTR</b>, but does not guarantee a null byte at the end of the data.</td>
  * </tr>
  * <tr>
  * <td><b>VT_BLOBOBJECT</b></td>
  * <td>70</td>
  * <td><b>blob</b></td>
  * <td>A <b>blob</b> member that contains a serialized object in the same representation that would appear in <b>VT_STREAMED_OBJECT</b>. That is, a <b>DWORD</b> byte count (where the byte count does not include the size of itself) which is in the format of a class identifier followed by initialization data for that class. 
  * 
  * 
  * The only significant difference between <b>VT_BLOB_OBJECT</b> and <b>VT_STREAMED_OBJECT</b> is that the former does not have the system-level storage overhead that the latter would have, and is therefore more suitable for scenarios involving numbers of small objects.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td><b>VT_LPSTR</b></td>
  * <td>30</td>
  * <td><b>pszVal</b></td>
  * <td>A pointer to a null-terminated ANSI string in the system default code page.</td>
  * </tr>
  * <tr>
  * <td><b>VT_LPWSTR</b></td>
  * <td>31</td>
  * <td><b>pwszVal</b></td>
  * <td>A pointer to a null-terminated Unicode string in the user default locale.</td>
  * </tr>
  * <tr>
  * <td><b>VT_UNKNOWN</b></td>
  * <td>13</td>
  * <td><b>punkVal</b></td>
  * <td>New.</td>
  * </tr>
  * <tr>
  * <td><b>VT_DISPATCH</b></td>
  * <td>9</td>
  * <td><b>pdispVal</b></td>
  * <td>New.</td>
  * </tr>
  * <tr>
  * <td><b>VT_STREAM</b></td>
  * <td>66</td>
  * <td><b>pStream</b></td>
  * <td>A pointer to an 
  * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface that represents a stream which is a sibling to the "Contents" stream.</td>
  * </tr>
  * <tr>
  * <td><b>VT_STREAMED_OBJECT</b></td>
  * <td>68</td>
  * <td><b>pStream</b></td>
  * <td>As in <b>VT_STREAM</b>, but indicates that the stream contains a serialized object, which is a CLSID followed by initialization data for the class. The stream is a sibling to the "Contents" stream that contains the property set.</td>
  * </tr>
  * <tr>
  * <td><b>VT_STORAGE</b></td>
  * <td>67</td>
  * <td><b>pStorage</b></td>
  * <td>A pointer to an 
  * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface, representing a storage object that is a sibling to the "Contents" stream.</td>
  * </tr>
  * <tr>
  * <td><b>VT_STORED_OBJECT</b></td>
  * <td>69</td>
  * <td><b>pStorage</b></td>
  * <td>As in <b>VT_STORAGE</b>, but indicates that the designated 
  * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> contains a loadable object.</td>
  * </tr>
  * <tr>
  * <td><b>VT_VERSIONED_STREAM</b></td>
  * <td>73</td>
  * <td><b>pVersionedStream</b></td>
  * <td>A stream with a GUID version.</td>
  * </tr>
  * <tr>
  * <td><b>VT_DECIMAL</b></td>
  * <td>14</td>
  * <td><b>decVal</b></td>
  * <td>A <b>DECIMAL</b> structure.</td>
  * </tr>
  * <tr>
  * <td><b>VT_VECTOR</b></td>
  * <td>0x1000</td>
  * <td><b>ca*</b></td>
  * <td>If the type indicator is combined with <b>VT_VECTOR</b> by using an <b>OR</b> operator, the value is one of the counted array values. This creates a <b>DWORD</b> count of elements, followed by a pointer to the specified repetitions of the value. 
  * 
  * 
  * For example, a type indicator of <b>VT_LPSTR</b>|<b>VT_VECTOR</b> has a <b>DWORD</b> element count, followed by a pointer to an array of <b>LPSTR</b> elements.
  * 
  * <b>VT_VECTOR</b> can be combined by an <b>OR</b> operator with the following types: <b>VT_I1</b>, <b>VT_UI1</b>, <b>VT_I2</b>, <b>VT_UI2</b>, <b>VT_BOOL</b>, <b>VT_I4</b>, <b>VT_UI4</b>, <b>VT_R4</b>, <b>VT_R8</b>, <b>VT_ERROR</b>, <b>VT_I8</b>, <b>VT_UI8</b>, <b>VT_CY</b>, <b>VT_DATE</b>, <b>VT_FILETIME</b>, <b>VT_CLSID</b>, <b>VT_CF</b>, <b>VT_BSTR</b>, <b>VT_LPSTR</b>, <b>VT_LPWSTR</b>, and <b>VT_VARIANT</b>.  <b>VT_VECTOR</b> can also be combined by an <b>OR</b> operation with  <b>VT_BSTR_BLOB</b>, however it is for system use only.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td><b>VT_ARRAY</b></td>
  * <td>0x2000</td>
  * <td><b>Parray</b></td>
  * <td>If the type indicator is combined with <b>VT_ARRAY</b> by an <b>OR</b> operator, the value is a pointer to a SAFEARRAY. <b>VT_ARRAY</b> can use the <b>OR</b> with the following data types: <b>VT_I1</b>, <b>VT_UI1</b>, <b>VT_I2</b>, <b>VT_UI2</b>, <b>VT_I4</b>, <b>VT_UI4</b>, <b>VT_INT</b>, <b>VT_UINT</b>, <b>VT_R4</b>, <b>VT_R8</b>, <b>VT_BOOL</b>, <b>VT_DECIMAL</b>, <b>VT_ERROR</b>, <b>VT_CY</b>, <b>VT_DATE</b>, <b>VT_BSTR</b>, <b>VT_DISPATCH</b>, <b>VT_UNKNOWN</b>, and <b>VT_VARIANT</b>. <b>VT_ARRAY</b> cannot use <b>OR</b> with <b>VT_VECTOR</b>.</td>
  * </tr>
  * <tr>
  * <td><b>VT_BYREF</b></td>
  * <td>0x4000</td>
  * <td><b>p*</b></td>
  * <td>If the type indicator is combined with <b>VT_BYREF</b> by an <b>OR</b> operator, the value is a reference. Reference types are interpreted as a reference to data, similar to the reference type in C++ (for example, "int&amp;"). 
  * 
  * 
  * VT_BYREF can use <b>OR</b> with the following types: <b>VT_I1</b>, <b>VT_UI1</b>, <b>VT_I2</b>, <b>VT_UI2</b>, <b>VT_I4</b>, <b>VT_UI4</b>, <b>VT_INT</b>, <b>VT_UINT</b>, <b>VT_R4</b>, <b>VT_R8</b>, <b>VT_BOOL</b>, <b>VT_DECIMAL</b>, <b>VT_ERROR</b>, <b>VT_CY</b>, <b>VT_DATE</b>, <b>VT_BSTR</b>, <b>VT_UNKNOWN</b>, <b>VT_DISPATCH</b>, <b>VT_ARRAY</b>, and <b>VT_VARIANT</b>.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td><b>VT_VARIANT</b></td>
  * <td>12</td>
  * <td><b>capropvar</b></td>
  * <td>A <b>DWORD</b> type indicator followed by the corresponding value. <b>VT_VARIANT</b> can be used only with <b>VT_VECTOR</b> or <b>VT_BYREF</b>.</td>
  * </tr>
  * <tr>
  * <td><b>VT_TYPEMASK</b></td>
  * <td>0xFFF</td>
  * <td> </td>
  * <td>Used as a mask for <b>VT_VECTOR</b> and other modifiers to extract the raw VT value.</td>
  * </tr>
  * </table>
  *  
  * 
  * Clipboard format identifiers, stored with the tag VT_CF, use one of five representations, identified in the <b>ulClipFmt</b> member of the <b>CLIPDATA</b> structure using the <b>pClipData</b> pointer to the particular data type.
  * 
  * <table>
  * <tr>
  * <th><b>ulClipFmt</b> value</th>
  * <th><b>pClipData</b> value</th>
  * </tr>
  * <tr>
  * <td>-1L</td>
  * <td>A <b>DWORD</b> that contains a built-in Windows clipboard format value.</td>
  * </tr>
  * <tr>
  * <td>-2L</td>
  * <td>A <b>DWORD</b> that contains a Macintosh clipboard format value.</td>
  * </tr>
  * <tr>
  * <td>-3L</td>
  * <td>A GUID that contains a format identifier (FMTID). This is rarely used.</td>
  * </tr>
  * <tr>
  * <td>any positive value</td>
  * <td>A null-terminated string that contains a Windows clipboard format name, one suitable for passing to the <b>RegisterClipboardFormat</b> function. This function registers a new clipboard format. If a registered format with the specified name already exists, a new format is not registered and the return value identifies the existing format. This enables more than one application to copy and paste data using the same registered clipboard format. The format name comparison is case insensitive and is identified by values in the range from 0xC000 through 0xFFFF. The code page used for characters in the string is according to the code-page indicator. The "positive value" here is the string length, including the null byte at the end. When register clipboard formats are placed on or retrieved from the clipboard, they must be in the form of an <b>HGLOBAL</b> data-type value, which provides the handle to the object.</td>
  * </tr>
  * <tr>
  * <td>0L</td>
  * <td>No data (rarely used).</td>
  * </tr>
  * </table>
  *  
  * 
  * If the value of the <b>ulClipFmt</b> member is -1, the data is in the form of a built-in Windows format. In this case, the first <b>DWORD</b> of the buffer pointed to by <b>pClipData</b> is the clipboard format identifier, for example CF_METAFILEPICT. In the case of CF_METAFILEPCT, what follows is a variation on the <b>METAFILEPICT</b> structure (it uses <b>WORD</b>, rather than <b>DWORD</b> data types). That is, this data is in the following form:
  * 
  * <pre class="syntax" xml:space="preserve"><code>struct PACKEDMETA
  * {
  *     WORD mm;
  *     WORD xExt;
  *     WORD yExt
  *     WORD reserved;
  * };</code></pre>
  * After the <b>METAFILEPICT</b> structure is the metafile data, suitable to be passed to the <b>SetMetaFileBitsEx</b> function. This function creates a memory-based, Windows-format metafile from the supplied data. This function is provided for compatibility with 16-bit versions of Windows. Win32-based applications should use the <b>SetEnhMetaFileBits</b> function. This function retrieves the contents of the specified enhanced-format metafile and copies them into a buffer. If the function succeeds and the buffer pointer is <b>NULL</b>, the return value is the size of the enhanced metafile in bytes. If the function succeeds and the buffer pointer is a valid pointer, the return value is the number of bytes copied to the buffer. If the function fails, the return value is zero.
  * 
  * When register clipboard formats are placed on or retrieved from the clipboard, they must be in the form of an <b>HGLOBAL</b> value.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propidlbase/ns-propidlbase-propvariant
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
