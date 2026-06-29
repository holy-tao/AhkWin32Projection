#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Media.Audio
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_CUSTOM := 0

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_BOOLEANMETER := 268500992

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_SIGNEDMETER := 268566528

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_PEAKMETER := 268566529

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_UNSIGNEDMETER := 268632064

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_BOOLEAN := 536936448

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_ONOFF := 536936449

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_MUTE := 536936450

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_MONO := 536936451

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_LOUDNESS := 536936452

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_STEREOENH := 536936453

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_BASS_BOOST := 536945271

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_BUTTON := 553713664

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_DECIBELS := 805568512

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_SIGNED := 805437440

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_UNSIGNED := 805502976

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_PERCENT := 805634048

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_SLIDER := 1073872896

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_PAN := 1073872897

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_QSOUNDPAN := 1073872898

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_FADER := 1342373888

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_VOLUME := 1342373889

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_BASS := 1342373890

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_TREBLE := 1342373891

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_EQUALIZER := 1342373892

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_SINGLESELECT := 1879113728

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_MUX := 1879113729

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT := 1895890944

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_MIXER := 1895890945

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_MICROTIME := 1610809344

/**
 * @type {Integer (UInt32)}
 */
export global MIXERCONTROL_CONTROLTYPE_MILLITIME := 1627586560

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_MAPPER := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global ENDPOINT_FORMAT_RESET_MIX_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENDPOINT_HARDWARE_SUPPORT_VOLUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENDPOINT_HARDWARE_SUPPORT_MUTE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENDPOINT_HARDWARE_SUPPORT_METER := 4

/**
 * @type {Integer (UInt32)}
 */
export global AUDIOCLOCK_CHARACTERISTIC_FIXED_FREQ := 1

/**
 * @type {Integer (UInt32)}
 */
export global AMBISONICS_PARAM_VERSION_1 := 1

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_NOT_INITIALIZED := -2004287487

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_ALREADY_INITIALIZED := -2004287486

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_WRONG_ENDPOINT_TYPE := -2004287485

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_DEVICE_INVALIDATED := -2004287484

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_NOT_STOPPED := -2004287483

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_BUFFER_TOO_LARGE := -2004287482

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_OUT_OF_ORDER := -2004287481

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_UNSUPPORTED_FORMAT := -2004287480

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_INVALID_SIZE := -2004287479

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_DEVICE_IN_USE := -2004287478

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_BUFFER_OPERATION_PENDING := -2004287477

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_THREAD_NOT_REGISTERED := -2004287476

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_EXCLUSIVE_MODE_NOT_ALLOWED := -2004287474

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_ENDPOINT_CREATE_FAILED := -2004287473

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_SERVICE_NOT_RUNNING := -2004287472

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_EVENTHANDLE_NOT_EXPECTED := -2004287471

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_EXCLUSIVE_MODE_ONLY := -2004287470

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_BUFDURATION_PERIOD_NOT_EQUAL := -2004287469

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_EVENTHANDLE_NOT_SET := -2004287468

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_INCORRECT_BUFFER_SIZE := -2004287467

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_BUFFER_SIZE_ERROR := -2004287466

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_CPUUSAGE_EXCEEDED := -2004287465

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_BUFFER_ERROR := -2004287464

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_BUFFER_SIZE_NOT_ALIGNED := -2004287463

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_INVALID_DEVICE_PERIOD := -2004287456

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_INVALID_STREAM_FLAG := -2004287455

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_ENDPOINT_OFFLOAD_NOT_CAPABLE := -2004287454

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_OUT_OF_OFFLOAD_RESOURCES := -2004287453

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_OFFLOAD_MODE_ONLY := -2004287452

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_NONOFFLOAD_MODE_ONLY := -2004287451

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_RESOURCES_INVALIDATED := -2004287450

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_RAW_MODE_UNSUPPORTED := -2004287449

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_ENGINE_PERIODICITY_LOCKED := -2004287448

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_ENGINE_FORMAT_LOCKED := -2004287447

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_HEADTRACKING_ENABLED := -2004287440

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_HEADTRACKING_UNSUPPORTED := -2004287424

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_EFFECT_NOT_AVAILABLE := -2004287423

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_EFFECT_STATE_READ_ONLY := -2004287422

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_E_POST_VOLUME_LOOPBACK_UNSUPPORTED := -2004287421

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_S_BUFFER_EMPTY := 143196161

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_S_THREAD_ALREADY_REGISTERED := 143196162

