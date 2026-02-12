#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that handles the [CleanUpVirtualizedItemEvent](virtualizingstackpanel_cleanupvirtualizeditemevent.md) attached event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.cleanupvirtualizeditemeventhandler
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CleanUpVirtualizedItemEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for CleanUpVirtualizedItemEventHandler
     * @type {Guid}
     */
    static IID => Guid("{cacad0d6-0f0d-4870-884d-f2dedf674288}")

    /**
     * The class identifier for CleanUpVirtualizedItemEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{cacad0d6-0f0d-4870-884d-f2dedf674288}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IInspectable} sender 
     * @param {CleanUpVirtualizedItemEventArgs} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, e) {
        result := ComCall(3, this, "ptr", sender, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
