#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_RECOVER_ACTION.ahk" { VDS_RECOVER_ACTION }

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_SERVICE_NOTIFICATION {
    #StructPack 4

    ulEvent : UInt32

    action : VDS_RECOVER_ACTION

}
