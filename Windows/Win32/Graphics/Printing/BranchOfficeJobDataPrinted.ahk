#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BranchOfficeJobDataPrinted {
    #StructPack 8

    Status : UInt32

    pDocumentName : PWSTR

    pUserName : PWSTR

    pMachineName : PWSTR

    pPrinterName : PWSTR

    pPortName : PWSTR

    Size : Int64

    TotalPages : UInt32

}