/**
 * @type {Integer (Int32)}
 */
export global AUDCLNT_S_POSITION_STALLED := 143196163

/**
 * @type {Integer (UInt32)}
 */
export global AUDCLNT_STREAMFLAGS_CROSSPROCESS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global AUDCLNT_STREAMFLAGS_LOOPBACK := 131072

/**
 * @type {Integer (UInt32)}
 */
export global AUDCLNT_STREAMFLAGS_EVENTCALLBACK := 262144

/**
 * @type {Integer (UInt32)}
 */
export global AUDCLNT_STREAMFLAGS_NOPERSIST := 524288

/**
 * @type {Integer (UInt32)}
 */
export global AUDCLNT_STREAMFLAGS_RATEADJUST := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global AUDCLNT_STREAMFLAGS_SRC_DEFAULT_QUALITY := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global AUDCLNT_STREAMFLAGS_AUTOCONVERTPCM := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global AUDCLNT_SESSIONFLAGS_EXPIREWHENUNOWNED := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global AUDCLNT_SESSIONFLAGS_DISPLAY_HIDE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global AUDCLNT_SESSIONFLAGS_DISPLAY_HIDEWHENEXPIRED := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_DESTROYED := -2004287232

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_OUT_OF_ORDER := -2004287231

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_RESOURCES_INVALIDATED := -2004287230

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_NO_MORE_OBJECTS := -2004287229

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_PROPERTY_NOT_SUPPORTED := -2004287228

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_ERRORS_IN_OBJECT_CALLS := -2004287227

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_METADATA_FORMAT_NOT_SUPPORTED := -2004287226

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_STREAM_NOT_AVAILABLE := -2004287225

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_INVALID_LICENSE := -2004287224

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_STREAM_NOT_STOPPED := -2004287222

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_STATIC_OBJECT_NOT_AVAILABLE := -2004287221

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_OBJECT_ALREADY_ACTIVE := -2004287220

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUDCLNT_E_INTERNAL := -2004287219

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_STATEMASK_ALL := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_FormFactor := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_FormFactor.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_FormFactor.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_ControlPanelPageProvider := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_ControlPanelPageProvider.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_ControlPanelPageProvider.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_Association := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_Association.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_Association.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_PhysicalSpeakers := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_PhysicalSpeakers.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_PhysicalSpeakers.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_GUID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_GUID.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_GUID.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_Disable_SysFx := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_Disable_SysFx.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_Disable_SysFx.pid := 5

/**
 * @type {Integer (UInt32)}
 */
export global ENDPOINT_SYSFX_ENABLED := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENDPOINT_SYSFX_DISABLED := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_FullRangeSpeakers := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_FullRangeSpeakers.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_FullRangeSpeakers.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_Supports_EventDriven_Mode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_Supports_EventDriven_Mode.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_Supports_EventDriven_Mode.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_JackSubType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_JackSubType.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_JackSubType.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_Default_VolumeInDb := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_Default_VolumeInDb.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_Default_VolumeInDb.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_Max_VolumeInDb := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_Max_VolumeInDb.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_Max_VolumeInDb.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpoint_Min_VolumeInDb := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpoint_Min_VolumeInDb.fmtid),
    Guid.Ptr, Guid("{1da5d803-d492-4edd-8c23-e0c0ffee7f0e}"),
    UInt32, 16)
PKEY_AudioEndpoint_Min_VolumeInDb.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEngine_DeviceFormat := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEngine_DeviceFormat.fmtid),
    Guid.Ptr, Guid("{f19f064d-082c-4e27-bc73-6882a1bb8e4c}"),
    UInt32, 16)
PKEY_AudioEngine_DeviceFormat.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEngine_OEMFormat := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEngine_OEMFormat.fmtid),
    Guid.Ptr, Guid("{e4870e26-3cc5-4cd2-ba46-ca0a9a70ed04}"),
    UInt32, 16)
PKEY_AudioEngine_OEMFormat.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpointLogo_IconEffects := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpointLogo_IconEffects.fmtid),
    Guid.Ptr, Guid("{f1ab780d-2010-4ed3-a3a6-8b87f0f0c476}"),
    UInt32, 16)
PKEY_AudioEndpointLogo_IconEffects.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpointLogo_IconPath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpointLogo_IconPath.fmtid),
    Guid.Ptr, Guid("{f1ab780d-2010-4ed3-a3a6-8b87f0f0c476}"),
    UInt32, 16)
