#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the encoder behaves when it detects a new scene. This enumeration is used with the AVEncMPVSceneDetection property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencmpvscenedetection
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMPVSceneDetection extends Win32Enum{

    /**
     * No special behavior.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVSceneDetection_None => 0

    /**
     * Insert an I frame.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVSceneDetection_InsertIPicture => 1

    /**
     * Start a new group of pictures (GOP).
     * @type {Integer (Int32)}
     */
    static eAVEncMPVSceneDetection_StartNewGOP => 2

    /**
     * Start a new GOP in which the first consecutive B frames do not reference the previous GOP.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVSceneDetection_StartNewLocatableGOP => 3
}
