#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\METHODDATA.ahk" { METHODDATA }

/**
 * Describes the object's properties and methods.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/ns-oleauto-interfacedata
 * @namespace Windows.Win32.System.Ole
 */
export default struct INTERFACEDATA {
    #StructPack 8

    /**
     * An array of METHODDATA structures.
     */
    pmethdata : METHODDATA.Ptr

    /**
     * The count of members.
     */
    cMembers : UInt32

}
