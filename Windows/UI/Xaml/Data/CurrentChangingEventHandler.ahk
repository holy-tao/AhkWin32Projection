#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that can handle the [CurrentChanging](icollectionview_currentchanging.md) event of an [ICollectionView](icollectionview.md) implementation.
 * @remarks
 * The [ICollectionView.CurrentChanging](icollectionview_currentchanging.md) event occurs when the [CurrentItem](icollectionview_currentitem.md) property value is changing. The [CurrentChangingEventArgs](currentchangingeventargs.md) parameter passed to the event handler specifies information about the change.
 * 
 * If [IsCancelable](currentchangingeventargs_iscancelable.md) is **true**, the event handler can cancel the change by setting [Cancel](currentchangingeventargs_cancel.md) to **true**. If the change is canceled, [CurrentItem](icollectionview_currentitem.md) is not changed. Setting [Cancel](currentchangingeventargs_cancel.md) to **true** when [IsCancelable](currentchangingeventargs_iscancelable.md) is **false** raises an exception.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.currentchangingeventhandler
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class CurrentChangingEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for CurrentChangingEventHandler
     * @type {Guid}
     */
    static IID => Guid("{f3888db8-139f-4dce-8dc9-f7f1444d1185}")

    /**
     * The class identifier for CurrentChangingEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{f3888db8-139f-4dce-8dc9-f7f1444d1185}")

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
     * @param {CurrentChangingEventArgs} e 
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
