#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct CUSTOMIZED_IO_QUERY_INPUT_RETURN {
    #StructPack 4

    FunctionId : UInt32

    ErrorCode : UInt32

    Value : UInt32

}
