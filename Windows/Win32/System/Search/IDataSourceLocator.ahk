#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDataSourceLocator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataSourceLocator
     * @type {Guid}
     */
    static IID => Guid("{2206ccb2-19c1-11d1-89e0-00c04fd7a829}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_hWnd", "put_hWnd", "PromptNew", "PromptEdit"]

    /**
     * @type {HWND} 
     */
    hWnd {
        get => this.get_hWnd()
        set => this.put_hWnd(value)
    }

    /**
     * 
     * @returns {HWND} 
     */
    get_hWnd() {
        phwndParent := HWND()
        result := ComCall(7, this, "ptr", phwndParent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phwndParent
    }

    /**
     * Gets or sets the handle value of the window on which ink is drawn. (IInkCollector.put_hWnd)
     * @remarks
     * If two or more windows exist, this property allows you to specify which window collects ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> objects, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property to <b>FALSE</b>. You can then set the <b>hWnd</b> property and re-enable the object by setting the <b>Enabled</b> property to <b>TRUE</b>.</div>
     * <div> </div>
     * In Automation, this property is called <b>hWnd Property</b>.
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkcollector-put_hwnd
     */
    put_hWnd(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(8, this, "ptr", hwndParent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    PromptNew() {
        result := ComCall(9, this, "ptr*", &ppADOConnection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppADOConnection)
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppADOConnection 
     * @returns {VARIANT_BOOL} 
     */
    PromptEdit(ppADOConnection) {
        result := ComCall(10, this, "ptr*", ppADOConnection, "short*", &pbSuccess := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbSuccess
    }
}
