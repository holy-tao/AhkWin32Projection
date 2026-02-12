#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\Navigation\PageStackEntry.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IFrame2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrame2
     * @type {Guid}
     */
    static IID => Guid("{3f367f87-9f5a-4b04-b818-b554c069597a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackStack", "get_ForwardStack", "Navigate"]

    /**
     * @type {IVector<PageStackEntry>} 
     */
    BackStack {
        get => this.get_BackStack()
    }

    /**
     * @type {IVector<PageStackEntry>} 
     */
    ForwardStack {
        get => this.get_ForwardStack()
    }

    /**
     * 
     * @returns {IVector<PageStackEntry>} 
     */
    get_BackStack() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(PageStackEntry, value)
    }

    /**
     * 
     * @returns {IVector<PageStackEntry>} 
     */
    get_ForwardStack() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(PageStackEntry, value)
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {TypeName} sourcePageType 
     * @param {IInspectable} parameter 
     * @param {NavigationTransitionInfo} infoOverride 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/navigate-element
     */
    Navigate(sourcePageType, parameter, infoOverride) {
        result := ComCall(8, this, "ptr", sourcePageType, "ptr", parameter, "ptr", infoOverride, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
