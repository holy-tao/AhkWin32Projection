#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Composition\Compositor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IWindow3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindow3
     * @type {Guid}
     */
    static IID => Guid("{b70bdc9d-1c35-462a-9b97-808d5af9f28e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Compositor"]

    /**
     * @type {Compositor} 
     */
    Compositor {
        get => this.get_Compositor()
    }

    /**
     * 
     * @returns {Compositor} 
     */
    get_Compositor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Compositor(value)
    }
}
