#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * A marker interface that identifies the implementing class as a playback source.
 * @remarks
 * This interface doesn't define any methods. This interface is implemented by classes used by the media playback framework, such as [MediaPlaybackItem](mediaplaybackitem.md), 
 * so that the system can identify them as playback sources. This interface is not intended to be used directly by apps.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.imediaplaybacksource
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackSource
     * @type {Guid}
     */
    static IID => Guid("{ef9dc2bc-9317-4696-b051-2bad643177b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
