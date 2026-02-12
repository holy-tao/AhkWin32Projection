#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiSongSelectMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiSongSelectMessage
     * @type {Guid}
     */
    static IID => Guid("{49f0f27f-6d83-4741-a5bf-4629f6be974f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Song"]

    /**
     * @type {Integer} 
     */
    Song {
        get => this.get_Song()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Song() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
