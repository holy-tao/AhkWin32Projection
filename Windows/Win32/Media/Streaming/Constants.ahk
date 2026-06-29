#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }

/**
 * @namespace Windows.Win32.Media.Streaming
 */

;@region Constants

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_PacketWakeSupported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_PacketWakeSupported.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_PacketWakeSupported.pid := 0

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SendPacketWakeSupported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SendPacketWakeSupported.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_SendPacketWakeSupported.pid := 1

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_UDN := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_UDN.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_UDN.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SupportsAudio := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SupportsAudio.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_SupportsAudio.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SupportsVideo := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SupportsVideo.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_SupportsVideo.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SupportsImages := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SupportsImages.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_SupportsImages.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SinkProtocolInfo := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SinkProtocolInfo.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_SinkProtocolInfo.pid := 14

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DLNADOC := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DLNADOC.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_DLNADOC.pid := 15

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DLNACAP := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DLNACAP.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_DLNACAP.pid := 16

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SupportsSearch := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SupportsSearch.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_SupportsSearch.pid := 17

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SupportsMute := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SupportsMute.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_SupportsMute.pid := 18

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_MaxVolume := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_MaxVolume.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_MaxVolume.pid := 19

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SupportsSetNextAVT := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SupportsSetNextAVT.fmtid),
    Guid.Ptr, Guid("{88ad39db-0d0c-4a38-8435-4043826b5c91}"),
    UInt32, 16)
DEVPKEY_Device_SupportsSetNextAVT.pid := 20

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_DMR := Guid("{d0875fb4-2196-4c7a-a63d-e416addd60a1}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_DMP := Guid("{25b4e268-2a05-496e-803b-266837fbda4b}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_DMS := Guid("{c96037ae-a558-4470-b432-115a31b85553}")
;@endregion Constants
