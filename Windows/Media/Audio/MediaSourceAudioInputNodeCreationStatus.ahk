#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the result status of a call to [AudioGraph.CreateMediaSourceAudioInputNode](audiograph_createmediasourceaudioinputnodeasync_989225096.md).
 * @remarks
 * [AudioGraph.CreateMediaSourceAudioInputNode](audiograph_createmediasourceaudioinputnodeasync_989225096.md) returns an [IAsyncOperation](../windows.foundation/iasyncoperation_1.md) object that returns a [CreateMediaSourceAudioInputNodeResult](createmediasourceaudioinputnoderesult.md) on completion. This object exposes a [Status](createmediasourceaudioinputnoderesult_status.md) property, containing a value from this enumeration, that indicates either that the operation was successful or the reason why the operation failed. The  [Node](createmediasourceaudioinputnoderesult_node.md) property provides a reference to the created [MediaSourceAudioInputNode](mediasourceaudioinputnode.md) on success.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.mediasourceaudioinputnodecreationstatus
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class MediaSourceAudioInputNodeCreationStatus extends Win32Enum{

    /**
     * The **MediaSourceAudioInputNode** was created successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The **MediaSourceAudioInputNode** could not be created because the media content associated with the **MediaSource** is in a format that is not supported by the [AudioGraph](audiograph.md) API.
     * @type {Integer (Int32)}
     */
    static FormatNotSupported => 1

    /**
     * The **MediaSourceAudioInputNode** could not be created because of a network error.
     * @type {Integer (Int32)}
     */
    static NetworkError => 2

    /**
     * The [MediaSourceAudioInputNode](mediasourceaudioinputnode.md) could not be created because of an unknown failure.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 3
}
