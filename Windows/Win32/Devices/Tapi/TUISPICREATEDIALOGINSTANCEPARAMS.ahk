#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TUISPI data structure is defined below.
 * @see https://learn.microsoft.com/windows/win32/api/tspi/ns-tspi-tuispicreatedialoginstanceparams
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TUISPICREATEDIALOGINSTANCEPARAMS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The <b>dwRequestID</b> passed to the service provider as a parameter in the asynchronous TSPI function with which the spontaneous UI is associated. TAPI uses this to identify the application in whose context the UI DLL is to be loaded and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tuispi_providergenericdialog">TUISPI_providerGenericDialog</a> function invoked.
     * @type {Integer}
     */
    dwRequestID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The service provider's identifier for the association with the instance of the generic dialog box. Because it is possible for multiple instances of the generic dialog box to be open in the same or multiple applications, the service provider must ensure that its handle is unique within the scope of existing instances within the context of the provider.
     * @type {Pointer<HDRVDIALOGINSTANCE>}
     */
    hdDlgInst {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * TAPI writes into this member its identifier for the association that is created. This member is set to <b>NULL</b> if creating the association failed, in which case it is impossible for the service provider to create a dialog box spontaneously in the context of the target application. The service provider must use this identifier in messages to send data to the UI DLL (<a href="https://docs.microsoft.com/windows/desktop/Tapi/line-senddialoginstancedata">LINE_SENDDIALOGINSTANCEDATA</a>).
     * @type {Integer}
     */
    htDlgInst {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a <b>NULL</b>-terminated string specifying the fully qualified name of the UI DLL to load in the application context.
     * @type {Pointer<PWSTR>}
     */
    lpszUIDLLName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a private parameter block to be conveyed to the UI DLL's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tuispi_providergenericdialog">TUISPI_providerGenericDialog</a> function. The service provider and UI DLL determine the contents of the parameter block. The transfer is unidirectional; the UI DLL is not able to modify the parameter block and return it to the service provider. Generally, this block instructs the UI DLL which dialog box to display, and contains the information to display (if necessary).
     * @type {Pointer<Void>}
     */
    lpParams {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The size, in bytes, of the parameter block.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
