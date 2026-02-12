#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowPresentationConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowPresentationConfiguration
     * @type {Guid}
     */
    static IID => Guid("{b5a43ee3-df33-5e67-bd31-1072457300df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind"]

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
