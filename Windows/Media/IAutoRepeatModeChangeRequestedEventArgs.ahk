#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IAutoRepeatModeChangeRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutoRepeatModeChangeRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ea137efa-d852-438e-882b-c990109a78f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestedAutoRepeatMode"]

    /**
     * @type {Integer} 
     */
    RequestedAutoRepeatMode {
        get => this.get_RequestedAutoRepeatMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestedAutoRepeatMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
