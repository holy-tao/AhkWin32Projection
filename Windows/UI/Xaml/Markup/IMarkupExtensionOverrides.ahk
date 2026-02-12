#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IMarkupExtensionOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMarkupExtensionOverrides
     * @type {Guid}
     */
    static IID => Guid("{393779bf-b9c0-4ffb-a57f-58e7356e425f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProvideValue"]

    /**
     * 
     * @returns {IInspectable} 
     */
    ProvideValue() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }
}
