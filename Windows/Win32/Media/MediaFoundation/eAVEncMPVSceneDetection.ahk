#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how the encoder behaves when it detects a new scene. This enumeration is used with the AVEncMPVSceneDetection property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvscenedetection
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncMPVSceneDetection {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
