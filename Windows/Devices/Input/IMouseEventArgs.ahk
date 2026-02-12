#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MouseDelta.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class IMouseEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMouseEventArgs
     * @type {Guid}
     */
    static IID => Guid("{f625aa5d-2354-4cc7-9230-96941c969fde}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MouseDelta"]

    /**
     * @type {MouseDelta} 
     */
    MouseDelta {
        get => this.get_MouseDelta()
    }

    /**
     * 
     * @returns {MouseDelta} 
     */
    get_MouseDelta() {
        value := MouseDelta()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
