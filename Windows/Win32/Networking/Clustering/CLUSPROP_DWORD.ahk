#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }

/**
 * Describes a numeric value identifying the physical drive of a disk.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_dword
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_DWORD {
    #StructPack 4

    Base : CLUSPROP_VALUE

    /**
     * Numeric value identifying the physical drive of the disk. Valid values begin at zero.
     */
    dw : UInt32

}
