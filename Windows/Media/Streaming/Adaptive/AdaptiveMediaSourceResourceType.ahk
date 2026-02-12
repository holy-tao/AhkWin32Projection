#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of an adaptive media resource.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourceresourcetype
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceResourceType extends Win32Enum{

    /**
     * The resource is an adaptive streaming manifest.
     * @type {Integer (Int32)}
     */
    static Manifest => 0

    /**
     * The resource is an initialization segment.
     * @type {Integer (Int32)}
     */
    static InitializationSegment => 1

    /**
     * The resource is a media segment.
     * @type {Integer (Int32)}
     */
    static MediaSegment => 2

    /**
     * The resource is an encryption key.
     * @type {Integer (Int32)}
     */
    static Key => 3

    /**
     * The resource is a cryptographic initialization vector.
     * @type {Integer (Int32)}
     */
    static InitializationVector => 4

    /**
     * The resource is a media segment index.
     * @type {Integer (Int32)}
     */
    static MediaSegmentIndex => 5
}
