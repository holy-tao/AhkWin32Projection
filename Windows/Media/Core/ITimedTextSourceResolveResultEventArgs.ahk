#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TimedMetadataTrackError.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\TimedMetadataTrack.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedTextSourceResolveResultEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedTextSourceResolveResultEventArgs
     * @type {Guid}
     */
    static IID => Guid("{48907c9c-dcd8-4c33-9ad3-6cdce7b1c566}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Error", "get_Tracks"]

    /**
     * @type {TimedMetadataTrackError} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * @type {IVectorView<TimedMetadataTrack>} 
     */
    Tracks {
        get => this.get_Tracks()
    }

    /**
     * 
     * @returns {TimedMetadataTrackError} 
     */
    get_Error() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedMetadataTrackError(value)
    }

    /**
     * 
     * @returns {IVectorView<TimedMetadataTrack>} 
     */
    get_Tracks() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(TimedMetadataTrack, value)
    }
}
