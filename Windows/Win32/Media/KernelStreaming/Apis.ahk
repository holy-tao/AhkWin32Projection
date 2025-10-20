#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KernelStreaming {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KS_PROPERTY => 3080195

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KS_ENABLE_EVENT => 3080199

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KS_DISABLE_EVENT => 3080203

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KS_METHOD => 3080207

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KS_WRITE_STREAM => 3112979

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KS_READ_STREAM => 3096599

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KS_RESET_STATE => 3080219

    /**
     * @type {Integer (UInt32)}
     */
    static KSPRIORITY_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSPRIORITY_NORMAL => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static KSPRIORITY_HIGH => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KSPRIORITY_EXCLUSIVE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static KSMETHOD_TYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSMETHOD_TYPE_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSMETHOD_TYPE_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSMETHOD_TYPE_MODIFY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KSMETHOD_TYPE_SOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSMETHOD_TYPE_SEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSMETHOD_TYPE_SETSUPPORT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSMETHOD_TYPE_BASICSUPPORT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KSMETHOD_TYPE_TOPOLOGY => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_GET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_GETPAYLOADSIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_SETSUPPORT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_BASICSUPPORT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_RELATIONS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_SERIALIZESET => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_UNSERIALIZESET => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_SERIALIZERAW => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_UNSERIALIZERAW => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_SERIALIZESIZE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_DEFAULTVALUES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_TOPOLOGY => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_HIGHPRIORITY => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_FSFILTERSCOPE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_TYPE_COPYPAYLOAD => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_MEMBER_RANGES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_MEMBER_STEPPEDRANGES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_MEMBER_VALUES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_MEMBER_FLAG_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_MEMBER_FLAG_BASICSUPPORT_MULTICHANNEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_MEMBER_FLAG_BASICSUPPORT_UNIFORM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENTF_EVENT_HANDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENTF_SEMAPHORE_HANDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENTF_EVENT_OBJECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENTF_SEMAPHORE_OBJECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENTF_DPC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENTF_WORKITEM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENTF_KSWORKITEM => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENT_TYPE_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENT_TYPE_ONESHOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENT_TYPE_ENABLEBUFFERED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENT_TYPE_SETSUPPORT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENT_TYPE_BASICSUPPORT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENT_TYPE_QUERYBUFFER => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENT_TYPE_TOPOLOGY => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static KSRELATIVEEVENT_FLAG_HANDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSRELATIVEEVENT_FLAG_POINTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSMEDIUM_TYPE_ANYINSTANCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSMEDIUM_STANDARD_DEVIO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_PIN_FLAGS_ATTRIBUTE_RANGE_AWARE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_PIN_FLAGS_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSDATAFORMAT_BIT_TEMPORAL_COMPRESSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSDATAFORMAT_BIT_ATTRIBUTES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSDATARANGE_BIT_ATTRIBUTES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSDATARANGE_BIT_REQUIRED_ATTRIBUTES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSATTRIBUTE_REQUIRED => 1

    /**
     * @type {String}
     */
    static KSSTRING_Filter => "{9B365890-165F-11D0-A195-0020AFD156E4}"

    /**
     * @type {String}
     */
    static KSSTRING_Pin => "{146F1A80-4791-11D0-A5D6-28DB04C10000}"

    /**
     * @type {String}
     */
    static KSSTRING_Clock => "{53172480-4791-11D0-A5D6-28DB04C10000}"

    /**
     * @type {String}
     */
    static KSSTRING_Allocator => "{642F5D00-4791-11D0-A5D6-28DB04C10000}"

    /**
     * @type {String}
     */
    static KSSTRING_AllocatorEx => "{091BB63B-603F-11D1-B067-00A0C9062802}"

    /**
     * @type {String}
     */
    static KSSTRING_TopologyNode => "{0621061A-EE75-11D0-B915-00A0C9223196}"

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_REQUIREMENTF_INPLACE_MODIFIER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_REQUIREMENTF_SYSTEM_MEMORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_REQUIREMENTF_FRAME_INTEGRITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_REQUIREMENTF_MUST_ALLOCATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_REQUIREMENTF_SYSTEM_MEMORY_CUSTOM_ALLOCATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_REQUIREMENTF_PREFERENCES_ONLY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_OPTIONF_COMPATIBLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_OPTIONF_SYSTEM_MEMORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_OPTIONF_VALID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_PARTIAL_READ_SUPPORT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_DEVICE_SPECIFIC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_CAN_ALLOCATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_INSIST_ON_FRAMESIZE_RATIO => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_NO_FRAME_INTEGRITY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_MULTIPLE_OUTPUT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_CYCLE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_ALLOCATOR_EXISTS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_INDEPENDENT_RANGES => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_ATTENTION_STEPPING => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_ENABLE_CACHED_MDL => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static KSALLOCATOR_FLAG_2D_BUFFER_REQUIRED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_SPLICEPOINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_PREROLL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_DATADISCONTINUITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_TYPECHANGED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_TIMEVALID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_TIMEDISCONTINUITY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_FLUSHONPAUSE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_DURATIONVALID => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_ENDOFSTREAM => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_BUFFEREDTRANSFER => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_VRAM_DATA_TRANSFER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_METADATA => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_ENDOFPHOTOSEQUENCE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_FRAMEINFO => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_PERSIST_SAMPLE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_SAMPLE_PERSISTED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_TRACK_COMPLETION_NUMBERS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_SECUREBUFFERTRANSFER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_HEADER_OPTIONSF_LOOPEDDATA => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_UVC_SECURE_ATTRIBUTE_SIZE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static KSFRAMETIME_VARIABLESIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSRATE_NOPRESENTATIONSTART => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSRATE_NOPRESENTATIONDURATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NANOSECONDS => 10000000

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROBE_STREAMREAD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROBE_STREAMWRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROBE_ALLOCATEMDL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROBE_PROBEANDLOCK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROBE_SYSTEMADDRESS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROBE_MODIFY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROBE_ALLOWFORMATCHANGE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_READ => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_WRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_PAGED_DATA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_NONPAGED_DATA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_SYNCHRONOUS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static KSSTREAM_FAILUREEXCEPTION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENT_ENTRY_DELETED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENT_ENTRY_ONESHOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSEVENT_ENTRY_BUFFERED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSDISPATCH_FASTIO => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KSCREATE_ITEM_SECURITYCHANGED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSCREATE_ITEM_WILDCARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSCREATE_ITEM_NOPARAMETERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSCREATE_ITEM_FREEONSTOP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BUS_INTERFACE_REFERENCE_VERSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KS_HANDSHAKE => 3080223

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_DEV_VER_FOR_QI => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSDEVICE_DESCRIPTOR_VERSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSDEVICE_DESCRIPTOR_VERSION_2 => 272

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_DEV_VER_FOR_FLAGS => 272

    /**
     * @type {Integer (UInt32)}
     */
    static KSDEVICE_FLAG_ENABLE_REMOTE_WAKEUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSDEVICE_FLAG_LOWPOWER_PASSTHROUGH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSDEVICE_FLAG_ENABLE_QUERYINTERFACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSFILTER_FLAG_DISPATCH_LEVEL_PROCESSING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSFILTER_FLAG_CRITICAL_PROCESSING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSFILTER_FLAG_HYPERCRITICAL_PROCESSING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSFILTER_FLAG_RECEIVE_ZERO_LENGTH_SAMPLES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KSFILTER_FLAG_DENY_USERMODE_ACCESS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KSFILTER_FLAG_PRIORITIZE_REFERENCEGUID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_DISPATCH_LEVEL_PROCESSING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_CRITICAL_PROCESSING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_HYPERCRITICAL_PROCESSING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_ASYNCHRONOUS_PROCESSING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_DO_NOT_INITIATE_PROCESSING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_INITIATE_PROCESSING_ON_EVERY_ARRIVAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_FRAMES_NOT_REQUIRED_FOR_PROCESSING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_ENFORCE_FIFO => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_GENERATE_MAPPINGS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_DISTINCT_TRAILING_EDGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_PROCESS_IN_RUN_STATE_ONLY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_SPLITTER => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_USE_STANDARD_TRANSPORT => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_DO_NOT_USE_STANDARD_TRANSPORT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_FIXED_FORMAT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_GENERATE_EOS_EVENTS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_IMPLEMENT_CLOCK => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_SOME_FRAMES_REQUIRED_FOR_PROCESSING => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_PROCESS_IF_ANY_IN_RUN_STATE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static KSPIN_FLAG_DENY_USERMODE_ACCESS => 2147483648

    /**
     * @type {Integer (UInt16)}
     */
    static RT_STRING => 6

    /**
     * @type {Integer (UInt16)}
     */
    static RT_RCDATA => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_EXTENSIBLE => 65534

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_BUFFER_PRIMARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_BUFFER_STATIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_BUFFER_LOCHARDWARE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_BUFFER_LOCSOFTWARE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_BUFFER_CTRL_3D => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_BUFFER_CTRL_FREQUENCY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_BUFFER_CTRL_PAN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_BUFFER_CTRL_VOLUME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_BUFFER_CTRL_POSITIONNOTIFY => 16

    /**
     * @type {Integer (Int32)}
     */
    static KSAUDIO_STEREO_SPEAKER_GEOMETRY_HEADPHONE => -1

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_STEREO_SPEAKER_GEOMETRY_MIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_STEREO_SPEAKER_GEOMETRY_NARROW => 10

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_STEREO_SPEAKER_GEOMETRY_WIDE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_STEREO_SPEAKER_GEOMETRY_MAX => 180

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_3D_MODE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_3D_MODE_HEADRELATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_3D_MODE_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSDSOUND_BUFFER_CTRL_HRTF_3D => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_QUALITY_WORST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_QUALITY_PC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_QUALITY_BASIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_QUALITY_ADVANCED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_CPU_RESOURCES_NOT_HOST_CPU => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_CPU_RESOURCES_HOST_CPU => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_FRONT_LEFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_FRONT_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_FRONT_CENTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_LOW_FREQUENCY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_BACK_LEFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_BACK_RIGHT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_FRONT_LEFT_OF_CENTER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_FRONT_RIGHT_OF_CENTER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_BACK_CENTER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_SIDE_LEFT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_SIDE_RIGHT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_TOP_CENTER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_TOP_FRONT_LEFT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_TOP_FRONT_CENTER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_TOP_FRONT_RIGHT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_TOP_BACK_LEFT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_TOP_BACK_CENTER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_TOP_BACK_RIGHT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_RESERVED => 2147221504

    /**
     * @type {Integer (UInt32)}
     */
    static SPEAKER_ALL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_SPEAKER_DIRECTOUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_SPEAKER_MONO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_SPEAKER_GROUND_FRONT_LEFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_SPEAKER_GROUND_FRONT_CENTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_SPEAKER_GROUND_FRONT_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_SPEAKER_GROUND_REAR_LEFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_SPEAKER_GROUND_REAR_RIGHT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_SPEAKER_TOP_MIDDLE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDIO_SPEAKER_SUPER_WOOFER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KSNODEPIN_STANDARD_IN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSNODEPIN_STANDARD_OUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSNODEPIN_SUM_MUX_IN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSNODEPIN_SUM_MUX_OUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSNODEPIN_DEMUX_IN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSNODEPIN_DEMUX_OUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSNODEPIN_AEC_RENDER_IN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSNODEPIN_AEC_RENDER_OUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSNODEPIN_AEC_CAPTURE_IN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSNODEPIN_AEC_CAPTURE_OUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AEC_STATUS_FD_HISTORY_UNINITIALIZED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AEC_STATUS_FD_HISTORY_CONTINUOUSLY_CONVERGED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AEC_STATUS_FD_HISTORY_PREVIOUSLY_DIVERGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AEC_STATUS_FD_CURRENTLY_CONVERGED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AEC_MODE_PASS_THROUGH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AEC_MODE_HALF_DUPLEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AEC_MODE_FULL_DUPLEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_WAVE_QUEUED_POSITION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSMETHOD_WAVE_QUEUED_BREAKLOOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSWAVE_COMPATCAPS_INPUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSWAVE_COMPATCAPS_OUTPUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSWAVE_BUFFER_ATTRIBUTEF_LOOPING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSWAVE_BUFFER_ATTRIBUTEF_STATIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYSAUDIO_FLAGS_DONT_COMBINE_PINS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYSAUDIO_FLAGS_CLEAR_PREFERRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSMPEGVIDMODE_PANSCAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSMPEGVIDMODE_LTRBOX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSMPEGVIDMODE_SCALE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_ALTERNATE_AUDIO_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_ALTERNATE_AUDIO_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_ALTERNATE_AUDIO_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_SERVICE_MAIN_AUDIO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_SERVICE_NO_DIALOG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_SERVICE_VISUALLY_IMPAIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_SERVICE_HEARING_IMPAIRED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_SERVICE_DIALOG_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_SERVICE_COMMENTARY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_SERVICE_EMERGENCY_FLASH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static KSAC3_SERVICE_VOICE_OVER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDDECOUTMODE_STEREO_ANALOG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDDECOUTMODE_PCM_51 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSAUDDECOUTMODE_SPDIFF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_CGMS_RESERVED_MASK => 120

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_CGMS_COPY_PROTECT_MASK => 24

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_CGMS_COPY_PERMITTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_CGMS_COPY_ONCE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_CGMS_NO_COPY => 24

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_COPYRIGHT_MASK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_NOT_COPYRIGHTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_COPYRIGHTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_SECTOR_PROTECT_MASK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_SECTOR_NOT_PROTECTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KS_DVD_SECTOR_PROTECTED => 32

    /**
     * @type {Integer (Int32)}
     */
    static KS_BI_RGB => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_BI_RLE8 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_BI_RLE4 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_BI_BITFIELDS => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_BI_JPEG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KS_iPALETTE_COLORS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KS_iEGA_COLORS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KS_iMASK_COLORS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KS_iTRUECOLOR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KS_iRED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KS_iGREEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KS_iBLUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KS_iPALETTE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KS_iMAXBITS => 8

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBIDATARATE_NABTS => 5727272

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBIDATARATE_CC => 503493

    /**
     * @type {Integer (Int32)}
     */
    static KS_TVTUNER_CHANGE_BEGIN_TUNE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_TVTUNER_CHANGE_END_TUNE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_IsInterlaced => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_1FieldPerSample => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_Field1First => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_UNUSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_FieldPatternMask => 48

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_FieldPatField1Only => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_FieldPatField2Only => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_FieldPatBothRegular => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_FieldPatBothIrregular => 48

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_DisplayModeMask => 192

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_DisplayModeBobOnly => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_DisplayModeWeaveOnly => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KS_INTERLACE_DisplayModeBobOrWeave => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KS_COPYPROTECT_RestrictDuplication => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEG2_DoPanScan => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEG2_DVDLine21Field1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEG2_DVDLine21Field2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEG2_SourceIsLetterboxed => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEG2_FilmCameraMode => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEG2_LetterboxAnalogOut => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEG2_DSS_UserData => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEG2_DVB_UserData => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEG2_27MhzTimebase => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEG2_WidescreenAnalogOut => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KS_AMCONTROL_USED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KS_AMCONTROL_PAD_TO_4x3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KS_AMCONTROL_PAD_TO_16x9 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KS_AMCONTROL_COLORINFO_PRESENT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MAX_SIZE_MPEG1_SEQUENCE_INFO => 140

    /**
     * @type {Integer (UInt32)}
     */
    static KS_MPEGAUDIOINFO_27MhzTimebase => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEOSTREAM_PREVIEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEOSTREAM_CAPTURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEOSTREAM_VBI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEOSTREAM_NABTS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEOSTREAM_CC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEOSTREAM_EDS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEOSTREAM_TELETEXT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEOSTREAM_STILL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEOSTREAM_IS_VPE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEO_ALLOC_VPE_SYSTEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEO_ALLOC_VPE_DISPLAY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KS_VIDEO_ALLOC_VPE_AGP => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBICAP_PROTECTION_MV_PRESENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBICAP_PROTECTION_MV_HARDWARE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBICAP_PROTECTION_MV_DETECTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_ORIGINAL_CONTENT_BASE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_ORIGINAL_CONTENT_ADVERTISER_BASE => 2064

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_PRODUCTION_COMPANY_CONTENT_BASE => 2080

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_PRODUCTION_COMPANY_ADVERTISER_BASE => 2096

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_SYNDICATED_SHOW_CONTENT_BASE => 2112

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_SYNDICATED_SHOW_ADVERTISER_BASE => 2128

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_NETWORK_WIDE_CONTENT_BASE => 2144

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_NETWORK_WIDE_ADVERTISER_BASE => 2160

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_TELEVISION_STATION_CONTENT_BASE => 2176

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_TELEVISION_STATION_ADVERTISER_BASE => 2192

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_LOCAL_CABLE_SYSTEM_CONTENT_BASE => 2208

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_LOCAL_CABLE_SYSTEM_ADVERTISER_BASE => 2224

    /**
     * @type {Integer (UInt32)}
     */
    static KS_NABTS_GROUPID_MICROSOFT_RESERVED_TEST_DATA_BASE => 2288

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NABTS_VBI_LINES_PER_FIELD => 11

    /**
     * @type {Integer (UInt32)}
     */
    static NABTS_LINES_PER_BUNDLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NABTS_PAYLOAD_PER_LINE => 28

    /**
     * @type {Integer (UInt32)}
     */
    static NABTS_BYTES_PER_LINE => 36

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_ODD => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_EVEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_FIELD1_MASK => 240

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_SERVICE_CC1 => 16

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_SERVICE_CC2 => 32

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_SERVICE_T1 => 64

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_SERVICE_T2 => 128

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_FIELD2_MASK => 7936

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_SERVICE_CC3 => 256

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_SERVICE_CC4 => 512

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_SERVICE_T3 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_SERVICE_T4 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static KS_CC_SUBSTREAM_SERVICE_XDS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CC_MAX_HW_DECODE_LINES => 12

    /**
     * @type {Integer (UInt32)}
     */
    static NABTS_BUFFER_PICTURENUMBER_SUPPORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WST_TVTUNER_CHANGE_BEGIN_TUNE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static WST_TVTUNER_CHANGE_END_TUNE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_WST_VBI_LINES_PER_FIELD => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WST_BYTES_PER_LINE => 42

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_FIELD_MASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_FRAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_FIELD1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_FIELD2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_FIELD1FIRST => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_WEAVE => 8

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_IPB_MASK => 48

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_I_FRAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_P_FRAME => 16

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_B_FRAME => 32

    /**
     * @type {Integer (Int32)}
     */
    static KS_VIDEO_FLAG_REPEAT_FIELD => 64

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBI_FLAG_FRAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBI_FLAG_FIELD1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBI_FLAG_FIELD2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBI_FLAG_MV_PRESENT => 256

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBI_FLAG_MV_HARDWARE => 512

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBI_FLAG_MV_DETECTED => 1024

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBI_FLAG_TVTUNER_CHANGE => 16

    /**
     * @type {Integer (Int32)}
     */
    static KS_VBI_FLAG_VBIINFOHEADER_CHANGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KS_AnalogVideo_NTSC_Mask => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KS_AnalogVideo_PAL_Mask => 1052656

    /**
     * @type {Integer (UInt32)}
     */
    static KS_AnalogVideo_SECAM_Mask => 1044480

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_FLAGS_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOPROCAMP_FLAGS_MANUAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FLAGS_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FLAGS_MANUAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FLAGS_ASYNCHRONOUS => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FLAGS_ABSOLUTE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FLAGS_RELATIVE => 16

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FLASH_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FLASH_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FLASH_AUTO => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FLASH_FLAGS_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FLASH_FLAGS_MANUAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_HIGH => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_MEDIUM => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_LOW => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_AUTO => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_FLAGS_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_FLAGS_MANUAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_FLAGS_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_FLAGS_MANUAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_FLAGS_ASYNC => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_CONFIG_FOCUS => 256

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_CONFIG_EXPOSURE => 512

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_CONFIG_WB => 1024

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_CONVERGEMODE => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY_EXCLUSIVE_WITH_RECORD => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY_SEQUENCE_EXCLUSIVE_WITH_RECORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_EXTENDEDPROP_FILTERSCOPE => 4294967295

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_CAPS_RESERVED => 18374686479671623680

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_CAPS_ASYNCCONTROL => 9223372036854775808

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_CAPS_CANCELLABLE => 4611686018427387904

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLAG_CANCELOPERATION => 9223372036854775808

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_CAPS_MASK => 18374686479671623680

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLAG_MASK => 18374686479671623680

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOMODE_NORMAL => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOMODE_SEQUENCE => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_WARMSTART_MODE_DISABLED => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_WARMSTART_MODE_ENABLED => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOTHUMBNAIL_DISABLE => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOTHUMBNAIL_2X => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOTHUMBNAIL_4X => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOTHUMBNAIL_8X => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOTHUMBNAIL_16X => 8

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_AUTO => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_MACRO => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_PORTRAIT => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_SPORT => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_SNOW => 8

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_NIGHT => 16

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_BEACH => 32

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_SUNSET => 64

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_CANDLELIGHT => 128

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_LANDSCAPE => 256

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_NIGHTPORTRAIT => 512

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_BACKLIT => 1024

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SCENEMODE_MANUAL => 36028797018963968

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOTORCH_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON_ADJUSTABLEPOWER => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_ON_ADJUSTABLEPOWER => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_AUTO => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_AUTO_ADJUSTABLEPOWER => 8

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_REDEYEREDUCTION => 16

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_SINGLEFLASH => 32

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_MULTIFLASHSUPPORTED => 64

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_OPTIMIZATION_PHOTO => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_OPTIMIZATION_VIDEO => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_OPTIMIZATION_DEFAULT => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_OPTIMIZATION_QUALITY => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_OPTIMIZATION_LATENCY => 8

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_OPTIMIZATION_POWER => 16

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_AUTO => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_MANUAL => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_LOCK => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_CONTINUOUS => 256

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_MACRO => 65536

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_NORMAL => 131072

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_FULLRANGE => 262144

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_INFINITY => 524288

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_HYPERFOCAL => 1048576

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_DISTANCE_INFINITY => 16777216

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_DISTANCE_HYPERFOCAL => 33554432

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_DISTANCE_NEAREST => 67108864

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_AUTO => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_50 => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_80 => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_100 => 8

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_200 => 16

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_400 => 32

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_800 => 64

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_1600 => 128

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_3200 => 256

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_6400 => 512

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_12800 => 1024

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_25600 => 2048

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_CONTINUOUSLOCK => 512

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_UNLOCK => 1024

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_DRIVERFALLBACK_OFF => 2048

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUS_REGIONBASED => 4096

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ISO_MANUAL => 36028797018963968

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_ASSISTANT_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_ASSISTANT_ON => 128

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FLASH_ASSISTANT_AUTO => 256

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_EVCOMP_SIXTHSTEP => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_EVCOMP_QUARTERSTEP => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_EVCOMP_THIRDSTEP => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_EVCOMP_HALFSTEP => 8

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_EVCOMP_FULLSTEP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOMODE_SEQUENCE_SUB_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOMODE_SEQUENCE_SUB_VARIABLE => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_METADATA_MEMORYTYPE_MASK => 255

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_METADATA_SYSTEMMEMORY => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_METADATA_ALIGNMENTREQUIRED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_FRAMEILLUMINATION_FLAG_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_EXPOSURETIME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_EXPOSURECOMPENSATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_ISOSPEED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_FOCUSSTATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_LENSPOSITION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_WHITEBALANCE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_FLASH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_FLASHPOWER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_ZOOMFACTOR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_SCENEMODE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KSCAMERA_METADATA_CAPTURESTATS_FLAG_SENSORFRAMERATE => 1024

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSPRIORITY_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSPRIORITY_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOCONFIRMATION_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_PHOTOCONFIRMATION_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_PERFRAMESETTING_AUTO => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_PERFRAMESETTING_MANUAL => 8589934592

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOSTABILIZATION_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOSTABILIZATION_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOSTABILIZATION_AUTO => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VFR_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VFR_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FACEDETECTION_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FACEDETECTION_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FACEDETECTION_PREVIEW => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FACEDETECTION_VIDEO => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FACEDETECTION_PHOTO => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FACEDETECTION_BLINK => 8

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FACEDETECTION_SMILE => 16

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOHDR_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOHDR_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOHDR_AUTO => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_HISTOGRAM_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_HISTOGRAM_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_OIS_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_OIS_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_OIS_AUTO => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ADVANCEDPHOTO_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ADVANCEDPHOTO_AUTO => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ADVANCEDPHOTO_HDR => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ADVANCEDPHOTO_FNF => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ADVANCEDPHOTO_ULTRALOWLIGHT => 8

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ZOOM_DEFAULT => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ZOOM_DIRECT => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_ZOOM_SMOOTH => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FACEAUTH_MODE_DISABLED => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FACEAUTH_MODE_ALTERNATIVE_FRAME_ILLUMINATION => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FACEAUTH_MODE_BACKGROUND_SUBTRACTION => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SECUREMODE_DISABLED => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_SECUREMODE_ENABLED => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOTEMPORALDENOISING_AUTO => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOTEMPORALDENOISING_OFF => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_VIDEOTEMPORALDENOISING_ON => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_IRTORCHMODE_OFF => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_IRTORCHMODE_ALWAYS_ON => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_IRTORCHMODE_ALTERNATING_FRAME_ILLUMINATION => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_RELATIVEPANELOPTIMIZATION_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_RELATIVEPANELOPTIMIZATION_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_RELATIVEPANELOPTIMIZATION_DYNAMIC => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_EYEGAZECORRECTION_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_EYEGAZECORRECTION_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_EYEGAZECORRECTION_STARE => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_BLUR => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_MASK => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_SHALLOWFOCUS => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_MANUAL => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_AUTOFACEFRAMING => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FRAMERATE_THROTTLE_OFF => 0

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERA_EXTENDEDPROP_FRAMERATE_THROTTLE_ON => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERAPROFILE_FLAGS_VIDEOSTABLIZATION => 1

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERAPROFILE_FLAGS_VIDEOHDR => 2

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERAPROFILE_FLAGS_PHOTOHDR => 4

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERAPROFILE_FLAGS_FACEDETECTION => 8

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERAPROFILE_FLAGS_VARIABLEPHOTOSEQUENCE => 16

    /**
     * @type {Integer (UInt64)}
     */
    static KSCAMERAPROFILE_FLAGS_PREVIEW_RES_MUSTMATCH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KSDEVICE_PROFILE_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KSDEVICE_PROFILE_TYPE_CAMERA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSCameraProfileSensorType_RGB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KSCameraProfileSensorType_Infrared => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSCameraProfileSensorType_Depth => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KSCameraProfileSensorType_PoseTracking => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KSCameraProfileSensorType_ImageSegmentation => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KSCameraProfileSensorType_Custom => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KS_TVAUDIO_MODE_MONO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KS_TVAUDIO_MODE_STEREO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KS_TVAUDIO_MODE_LANG_A => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KS_TVAUDIO_MODE_LANG_B => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KS_TVAUDIO_MODE_LANG_C => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KS_TVAUDIO_PRESET_STEREO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KS_TVAUDIO_PRESET_LANG_A => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static KS_TVAUDIO_PRESET_LANG_B => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static KS_TVAUDIO_PRESET_LANG_C => 16384

    /**
     * @type {Integer (Int32)}
     */
    static KS_AM_UseNewCSSKey => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SINK_DESCRIPTION_NAME_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JACKDESC2_PRESENCE_DETECT_CAPABILITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JACKDESC2_DYNAMIC_FORMAT_CHANGE_CAPABILITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KSPROPERTY_AUDIO_BUFFER_DURATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOLOOPBACK_TAPPOINT_CAPS_PREVOLUMEMUTE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOLOOPBACK_TAPPOINT_CAPS_POSTVOLUMEMUTE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_RESOURCEGROUPID_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOMODULE_MAX_DATA_SIZE => 64000

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOMODULE_MAX_NAME_CCH_SIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AllocatorStrategy_DontCare => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AllocatorStrategy_MinimizeNumberOfFrames => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AllocatorStrategy_MinimizeFrameSize => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AllocatorStrategy_MinimizeNumberOfAllocators => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AllocatorStrategy_MaximizeSpeed => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_UserModeUpstream => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_UserModeDownstream => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_MemoryTypes => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_Flags => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_PhysicalRanges => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_OptimalRanges => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_FixedCompression => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_UnknownCompression => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_Buffers => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_Align => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_PhysicalEnd => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PipeFactor_LogicalEnd => 2048

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEMORY_TRANSPORT => 1
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {HANDLE} ConnectionHandle 
     * @param {Pointer<KSALLOCATOR_FRAMING>} AllocatorFraming 
     * @param {Pointer<HANDLE>} AllocatorHandle 
     * @returns {Integer} 
     */
    static KsCreateAllocator(ConnectionHandle, AllocatorFraming, AllocatorHandle) {
        ConnectionHandle := ConnectionHandle is Win32Handle ? NumGet(ConnectionHandle, "ptr") : ConnectionHandle

        result := DllCall("ksuser.dll\KsCreateAllocator", "ptr", ConnectionHandle, "ptr", AllocatorFraming, "ptr", AllocatorHandle, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} ConnectionHandle 
     * @param {Pointer<KSCLOCK_CREATE>} ClockCreate 
     * @param {Pointer<HANDLE>} ClockHandle 
     * @returns {Integer} 
     */
    static KsCreateClock(ConnectionHandle, ClockCreate, ClockHandle) {
        ConnectionHandle := ConnectionHandle is Win32Handle ? NumGet(ConnectionHandle, "ptr") : ConnectionHandle

        result := DllCall("ksuser.dll\KsCreateClock", "ptr", ConnectionHandle, "ptr", ClockCreate, "ptr", ClockHandle, "uint")
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
    static KsCreatePin(FilterHandle, Connect, DesiredAccess, ConnectionHandle) {
        FilterHandle := FilterHandle is Win32Handle ? NumGet(FilterHandle, "ptr") : FilterHandle

        result := DllCall("ksuser.dll\KsCreatePin", "ptr", FilterHandle, "ptr", Connect, "uint", DesiredAccess, "ptr", ConnectionHandle, "uint")
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
    static KsCreateTopologyNode(ParentHandle, NodeCreate, DesiredAccess, NodeHandle) {
        ParentHandle := ParentHandle is Win32Handle ? NumGet(ParentHandle, "ptr") : ParentHandle

        result := DllCall("ksuser.dll\KsCreateTopologyNode", "ptr", ParentHandle, "ptr", NodeCreate, "uint", DesiredAccess, "ptr", NodeHandle, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} ConnectionHandle 
     * @param {Pointer<KSALLOCATOR_FRAMING>} AllocatorFraming 
     * @param {Pointer<HANDLE>} AllocatorHandle 
     * @returns {HRESULT} 
     */
    static KsCreateAllocator2(ConnectionHandle, AllocatorFraming, AllocatorHandle) {
        ConnectionHandle := ConnectionHandle is Win32Handle ? NumGet(ConnectionHandle, "ptr") : ConnectionHandle

        result := DllCall("ksuser.dll\KsCreateAllocator2", "ptr", ConnectionHandle, "ptr", AllocatorFraming, "ptr", AllocatorHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} ConnectionHandle 
     * @param {Pointer<KSCLOCK_CREATE>} ClockCreate 
     * @param {Pointer<HANDLE>} ClockHandle 
     * @returns {HRESULT} 
     */
    static KsCreateClock2(ConnectionHandle, ClockCreate, ClockHandle) {
        ConnectionHandle := ConnectionHandle is Win32Handle ? NumGet(ConnectionHandle, "ptr") : ConnectionHandle

        result := DllCall("ksuser.dll\KsCreateClock2", "ptr", ConnectionHandle, "ptr", ClockCreate, "ptr", ClockHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} FilterHandle 
     * @param {Pointer<KSPIN_CONNECT>} Connect 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<HANDLE>} ConnectionHandle 
     * @returns {HRESULT} 
     */
    static KsCreatePin2(FilterHandle, Connect, DesiredAccess, ConnectionHandle) {
        FilterHandle := FilterHandle is Win32Handle ? NumGet(FilterHandle, "ptr") : FilterHandle

        result := DllCall("ksuser.dll\KsCreatePin2", "ptr", FilterHandle, "ptr", Connect, "uint", DesiredAccess, "ptr", ConnectionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} ParentHandle 
     * @param {Pointer<KSNODE_CREATE>} NodeCreate 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<HANDLE>} NodeHandle 
     * @returns {HRESULT} 
     */
    static KsCreateTopologyNode2(ParentHandle, NodeCreate, DesiredAccess, NodeHandle) {
        ParentHandle := ParentHandle is Win32Handle ? NumGet(ParentHandle, "ptr") : ParentHandle

        result := DllCall("ksuser.dll\KsCreateTopologyNode2", "ptr", ParentHandle, "ptr", NodeCreate, "uint", DesiredAccess, "ptr", NodeHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KSDATAFORMAT>} DataRange 
     * @param {Pointer<KSMULTIPLE_ITEM>} Attributes 
     * @returns {HRESULT} 
     */
    static KsResolveRequiredAttributes(DataRange, Attributes) {
        result := DllCall("ksproxy.ax\KsResolveRequiredAttributes", "ptr", DataRange, "ptr", Attributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Category 
     * @param {Integer} Access 
     * @param {Pointer<HANDLE>} DeviceHandle 
     * @returns {HRESULT} 
     */
    static KsOpenDefaultDevice(Category, Access, DeviceHandle) {
        result := DllCall("ksproxy.ax\KsOpenDefaultDevice", "ptr", Category, "uint", Access, "ptr", DeviceHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Integer} IoControl 
     * @param {Pointer} InBuffer 
     * @param {Integer} InLength 
     * @param {Pointer} OutBuffer 
     * @param {Integer} OutLength 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {HRESULT} 
     */
    static KsSynchronousDeviceControl(Handle, IoControl, InBuffer, InLength, OutBuffer, OutLength, BytesReturned) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("ksproxy.ax\KsSynchronousDeviceControl", "ptr", Handle, "uint", IoControl, "ptr", InBuffer, "uint", InLength, "ptr", OutBuffer, "uint", OutLength, "uint*", BytesReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} FilterHandle 
     * @param {Integer} PinFactoryId 
     * @param {Integer} PropertyId 
     * @param {Pointer<Pointer<Void>>} Items 
     * @returns {HRESULT} 
     */
    static KsGetMultiplePinFactoryItems(FilterHandle, PinFactoryId, PropertyId, Items) {
        FilterHandle := FilterHandle is Win32Handle ? NumGet(FilterHandle, "ptr") : FilterHandle

        result := DllCall("ksproxy.ax\KsGetMultiplePinFactoryItems", "ptr", FilterHandle, "uint", PinFactoryId, "uint", PropertyId, "ptr*", Items, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} FilterHandle 
     * @param {Integer} PinFactoryId 
     * @param {Pointer<Integer>} MediaTypeCount 
     * @returns {HRESULT} 
     */
    static KsGetMediaTypeCount(FilterHandle, PinFactoryId, MediaTypeCount) {
        FilterHandle := FilterHandle is Win32Handle ? NumGet(FilterHandle, "ptr") : FilterHandle

        result := DllCall("ksproxy.ax\KsGetMediaTypeCount", "ptr", FilterHandle, "uint", PinFactoryId, "uint*", MediaTypeCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Position 
     * @param {Pointer<AM_MEDIA_TYPE>} AmMediaType 
     * @param {HANDLE} FilterHandle 
     * @param {Integer} PinFactoryId 
     * @returns {HRESULT} 
     */
    static KsGetMediaType(Position, AmMediaType, FilterHandle, PinFactoryId) {
        FilterHandle := FilterHandle is Win32Handle ? NumGet(FilterHandle, "ptr") : FilterHandle

        result := DllCall("ksproxy.ax\KsGetMediaType", "int", Position, "ptr", AmMediaType, "ptr", FilterHandle, "uint", PinFactoryId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
