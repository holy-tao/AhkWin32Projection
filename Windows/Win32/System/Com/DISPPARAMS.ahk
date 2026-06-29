#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Contains the arguments passed to a method or property.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-dispparams
 * @namespace Windows.Win32.System.Com
 */
export default struct DISPPARAMS {
    #StructPack 8

    /**
     * An array of arguments.
     * 
     * **Note**: these arguments appear in reverse order
     */
    rgvarg : VARIANT.Ptr

    /**
     * The dispatch IDs of the named arguments.
     */
    rgdispidNamedArgs : IntPtr

    /**
     * The number of arguments.
     */
    cArgs : UInt32

    /**
     * The number of named arguments.
     */
    cNamedArgs : UInt32

}
