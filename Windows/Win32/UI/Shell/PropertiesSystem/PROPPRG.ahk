#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * This structure contains information from a .pif file. It is used by PifMgr_GetProperties.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-propprg
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct PROPPRG {
    #StructPack 4

    /**
     * Type: <b>WORD</b>
     * 
     * Flags that describe how the program will run.
     */
    flPrg : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * Flags that specify the initial conditions for the application.
     */
    flPrgInit : UInt16

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the title.
     */
    achTitle : CHAR[30]

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the command line, including arguments.
     */
    achCmdLine : CHAR[128]

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the working directory.
     */
    achWorkDir : CHAR[64]

    /**
     * Type: <b>WORD</b>
     * 
     * The key code of the .pif file's hotkey.
     */
    wHotKey : UInt16

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the file that contains the icon.
     */
    achIconFile : CHAR[80]

    /**
     * Type: <b>WORD</b>
     * 
     * The index of the icon in the file specified by <b>achIconFile</b>.
     */
    wIconIndex : UInt16

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    dwEnhModeFlags : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags that specify the real mode options.
     */
    dwRealModeFlags : UInt32

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the "other" file in the directory.
     */
    achOtherFile : CHAR[80]

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the .pif file in the directory.
     */
    achPIFFile : CHAR[260]

}