PKEY_AudioEndpointLogo_IconPath.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpointSettings_MenuText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpointSettings_MenuText.fmtid),
    Guid.Ptr, Guid("{14242002-0320-4de4-9555-a7d82b73c286}"),
    UInt32, 16)
PKEY_AudioEndpointSettings_MenuText.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEndpointSettings_LaunchContract := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEndpointSettings_LaunchContract.fmtid),
    Guid.Ptr, Guid("{14242002-0320-4de4-9555-a7d82b73c286}"),
    UInt32, 16)
PKEY_AudioEndpointSettings_LaunchContract.pid := 1

/**
 * @type {Guid}
 */
export global DEVINTERFACE_AUDIO_RENDER := Guid("{e6327cad-dcec-4949-ae8a-991e976a79d2}")

/**
 * @type {Guid}
 */
export global DEVINTERFACE_AUDIO_CAPTURE := Guid("{2eef81be-33fa-4800-9670-1cd474972c3f}")

/**
 * @type {Guid}
 */
export global DEVINTERFACE_MIDI_OUTPUT := Guid("{6dc23320-ab33-4ce4-80d4-bbb3ebbf2814}")

/**
 * @type {Guid}
 */
export global DEVINTERFACE_MIDI_INPUT := Guid("{504be32c-ccf6-4d2c-b73f-6f8b3747e22b}")

/**
 * @type {Guid}
 */
export global EVENTCONTEXT_VOLUMESLIDER := Guid("{e2c2e9de-09b1-4b04-84e5-07931225ee04}")

/**
 * @type {Integer (UInt32)}
 */
export global SPATIAL_AUDIO_STANDARD_COMMANDS_START := 200

/**
 * @type {Integer (UInt32)}
 */
export global SPATIAL_AUDIO_POSITION := 200

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_COMMAND_NOT_FOUND := -2004286976

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_OBJECT_NOT_INITIALIZED := -2004286975

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_INVALID_ARGS := -2004286974

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_METADATA_FORMAT_NOT_FOUND := -2004286973

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_VALUE_BUFFER_INCORRECT_SIZE := -2004286972

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_MEMORY_BOUNDS := -2004286971

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_NO_MORE_COMMANDS := -2004286970

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_BUFFER_ALREADY_ATTACHED := -2004286969

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_BUFFER_NOT_ATTACHED := -2004286968

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_FRAMECOUNT_OUT_OF_RANGE := -2004286967

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_NO_ITEMS_FOUND := -2004286960

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_ITEM_COPY_OVERFLOW := -2004286959

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_NO_ITEMS_OPEN := -2004286958

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_ITEMS_ALREADY_OPEN := -2004286957

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_ATTACH_FAILED_INTERNAL_BUFFER := -2004286956

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_DETACH_FAILED_INTERNAL_BUFFER := -2004286955

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_NO_BUFFER_ATTACHED := -2004286954

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_NO_MORE_ITEMS := -2004286953

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_FRAMEOFFSET_OUT_OF_RANGE := -2004286952

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_ITEM_MUST_HAVE_COMMANDS := -2004286951

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_NO_ITEMOFFSET_WRITTEN := -2004286944

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_NO_ITEMS_WRITTEN := -2004286943

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_COMMAND_ALREADY_WRITTEN := -2004286942

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_FORMAT_MISMATCH := -2004286941

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_BUFFER_STILL_ATTACHED := -2004286940

/**
 * @type {Integer (Int32)}
 */
export global SPTLAUD_MD_CLNT_E_ITEMS_LOCKED_FOR_WRITING := -2004286939

/**
 * @type {String}
 */
export global VIRTUAL_AUDIO_DEVICE_PROCESS_LOOPBACK := "VAD\Process_Loopback"

/**
 * @type {Integer (UInt32)}
 */
export global WAVERR_BADFORMAT := 32

/**
 * @type {Integer (UInt32)}
 */
export global WAVERR_STILLPLAYING := 33

/**
 * @type {Integer (UInt32)}
 */
export global WAVERR_UNPREPARED := 34

/**
 * @type {Integer (UInt32)}
 */
export global WAVERR_SYNC := 35

/**
 * @type {Integer (UInt32)}
 */
export global WAVERR_LASTERROR := 35

/**
 * @type {Integer (UInt32)}
 */
export global WHDR_DONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHDR_PREPARED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHDR_BEGINLOOP := 4

/**
 * @type {Integer (UInt32)}
 */
export global WHDR_ENDLOOP := 8

