#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_URB_SET_FRAME_LENGTH.ahk" { _URB_SET_FRAME_LENGTH }
#Import ".\_URB_GET_FRAME_LENGTH.ahk" { _URB_GET_FRAME_LENGTH }
#Import ".\USBD_PIPE_TYPE.ahk" { USBD_PIPE_TYPE }
#Import ".\_URB_CONTROL_VENDOR_OR_CLASS_REQUEST.ahk" { _URB_CONTROL_VENDOR_OR_CLASS_REQUEST }
#Import ".\USBD_PIPE_INFORMATION.ahk" { USBD_PIPE_INFORMATION }
#Import ".\_URB_SELECT_INTERFACE.ahk" { _URB_SELECT_INTERFACE }
#Import ".\USB_CONFIGURATION_DESCRIPTOR.ahk" { USB_CONFIGURATION_DESCRIPTOR }
#Import ".\_URB_CONTROL_GET_INTERFACE_REQUEST.ahk" { _URB_CONTROL_GET_INTERFACE_REQUEST }
#Import ".\_URB_GET_ISOCH_PIPE_TRANSFER_PATH_DELAYS.ahk" { _URB_GET_ISOCH_PIPE_TRANSFER_PATH_DELAYS }
#Import ".\_URB_GET_CURRENT_FRAME_NUMBER.ahk" { _URB_GET_CURRENT_FRAME_NUMBER }
#Import ".\USBD_STREAM_INFORMATION.ahk" { USBD_STREAM_INFORMATION }
#Import ".\_URB_ISOCH_TRANSFER.ahk" { _URB_ISOCH_TRANSFER }
#Import ".\USBD_ISO_PACKET_DESCRIPTOR.ahk" { USBD_ISO_PACKET_DESCRIPTOR }
#Import ".\_URB_FRAME_LENGTH_CONTROL.ahk" { _URB_FRAME_LENGTH_CONTROL }
#Import ".\_URB_PIPE_REQUEST.ahk" { _URB_PIPE_REQUEST }
#Import ".\_URB_CONTROL_TRANSFER.ahk" { _URB_CONTROL_TRANSFER }
#Import ".\_URB_BULK_OR_INTERRUPT_TRANSFER.ahk" { _URB_BULK_OR_INTERRUPT_TRANSFER }
#Import ".\_URB_CONTROL_GET_CONFIGURATION_REQUEST.ahk" { _URB_CONTROL_GET_CONFIGURATION_REQUEST }
#Import ".\_URB_OS_FEATURE_DESCRIPTOR_REQUEST.ahk" { _URB_OS_FEATURE_DESCRIPTOR_REQUEST }
#Import ".\_URB_CONTROL_TRANSFER_EX.ahk" { _URB_CONTROL_TRANSFER_EX }
#Import ".\_URB_HCD_AREA.ahk" { _URB_HCD_AREA }
#Import ".\USBD_INTERFACE_INFORMATION.ahk" { USBD_INTERFACE_INFORMATION }
#Import ".\_URB_OPEN_STATIC_STREAMS.ahk" { _URB_OPEN_STATIC_STREAMS }
#Import ".\_URB_CONTROL_FEATURE_REQUEST.ahk" { _URB_CONTROL_FEATURE_REQUEST }
#Import ".\_URB_CONTROL_DESCRIPTOR_REQUEST.ahk" { _URB_CONTROL_DESCRIPTOR_REQUEST }
#Import ".\_URB_HEADER.ahk" { _URB_HEADER }
#Import ".\_URB_SELECT_CONFIGURATION.ahk" { _URB_SELECT_CONFIGURATION }
#Import ".\_URB_CONTROL_GET_STATUS_REQUEST.ahk" { _URB_CONTROL_GET_STATUS_REQUEST }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct URB {
    #StructPack 8

    UrbHeader : _URB_HEADER

    static __New() {
        DefineProp(this.Prototype, 'UrbSelectInterface', { type: _URB_SELECT_INTERFACE, offset: 0 })
        DefineProp(this.Prototype, 'UrbSelectConfiguration', { type: _URB_SELECT_CONFIGURATION, offset: 0 })
        DefineProp(this.Prototype, 'UrbPipeRequest', { type: _URB_PIPE_REQUEST, offset: 0 })
        DefineProp(this.Prototype, 'UrbFrameLengthControl', { type: _URB_FRAME_LENGTH_CONTROL, offset: 0 })
        DefineProp(this.Prototype, 'UrbGetFrameLength', { type: _URB_GET_FRAME_LENGTH, offset: 0 })
        DefineProp(this.Prototype, 'UrbSetFrameLength', { type: _URB_SET_FRAME_LENGTH, offset: 0 })
        DefineProp(this.Prototype, 'UrbGetCurrentFrameNumber', { type: _URB_GET_CURRENT_FRAME_NUMBER, offset: 0 })
        DefineProp(this.Prototype, 'UrbControlTransfer', { type: _URB_CONTROL_TRANSFER, offset: 0 })
        DefineProp(this.Prototype, 'UrbControlTransferEx', { type: _URB_CONTROL_TRANSFER_EX, offset: 0 })
        DefineProp(this.Prototype, 'UrbBulkOrInterruptTransfer', { type: _URB_BULK_OR_INTERRUPT_TRANSFER, offset: 0 })
        DefineProp(this.Prototype, 'UrbIsochronousTransfer', { type: _URB_ISOCH_TRANSFER, offset: 0 })
        DefineProp(this.Prototype, 'UrbControlDescriptorRequest', { type: _URB_CONTROL_DESCRIPTOR_REQUEST, offset: 0 })
        DefineProp(this.Prototype, 'UrbControlGetStatusRequest', { type: _URB_CONTROL_GET_STATUS_REQUEST, offset: 0 })
        DefineProp(this.Prototype, 'UrbControlFeatureRequest', { type: _URB_CONTROL_FEATURE_REQUEST, offset: 0 })
        DefineProp(this.Prototype, 'UrbControlVendorClassRequest', { type: _URB_CONTROL_VENDOR_OR_CLASS_REQUEST, offset: 0 })
        DefineProp(this.Prototype, 'UrbControlGetInterfaceRequest', { type: _URB_CONTROL_GET_INTERFACE_REQUEST, offset: 0 })
        DefineProp(this.Prototype, 'UrbControlGetConfigurationRequest', { type: _URB_CONTROL_GET_CONFIGURATION_REQUEST, offset: 0 })
        DefineProp(this.Prototype, 'UrbOSFeatureDescriptorRequest', { type: _URB_OS_FEATURE_DESCRIPTOR_REQUEST, offset: 0 })
        DefineProp(this.Prototype, 'UrbOpenStaticStreams', { type: _URB_OPEN_STATIC_STREAMS, offset: 0 })
        DefineProp(this.Prototype, 'UrbGetIsochPipeTransferPathDelays', { type: _URB_GET_ISOCH_PIPE_TRANSFER_PATH_DELAYS, offset: 0 })
        this.DeleteProp("__New")
    }
}
