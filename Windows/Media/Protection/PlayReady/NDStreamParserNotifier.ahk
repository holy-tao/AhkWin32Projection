#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INDStreamParserNotifier.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains methods that a stream parser plug-in uses to send notifications to a PlayReady-ND client.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndstreamparsernotifier
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDStreamParserNotifier extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INDStreamParserNotifier

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INDStreamParserNotifier.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [NDStreamParserNotifier](ndstreamparsernotifier.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.NDStreamParserNotifier")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Called by a stream parser when it receives the content identifier.
     * @param {INDLicenseFetchDescriptor} licenseFetchDescriptor The license fetch descriptor containing the content identifier.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndstreamparsernotifier.oncontentidreceived
     */
    OnContentIDReceived(licenseFetchDescriptor) {
        if (!this.HasProp("__INDStreamParserNotifier")) {
            if ((queryResult := this.QueryInterface(INDStreamParserNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDStreamParserNotifier := INDStreamParserNotifier(outPtr)
        }

        return this.__INDStreamParserNotifier.OnContentIDReceived(licenseFetchDescriptor)
    }

    /**
     * Called by the stream parser when the media stream descriptor is created.
     * @param {IVector<AudioStreamDescriptor>} audioStreamDescriptors An array of audio stream descriptors that are part of the media stream descriptor.
     * @param {IVector<VideoStreamDescriptor>} videoStreamDescriptors An array of video stream descriptors that are part of the media stream descriptor.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndstreamparsernotifier.onmediastreamdescriptorcreated
     */
    OnMediaStreamDescriptorCreated(audioStreamDescriptors, videoStreamDescriptors) {
        if (!this.HasProp("__INDStreamParserNotifier")) {
            if ((queryResult := this.QueryInterface(INDStreamParserNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDStreamParserNotifier := INDStreamParserNotifier(outPtr)
        }

        return this.__INDStreamParserNotifier.OnMediaStreamDescriptorCreated(audioStreamDescriptors, videoStreamDescriptors)
    }

    /**
     * Called when the stream parser parses a sample from the media stream.
     * @param {Integer} streamID The identifier for the media stream that is being parsed.
     * @param {Integer} streamType The type of the media stream. This value can be **Audio** or **Video**.
     * @param {MediaStreamSample} streamSample The array of stream samples.
     * @param {Integer} pts The presentation timestamp that indicates when to play the sample, in milliseconds. This value is relative to previous samples in the presentation. For example, if a given sample has a presentation time stamp of 1000 and some later sample has a presentation time stamp of 2000, the later sample occurs one second (1000ms) after the given sample.
     * @param {Integer} ccFormat The closed caption format. This value can be **ATSC**, **SCTE20**, or **Unknown**.
     * @param {Integer} ccDataBytes_length 
     * @param {Pointer<Integer>} ccDataBytes An array that contains the closed caption data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndstreamparsernotifier.onsampleparsed
     */
    OnSampleParsed(streamID, streamType, streamSample, pts, ccFormat, ccDataBytes_length, ccDataBytes) {
        if (!this.HasProp("__INDStreamParserNotifier")) {
            if ((queryResult := this.QueryInterface(INDStreamParserNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDStreamParserNotifier := INDStreamParserNotifier(outPtr)
        }

        return this.__INDStreamParserNotifier.OnSampleParsed(streamID, streamType, streamSample, pts, ccFormat, ccDataBytes_length, ccDataBytes)
    }

    /**
     * Called by the stream parser when it requests a setup decryptor.
     * @param {IMediaStreamDescriptor} descriptor The descriptor of the media stream being decrypted.
     * @param {Guid} keyID The key identifier used for decryption.
     * @param {Integer} proBytes_length 
     * @param {Pointer<Integer>} proBytes The data for the setup decryptor.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndstreamparsernotifier.onbeginsetupdecryptor
     */
    OnBeginSetupDecryptor(descriptor, keyID, proBytes_length, proBytes) {
        if (!this.HasProp("__INDStreamParserNotifier")) {
            if ((queryResult := this.QueryInterface(INDStreamParserNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDStreamParserNotifier := INDStreamParserNotifier(outPtr)
        }

        return this.__INDStreamParserNotifier.OnBeginSetupDecryptor(descriptor, keyID, proBytes_length, proBytes)
    }

;@endregion Instance Methods
}
