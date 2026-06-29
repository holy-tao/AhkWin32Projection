#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DOCEVENT_FILTER {
    #StructPack 4

    cbSize : UInt32 := this.Size

    cElementsAllocated : UInt32

    cElementsNeeded : UInt32

    cElementsReturned : UInt32

    aDocEventCall : UInt32[1]

}
