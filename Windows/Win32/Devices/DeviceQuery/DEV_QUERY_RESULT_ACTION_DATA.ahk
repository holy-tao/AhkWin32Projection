#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Properties\DEVPROPERTY.ahk" { DEVPROPERTY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DEV_QUERY_RESULT_ACTION.ahk" { DEV_QUERY_RESULT_ACTION }
#Import ".\DEV_OBJECT.ahk" { DEV_OBJECT }
#Import ".\DEV_QUERY_STATE.ahk" { DEV_QUERY_STATE }
#Import ".\DEV_OBJECT_TYPE.ahk" { DEV_OBJECT_TYPE }

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
export default struct DEV_QUERY_RESULT_ACTION_DATA {
    #StructPack 8


    struct _DEV_QUERY_RESULT_UPDATE_PAYLOAD {
        State : DEV_QUERY_STATE

        static __New() {
            DefineProp(this.Prototype, 'DeviceObject', { type: DEV_OBJECT, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Action : DEV_QUERY_RESULT_ACTION

    Data : DEV_QUERY_RESULT_ACTION_DATA._DEV_QUERY_RESULT_UPDATE_PAYLOAD

}
