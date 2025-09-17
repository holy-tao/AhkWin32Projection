#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PDH_BROWSE_DLG_CONFIG_H structure is used by the PdhBrowseCountersH function to configure the Browse Performance Counters dialog box. (Unicode)
 * @remarks
 * Each time the 
  * <a href="https://docs.microsoft.com/windows/desktop/SysMon/counters-add">Add</a> button is clicked, the <b>szReturnPathBuffer</b> buffer contains the selected counter and the <b>pCallBack</b> callback function is called. The callback function should call the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function for each counter in the buffer.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The pdh.h header defines PDH_BROWSE_DLG_CONFIG_H as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_hw
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 * @charset Unicode
 */
class PDH_BROWSE_DLG_CONFIG_HW extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Handle of the window to own the dialog. If <b>NULL</b>, the owner is the desktop.
     * @type {Pointer<Void>}
     */
    hWndOwner {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @type {Pointer<Void>}
     */
    hDataSource {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a MULTI_SZ that contains the selected counter paths. 
     * 
     * If <b>bInitializePath</b> is <b>TRUE</b>, you can use this member to specify a counter path whose components are used to highlight entries in computer, object, counter, and instance lists when the dialog is first displayed.
     * @type {Pointer<Char>}
     */
    szReturnPathBuffer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Size of the <b>szReturnPathBuffer</b> buffer, in <b>TCHARs</b>. If the callback function reallocates a new buffer, it must also update this value.
     * @type {Integer}
     */
    cchReturnPathLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to the callback function that processes the user's selection. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nc-pdh-counterpathcallback">CounterPathCallBack</a>.
     * @type {Pointer<CounterPathCallBack>}
     */
    pCallBack {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Caller-defined value that is passed to the callback function.
     * @type {Pointer}
     */
    dwCallBackArg {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * On entry to the callback function, this member contains the status of the path buffer. On exit, the callback function sets the status value resulting from processing. 
     * 
     * 
     * 
     * 
     * If the buffer is too small to load the current selection, the dialog sets this value to PDH_MORE_DATA. If this value is ERROR_SUCCESS, then the <b>szReturnPathBuffer</b> member contains a valid counter path or counter path list.
     * 
     * If the callback function reallocates a new buffer, it should set this member to PDH_RETRY so that the dialog will try to load the buffer with the selected paths and call the callback function again.
     * 
     * If some other error occurred, then the callback function should return the appropriate PDH error status value.
     * @type {Integer}
     */
    CallBackStatus {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * 
     * @type {Integer}
     */
    dwDefaultDetailLevel {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Pointer to a <b>null</b>-terminated string that specifies the optional caption to display in the caption bar of the dialog box. If this member is <b>NULL</b>, the caption will be <b>Browse Performance Counters</b>.
     * @type {Pointer<Char>}
     */
    szDialogBoxCaption {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
