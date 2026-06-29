#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYSKIND.ahk" { SYSKIND }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about a type library. Information from this structure is used to identify the type library and to provide national language support for member names.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-tlibattr
 * @namespace Windows.Win32.System.Com
 */
export default struct TLIBATTR {
    #StructPack 4

    /**
     * The globally unique identifier.
     */
    guid : Guid

    /**
     * The locale identifier.
     */
    lcid : UInt32

    /**
     * The target hardware platform.
     */
    syskind : SYSKIND

    /**
     * The major version number.
     */
    wMajorVerNum : UInt16

    /**
     * The minor version number.
     */
    wMinorVerNum : UInt16

    /**
     * The library flags.
     */
    wLibFlags : UInt16

}
