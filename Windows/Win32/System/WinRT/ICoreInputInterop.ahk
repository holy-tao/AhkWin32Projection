#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables an input source on a Windows application's core input object.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource">CoreIndependentInputSource</a> or <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource">CoreComponentInputSource</a> object defines the basic keyboard and pointer input events  for a Windows Store app.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//corewindow/nn-corewindow-icoreinputinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICoreInputInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInputInterop
     * @type {Guid}
     */
    static IID => Guid("{40bfe3e3-b75a-4479-ac96-475365749bb8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInputSource", "put_MessageHandled"]

    /**
     * @type {HRESULT} 
     */
    MessageHandled {
        set => this.put_MessageHandled(value)
    }

    /**
     * Sets the input source for an app's CoreIndependentInputSource or CoreComponentInputSource.
     * @param {IUnknown} value Pointer to the base COM interface of the input source.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//corewindow/nf-corewindow-icoreinputinterop-setinputsource
     */
    SetInputSource(value) {
        result := ComCall(3, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Sets whether or not the message to the CoreWindow has been handled.
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//corewindow/nf-corewindow-icoreinputinterop-put_messagehandled
     */
    put_MessageHandled(value) {
        result := ComCall(4, this, "char", value, "HRESULT")
        return result
    }
}
