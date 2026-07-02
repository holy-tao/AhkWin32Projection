#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POB_POST_OPERATION_CALLBACK.ahk" { POB_POST_OPERATION_CALLBACK }
#Import ".\POB_PRE_OPERATION_CALLBACK.ahk" { POB_PRE_OPERATION_CALLBACK }
#Import "..\..\Foundation\POBJECT_TYPE.ahk" { POBJECT_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct OB_OPERATION_REGISTRATION {
    #StructPack 8

    ObjectType : POBJECT_TYPE.Ptr

    Operations : UInt32

    PreOperation : POB_PRE_OPERATION_CALLBACK

    PostOperation : POB_POST_OPERATION_CALLBACK

}
