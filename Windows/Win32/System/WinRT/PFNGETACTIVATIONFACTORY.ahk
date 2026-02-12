#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IActivationFactory.ahk
#Include .\HSTRING.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class PFNGETACTIVATIONFACTORY extends IUnknown {

    static sizeof => A_PtrSize

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
     * @param {HSTRING} param0 
     * @returns {IActivationFactory} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0) {
        if(param0 is String) {
            pin := HSTRING.Create(param0)
            param0 := pin.Value
        }
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(3, this, "ptr", param0, "ptr*", &param1 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IActivationFactory(param1)
    }
}
