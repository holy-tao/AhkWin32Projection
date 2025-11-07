#Requires AutoHotkey v2.0.0 64-bit

/**
 * The EVENT_INFO_CLASS enumeration type is used with the EventSetInformation function to specify the configuration operation to be performed on an ETW event provider registration.
 * @see https://docs.microsoft.com/windows/win32/api//evntprov/ne-evntprov-event_info_class
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_INFO_CLASS{

    /**
     * Adds binary tracking information from this provider to each session that
     * collects events from this event provider. The binary tracking data includes the
     * full path to the binary containing the callback that was specified when
     * registering the event provider. This information is useful if the binary
     * contains
     * [mc.exe](https://docs.microsoft.com/windows/win32/wes/message-compiler--mc-exe-)-generated
     * decoding resources but is not globally registered. Decoding tools can use the
     * path in the trace to locate the binary and extract the decoding resources.
     * 
     * The _EventInformation_ buffer is not used with this configuration operation. The
     * ETW runtime will automatically use the full path of the caller's module (the
     * full path to the DLL or EXE that contains the callback function specified in the
     * call to **EventRegister**). For this operation to be useful, the same DLL or EXE
     * file must contain the `mc.exe`-generated decoding resources.
     * @type {Integer (Int32)}
     */
    static EventProviderBinaryTrackInfo => 0

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static EventProviderSetReserved1 => 1

    /**
     * Sets traits for the provider such as the provider's name. Indicates that ETW
     * should recognize the `Type` field of
     * [EVENT_DATA_DESCRIPTOR](ns-evntprov-event_data_descriptor.md) structures used
     * with this provider. Requires the provider to initialize all fields of the
     * **EVENT_DATA_DESCRIPTOR** structures, including the `Reserved` field. (The
     * provider should usually set `dataDescriptor.Reserved = 0`, as is done by
     * [EventDataDescCreate](nf-evntprov-eventdatadesccreate.md).)
     * 
     * Note that the **EVENT_DATA_DESCRIPTOR** structure contains a `Type` field in a
     * section of the structure that was previously the `Reserved` field. To avoid
     * compatibility issues with providers that leave the Reserved field uninitialized,
     * ETW will ignore the `Type` field (treat it as 0) unless the provider has used
     * _EventProviderSetTraits_ or _EventProviderUseDescriptorType_ in a call to
     * **EventSetInformation**.
     * 
     * The _EventInformation_ buffer should contain the
     * [provider traits](/windows/desktop/ETW/provider-traits) to be used for the
     * provider.
     * @type {Integer (Int32)}
     */
    static EventProviderSetTraits => 2

    /**
     * Specifies whether ETW should recognize the `Type` field of
     * [EVENT_DATA_DESCRIPTOR](ns-evntprov-event_data_descriptor.md) structures used
     * with this provider. If `TRUE`, requires the provider to initialize all fields of
     * the **EVENT_DATA_DESCRIPTOR** structures, including the `Reserved` field. (The
     * provider should usually set `dataDescriptor.Reserved = 0`, as is done by
     * [EventDataDescCreate](nf-evntprov-eventdatadesccreate.md).)
     * 
     * Note that the **EVENT_DATA_DESCRIPTOR** structure contains a `Type` field in a
     * section of the structure that was previously the `Reserved` field. To avoid
     * compatibility issues with providers that leave the Reserved field uninitialized,
     * ETW will ignore the `Type` field (treat it as 0) unless the provider has used
     * _EventProviderSetTraits_ or _EventProviderUseDescriptorType_ in a call to
     * **EventSetInformation**.
     * 
     * The _EventInformation_ buffer should contain a **BOOLEAN** value (1 byte, value
     * `FALSE` or `TRUE`).
     * @type {Integer (Int32)}
     */
    static EventProviderUseDescriptorType => 3

    /**
     * The first invalid operation code. This value may change in subsequent versions
     * of the Windows SDK.
     * @type {Integer (Int32)}
     */
    static MaxEventInfo => 4
}
