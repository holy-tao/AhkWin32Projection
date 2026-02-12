#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\TimedMetadataTrack.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the interface implemented by a custom stream that provides metadata tracks.
 * @remarks
 * Streams implement this interface to provide metadata tracks when passed into [MediaSource.CreateFromStream](mediasource_createfromstream_983868770.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.itimedmetadatatrackprovider
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedMetadataTrackProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedMetadataTrackProvider
     * @type {Guid}
     */
    static IID => Guid("{3b7f2024-f74e-4ade-93c5-219da05b6856}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TimedMetadataTracks"]

    /**
     * Gets the list of timed metadata tracks provided by the object that implements this interface.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.itimedmetadatatrackprovider.timedmetadatatracks
     * @type {IVectorView<TimedMetadataTrack>} 
     */
    TimedMetadataTracks {
        get => this.get_TimedMetadataTracks()
    }

    /**
     * 
     * @returns {IVectorView<TimedMetadataTrack>} 
     */
    get_TimedMetadataTracks() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(TimedMetadataTrack, value)
    }
}
