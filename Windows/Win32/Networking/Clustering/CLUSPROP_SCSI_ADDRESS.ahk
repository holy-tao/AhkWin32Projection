#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUS_SCSI_ADDRESS.ahk" { CLUS_SCSI_ADDRESS }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }

/**
 * Describes an address for a SCSI device.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_scsi_address
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_SCSI_ADDRESS {
    #StructPack 4

    Base : CLUSPROP_VALUE

    Base2 : CLUS_SCSI_ADDRESS

}
