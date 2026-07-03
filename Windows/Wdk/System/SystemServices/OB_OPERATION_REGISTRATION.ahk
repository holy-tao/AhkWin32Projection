#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POBJECT_TYPE.ahk" { POBJECT_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct OB_OPERATION_REGISTRATION {
    #StructPack 8

    ObjectType : POBJECT_TYPE.Ptr

    Operations : UInt32

    PreOperation : IntPtr

    PostOperation : IntPtr

}
