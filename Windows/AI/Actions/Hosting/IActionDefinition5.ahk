#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class IActionDefinition5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionDefinition5
     * @type {Guid}
     */
    static IID => Guid("{5bea33ef-d325-53a8-8db3-0d771f4d1e54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIconFullPath"]

    /**
     * 
     * @param {PropertySet} qualifierValues 
     * @returns {HSTRING} 
     */
    GetIconFullPath(qualifierValues) {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", qualifierValues, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
