#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The ADDJOB\_INFO\_1 structure identifies a print job as well as the directory and file in which an application can store that job.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addjob-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct ADDJOB_INFO_1A {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that contains the path and file name that the application can use to store the print job.
     */
    Path : PSTR

    /**
     * A handle to the print job.
     */
    JobId : UInt32

}
