#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewBrush
     * @type {Guid}
     */
    static IID => Guid("{40e86f75-0cf4-4b72-a4d6-cf5d15780116}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceName", "put_SourceName", "Redraw", "SetSource"]

    /**
     * @type {HSTRING} 
     */
    SourceName {
        get => this.get_SourceName()
        set => this.put_SourceName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SourceName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The RedrawWindow function updates the specified rectangle or region in a window's client area.
     * @remarks
     * When <b>RedrawWindow</b> is used to invalidate part of the desktop window, the desktop window does not receive a <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> message. To repaint the desktop, an application uses the RDW_ERASE flag to generate a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-erasebkgnd">WM_ERASEBKGND</a> message.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-redrawwindow
     */
    Redraw() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {WebView} source 
     * @returns {HRESULT} 
     */
    SetSource(source) {
        result := ComCall(9, this, "ptr", source, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
