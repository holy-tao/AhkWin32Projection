#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IRenderingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRenderingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{5bf7d30d-9748-4aed-8380-d7890eb776a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RenderingTime"]

    /**
     * @type {TimeSpan} 
     */
    RenderingTime {
        get => this.get_RenderingTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RenderingTime() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
