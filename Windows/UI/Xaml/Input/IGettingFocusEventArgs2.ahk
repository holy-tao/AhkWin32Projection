#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IGettingFocusEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGettingFocusEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{88754d7b-b4b9-4959-8bce-89bf212ed4eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCancel", "TrySetNewFocusedElement"]

    /**
     * Do not use. This API is only supported for Xbox developers. (TryCancelPendingGameUI)
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/gamingtcui/nf-gamingtcui-trycancelpendinggameui
     */
    TryCancel() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    TrySetNewFocusedElement(element) {
        result := ComCall(7, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
