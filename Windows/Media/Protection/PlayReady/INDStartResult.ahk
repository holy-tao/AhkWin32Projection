#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Core\MediaStreamSource.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the [StartAsync](ndclient_startasync_1466387351.md) result that contains the created PlayReady-ND  instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstartresult
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDStartResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDStartResult
     * @type {Guid}
     */
    static IID => Guid("{79f6e96e-f50f-4015-8ba4-c2bc344ebd4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaStreamSource"]

    /**
     * Gets the  object for the data that the transmitter streams.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstartresult.mediastreamsource
     * @type {MediaStreamSource} 
     */
    MediaStreamSource {
        get => this.get_MediaStreamSource()
    }

    /**
     * 
     * @returns {MediaStreamSource} 
     */
    get_MediaStreamSource() {
        result := ComCall(6, this, "ptr*", &mediaStreamSource_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSource(mediaStreamSource_)
    }
}
