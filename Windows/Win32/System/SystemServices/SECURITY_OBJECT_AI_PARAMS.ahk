#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SECURITY_OBJECT_AI_PARAMS {
    #StructPack 4

    Size : UInt32

    ConstraintMask : UInt32

}
