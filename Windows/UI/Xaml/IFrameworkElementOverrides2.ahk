#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IFrameworkElementOverrides2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkElementOverrides2
     * @type {Guid}
     */
    static IID => Guid("{cb5cd2b9-e3b4-458c-b64e-1434fd1bd88a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GoToElementStateCore"]

    /**
     * 
     * @param {HSTRING} stateName 
     * @param {Boolean} useTransitions 
     * @returns {Boolean} 
     */
    GoToElementStateCore(stateName, useTransitions) {
        if(stateName is String) {
            pin := HSTRING.Create(stateName)
            stateName := pin.Value
        }
        stateName := stateName is Win32Handle ? NumGet(stateName, "ptr") : stateName

        result := ComCall(6, this, "ptr", stateName, "int", useTransitions, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
