#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The CCAB structure contains cabinet information.
 * @see https://learn.microsoft.com/windows/win32/api/fci/ns-fci-ccab
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct CCAB {
    #StructPack 4

    /**
     * The maximum size, in bytes, of a cabinet  created by FCI.
     */
    cb : UInt32

    /**
     * The maximum size, in bytes, that  a folder will contain before a new folder is created.
     */
    cbFolderThresh : UInt32

    /**
     * The size, in bytes, of the CFHeader reserve area. Possible value range is 0-60,000.
     */
    cbReserveCFHeader : UInt32

    /**
     * The size, in bytes, of the CFFolder reserve area. Possible value range is 0-255.
     */
    cbReserveCFFolder : UInt32

    /**
     * The size, in bytes, of the CFData reserve area. Possible value range is 0-255.
     */
    cbReserveCFData : UInt32

    /**
     * The number of created cabinets.
     */
    iCab : Int32

    /**
     * The maximum size, in bytes, of a cabinet  created by FCI.
     */
    iDisk : Int32

    /**
     * TBD
     */
    fFailOnIncompressible : Int32

    /**
     * A value that represents the association between a collection of linked cabinet files.
     */
    setID : UInt16

    /**
     * The name of the disk on which the cabinet is placed.
     */
    szDisk : CHAR[256]

    /**
     * The name of the cabinet.
     */
    szCab : CHAR[256]

    /**
     * The full path that indicates where to create the cabinet.
     */
    szCabPath : CHAR[256]

}
