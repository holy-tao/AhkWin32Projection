#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import ".\KSNODE_CREATE.ahk" { KSNODE_CREATE }
#Import ".\KSALLOCATOR_FRAMING.ahk" { KSALLOCATOR_FRAMING }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\KSMULTIPLE_ITEM.ahk" { KSMULTIPLE_ITEM }
#Import ".\KSCLOCK_CREATE.ahk" { KSCLOCK_CREATE }
#Import ".\KSPIN_CONNECT.ahk" { KSPIN_CONNECT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */

;@region Functions
/**
 * 
 * @param {HANDLE} ConnectionHandle 
 * @param {Pointer<KSALLOCATOR_FRAMING>} AllocatorFraming 
 * @param {Pointer<HANDLE>} AllocatorHandle 
 * @returns {Integer} 
 */
export KsCreateAllocator(ConnectionHandle, AllocatorFraming, AllocatorHandle) {
    result := DllCall("ksuser.dll\KsCreateAllocator", HANDLE, ConnectionHandle, KSALLOCATOR_FRAMING.Ptr, AllocatorFraming, HANDLE.Ptr, AllocatorHandle, UInt32)
    return result
}

/**
 * 
 * @param {HANDLE} ConnectionHandle 
 * @param {Pointer<KSCLOCK_CREATE>} ClockCreate 
 * @param {Pointer<HANDLE>} ClockHandle 
 * @returns {Integer} 
 */
export KsCreateClock(ConnectionHandle, ClockCreate, ClockHandle) {
    result := DllCall("ksuser.dll\KsCreateClock", HANDLE, ConnectionHandle, KSCLOCK_CREATE.Ptr, ClockCreate, HANDLE.Ptr, ClockHandle, UInt32)
    return result
}

/**
 * 
 * @param {HANDLE} FilterHandle 
 * @param {Pointer<KSPIN_CONNECT>} Connect 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<HANDLE>} ConnectionHandle 
 * @returns {Integer} 
 */
export KsCreatePin(FilterHandle, Connect, DesiredAccess, ConnectionHandle) {
    result := DllCall("ksuser.dll\KsCreatePin", HANDLE, FilterHandle, KSPIN_CONNECT.Ptr, Connect, "uint", DesiredAccess, HANDLE.Ptr, ConnectionHandle, UInt32)
    return result
}

/**
 * 
 * @param {HANDLE} ParentHandle 
 * @param {Pointer<KSNODE_CREATE>} NodeCreate 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<HANDLE>} NodeHandle 
 * @returns {Integer} 
 */
export KsCreateTopologyNode(ParentHandle, NodeCreate, DesiredAccess, NodeHandle) {
    result := DllCall("ksuser.dll\KsCreateTopologyNode", HANDLE, ParentHandle, KSNODE_CREATE.Ptr, NodeCreate, "uint", DesiredAccess, HANDLE.Ptr, NodeHandle, UInt32)
    return result
}

/**
 * 
 * @param {HANDLE} ConnectionHandle 
 * @param {Pointer<KSALLOCATOR_FRAMING>} AllocatorFraming 
 * @returns {HANDLE} 
 */
export KsCreateAllocator2(ConnectionHandle, AllocatorFraming) {
    AllocatorHandle := HANDLE.Owned()
    result := DllCall("ksuser.dll\KsCreateAllocator2", HANDLE, ConnectionHandle, KSALLOCATOR_FRAMING.Ptr, AllocatorFraming, HANDLE.Ptr, AllocatorHandle, "HRESULT")
    return AllocatorHandle
}

/**
 * 
 * @param {HANDLE} ConnectionHandle 
 * @param {Pointer<KSCLOCK_CREATE>} ClockCreate 
 * @returns {HANDLE} 
 */
export KsCreateClock2(ConnectionHandle, ClockCreate) {
    ClockHandle := HANDLE.Owned()
    result := DllCall("ksuser.dll\KsCreateClock2", HANDLE, ConnectionHandle, KSCLOCK_CREATE.Ptr, ClockCreate, HANDLE.Ptr, ClockHandle, "HRESULT")
    return ClockHandle
}

/**
 * 
 * @param {HANDLE} FilterHandle 
 * @param {Pointer<KSPIN_CONNECT>} Connect 
 * @param {Integer} DesiredAccess 
 * @returns {HANDLE} 
 */
