#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlayerDataReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayerDataReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c75a9405-c801-412a-835b-83fc0e622a8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Data"]

    /**
     * @type {ValueSet} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Data() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }
}
