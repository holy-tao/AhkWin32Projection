#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * A variable-size structure that contains information about a menu file name.
 * @remarks
 * <div class="alert"><b>Important</b>  This structure cannot be used with operating systems later than Windows 2000.</div>
 * <div> </div>
 * When reading an <b>AASHELLMENUFILENAME</b> structure, first read a single SHORT to determine the total size of the structure, then use that value to read the remainder of the structure.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-aashellmenufilename
 * @namespace Windows.Win32.UI.Shell
 */
export default struct AASHELLMENUFILENAME {
    #StructPack 2

    /**
     * Type: <b>SHORT</b>
     * 
     * The size of the structure, in bytes.
     */
    cbTotal : Int16

    /**
     * Type: <b>BYTE[12]</b>
     * 
     * Reserved. Applications should ignore this value.
     */
    rgbReserved : Int8[12]

    /**
     * Type: <b>TCHAR[1]</b>
     * 
     * The menu file name. This string is in Unicode on Windows 2000.
     */
    szFileName : WCHAR[1]

}