/**
 * @type {Integer (UInt32)}
 */
export global WHDR_INQUEUE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WAVECAPS_PITCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global WAVECAPS_PLAYBACKRATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WAVECAPS_VOLUME := 4

/**
 * @type {Integer (UInt32)}
 */
export global WAVECAPS_LRVOLUME := 8

/**
 * @type {Integer (UInt32)}
 */
export global WAVECAPS_SYNC := 16

/**
 * @type {Integer (UInt32)}
 */
export global WAVECAPS_SAMPLEACCURATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_INVALIDFORMAT := 0

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_1M08 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_1S08 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_1M16 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_1S16 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_2M08 := 16

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_2S08 := 32

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_2M16 := 64

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_2S16 := 128

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_4M08 := 256

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_4S08 := 512

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_4M16 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_4S16 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_44M08 := 256

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_44S08 := 512

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_44M16 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_44S16 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_48M08 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_48S08 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_48M16 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_48S16 := 32768

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_96M08 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_96S08 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_96M16 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_96S16 := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WAVE_FORMAT_PCM := 1

/**
 * @type {Integer (UInt32)}
 */
export global MIDIERR_UNPREPARED := 64

/**
 * @type {Integer (UInt32)}
 */
export global MIDIERR_STILLPLAYING := 65

/**
 * @type {Integer (UInt32)}
 */
export global MIDIERR_NOMAP := 66

/**
 * @type {Integer (UInt32)}
 */
export global MIDIERR_NOTREADY := 67

/**
 * @type {Integer (UInt32)}
 */
export global MIDIERR_NODEVICE := 68

/**
 * @type {Integer (UInt32)}
 */
export global MIDIERR_INVALIDSETUP := 69

/**
 * @type {Integer (UInt32)}
 */
export global MIDIERR_BADOPENMODE := 70

/**
 * @type {Integer (UInt32)}
 */
export global MIDIERR_DONT_CONTINUE := 71

/**
 * @type {Integer (UInt32)}
 */
export global MIDIERR_LASTERROR := 71

/**
 * @type {Integer (UInt32)}
 */
export global MIDIPATCHSIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global MIDI_CACHE_ALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global MIDI_CACHE_BESTFIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global MIDI_CACHE_QUERY := 3

/**
 * @type {Integer (UInt32)}
 */
export global MIDI_UNCACHE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MOD_MIDIPORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MOD_SYNTH := 2

/**
 * @type {Integer (UInt32)}
 */
export global MOD_SQSYNTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global MOD_FMSYNTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global MOD_MAPPER := 5

/**
 * @type {Integer (UInt32)}
 */
export global MOD_WAVETABLE := 6

/**
 * @type {Integer (UInt32)}
 */
export global MOD_SWSYNTH := 7

/**
 * @type {Integer (UInt32)}
 */
export global MIDICAPS_VOLUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global MIDICAPS_LRVOLUME := 2

/**
 * @type {Integer (UInt32)}
 */
export global MIDICAPS_CACHE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MIDICAPS_STREAM := 8

/**
 * @type {Integer (UInt32)}
 */
export global MHDR_DONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MHDR_PREPARED := 2

/**
 * @type {Integer (UInt32)}
 */
export global MHDR_INQUEUE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MHDR_ISSTRM := 8

/**
 * @type {Integer (Int32)}
 */
export global MEVT_F_SHORT := 0

/**
 * @type {Integer (Int32)}
 */
export global MEVT_F_LONG := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global MEVT_F_CALLBACK := 1073741824

/**
 * @type {Integer (Byte)}
 */
export global MEVT_SHORTMSG := 0x00

/**
 * @type {Integer (Byte)}
 */
export global MEVT_TEMPO := 0x01

/**
 * @type {Integer (Byte)}
 */
export global MEVT_NOP := 0x02

/**
 * @type {Integer (Byte)}
 */
export global MEVT_LONGMSG := 0x80

/**
 * @type {Integer (Byte)}
 */
export global MEVT_COMMENT := 0x82

/**
 * @type {Integer (Byte)}
 */
export global MEVT_VERSION := 0x84

/**
 * @type {Integer (Int32)}
 */
export global MIDISTRM_ERROR := -2

/**
 * @type {Integer (Int32)}
 */
export global MIDIPROP_SET := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global MIDIPROP_GET := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global MIDIPROP_TIMEDIV := 1

/**
 * @type {Integer (Int32)}
 */
