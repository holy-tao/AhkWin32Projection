#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BranchOfficeJobDataError {
    #StructPack 8

    LastError : UInt32

    pDocumentName : PWSTR

    pUserName : PWSTR

    pPrinterName : PWSTR

    pDataType : PWSTR

    TotalSize : Int64

    PrintedSize : Int64

    TotalPages : UInt32

    PrintedPages : UInt32

    pMachineName : PWSTR

    pJobError : PWSTR

    pErrorDescription : PWSTR

}
