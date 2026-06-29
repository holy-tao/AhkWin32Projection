#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PHYSICAL_MEMORY_RANGE {
    #StructPack 8

    BaseAddress : Int64

    NumberOfBytes : Int64

}
