#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\TYPEDESC.ahk" { TYPEDESC }
#Import "..\Com\SAFEARRAYBOUND.ahk" { SAFEARRAYBOUND }
#Import "..\Variant\VARENUM.ahk" { VARENUM }

/**
 * Describes an array, its element type, and its dimension.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-arraydesc
 * @namespace Windows.Win32.System.Ole
 */
export default struct ARRAYDESC {
    #StructPack 8

    /**
     * The element type.
     */
    tdescElem : TYPEDESC

    /**
     * The dimension count.
     */
    cDims : UInt16

    /**
     * A variable-length array containing one element for each dimension.
     */
    rgbounds : SAFEARRAYBOUND[1]

}
