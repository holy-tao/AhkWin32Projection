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
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    SetInputSource(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MessageHandled(value) {
        result := ComCall(4, this, "char", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
