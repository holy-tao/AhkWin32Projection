#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IFlashControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlashControl
     * @type {Guid}
     */
    static IID => Guid("{def41dbe-7d68-45e3-8c0f-be7bb32837d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Supported", "get_PowerSupported", "get_RedEyeReductionSupported", "get_Enabled", "put_Enabled", "get_Auto", "put_Auto", "get_RedEyeReduction", "put_RedEyeReduction", "get_PowerPercent", "put_PowerPercent"]

    /**
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * @type {Boolean} 
     */
    PowerSupported {
        get => this.get_PowerSupported()
    }

    /**
     * @type {Boolean} 
     */
    RedEyeReductionSupported {
        get => this.get_RedEyeReductionSupported()
    }

    /**
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {Boolean} 
     */
    Auto {
        get => this.get_Auto()
        set => this.put_Auto(value)
    }

    /**
     * @type {Boolean} 
     */
    RedEyeReduction {
        get => this.get_RedEyeReduction()
        set => this.put_RedEyeReduction(value)
    }

    /**
     * @type {Float} 
     */
    PowerPercent {
        get => this.get_PowerPercent()
        set => this.put_PowerPercent(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PowerSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RedEyeReductionSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets or sets a value that specifies whether the InkCollector object collects pen input (in-air packets, cursor in range events, and so on). (Put)
     * @remarks
     * If an enabled object's window input rectangle (set in the constructor or with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setwindowinputrectangle">SetWindowInputRectangle</a> method) of an enabled object overlaps the window input rectangle of another enabled object, the E_INK_OVERLAPPING_INPUT_RECT error is returned. Overlap can occur without an error as long as only one of the input rectangles is enabled at any known time.
     * 
     * While an object is not enabled, you receive no events.
     * 
     * When a container control has its <b>Enabled</b> property set to <b>FALSE</b>, all of its contained controls are disabled as well.
     * 
     * You cannot set the <b>Enabled</b> property to <b>FALSE</b> while the object is collecting ink (<a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_collectingink">CollectingInk</a> property is <b>TRUE</b>).
     * 
     * We recommend that you set <b>Enabled</b> set to <b>FALSE</b> when the application shuts down.
     * 
     * <div class="alert"><b>Note</b>  Setting this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * This property must be set to <b>FALSE</b> before setting or calling specific properties and methods of the object. If you try to change the specified properties or methods, an error occurs. The following properties and methods cannot be set or called unless the <b>Enabled</b> property is first set to <b>FALSE</b>:
     * 
     * Properties
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_attachmode">AttachMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd">hWnd</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_ink">Ink</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_marginx">MarginX</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_marginy">MarginY</a>
     * </li>
     * </ul>
     * Methods
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setalltabletsmode">SetAllTabletsMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setsingletabletintegratedmode">SetSingleTabletIntegratedMode</a>
     * </li>
     * </ul>
     * @param {Boolean} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkcollector-put_enabled
     */
    put_Enabled(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Auto() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Auto(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RedEyeReduction() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RedEyeReduction(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PowerPercent() {
        result := ComCall(15, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PowerPercent(value) {
        result := ComCall(16, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
