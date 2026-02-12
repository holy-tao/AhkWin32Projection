#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentControl2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentControl2
     * @type {Guid}
     */
    static IID => Guid("{652c208c-8ccf-4399-bd3e-5a015aa1bc03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentTemplateRoot"]

    /**
     * @type {UIElement} 
     */
    ContentTemplateRoot {
        get => this.get_ContentTemplateRoot()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_ContentTemplateRoot() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }
}