export KsCreatePin2(FilterHandle, Connect, DesiredAccess) {
    ConnectionHandle := HANDLE.Owned()
    result := DllCall("ksuser.dll\KsCreatePin2", HANDLE, FilterHandle, KSPIN_CONNECT.Ptr, Connect, "uint", DesiredAccess, HANDLE.Ptr, ConnectionHandle, "HRESULT")
    return ConnectionHandle
}

/**
 * 
 * @param {HANDLE} ParentHandle 
 * @param {Pointer<KSNODE_CREATE>} NodeCreate 
 * @param {Integer} DesiredAccess 
 * @returns {HANDLE} 
 */
export KsCreateTopologyNode2(ParentHandle, NodeCreate, DesiredAccess) {
    NodeHandle := HANDLE.Owned()
    result := DllCall("ksuser.dll\KsCreateTopologyNode2", HANDLE, ParentHandle, KSNODE_CREATE.Ptr, NodeCreate, "uint", DesiredAccess, HANDLE.Ptr, NodeHandle, "HRESULT")
    return NodeHandle
}

/**
 * 
 * @param {Pointer<KSDATAFORMAT>} DataRange 
 * @param {Pointer<KSMULTIPLE_ITEM>} Attributes 
 * @returns {HRESULT} 
 */
export KsResolveRequiredAttributes(DataRange, Attributes) {
    result := DllCall("ksproxy.ax\KsResolveRequiredAttributes", KSDATAFORMAT.Ptr, DataRange, KSMULTIPLE_ITEM.Ptr, Attributes, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Guid>} Category 
 * @param {Integer} Access 
 * @returns {HANDLE} 
 */
export KsOpenDefaultDevice(Category, Access) {
    DeviceHandle := HANDLE.Owned()
    result := DllCall("ksproxy.ax\KsOpenDefaultDevice", Guid.Ptr, Category, "uint", Access, HANDLE.Ptr, DeviceHandle, "HRESULT")
    return DeviceHandle
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {Integer} IoControl 
 * @param {Integer} InBuffer 
 * @param {Integer} InLength 
 * @param {Integer} OutBuffer 
 * @param {Integer} OutLength 
 * @param {Pointer<Integer>} BytesReturned 
 * @returns {HRESULT} 
 */
export KsSynchronousDeviceControl(_Handle, IoControl, InBuffer, InLength, OutBuffer, OutLength, BytesReturned) {
    BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("ksproxy.ax\KsSynchronousDeviceControl", HANDLE, _Handle, "uint", IoControl, "ptr", InBuffer, "uint", InLength, "ptr", OutBuffer, "uint", OutLength, BytesReturnedMarshal, BytesReturned, "HRESULT")
    return result
}

/**
 * 
 * @param {HANDLE} FilterHandle 
 * @param {Integer} PinFactoryId 
 * @param {Integer} PropertyId 
 * @returns {Pointer<Void>} 
 */
export KsGetMultiplePinFactoryItems(FilterHandle, PinFactoryId, PropertyId) {
    result := DllCall("ksproxy.ax\KsGetMultiplePinFactoryItems", HANDLE, FilterHandle, "uint", PinFactoryId, "uint", PropertyId, "ptr*", &Items := 0, "HRESULT")
    return Items
}

/**
 * 
 * @param {HANDLE} FilterHandle 
 * @param {Integer} PinFactoryId 
 * @returns {Integer} 
 */
export KsGetMediaTypeCount(FilterHandle, PinFactoryId) {
    result := DllCall("ksproxy.ax\KsGetMediaTypeCount", HANDLE, FilterHandle, "uint", PinFactoryId, "uint*", &MediaTypeCount := 0, "HRESULT")
    return MediaTypeCount
}

/**
 * 
 * @param {Integer} Position 
 * @param {Pointer<AM_MEDIA_TYPE>} AmMediaType 
 * @param {HANDLE} FilterHandle 
 * @param {Integer} PinFactoryId 
 * @returns {HRESULT} 
 */
export KsGetMediaType(Position, AmMediaType, FilterHandle, PinFactoryId) {
    result := DllCall("ksproxy.ax\KsGetMediaType", "int", Position, AM_MEDIA_TYPE.Ptr, AmMediaType, HANDLE, FilterHandle, "uint", PinFactoryId, "HRESULT")
    return result
}

;@endregion Functions