export global MIDIPROP_TEMPO := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUXCAPS_CDAUDIO := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUXCAPS_AUXIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUXCAPS_VOLUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUXCAPS_LRVOLUME := 2

/**
 * @type {Integer (UInt32)}
 */
export global MIXER_SHORT_NAME_CHARS := 16

/**
 * @type {Integer (UInt32)}
 */
export global MIXER_LONG_NAME_CHARS := 64

/**
 * @type {Integer (UInt32)}
 */
export global MIXERR_INVALLINE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MIXERR_INVALCONTROL := 1025

/**
 * @type {Integer (UInt32)}
 */
export global MIXERR_INVALVALUE := 1026

/**
 * @type {Integer (UInt32)}
 */
export global MIXERR_LASTERROR := 1026

/**
 * @type {Integer (Int32)}
 */
export global MIXER_OBJECTF_HANDLE := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global MIXER_OBJECTF_MIXER := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXER_OBJECTF_WAVEOUT := 268435456

/**
 * @type {Integer (Int32)}
 */
export global MIXER_OBJECTF_WAVEIN := 536870912

/**
 * @type {Integer (Int32)}
 */
export global MIXER_OBJECTF_MIDIOUT := 805306368

/**
 * @type {Integer (Int32)}
 */
export global MIXER_OBJECTF_MIDIIN := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global MIXER_OBJECTF_AUX := 1342177280

/**
 * @type {Integer (Int32)}
 */
export global MIXERLINE_LINEF_ACTIVE := 1

/**
 * @type {Integer (Int32)}
 */
export global MIXERLINE_LINEF_DISCONNECTED := 32768

/**
 * @type {Integer (Int32)}
 */
export global MIXERLINE_LINEF_SOURCE := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global MIXERLINE_COMPONENTTYPE_DST_FIRST := 0

/**
 * @type {Integer (UInt32)}
 */
export global MIXERLINE_COMPONENTTYPE_DST_LAST := 8

/**
 * @type {Integer (Int32)}
 */
export global MIXERLINE_COMPONENTTYPE_SRC_FIRST := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MIXERLINE_COMPONENTTYPE_SRC_LAST := 4106

/**
 * @type {Integer (UInt32)}
 */
export global MIXERLINE_TARGETTYPE_UNDEFINED := 0

/**
 * @type {Integer (UInt32)}
 */
export global MIXERLINE_TARGETTYPE_WAVEOUT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MIXERLINE_TARGETTYPE_WAVEIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global MIXERLINE_TARGETTYPE_MIDIOUT := 3

/**
 * @type {Integer (UInt32)}
 */
export global MIXERLINE_TARGETTYPE_MIDIIN := 4

/**
 * @type {Integer (UInt32)}
 */
export global MIXERLINE_TARGETTYPE_AUX := 5

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETLINEINFOF_DESTINATION := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETLINEINFOF_SOURCE := 1

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETLINEINFOF_LINEID := 2

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETLINEINFOF_COMPONENTTYPE := 3

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETLINEINFOF_TARGETTYPE := 4

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETLINEINFOF_QUERYMASK := 15

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CONTROLF_UNIFORM := 1

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CONTROLF_MULTIPLE := 2

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CONTROLF_DISABLED := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_CLASS_MASK := -268435456

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_CLASS_CUSTOM := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_CLASS_METER := 268435456

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_CLASS_SWITCH := 536870912

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_CLASS_NUMBER := 805306368

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_CLASS_SLIDER := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_CLASS_FADER := 1342177280

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_CLASS_TIME := 1610612736

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_CLASS_LIST := 1879048192

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_SUBCLASS_MASK := 251658240

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_SC_SWITCH_BOOLEAN := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_SC_SWITCH_BUTTON := 16777216

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_SC_METER_POLLED := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_SC_TIME_MICROSECS := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_SC_TIME_MILLISECS := 16777216

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_SC_LIST_SINGLE := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_SC_LIST_MULTIPLE := 16777216

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_UNITS_MASK := 16711680

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_UNITS_CUSTOM := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_UNITS_BOOLEAN := 65536

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_UNITS_SIGNED := 131072

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_UNITS_UNSIGNED := 196608

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_UNITS_DECIBELS := 262144

/**
 * @type {Integer (Int32)}
 */
export global MIXERCONTROL_CT_UNITS_PERCENT := 327680

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETLINECONTROLSF_ALL := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETLINECONTROLSF_ONEBYID := 1

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETLINECONTROLSF_ONEBYTYPE := 2

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETLINECONTROLSF_QUERYMASK := 15

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETCONTROLDETAILSF_VALUE := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETCONTROLDETAILSF_LISTTEXT := 1

