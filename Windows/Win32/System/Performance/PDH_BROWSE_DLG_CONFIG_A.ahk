#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PERF_DETAIL.ahk" { PERF_DETAIL }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The PDH_BROWSE_DLG_CONFIG structure is used by the PdhBrowseCounters function to configure the Browse Performance Counters dialog box. (ANSI)
 * @remarks
 * Each time the 
 * <a href="https://docs.microsoft.com/windows/desktop/SysMon/counters-add">Add</a> button is clicked, the <b>szReturnPathBuffer</b> buffer contains the selected counter and the <b>pCallBack</b> callback function is called. The callback function should call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function for each counter in the buffer.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_a
 * @namespace Windows.Win32.System.Performance
 * @charset ANSI
 */
export default struct PDH_BROWSE_DLG_CONFIG_A {
    #StructPack 8

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
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    bIncludeInstanceIndex {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    bSingleCounterPerAdd {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    bSingleCounterPerDialog {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    bLocalCountersOnly {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    bWildCardInstances {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    bHideDetailBox {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    bInitializePath {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    bDisableMachineSelection {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    bIncludeCostlyObjects {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    bShowObjectBrowser {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    bReserved {
        get => (this._bitfield >> 10) & 0x3FFFFF
        set => this._bitfield := ((value & 0x3FFFFF) << 10) | (this._bitfield & ~(0x3FFFFF << 10))
    }
    /**
     * Handle of the window to own the dialog. If <b>NULL</b>, the owner is the desktop.
     */
    hWndOwner : HWND

    /**
     * Pointer to a <b>null</b>-terminated string that specifies the name of the log file from which the list of counters is retrieved. If <b>NULL</b>, the list of counters is retrieved from the local computer (or remote computer if specified).
     */
    szDataSource : PSTR

    /**
     * Pointer to a MULTI_SZ that contains the selected counter paths. 
     * 
     * If <b>bInitializePath</b> is <b>TRUE</b>, you can use this member to specify a counter path whose components are used to highlight entries in computer, object, counter, and instance lists when the dialog is first displayed.
     */
    szReturnPathBuffer : PSTR

    /**
     * Size of the <b>szReturnPathBuffer</b> buffer, in <b>TCHARs</b>. If the callback function reallocates a new buffer, it must also update this value.
     */
    cchReturnPathLength : UInt32

    /**
     * Pointer to the callback function that processes the user's selection. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nc-pdh-counterpathcallback">CounterPathCallBack</a>.
     */
    pCallBack : IntPtr

    /**
     * Caller-defined value that is passed to the callback function.
     */
    dwCallBackArg : IntPtr

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
     */
    CallBackStatus : Int32

    dwDefaultDetailLevel : PERF_DETAIL

    /**
     * Pointer to a <b>null</b>-terminated string that specifies the optional caption to display in the caption bar of the dialog box. If this member is <b>NULL</b>, the caption will be <b>Browse Performance Counters</b>.
     */
    szDialogBoxCaption : PSTR

}
