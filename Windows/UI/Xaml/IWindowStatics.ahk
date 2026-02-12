#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Window.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IWindowStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowStatics
     * @type {Guid}
     */
    static IID => Guid("{93328409-4ea1-4afa-83dc-0c4e73e88bb1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current"]

    /**
     * @type {Window} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {Window} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Window(value)
    }
}
