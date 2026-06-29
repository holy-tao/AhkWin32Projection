#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LUID structure is an opaque structure that specifies an identifier that is guaranteed to be unique on the local machine. For more information, see the reference page for LUID in the Microsoft Windows SDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/ntdef/ns-ntdef-luid
 * @namespace Windows.Win32.Foundation
 */
export default struct LUID {
    #StructPack 4

    LowPart : UInt32

    HighPart : Int32

}
