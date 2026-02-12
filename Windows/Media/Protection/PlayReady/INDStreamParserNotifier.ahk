#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains methods that a stream parser plug-in uses to send notifications to a PlayReady-ND client.
 * @remarks
 * The stream parser plug-in is responsible for instantiating this interface and using its methods to send notifications.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparsernotifier
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDStreamParserNotifier extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDStreamParserNotifier
     * @type {Guid}
     */
    static IID => Guid("{c167acd0-2ce6-426c-ace5-5e9275fea715}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnContentIDReceived", "OnMediaStreamDescriptorCreated", "OnSampleParsed", "OnBeginSetupDecryptor"]

    /**
     * Called by a stream parser when it receives the content identifier.
     * @param {INDLicenseFetchDescriptor} licenseFetchDescriptor The license fetch descriptor containing the content identifier.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparsernotifier.oncontentidreceived
     */
    OnContentIDReceived(licenseFetchDescriptor) {
        result := ComCall(6, this, "ptr", licenseFetchDescriptor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by the stream parser when the media stream descriptor is created.
     * @param {IVector<AudioStreamDescriptor>} audioStreamDescriptors An array of audio stream descriptors that are part of the media stream descriptor.
     * @param {IVector<VideoStreamDescriptor>} videoStreamDescriptors An array of video stream descriptors that are part of the media stream descriptor.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparsernotifier.onmediastreamdescriptorcreated
     */
    OnMediaStreamDescriptorCreated(audioStreamDescriptors, videoStreamDescriptors) {
        result := ComCall(7, this, "ptr", audioStreamDescriptors, "ptr", videoStreamDescriptors, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the stream parser parses a sample from the media stream.
     * @param {Integer} streamID The identifier for the media stream that is being parsed.
     * @param {Integer} streamType The type of the media stream. This value can be either **Audio** or **Video**.
     * @param {MediaStreamSample} streamSample The array of stream samples.
     * @param {Integer} pts The presentation timestamp that indicates when to play the sample.
     * @param {Integer} ccFormat The closed caption format. This value can be **ATSC**, **SCTE20**, or **Unknown**.
     * @param {Integer} ccDataBytes_length 
     * @param {Pointer<Integer>} ccDataBytes An array that contains the closed caption data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparsernotifier.onsampleparsed
     */
    OnSampleParsed(streamID, streamType, streamSample, pts, ccFormat, ccDataBytes_length, ccDataBytes) {
        ccDataBytesMarshal := ccDataBytes is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", streamID, "int", streamType, "ptr", streamSample, "int64", pts, "int", ccFormat, "uint", ccDataBytes_length, ccDataBytesMarshal, ccDataBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by the stream parser when it requests a setup decryptor.
     * @param {IMediaStreamDescriptor} descriptor The descriptor of the media stream being decrypted.
     * @param {Guid} keyID The key identifier used for decryption.
     * @param {Integer} proBytes_length 
     * @param {Pointer<Integer>} proBytes The byte array of a PlayReadyObject for creating the decryptor. For MPEG2 TS, the PlayReadyObject is in the entitlement control messages (ECM) packet.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstreamparsernotifier.onbeginsetupdecryptor
     */
    OnBeginSetupDecryptor(descriptor, keyID, proBytes_length, proBytes) {
        proBytesMarshal := proBytes is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "ptr", descriptor, "ptr", keyID, "uint", proBytes_length, proBytesMarshal, proBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
