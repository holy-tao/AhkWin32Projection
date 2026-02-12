#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IXamlMarkupHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlMarkupHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{c9bc3725-f34f-445c-81a2-6b72a5e8f072}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UnloadObject"]

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {HRESULT} 
     */
    UnloadObject(element) {
        result := ComCall(6, this, "ptr", element, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
