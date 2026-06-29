#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA128A {
    #StructPack 8

    Low : Int64

    High : Int64

}
