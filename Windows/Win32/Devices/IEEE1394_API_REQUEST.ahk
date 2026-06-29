#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IEEE1394_VDEV_PNP_REQUEST.ahk" { IEEE1394_VDEV_PNP_REQUEST }

/**
 * @namespace Windows.Win32.Devices
 */
export default struct IEEE1394_API_REQUEST {
    #StructPack 8


    struct _u {
        AddVirtualDevice : IEEE1394_VDEV_PNP_REQUEST

        static __New() {
            DefineProp(this.Prototype, 'RemoveVirtualDevice', { type: IEEE1394_VDEV_PNP_REQUEST, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    RequestNumber : UInt32

    Flags : UInt32

    u : IEEE1394_API_REQUEST._u

}
