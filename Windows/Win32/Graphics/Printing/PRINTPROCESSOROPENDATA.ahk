#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTPROCESSOROPENDATA {
    #StructPack 8

    pDevMode : DEVMODEA.Ptr

    pDatatype : PWSTR

    pParameters : PWSTR

    pDocumentName : PWSTR

    JobId : UInt32

    pOutputFile : PWSTR

    pPrinterName : PWSTR

}
