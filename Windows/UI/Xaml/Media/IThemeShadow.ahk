#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElementWeakCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IThemeShadow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThemeShadow
     * @type {Guid}
     */
    static IID => Guid("{3eccad09-7985-5f39-8b62-6c10696dca6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Receivers"]

    /**
     * @type {UIElementWeakCollection} 
     */
    Receivers {
        get => this.get_Receivers()
    }

    /**
     * 
     * @returns {UIElementWeakCollection} 
     */
    get_Receivers() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElementWeakCollection(value)
    }
}
