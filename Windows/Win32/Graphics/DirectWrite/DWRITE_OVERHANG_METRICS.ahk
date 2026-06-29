#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates how much any visible DIPs (device independent pixels) overshoot each side of the layout or inline objects.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_overhang_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_OVERHANG_METRICS {
    #StructPack 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the left-most visible DIP to its  left-alignment edge.
     */
    left : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the top-most visible DIP to its  top alignment edge.
     */
    top : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the right-most visible DIP to its  right-alignment edge.
     */
    right : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the bottom-most visible DIP to its lower-alignment edge.
     */
    bottom : Float32

}
