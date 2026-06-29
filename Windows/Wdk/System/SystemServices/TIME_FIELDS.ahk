#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct TIME_FIELDS {
    #StructPack 2

    Year : Int16

    Month : Int16

    Day : Int16

    Hour : Int16

    Minute : Int16

    Second : Int16

    Milliseconds : Int16

    Weekday : Int16

}
