#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiNoteOffMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiNoteOffMessage
     * @type {Guid}
     */
    static IID => Guid("{16fd8af4-198e-4d8f-a654-d305a293548f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Channel", "get_Note", "get_Velocity"]

    /**
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * @type {Integer} 
     */
    Note {
        get => this.get_Note()
    }

    /**
     * @type {Integer} 
     */
    Velocity {
        get => this.get_Velocity()
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
    get_Note() {
        result := ComCall(7, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Velocity() {
        result := ComCall(8, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
