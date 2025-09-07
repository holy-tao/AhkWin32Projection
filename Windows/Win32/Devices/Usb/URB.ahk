#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\_URB_HEADER.ahk
#Include .\USBD_PIPE_INFORMATION.ahk
#Include .\USBD_INTERFACE_INFORMATION.ahk
#Include .\_URB_SELECT_INTERFACE.ahk
#Include .\_URB_SELECT_CONFIGURATION.ahk
#Include .\_URB_PIPE_REQUEST.ahk
#Include .\_URB_FRAME_LENGTH_CONTROL.ahk
#Include .\_URB_GET_FRAME_LENGTH.ahk
#Include .\_URB_SET_FRAME_LENGTH.ahk
#Include .\_URB_GET_CURRENT_FRAME_NUMBER.ahk
#Include .\_URB_HCD_AREA.ahk
#Include .\_URB_CONTROL_TRANSFER.ahk
#Include .\_URB_CONTROL_TRANSFER_EX.ahk
#Include .\_URB_BULK_OR_INTERRUPT_TRANSFER.ahk
#Include .\USBD_ISO_PACKET_DESCRIPTOR.ahk
#Include .\_URB_ISOCH_TRANSFER.ahk
#Include .\_URB_CONTROL_DESCRIPTOR_REQUEST.ahk
#Include .\_URB_CONTROL_GET_STATUS_REQUEST.ahk
#Include .\_URB_CONTROL_FEATURE_REQUEST.ahk
#Include .\_URB_CONTROL_VENDOR_OR_CLASS_REQUEST.ahk
#Include .\_URB_CONTROL_GET_INTERFACE_REQUEST.ahk
#Include .\_URB_CONTROL_GET_CONFIGURATION_REQUEST.ahk
#Include .\_URB_OS_FEATURE_DESCRIPTOR_REQUEST.ahk
#Include .\_URB_OPEN_STATIC_STREAMS.ahk
#Include .\_URB_GET_ISOCH_PIPE_TRANSFER_PATH_DELAYS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class URB extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {_URB_HEADER}
     */
    UrbHeader{
        get {
            if(!this.HasProp("__UrbHeader"))
                this.__UrbHeader := _URB_HEADER(this.ptr + 0)
            return this.__UrbHeader
        }
    }

    /**
     * @type {_URB_SELECT_INTERFACE}
     */
    UrbSelectInterface{
        get {
            if(!this.HasProp("__UrbSelectInterface"))
                this.__UrbSelectInterface := _URB_SELECT_INTERFACE(this.ptr + 0)
            return this.__UrbSelectInterface
        }
    }

    /**
     * @type {_URB_SELECT_CONFIGURATION}
     */
    UrbSelectConfiguration{
        get {
            if(!this.HasProp("__UrbSelectConfiguration"))
                this.__UrbSelectConfiguration := _URB_SELECT_CONFIGURATION(this.ptr + 0)
            return this.__UrbSelectConfiguration
        }
    }

    /**
     * @type {_URB_PIPE_REQUEST}
     */
    UrbPipeRequest{
        get {
            if(!this.HasProp("__UrbPipeRequest"))
                this.__UrbPipeRequest := _URB_PIPE_REQUEST(this.ptr + 0)
            return this.__UrbPipeRequest
        }
    }

    /**
     * @type {_URB_FRAME_LENGTH_CONTROL}
     */
    UrbFrameLengthControl{
        get {
            if(!this.HasProp("__UrbFrameLengthControl"))
                this.__UrbFrameLengthControl := _URB_FRAME_LENGTH_CONTROL(this.ptr + 0)
            return this.__UrbFrameLengthControl
        }
    }

    /**
     * @type {_URB_GET_FRAME_LENGTH}
     */
    UrbGetFrameLength{
        get {
            if(!this.HasProp("__UrbGetFrameLength"))
                this.__UrbGetFrameLength := _URB_GET_FRAME_LENGTH(this.ptr + 0)
            return this.__UrbGetFrameLength
        }
    }

    /**
     * @type {_URB_SET_FRAME_LENGTH}
     */
    UrbSetFrameLength{
        get {
            if(!this.HasProp("__UrbSetFrameLength"))
                this.__UrbSetFrameLength := _URB_SET_FRAME_LENGTH(this.ptr + 0)
            return this.__UrbSetFrameLength
        }
    }

    /**
     * @type {_URB_GET_CURRENT_FRAME_NUMBER}
     */
    UrbGetCurrentFrameNumber{
        get {
            if(!this.HasProp("__UrbGetCurrentFrameNumber"))
                this.__UrbGetCurrentFrameNumber := _URB_GET_CURRENT_FRAME_NUMBER(this.ptr + 0)
            return this.__UrbGetCurrentFrameNumber
        }
    }

    /**
     * @type {_URB_CONTROL_TRANSFER}
     */
    UrbControlTransfer{
        get {
            if(!this.HasProp("__UrbControlTransfer"))
                this.__UrbControlTransfer := _URB_CONTROL_TRANSFER(this.ptr + 0)
            return this.__UrbControlTransfer
        }
    }

    /**
     * @type {_URB_CONTROL_TRANSFER_EX}
     */
    UrbControlTransferEx{
        get {
            if(!this.HasProp("__UrbControlTransferEx"))
                this.__UrbControlTransferEx := _URB_CONTROL_TRANSFER_EX(this.ptr + 0)
            return this.__UrbControlTransferEx
        }
    }

    /**
     * @type {_URB_BULK_OR_INTERRUPT_TRANSFER}
     */
    UrbBulkOrInterruptTransfer{
        get {
            if(!this.HasProp("__UrbBulkOrInterruptTransfer"))
                this.__UrbBulkOrInterruptTransfer := _URB_BULK_OR_INTERRUPT_TRANSFER(this.ptr + 0)
            return this.__UrbBulkOrInterruptTransfer
        }
    }

    /**
     * @type {_URB_ISOCH_TRANSFER}
     */
    UrbIsochronousTransfer{
        get {
            if(!this.HasProp("__UrbIsochronousTransfer"))
                this.__UrbIsochronousTransfer := _URB_ISOCH_TRANSFER(this.ptr + 0)
            return this.__UrbIsochronousTransfer
        }
    }

    /**
     * @type {_URB_CONTROL_DESCRIPTOR_REQUEST}
     */
    UrbControlDescriptorRequest{
        get {
            if(!this.HasProp("__UrbControlDescriptorRequest"))
                this.__UrbControlDescriptorRequest := _URB_CONTROL_DESCRIPTOR_REQUEST(this.ptr + 0)
            return this.__UrbControlDescriptorRequest
        }
    }

    /**
     * @type {_URB_CONTROL_GET_STATUS_REQUEST}
     */
    UrbControlGetStatusRequest{
        get {
            if(!this.HasProp("__UrbControlGetStatusRequest"))
                this.__UrbControlGetStatusRequest := _URB_CONTROL_GET_STATUS_REQUEST(this.ptr + 0)
            return this.__UrbControlGetStatusRequest
        }
    }

    /**
     * @type {_URB_CONTROL_FEATURE_REQUEST}
     */
    UrbControlFeatureRequest{
        get {
            if(!this.HasProp("__UrbControlFeatureRequest"))
                this.__UrbControlFeatureRequest := _URB_CONTROL_FEATURE_REQUEST(this.ptr + 0)
            return this.__UrbControlFeatureRequest
        }
    }

    /**
     * @type {_URB_CONTROL_VENDOR_OR_CLASS_REQUEST}
     */
    UrbControlVendorClassRequest{
        get {
            if(!this.HasProp("__UrbControlVendorClassRequest"))
                this.__UrbControlVendorClassRequest := _URB_CONTROL_VENDOR_OR_CLASS_REQUEST(this.ptr + 0)
            return this.__UrbControlVendorClassRequest
        }
    }

    /**
     * @type {_URB_CONTROL_GET_INTERFACE_REQUEST}
     */
    UrbControlGetInterfaceRequest{
        get {
            if(!this.HasProp("__UrbControlGetInterfaceRequest"))
                this.__UrbControlGetInterfaceRequest := _URB_CONTROL_GET_INTERFACE_REQUEST(this.ptr + 0)
            return this.__UrbControlGetInterfaceRequest
        }
    }

    /**
     * @type {_URB_CONTROL_GET_CONFIGURATION_REQUEST}
     */
    UrbControlGetConfigurationRequest{
        get {
            if(!this.HasProp("__UrbControlGetConfigurationRequest"))
                this.__UrbControlGetConfigurationRequest := _URB_CONTROL_GET_CONFIGURATION_REQUEST(this.ptr + 0)
            return this.__UrbControlGetConfigurationRequest
        }
    }

    /**
     * @type {_URB_OS_FEATURE_DESCRIPTOR_REQUEST}
     */
    UrbOSFeatureDescriptorRequest{
        get {
            if(!this.HasProp("__UrbOSFeatureDescriptorRequest"))
                this.__UrbOSFeatureDescriptorRequest := _URB_OS_FEATURE_DESCRIPTOR_REQUEST(this.ptr + 0)
            return this.__UrbOSFeatureDescriptorRequest
        }
    }

    /**
     * @type {_URB_OPEN_STATIC_STREAMS}
     */
    UrbOpenStaticStreams{
        get {
            if(!this.HasProp("__UrbOpenStaticStreams"))
                this.__UrbOpenStaticStreams := _URB_OPEN_STATIC_STREAMS(this.ptr + 0)
            return this.__UrbOpenStaticStreams
        }
    }

    /**
     * @type {_URB_GET_ISOCH_PIPE_TRANSFER_PATH_DELAYS}
     */
    UrbGetIsochPipeTransferPathDelays{
        get {
            if(!this.HasProp("__UrbGetIsochPipeTransferPathDelays"))
                this.__UrbGetIsochPipeTransferPathDelays := _URB_GET_ISOCH_PIPE_TRANSFER_PATH_DELAYS(this.ptr + 0)
            return this.__UrbGetIsochPipeTransferPathDelays
        }
    }
}
