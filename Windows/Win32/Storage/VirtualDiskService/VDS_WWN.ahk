#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VDS_WWN structure (vdshwprv.h) defines a world-wide name (WWN). This structure corresponds to the HBA_WWN structure defined by the ANSI HBA API.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_wwn
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_WWN {
    #StructPack 1

    /**
     * An array of 8 bytes that together specify the 64-bit WWN value. The first element of the array is the most 
     *       significant byte of the WWN, with the most significant bit of that byte being the most significant bit of the 
     *       WWN.
     */
    rguchWwn : Int8[8]

}
