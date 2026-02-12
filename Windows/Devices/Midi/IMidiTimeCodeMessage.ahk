#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiTimeCodeMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiTimeCodeMessage
     * @type {Guid}
     */
    static IID => Guid("{0bf7087d-fa63-4a1c-8deb-c0e87796a6d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameType", "get_Values"]

    /**
     * @type {Integer} 
     */
    FrameType {
        get => this.get_FrameType()
    }

    /**
     * @type {Integer} 
     */
    Values {
        get => this.get_Values()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameType() {
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
    get_Values() {
        result := ComCall(7, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
