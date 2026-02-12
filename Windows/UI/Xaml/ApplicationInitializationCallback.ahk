#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the callback that should be invoked during the initialization sequence.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.applicationinitializationcallback
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ApplicationInitializationCallback extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ApplicationInitializationCallback
     * @type {Guid}
     */
    static IID => Guid("{b6351c55-c284-46e4-8310-fb0967fab76f}")

    /**
     * The class identifier for ApplicationInitializationCallback
     * @type {Guid}
     */
    static CLSID => Guid("{b6351c55-c284-46e4-8310-fb0967fab76f}")

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
     * @param {ApplicationInitializationCallbackParams} p 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(p) {
        result := ComCall(3, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
