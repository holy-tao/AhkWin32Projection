#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a single method that enables an application to determine whether its host is in desktop or immersive mode.
 * @remarks
 * 
  * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
  * An application must implement this interface together with the DelegateExecute handler (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexecutecommand">IExecuteCommand</a>).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iexecutecommandapplicationhostenvironment
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExecuteCommandApplicationHostEnvironment extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExecuteCommandApplicationHostEnvironment
     * @type {Guid}
     */
    static IID => Guid("{18b21aa9-e184-4ff0-9f5e-f882d03771b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValue"]

    /**
     * 
     * @param {Pointer<Integer>} pahe 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexecutecommandapplicationhostenvironment-getvalue
     */
    GetValue(pahe) {
        result := ComCall(3, this, "int*", pahe, "HRESULT")
        return result
    }
}
