#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The FDICABINETINFO structure contains details about a particular cabinet file.
 * @see https://learn.microsoft.com/windows/win32/api/fdi/ns-fdi-fdicabinetinfo
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct FDICABINETINFO {
    #StructPack 4

    /**
     * The total length of the cabinet file.
     */
    cbCabinet : Int32

    /**
     * The count of the folders in the cabinet.
     */
    cFolders : UInt16

    /**
     * The count of the files in the cabinet.
     */
    cFiles : UInt16

    /**
     * The identifier of the cabinet set.
     */
    setID : UInt16

    /**
     * The cabinet number in set. This index is zero based.
     */
    iCabinet : UInt16

    /**
     * If this value is set to <b>TRUE</b>, a reserved area is present in the cabinet.
     */
    fReserve : BOOL

    /**
     * If this value is set to <b>TRUE</b>, the cabinet is linked to a previous cabinet. This is accomplished by having a file continued from the previous cabinet into the current one.
     */
    hasprev : BOOL

    /**
     * If this value is set to <b>TRUE</b>, the current cabinet is linked to the next cabinet by having a file continued from the current cabinet into the next one.
     */
    hasnext : BOOL

}
