#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method to use as the [OnNavigatingFrom](../windows.ui.xaml.controls/page_onnavigatingfrom_425696585.md) callback override.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigatingcanceleventhandler
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class NavigatingCancelEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for NavigatingCancelEventHandler
     * @type {Guid}
     */
    static IID => Guid("{75d6a78f-a302-4489-9898-24ea49182910}")

    /**
     * The class identifier for NavigatingCancelEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{75d6a78f-a302-4489-9898-24ea49182910}")

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
     * @param {NavigatingCancelEventArgs} e 
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
