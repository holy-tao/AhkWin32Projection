#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDLDESC.ahk" { IDLDESC }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDLFLAGS.ahk" { IDLFLAGS }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import ".\TYPEKIND.ahk" { TYPEKIND }
#Import ".\TYPEDESC.ahk" { TYPEDESC }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Ole\ARRAYDESC.ahk" { ARRAYDESC }

/**
 * Contains attributes of a type.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-typeattr
 * @namespace Windows.Win32.System.Com
 */
export default struct TYPEATTR {
    #StructPack 8

    /**
     * The GUID of the type information.
     */
    guid : Guid

    /**
     * The locale of member names and documentation strings.
     */
    lcid : UInt32

    /**
     * Reserved.
     */
    dwReserved : UInt32

    /**
     * The constructor ID, or MEMBERID_NIL if none.
     */
    memidConstructor : Int32

    /**
     * The destructor ID, or MEMBERID_NIL if none.
     */
    memidDestructor : Int32

    /**
     * Reserved.
     */
    lpstrSchema : PWSTR

    /**
     * The size of an instance of this type.
     */
    cbSizeInstance : UInt32

    /**
     * The kind of type.
     */
    typekind : TYPEKIND

    /**
     * The number of functions.
     */
    cFuncs : UInt16

    /**
     * The number of variables or data members.
     */
    cVars : UInt16

    /**
     * The number of implemented interfaces.
     */
    cImplTypes : UInt16

    /**
     * The size of this type's VTBL.
     */
    cbSizeVft : UInt16

    /**
     * The byte alignment for an instance of this type. A value of 0 indicates alignment on the 64K boundary; 1 indicates no special alignment. For other values, <i>n</i> indicates aligned on byte <i>n</i>.
     */
    cbAlignment : UInt16

    /**
     * The type flags. See <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ne-oaidl-typeflags">TYPEFLAGS</a>.
     */
    wTypeFlags : UInt16

    /**
     * The major version number.
     */
    wMajorVerNum : UInt16

    /**
     * The minor version number.
     */
    wMinorVerNum : UInt16

    /**
     * If <b>typekind</b> is TKIND_ALIAS, specifies the type for which this type is an alias.
     */
    tdescAlias : TYPEDESC

    /**
     * The IDL attributes of the described type.
     */
    idldescType : IDLDESC

}
