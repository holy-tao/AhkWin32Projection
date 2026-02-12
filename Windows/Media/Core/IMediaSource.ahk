#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a media source that delivers media samples to a media pipeline.
 * @remarks
 * The IMediaSource interface is implemented by the [MediaStreamSource](mediastreamsource.md) runtime class and can also be implemented by other runtime classes.
 * 
 * Runtime classes that implement this interface must also implement the [IMFGetService](/windows/desktop/api/mfidl/nn-mfidl-imfgetservice) interface and must support returning an [IMFMediaSource](/windows/desktop/api/mfidl/nn-mfidl-imfmediasource) or an [IMFMediaSourceExtension](/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediasourceextension) interface when [IMFGetService.GetService](/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice) method is invoked for the MF_MEDIASOURCE_SERVICE service.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediasource
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSource
     * @type {Guid}
     */
    static IID => Guid("{e7bfb599-a09d-4c21-bcdf-20af4f86b3d9}")

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
