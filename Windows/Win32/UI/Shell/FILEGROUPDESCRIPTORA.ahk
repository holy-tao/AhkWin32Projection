#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\FILEDESCRIPTORA.ahk" { FILEDESCRIPTORA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Defines the CF_FILEGROUPDESCRIPTOR clipboard format. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The shlobj_core.h header defines FILEGROUPDESCRIPTOR as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-filegroupdescriptora
 * @namespace Windows.Win32.UI.Shell
 * @charset ANSI
 */
export default struct FILEGROUPDESCRIPTORA {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * The number of elements in <b>fgd</b>.
     */
    cItems : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-filedescriptora">FILEDESCRIPTOR</a>[1]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-filedescriptora">FILEDESCRIPTOR</a> structures that contain the file information.
     */
    fgd : FILEDESCRIPTORA[1]

}