/**
 * @type {Integer (Int32)}
 */
export global MIXER_GETCONTROLDETAILSF_QUERYMASK := 15

/**
 * @type {Integer (Int32)}
 */
export global MIXER_SETCONTROLDETAILSF_VALUE := 0

/**
 * @type {Integer (Int32)}
 */
export global MIXER_SETCONTROLDETAILSF_CUSTOM := 1

/**
 * @type {Integer (Int32)}
 */
export global MIXER_SETCONTROLDETAILSF_QUERYMASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global DRV_MAPPER_PREFERRED_INPUT_GET := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DRV_MAPPER_PREFERRED_OUTPUT_GET := 16386

/**
 * @type {Integer (UInt32)}
 */
export global DRVM_MAPPER := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DRVM_MAPPER_STATUS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WIDM_MAPPER_STATUS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WAVEIN_MAPPER_STATUS_DEVICE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WAVEIN_MAPPER_STATUS_MAPPED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WAVEIN_MAPPER_STATUS_FORMAT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WODM_MAPPER_STATUS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WAVEOUT_MAPPER_STATUS_DEVICE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WAVEOUT_MAPPER_STATUS_MAPPED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WAVEOUT_MAPPER_STATUS_FORMAT := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACMERR_BASE := 512

/**
 * @type {Integer (UInt32)}
 */
export global ACMERR_NOTPOSSIBLE := 512

/**
 * @type {Integer (UInt32)}
 */
export global ACMERR_BUSY := 513

/**
 * @type {Integer (UInt32)}
 */
export global ACMERR_UNPREPARED := 514

/**
 * @type {Integer (UInt32)}
 */
export global ACMERR_CANCELED := 515

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_DRIVERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_CODECS := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_CONVERTERS := 3

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_FILTERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_DISABLED := 5

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_HARDWARE := 6

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_LOCAL_DRIVERS := 20

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_LOCAL_CODECS := 21

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_LOCAL_CONVERTERS := 22

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_LOCAL_FILTERS := 23

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_COUNT_LOCAL_DISABLED := 24

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_HARDWARE_WAVE_INPUT := 30

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_HARDWARE_WAVE_OUTPUT := 31

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_MAX_SIZE_FORMAT := 50

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_MAX_SIZE_FILTER := 51

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_DRIVER_SUPPORT := 100

/**
 * @type {Integer (UInt32)}
 */
export global ACM_METRIC_DRIVER_PRIORITY := 101

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERENUMF_NOLOCAL := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERENUMF_DISABLED := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERADDF_NAME := 1

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERADDF_FUNCTION := 3

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERADDF_NOTIFYHWND := 4

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERADDF_TYPEMASK := 7

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERADDF_LOCAL := 0

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERADDF_GLOBAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_USER := 16384

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_RESERVED_LOW := 24576

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_RESERVED_HIGH := 28671

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_DRIVER_ABOUT := 24587

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERPRIORITYF_ENABLE := 1

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERPRIORITYF_DISABLE := 2

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERPRIORITYF_ABLEMASK := 3

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERPRIORITYF_BEGIN := 65536

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERPRIORITYF_END := 131072

/**
 * @type {Integer (Int32)}
 */
export global ACM_DRIVERPRIORITYF_DEFERMASK := 196608

/**
 * @type {Integer (UInt32)}
 */
export global ACMDRIVERDETAILS_SHORTNAME_CHARS := 32

/**
 * @type {Integer (UInt32)}
 */
export global ACMDRIVERDETAILS_LONGNAME_CHARS := 128

/**
 * @type {Integer (UInt32)}
 */
export global ACMDRIVERDETAILS_COPYRIGHT_CHARS := 80

/**
 * @type {Integer (UInt32)}
 */
export global ACMDRIVERDETAILS_LICENSING_CHARS := 128

/**
 * @type {Integer (UInt32)}
 */
export global ACMDRIVERDETAILS_FEATURES_CHARS := 512

/**
 * @type {Integer (Int32)}
 */
export global ACMDRIVERDETAILS_SUPPORTF_CODEC := 1

/**
 * @type {Integer (Int32)}
 */
export global ACMDRIVERDETAILS_SUPPORTF_CONVERTER := 2

