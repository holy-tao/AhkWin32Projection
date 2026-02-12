#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiChannelPressureMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiChannelPressureMessage
     * @type {Guid}
     */
    static IID => Guid("{be1fa860-62b4-4d52-a37e-92e54d35b909}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Channel", "get_Pressure"]

    /**
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * @type {Integer} 
     */
    Pressure {
        get => this.get_Pressure()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Channel() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Pressure() {
        result := ComCall(7, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
