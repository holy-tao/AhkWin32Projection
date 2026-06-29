#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Represents a XAML Runtime enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-enumtype
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct EnumType {
    #StructPack 8

    /**
     * The name of the enumeration.
     */
    Name : BSTR

    /**
     * An array of int values in the enumeration.
     */
    ValueInts : SAFEARRAY.Ptr

    /**
     * An array of strings representing the named value of the enumeration.
     */
    ValueStrings : SAFEARRAY.Ptr

}
