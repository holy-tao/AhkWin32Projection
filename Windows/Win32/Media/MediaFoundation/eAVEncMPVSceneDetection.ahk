#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the encoder behaves when it detects a new scene. This enumeration is used with the AVEncMPVSceneDetection property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvscenedetection
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncMPVSceneDetection extends Win32Enum {

    /**
     * No special behavior.
     * Native name: eAVEncMPVSceneDetection_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Insert an I frame.
     * Native name: eAVEncMPVSceneDetection_InsertIPicture
     * @type {Integer (Int32)}
     */
    static InsertIPicture => 1

    /**
     * Start a new group of pictures (GOP).
     * Native name: eAVEncMPVSceneDetection_StartNewGOP
     * @type {Integer (Int32)}
     */
    static StartNewGOP => 2

    /**
     * Start a new GOP in which the first consecutive B frames do not reference the previous GOP.
     * Native name: eAVEncMPVSceneDetection_StartNewLocatableGOP
     * @type {Integer (Int32)}
     */
    static StartNewLocatableGOP => 3
}
