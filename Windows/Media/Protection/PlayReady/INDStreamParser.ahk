#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NDStreamParserNotifier.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Parses data from a PlayReady-ND media stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparser
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDStreamParser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDStreamParser
     * @type {Guid}
     */
    static IID => Guid("{e0baa198-9796-41c9-8695-59437e67e66a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseData", "GetStreamInformation", "BeginOfStream", "EndOfStream", "get_Notifier"]

    /**
     * Gets the stream parser notifier that will provide notification of stream parser events from the transmitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparser.notifier
     * @type {NDStreamParserNotifier} 
     */
    Notifier {
        get => this.get_Notifier()
    }

    /**
     * Parses samples from a PlayReady-ND media stream.
     * @param {Integer} dataBytes_length 
     * @param {Pointer<Integer>} dataBytes The data to be parsed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparser.parsedata
     */
    ParseData(dataBytes_length, dataBytes) {
        dataBytesMarshal := dataBytes is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", dataBytes_length, dataBytesMarshal, dataBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the stream type (audio or video) and stream identifier of the media stream descriptor.
     * @param {IMediaStreamDescriptor} descriptor The media stream from which this method gets information.
     * @param {Pointer<Int32>} streamType The type of the media stream. This type can be either **Audio** or **Video**.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparser.getstreaminformation
     */
    GetStreamInformation(descriptor, streamType) {
        result := ComCall(7, this, "ptr", descriptor, "ptr", streamType, "uint*", &streamID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return streamID
    }

    /**
     * Notifies a PlayReady-ND stream parser to be ready for the beginning of a new media stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparser.beginofstream
     */
    BeginOfStream() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies a PlayReady-ND stream parser that the end of a media stream has been reached.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparser.endofstream
     */
    EndOfStream() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {NDStreamParserNotifier} 
     */
    get_Notifier() {
        result := ComCall(10, this, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NDStreamParserNotifier(instance)
    }
}
