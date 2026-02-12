#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [UnhandledException](application_unhandledexception.md) event.
 * @remarks
 * For more info on how to write a handler based on this delegate, see [Exception handling for    in C# or Visual Basic](/previous-versions/windows/apps/dn532194(v=win.10)) and Remarks in [UnhandledException](application_unhandledexception.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.unhandledexceptioneventhandler
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class UnhandledExceptionEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for UnhandledExceptionEventHandler
     * @type {Guid}
     */
    static IID => Guid("{9274e6bd-49a1-4958-beee-d0e19587b6e3}")

    /**
     * The class identifier for UnhandledExceptionEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{9274e6bd-49a1-4958-beee-d0e19587b6e3}")

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
     * @param {UnhandledExceptionEventArgs} e 
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
