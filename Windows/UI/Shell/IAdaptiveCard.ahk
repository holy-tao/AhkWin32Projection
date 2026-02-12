#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An Adaptive Card that can be used in Windows.
 * @remarks
 * Adaptive Cards are a cross-platform framework for custom and interactive chat bot cards. [Learn more about the framework and view associated samples.](https://adaptivecards.io)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.iadaptivecard
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class IAdaptiveCard extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveCard
     * @type {Guid}
     */
    static IID => Guid("{72d0568c-a274-41cd-82a8-989d40b9b05e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ToJson"]

    /**
     * Returns the JSON that represents this Adaptive Card.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.iadaptivecard.tojson
     */
    ToJson() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
