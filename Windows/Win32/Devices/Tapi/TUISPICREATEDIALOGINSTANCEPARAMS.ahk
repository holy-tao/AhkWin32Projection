#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HDRVDIALOGINSTANCE.ahk" { HDRVDIALOGINSTANCE }

/**
 * The TUISPI data structure is defined below.
 * @see https://learn.microsoft.com/windows/win32/api/tspi/ns-tspi-tuispicreatedialoginstanceparams
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct TUISPICREATEDIALOGINSTANCEPARAMS {
    #StructPack 8

    /**
     * The <b>dwRequestID</b> passed to the service provider as a parameter in the asynchronous TSPI function with which the spontaneous UI is associated. TAPI uses this to identify the application in whose context the UI DLL is to be loaded and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tuispi_providergenericdialog">TUISPI_providerGenericDialog</a> function invoked.
     */
    dwRequestID : UInt32

    /**
     * The service provider's identifier for the association with the instance of the generic dialog box. Because it is possible for multiple instances of the generic dialog box to be open in the same or multiple applications, the service provider must ensure that its handle is unique within the scope of existing instances within the context of the provider.
     */
    hdDlgInst : HDRVDIALOGINSTANCE

    /**
     * TAPI writes into this member its identifier for the association that is created. This member is set to <b>NULL</b> if creating the association failed, in which case it is impossible for the service provider to create a dialog box spontaneously in the context of the target application. The service provider must use this identifier in messages to send data to the UI DLL (<a href="https://docs.microsoft.com/windows/desktop/Tapi/line-senddialoginstancedata">LINE_SENDDIALOGINSTANCEDATA</a>).
     */
    htDlgInst : UInt32

    /**
     * Pointer to a <b>NULL</b>-terminated string specifying the fully qualified name of the UI DLL to load in the application context.
     */
    lpszUIDLLName : PWSTR

    /**
     * Pointer to a private parameter block to be conveyed to the UI DLL's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tuispi_providergenericdialog">TUISPI_providerGenericDialog</a> function. The service provider and UI DLL determine the contents of the parameter block. The transfer is unidirectional; the UI DLL is not able to modify the parameter block and return it to the service provider. Generally, this block instructs the UI DLL which dialog box to display, and contains the information to display (if necessary).
     */
    lpParams : IntPtr

    /**
     * The size, in bytes, of the parameter block.
     */
    dwSize : UInt32

}