/**
 * @type {Integer (Int32)}
 */
export global ACMDRIVERDETAILS_SUPPORTF_FILTER := 4

/**
 * @type {Integer (Int32)}
 */
export global ACMDRIVERDETAILS_SUPPORTF_HARDWARE := 8

/**
 * @type {Integer (Int32)}
 */
export global ACMDRIVERDETAILS_SUPPORTF_ASYNC := 16

/**
 * @type {Integer (Int32)}
 */
export global ACMDRIVERDETAILS_SUPPORTF_LOCAL := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global ACMDRIVERDETAILS_SUPPORTF_DISABLED := -2147483648

/**
 * @type {Integer (UInt32)}
 */
export global ACMFORMATTAGDETAILS_FORMATTAG_CHARS := 48

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATTAGDETAILSF_INDEX := 0

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATTAGDETAILSF_FORMATTAG := 1

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATTAGDETAILSF_LARGESTSIZE := 2

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATTAGDETAILSF_QUERYMASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global ACMFORMATDETAILS_FORMAT_CHARS := 128

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATDETAILSF_INDEX := 0

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATDETAILSF_FORMAT := 1

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATDETAILSF_QUERYMASK := 15

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATENUMF_WFORMATTAG := 65536

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATENUMF_NCHANNELS := 131072

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATENUMF_NSAMPLESPERSEC := 262144

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATENUMF_WBITSPERSAMPLE := 524288

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATENUMF_CONVERT := 1048576

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATENUMF_SUGGEST := 2097152

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATENUMF_HARDWARE := 4194304

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATENUMF_INPUT := 8388608

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATENUMF_OUTPUT := 16777216

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATSUGGESTF_WFORMATTAG := 65536

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATSUGGESTF_NCHANNELS := 131072

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATSUGGESTF_NSAMPLESPERSEC := 262144

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATSUGGESTF_WBITSPERSAMPLE := 524288

/**
 * @type {Integer (Int32)}
 */
export global ACM_FORMATSUGGESTF_TYPEMASK := 16711680

/**
 * @type {String}
 */
export global ACMHELPMSGSTRINGA := "acmchoose_help"

/**
 * @type {String}
 */
export global ACMHELPMSGSTRINGW := "acmchoose_help"

/**
 * @type {String}
 */
export global ACMHELPMSGCONTEXTMENUA := "acmchoose_contextmenu"

/**
 * @type {String}
 */
export global ACMHELPMSGCONTEXTMENUW := "acmchoose_contextmenu"

/**
 * @type {String}
 */
export global ACMHELPMSGCONTEXTHELPA := "acmchoose_contexthelp"

/**
 * @type {String}
 */
export global ACMHELPMSGCONTEXTHELPW := "acmchoose_contexthelp"

/**
 * @type {String}
 */
export global ACMHELPMSGSTRING := "acmchoose_help"

/**
 * @type {String}
 */
export global ACMHELPMSGCONTEXTMENU := "acmchoose_contextmenu"

/**
 * @type {String}
 */
export global ACMHELPMSGCONTEXTHELP := "acmchoose_contexthelp"

/**
 * @type {Integer (UInt32)}
 */
export global MM_ACM_FORMATCHOOSE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FORMATCHOOSE_MESSAGE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FORMATCHOOSE_FORMATTAG_VERIFY := 0

/**
 * @type {Integer (UInt32)}
 */
export global FORMATCHOOSE_FORMAT_VERIFY := 1

/**
 * @type {Integer (UInt32)}
 */
export global FORMATCHOOSE_CUSTOM_VERIFY := 2

/**
 * @type {Integer (Int32)}
 */
export global ACMFORMATCHOOSE_STYLEF_SHOWHELP := 4

/**
 * @type {Integer (Int32)}
 */
export global ACMFORMATCHOOSE_STYLEF_ENABLEHOOK := 8

/**
 * @type {Integer (Int32)}
 */
export global ACMFORMATCHOOSE_STYLEF_ENABLETEMPLATE := 16

/**
 * @type {Integer (Int32)}
 */
export global ACMFORMATCHOOSE_STYLEF_ENABLETEMPLATEHANDLE := 32

/**
 * @type {Integer (Int32)}
 */
export global ACMFORMATCHOOSE_STYLEF_INITTOWFXSTRUCT := 64

/**
 * @type {Integer (Int32)}
 */
export global ACMFORMATCHOOSE_STYLEF_CONTEXTHELP := 128

