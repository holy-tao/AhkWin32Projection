#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines an item identifier.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-shitemid
 * @namespace Windows.Win32.UI.Shell.Common
 */
export default struct SHITEMID {
    #StructPack 2

    /**
     * Type: <b>USHORT</b>
     * 
     * The size of identifier, in bytes, including <b>cb</b> itself.
     */
    cb : UInt16

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * A variable-length item identifier.
     */
    abID : Int8[1]

}
