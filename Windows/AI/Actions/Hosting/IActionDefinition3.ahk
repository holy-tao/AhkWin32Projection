#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class IActionDefinition3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionDefinition3
     * @type {Guid}
     */
    static IID => Guid("{89c9a7e0-4bfd-55f4-9eed-dce2250114fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PackageRelativeApplicationId"]

    /**
     * @type {HSTRING} 
     */
    PackageRelativeApplicationId {
        get => this.get_PackageRelativeApplicationId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageRelativeApplicationId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
