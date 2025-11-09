#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk

/**
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class Streaming {

;@region Constants

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_PacketWakeSupported {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SendPacketWakeSupported {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_UDN {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SupportsAudio {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SupportsVideo {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SupportsImages {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SinkProtocolInfo {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DLNADOC {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_DLNACAP {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SupportsSearch {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SupportsMute {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_MaxVolume {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Device_SupportsSetNextAVT {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_DMR => Guid("{d0875fb4-2196-4c7a-a63d-e416addd60a1}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_DMP => Guid("{25b4e268-2a05-496e-803b-266837fbda4b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_DMS => Guid("{c96037ae-a558-4470-b432-115a31b85553}")
;@endregion Constants

;@region Methods
;@endregion Methods
}
