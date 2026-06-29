#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct GESTURE_DATA {
    #StructPack 4

    gestureId : Int32

    recoConfidence : Int32

    strokeCount : Int32

}
