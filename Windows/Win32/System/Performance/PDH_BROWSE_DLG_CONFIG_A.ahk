#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * The PDH_BROWSE_DLG_CONFIG structure is used by the PdhBrowseCounters function to configure the Browse Performance Counters dialog box. (ANSI)
 * @remarks
 * Each time the 
 * <a href="https://docs.microsoft.com/windows/desktop/SysMon/counters-add">Add</a> button is clicked, the <b>szReturnPathBuffer</b> buffer contains the selected counter and the <b>pCallBack</b> callback function is called. The callback function should call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function for each counter in the buffer.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_a
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 * @charset ANSI
 */
class PDH_BROWSE_DLG_CONFIG_A extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - bIncludeInstanceIndex
     * - bSingleCounterPerAdd
     * - bSingleCounterPerDialog
     * - bLocalCountersOnly
     * - bWildCardInstances
     * - bHideDetailBox
     * - bInitializePath
     * - bDisableMachineSelection
     * - bIncludeCostlyObjects
     * - bShowObjectBrowser
     * - bReserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If this flag is <b>TRUE</b>, the dialog box includes an index number for duplicate instance names. For example, if there are two cmd instances, the instance list will contain cmd and cmd#1. If this flag is <b>FALSE</b>, duplicate instance names will not contain an index number.
     * @type {Integer}
     */
    bIncludeInstanceIndex {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * If this flag is <b>TRUE</b>, the dialog returns only one counter. If this flag is <b>FALSE</b>, the dialog can return multiple selections, and wildcard selections are permitted. Selected counters are returned as a MULTI_SZ string.
     * @type {Integer}
     */
    bSingleCounterPerAdd {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * If this flag is <b>TRUE</b>, the dialog box uses an OK and Cancel button. The dialog returns when the user clicks either button. If this flag is <b>FALSE</b>, the dialog box uses an Add and Close button. The dialog box closes when the user clicks the Close button. The Add button can be clicked multiple times. The Add button overwrites the previously selected items with the currently selected items.
     * @type {Integer}
     */
    bSingleCounterPerDialog {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * If this flag is <b>TRUE</b>, the dialog box lets the user select counters only from the local computer (the path will not contain a computer name). If this flag is <b>FALSE</b>, the user can specify a computer from which to select counters. The computer name will prefix the counter path unless the user selects <b>Use local computer counters</b>.
     * @type {Integer}
     */
    bLocalCountersOnly {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * If this flag is <b>TRUE</b> and the user selects <b>All instances</b>, the counter path will include the wildcard character for the instance field. 
     * 
     * 
     * If this flag is <b>FALSE</b>, and the user selects <b>All instances</b>, all the instances currently found for that object will be returned in a MULTI_SZ string.
     * @type {Integer}
     */
    bWildCardInstances {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * If this flag is <b>TRUE</b>, this removes <b>Detail level</b> from the dialog box so the user cannot change the detail level of the counters displayed in the dialog box. The detail level will be fixed to the value of the <b>dwDefaultDetailLevel</b> member. 
     * 
     * 
     * If this flag is <b>FALSE</b>, this displays <b>Detail level</b> in the dialog box, allowing the user to change the detail level of the counters displayed. 
     * 
     * 
     * 
     * Note that the counters displayed will be those whose detail level is less than or equal to the current detail level selection. Selecting a detail level of Wizard will display all counters and objects.
     * @type {Integer}
     */
    bHideDetailBox {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * If this flag is <b>TRUE</b>, the dialog highlights the counter and object specified in <b>szReturnPathBuffer</b> when the dialog box is first displayed, instead of using the default counter and object specified by the computer. 
     * 
     * 
     * If this flag is <b>FALSE</b>, this selects the initial counter and object using the default counter and object information returned by the computer.
     * @type {Integer}
     */
    bInitializePath {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * If this flag is <b>TRUE</b>, the user cannot select a computer from  <b>Select counters from computer</b>. 
     * 
     * 
     * If this flag is <b>FALSE</b>, the user can select a computer from <b>Select counters from computer</b>. This is the default value. 
     * The list contains the local computer only unless you call the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhconnectmachinea">PdhConnectMachine</a> to connect to other computers first.
     * @type {Integer}
     */
    bDisableMachineSelection {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * If this flag is <b>TRUE</b>, the counters list will also contain costly data—that is, data that requires a relatively large amount of processor time or memory overhead to collect. 
     * 
     * 
     * If this flag is <b>FALSE</b>, the list will not contain costly counters. This is the default value.
     * @type {Integer}
     */
    bIncludeCostlyObjects {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * If this flag is <b>TRUE</b>, the dialog lists only performance objects. When the user selects an object, the dialog returns a counter path that includes the object and wildcard characters for the instance name and counter if the object is a multiple instance object. For example, if the "Process" object is selected, the dialog returns the string "\Process(*)\*". If the object is a single instance object, the path contains a wildcard character for counter only. For example, "\System\*". You can then pass the path to <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhexpandwildcardpatha">PdhExpandWildCardPath</a> to retrieve a list of actual paths for the object.
     * @type {Integer}
     */
    bShowObjectBrowser {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * 
     * @type {Integer}
     */
    bReserved {
        get => (this._bitfield >> 10) & 0x3FFFFF
        set => this._bitfield := ((value & 0x3FFFFF) << 10) | (this._bitfield & ~(0x3FFFFF << 10))
    }

    /**
     * Handle of the window to own the dialog. If <b>NULL</b>, the owner is the desktop.
     * @type {HWND}
     */
    hWndOwner{
        get {
            if(!this.HasProp("__hWndOwner"))
                this.__hWndOwner := HWND(8, this)
            return this.__hWndOwner
        }
    }

    /**
     * Pointer to a <b>null</b>-terminated string that specifies the name of the log file from which the list of counters is retrieved. If <b>NULL</b>, the list of counters is retrieved from the local computer (or remote computer if specified).
     * @type {PSTR}
     */
    szDataSource {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a MULTI_SZ that contains the selected counter paths. 
     * 
     * If <b>bInitializePath</b> is <b>TRUE</b>, you can use this member to specify a counter path whose components are used to highlight entries in computer, object, counter, and instance lists when the dialog is first displayed.
     * @type {PSTR}
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
     * @type {PSTR}
     */
    szDialogBoxCaption {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
