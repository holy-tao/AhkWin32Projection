#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BranchOfficeJobDataPipelineFailed {
    #StructPack 8

    pDocumentName : PWSTR

    pPrinterName : PWSTR

    pExtraErrorInfo : PWSTR

}
