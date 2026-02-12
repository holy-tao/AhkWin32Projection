#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class IActionInstanceDisplayInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionInstanceDisplayInfo
     * @type {Guid}
     */
    static IID => Guid("{fcfdce21-678b-5602-b9dc-2f4533a6f4b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description"]

    /**
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
