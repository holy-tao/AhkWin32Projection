#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Core\TimedMetadataTrack.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class ITimedMetadataPresentationModeChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedMetadataPresentationModeChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d1636099-65df-45ae-8cef-dc0b53fdc2bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Track", "get_OldPresentationMode", "get_NewPresentationMode"]

    /**
     * @type {TimedMetadataTrack} 
     */
    Track {
        get => this.get_Track()
    }

    /**
     * @type {Integer} 
     */
    OldPresentationMode {
        get => this.get_OldPresentationMode()
    }

    /**
     * @type {Integer} 
     */
    NewPresentationMode {
        get => this.get_NewPresentationMode()
    }

    /**
     * 
     * @returns {TimedMetadataTrack} 
     */
    get_Track() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedMetadataTrack(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OldPresentationMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewPresentationMode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
