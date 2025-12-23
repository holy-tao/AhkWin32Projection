#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the variant types.
 * @remarks
 * The following table shows where these values can be used.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>VARIANT</th>
 * <th>TYPEDESC</th>
 * <th>Property set</th>
 * <th>Safe array</th>
 * </tr>
 * <tr>
 * <td><b>VT_ARRAY</b></td>
 * <td>X</td>
 * <td></td>
 * <td></td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_BLOB</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_BLOB_OBJECT</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_BOOL</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_BSTR</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_BSTR_BLOB</b></td>
 * <td></td>
 * <td></td>
 * <td></td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_BYREF</b></td>
 * <td>X</td>
 * <td></td>
 * <td></td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_CARRAY</b></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_CF</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_CLSID</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_CY</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_DATE</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_DECIMAL</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td></td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_DISPATCH</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td></td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_EMPTY</b></td>
 * <td>X</td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_ERROR</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_FILETIME</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_HRESULT</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_I1</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_I2</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_I4</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_I8</b></td>
 * <td></td>
 * <td>X</td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_INT</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_INT_PTR</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_LPSTR</b></td>
 * <td></td>
 * <td>X</td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_LPWSTR</b></td>
 * <td></td>
 * <td>X</td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_NULL</b></td>
 * <td>X</td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_PTR</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_R4</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_R8</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_RECORD</b></td>
 * <td>X</td>
 * <td></td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_SAFEARRAY</b></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_STORAGE</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_STORED_OBJECT</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_STREAM</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_STREAMED_OBJECT</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_UI1</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_UI2</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_UI4</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_UI8</b></td>
 * <td></td>
 * <td>X</td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_UINT</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td></td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_UINT_PTR</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_UNKNOWN</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td></td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_USERDEFINED</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_VARIANT</b></td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * <td>X</td>
 * </tr>
 * <tr>
 * <td><b>VT_VECTOR</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_VERSIONED_STREAM</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * <tr>
 * <td><b>VT_VOID</b></td>
 * <td></td>
 * <td></td>
 * <td>X</td>
 * <td></td>
 * </tr>
 * </table>
 *  
 * 
 * <b>VT_BSTR_BLOB</b> is reserved for system use.
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ne-wtypes-varenum
 * @namespace Windows.Win32.System.Variant
 * @version v4.0.30319
 */
class VARENUM extends Win32BitflagEnum{

    /**
     * Not specified.
     * @type {Integer (UInt16)}
     */
    static VT_EMPTY => 0

    /**
     * Null.
     * @type {Integer (UInt16)}
     */
    static VT_NULL => 1

    /**
     * A 2-byte integer.
     * @type {Integer (UInt16)}
     */
    static VT_I2 => 2

    /**
     * A 4-byte integer.
     * @type {Integer (UInt16)}
     */
    static VT_I4 => 3

    /**
     * A 4-byte real.
     * @type {Integer (UInt16)}
     */
    static VT_R4 => 4

    /**
     * An 8-byte real.
     * @type {Integer (UInt16)}
     */
    static VT_R8 => 5

    /**
     * Currency.
     * @type {Integer (UInt16)}
     */
    static VT_CY => 6

    /**
     * A date.
     * @type {Integer (UInt16)}
     */
    static VT_DATE => 7

    /**
     * A string.
     * @type {Integer (UInt16)}
     */
    static VT_BSTR => 8

    /**
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> pointer.
     * @type {Integer (UInt16)}
     */
    static VT_DISPATCH => 9

    /**
     * An SCODE value.
     * @type {Integer (UInt16)}
     */
    static VT_ERROR => 10

    /**
     * A Boolean value. True is -1 and false is 0.
     * @type {Integer (UInt16)}
     */
    static VT_BOOL => 11

    /**
     * A variant pointer.
     * @type {Integer (UInt16)}
     */
    static VT_VARIANT => 12

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer.
     * @type {Integer (UInt16)}
     */
    static VT_UNKNOWN => 13

    /**
     * A 16-byte fixed-pointer value.
     * @type {Integer (UInt16)}
     */
    static VT_DECIMAL => 14

    /**
     * A character.
     * @type {Integer (UInt16)}
     */
    static VT_I1 => 16

    /**
     * An unsigned character.
     * @type {Integer (UInt16)}
     */
    static VT_UI1 => 17

