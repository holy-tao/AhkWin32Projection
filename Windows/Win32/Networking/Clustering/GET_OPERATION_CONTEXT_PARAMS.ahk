#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESDLL_CONTEXT_OPERATION_TYPE.ahk" { RESDLL_CONTEXT_OPERATION_TYPE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct GET_OPERATION_CONTEXT_PARAMS {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    Type : RESDLL_CONTEXT_OPERATION_TYPE

    Priority : UInt32

}
