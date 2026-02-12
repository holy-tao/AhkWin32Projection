#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Media\Brush.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IJumpListItemBackgroundConverter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJumpListItemBackgroundConverter
     * @type {Guid}
     */
    static IID => Guid("{81177858-d224-410c-b16c-c5b6bb6188b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Enabled", "put_Enabled", "get_Disabled", "put_Disabled"]

    /**
     * @type {Brush} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {Brush} 
     */
    Disabled {
        get => this.get_Disabled()
        set => this.put_Disabled(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Enabled() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
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
     * @param {Brush} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkcollector-put_enabled
     */
    put_Enabled(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Disabled() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Disabled(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
