#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle pointer message events such as [PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md).
 * @remarks
 * This delegate is used for handling each of the following events:
 * 
 * 
 * + [PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md)
 * + [PointerCanceled](../windows.ui.xaml/uielement_pointercanceled.md)
 * + [PointerCaptureLost](../windows.ui.xaml/uielement_pointercapturelost.md)
 * + [PointerEntered](../windows.ui.xaml/uielement_pointerentered.md)
 * + [PointerExited](../windows.ui.xaml/uielement_pointerexited.md)
 * + [PointerMoved](../windows.ui.xaml/uielement_pointermoved.md)
 * + [PointerReleased](../windows.ui.xaml/uielement_pointerreleased.md)
 * + [PointerWheelChanged](../windows.ui.xaml/uielement_pointerwheelchanged.md)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointereventhandler
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class PointerEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for PointerEventHandler
     * @type {Guid}
     */
    static IID => Guid("{e4385929-c004-4bcf-8970-359486e39f88}")

    /**
     * The class identifier for PointerEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{e4385929-c004-4bcf-8970-359486e39f88}")

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
     * @param {PointerRoutedEventArgs} e 
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