    /**
     * An unsigned short.
     * @type {Integer (UInt16)}
     */
    static VT_UI2 => 18

    /**
     * An unsigned long.
     * @type {Integer (UInt16)}
     */
    static VT_UI4 => 19

    /**
     * A 64-bit integer.
     * @type {Integer (UInt16)}
     */
    static VT_I8 => 20

    /**
     * A 64-bit unsigned integer.
     * @type {Integer (UInt16)}
     */
    static VT_UI8 => 21

    /**
     * An integer.
     * @type {Integer (UInt16)}
     */
    static VT_INT => 22

    /**
     * An unsigned integer.
     * @type {Integer (UInt16)}
     */
    static VT_UINT => 23

    /**
     * A C-style void.
     * @type {Integer (UInt16)}
     */
    static VT_VOID => 24

    /**
     * An HRESULT value.
     * @type {Integer (UInt16)}
     */
    static VT_HRESULT => 25

    /**
     * A pointer type.
     * @type {Integer (UInt16)}
     */
    static VT_PTR => 26

    /**
     * A safe array. Use VT_ARRAY in VARIANT.
     * @type {Integer (UInt16)}
     */
    static VT_SAFEARRAY => 27

    /**
     * A C-style array.
     * @type {Integer (UInt16)}
     */
    static VT_CARRAY => 28

    /**
     * A user-defined type.
     * @type {Integer (UInt16)}
     */
    static VT_USERDEFINED => 29

    /**
     * A null-terminated string.
     * @type {Integer (UInt16)}
     */
    static VT_LPSTR => 30

    /**
     * A wide null-terminated string.
     * @type {Integer (UInt16)}
     */
    static VT_LPWSTR => 31

    /**
     * A user-defined type.
     * @type {Integer (UInt16)}
     */
    static VT_RECORD => 36

    /**
     * A signed machine register size width.
     * @type {Integer (UInt16)}
     */
    static VT_INT_PTR => 37

    /**
     * An unsigned machine register size width.
     * @type {Integer (UInt16)}
     */
    static VT_UINT_PTR => 38

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> value.
     * @type {Integer (UInt16)}
     */
    static VT_FILETIME => 64

    /**
     * Length-prefixed bytes.
     * @type {Integer (UInt16)}
     */
    static VT_BLOB => 65

    /**
     * The name of the stream follows.
     * @type {Integer (UInt16)}
     */
    static VT_STREAM => 66

    /**
     * The name of the storage follows.
     * @type {Integer (UInt16)}
     */
    static VT_STORAGE => 67

    /**
     * The stream contains an object.
     * @type {Integer (UInt16)}
     */
    static VT_STREAMED_OBJECT => 68

    /**
     * The storage contains an object.
     * @type {Integer (UInt16)}
     */
    static VT_STORED_OBJECT => 69

    /**
     * The blob contains an object.
     * @type {Integer (UInt16)}
     */
    static VT_BLOB_OBJECT => 70

    /**
     * A clipboard format.
     * @type {Integer (UInt16)}
     */
    static VT_CF => 71

    /**
     * A class ID.
     * @type {Integer (UInt16)}
     */
    static VT_CLSID => 72

    /**
     * A stream with a GUID version.
     * @type {Integer (UInt16)}
     */
    static VT_VERSIONED_STREAM => 73

    /**
     * Reserved.
     * @type {Integer (UInt16)}
     */
    static VT_BSTR_BLOB => 4095

    /**
     * A simple counted array.
     * @type {Integer (UInt16)}
     */
    static VT_VECTOR => 4096

    /**
     * A SAFEARRAY pointer.
     * @type {Integer (UInt16)}
     */
    static VT_ARRAY => 8192

    /**
     * A void pointer for local use.
     * @type {Integer (UInt16)}
     */
    static VT_BYREF => 16384

    /**
     * 
     * @type {Integer (UInt16)}
     */
    static VT_RESERVED => 32768

    /**
     * 
     * @type {Integer (UInt16)}
     */
    static VT_ILLEGAL => 65535

    /**
     * 
     * @type {Integer (UInt16)}
     */
    static VT_ILLEGALMASKED => 4095

    /**
     * 
     * @type {Integer (UInt16)}
     */
    static VT_TYPEMASK => 4095
}
