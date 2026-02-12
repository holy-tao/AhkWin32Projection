#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [GetPreviewPage](printdocument_getpreviewpage.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.getpreviewpageeventhandler
 * @namespace Windows.UI.Xaml.Printing
 * @version WindowsRuntime 1.4
 */
class GetPreviewPageEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for GetPreviewPageEventHandler
     * @type {Guid}
     */
    static IID => Guid("{ccb3e9ed-9c11-4e50-ab49-e98086bbfdef}")

    /**
     * The class identifier for GetPreviewPageEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{ccb3e9ed-9c11-4e50-ab49-e98086bbfdef}")

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
     * @param {GetPreviewPageEventArgs} e 
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