/**
 * @type {Integer (UInt32)}
 */
export global ACMFILTERTAGDETAILS_FILTERTAG_CHARS := 48

/**
 * @type {Integer (Int32)}
 */
export global ACM_FILTERTAGDETAILSF_INDEX := 0

/**
 * @type {Integer (Int32)}
 */
export global ACM_FILTERTAGDETAILSF_FILTERTAG := 1

/**
 * @type {Integer (Int32)}
 */
export global ACM_FILTERTAGDETAILSF_LARGESTSIZE := 2

/**
 * @type {Integer (Int32)}
 */
export global ACM_FILTERTAGDETAILSF_QUERYMASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global ACMFILTERDETAILS_FILTER_CHARS := 128

/**
 * @type {Integer (Int32)}
 */
export global ACM_FILTERDETAILSF_INDEX := 0

/**
 * @type {Integer (Int32)}
 */
export global ACM_FILTERDETAILSF_FILTER := 1

/**
 * @type {Integer (Int32)}
 */
export global ACM_FILTERDETAILSF_QUERYMASK := 15

/**
 * @type {Integer (Int32)}
 */
export global ACM_FILTERENUMF_DWFILTERTAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global MM_ACM_FILTERCHOOSE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FILTERCHOOSE_MESSAGE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILTERCHOOSE_FILTERTAG_VERIFY := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILTERCHOOSE_FILTER_VERIFY := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILTERCHOOSE_CUSTOM_VERIFY := 2

/**
 * @type {Integer (Int32)}
 */
export global ACMFILTERCHOOSE_STYLEF_SHOWHELP := 4

/**
 * @type {Integer (Int32)}
 */
export global ACMFILTERCHOOSE_STYLEF_ENABLEHOOK := 8

/**
 * @type {Integer (Int32)}
 */
export global ACMFILTERCHOOSE_STYLEF_ENABLETEMPLATE := 16

/**
 * @type {Integer (Int32)}
 */
export global ACMFILTERCHOOSE_STYLEF_ENABLETEMPLATEHANDLE := 32

/**
 * @type {Integer (Int32)}
 */
export global ACMFILTERCHOOSE_STYLEF_INITTOFILTERSTRUCT := 64

/**
 * @type {Integer (Int32)}
 */
export global ACMFILTERCHOOSE_STYLEF_CONTEXTHELP := 128

/**
 * @type {Integer (Int32)}
 */
export global ACMSTREAMHEADER_STATUSF_DONE := 65536

/**
 * @type {Integer (Int32)}
 */
export global ACMSTREAMHEADER_STATUSF_PREPARED := 131072

/**
 * @type {Integer (Int32)}
 */
export global ACMSTREAMHEADER_STATUSF_INQUEUE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global ACM_STREAMOPENF_QUERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACM_STREAMOPENF_ASYNC := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACM_STREAMOPENF_NONREALTIME := 4

/**
 * @type {Integer (Int32)}
 */
export global ACM_STREAMSIZEF_SOURCE := 0

/**
 * @type {Integer (Int32)}
 */
export global ACM_STREAMSIZEF_DESTINATION := 1

/**
 * @type {Integer (Int32)}
 */
export global ACM_STREAMSIZEF_QUERYMASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global ACM_STREAMCONVERTF_BLOCKALIGN := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACM_STREAMCONVERTF_START := 16

/**
 * @type {Integer (UInt32)}
 */
export global ACM_STREAMCONVERTF_END := 32

/**
 * @type {Integer (Int32)}
 */
export global SND_RING := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SND_ALIAS_START := 0

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_DRIVER_NOTIFY := 24577

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_DRIVER_DETAILS := 24586

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_HARDWARE_WAVE_CAPS_INPUT := 24596

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_HARDWARE_WAVE_CAPS_OUTPUT := 24597

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_FORMATTAG_DETAILS := 24601

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_FORMAT_DETAILS := 24602

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_FORMAT_SUGGEST := 24603

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_FILTERTAG_DETAILS := 24626

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_FILTER_DETAILS := 24627

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_STREAM_OPEN := 24652

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_STREAM_CLOSE := 24653

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_STREAM_SIZE := 24654

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_STREAM_CONVERT := 24655

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_STREAM_RESET := 24656

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_STREAM_PREPARE := 24657

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_STREAM_UNPREPARE := 24658

/**
 * @type {Integer (UInt32)}
 */
export global ACMDM_STREAM_UPDATE := 24659
;@endregion Constants
