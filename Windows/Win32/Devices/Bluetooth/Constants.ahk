#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MAJORVERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MINORVERSION := 1

/**
 * @type {Guid}
 */
export global GUID_BTHPORT_DEVICE_INTERFACE := Guid("{0850302a-b344-4fda-9be9-90576b8d46f0}")

/**
 * @type {Guid}
 */
export global GUID_BTH_RFCOMM_SERVICE_DEVICE_INTERFACE := Guid("{b142fc3e-fa4e-460b-8abc-072b628b3c70}")

/**
 * @type {Guid}
 */
export global GUID_BLUETOOTH_RADIO_IN_RANGE := Guid("{ea3b5b82-26ee-450e-b0d8-d26fe30a3869}")

/**
 * @type {Guid}
 */
export global GUID_BLUETOOTH_RADIO_OUT_OF_RANGE := Guid("{e28867c9-c2aa-4ced-b969-4570866037c4}")

/**
 * @type {Guid}
 */
export global GUID_BLUETOOTH_L2CAP_EVENT := Guid("{7eae4030-b709-4aa8-ac55-e953829c9daa}")

/**
 * @type {Guid}
 */
export global GUID_BLUETOOTH_HCI_EVENT := Guid("{fc240062-1541-49be-b463-84c4dcd7bf7f}")

/**
 * @type {Guid}
 */
export global GUID_BLUETOOTH_AUTHENTICATION_REQUEST := Guid("{5dc9136d-996c-46db-84f5-32c0a3f47352}")

/**
 * @type {Guid}
 */
export global GUID_BLUETOOTH_KEYPRESS_EVENT := Guid("{d668dfcd-0f4e-4efc-bfe0-392eeec5109c}")

/**
 * @type {Guid}
 */
export global GUID_BLUETOOTH_HCI_VENDOR_EVENT := Guid("{547247e6-45bb-4c33-af8c-c00efe15a71d}")

/**
 * @type {Guid}
 */
export global Bluetooth_Base_UUID := Guid("{00000000-0000-1000-8000-00805f9b34fb}")

/**
 * @type {Integer (UInt32)}
 */
export global SDP_PROTOCOL_UUID16 := 1

/**
 * @type {Integer (UInt32)}
 */
export global UDP_PROTOCOL_UUID16 := 2

/**
 * @type {Integer (UInt32)}
 */
export global RFCOMM_PROTOCOL_UUID16 := 3

/**
 * @type {Integer (UInt32)}
 */
export global TCP_PROTOCOL_UUID16 := 4

/**
 * @type {Integer (UInt32)}
 */
export global TCSBIN_PROTOCOL_UUID16 := 5

/**
 * @type {Integer (UInt32)}
 */
export global TCSAT_PROTOCOL_UUID16 := 6

/**
 * @type {Integer (UInt32)}
 */
export global ATT_PROTOCOL_UUID16 := 7

/**
 * @type {Integer (UInt32)}
 */
export global OBEX_PROTOCOL_UUID16 := 8

/**
 * @type {Integer (UInt32)}
 */
export global IP_PROTOCOL_UUID16 := 9

/**
 * @type {Integer (UInt32)}
 */
export global FTP_PROTOCOL_UUID16 := 10

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_PROTOCOL_UUID16 := 12

/**
 * @type {Integer (UInt32)}
 */
export global WSP_PROTOCOL_UUID16 := 14

/**
 * @type {Integer (UInt32)}
 */
export global BNEP_PROTOCOL_UUID16 := 15

/**
 * @type {Integer (UInt32)}
 */
export global UPNP_PROTOCOL_UUID16 := 16

/**
 * @type {Integer (UInt32)}
 */
export global HID_PROTOCOL_UUID16 := 17

/**
 * @type {Integer (UInt32)}
 */
export global HCCC_PROTOCOL_UUID16 := 18

/**
 * @type {Integer (UInt32)}
 */
export global HCDC_PROTOCOL_UUID16 := 20

/**
 * @type {Integer (UInt32)}
 */
export global HCN_PROTOCOL_UUID16 := 22

/**
 * @type {Integer (UInt32)}
 */
export global AVCTP_PROTOCOL_UUID16 := 23

/**
 * @type {Integer (UInt32)}
 */
export global AVDTP_PROTOCOL_UUID16 := 25

/**
 * @type {Integer (UInt32)}
 */
export global CMPT_PROTOCOL_UUID16 := 27

/**
 * @type {Integer (UInt32)}
 */
export global UDI_C_PLANE_PROTOCOL_UUID16 := 29

/**
 * @type {Integer (UInt32)}
 */
export global L2CAP_PROTOCOL_UUID16 := 256

/**
 * @type {Integer (UInt32)}
 */
export global ServiceDiscoveryServerServiceClassID_UUID16 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global BrowseGroupDescriptorServiceClassID_UUID16 := 4097

/**
 * @type {Integer (UInt32)}
 */
export global PublicBrowseGroupServiceClassID_UUID16 := 4098

/**
 * @type {Integer (UInt32)}
 */
export global SerialPortServiceClassID_UUID16 := 4353

/**
 * @type {Integer (UInt32)}
 */
export global LANAccessUsingPPPServiceClassID_UUID16 := 4354

/**
 * @type {Integer (UInt32)}
 */
export global DialupNetworkingServiceClassID_UUID16 := 4355

/**
 * @type {Integer (UInt32)}
 */
export global IrMCSyncServiceClassID_UUID16 := 4356

/**
 * @type {Integer (UInt32)}
 */
export global OBEXObjectPushServiceClassID_UUID16 := 4357

/**
 * @type {Integer (UInt32)}
 */
export global OBEXFileTransferServiceClassID_UUID16 := 4358

/**
 * @type {Integer (UInt32)}
 */
export global IrMcSyncCommandServiceClassID_UUID16 := 4359

/**
 * @type {Integer (UInt32)}
 */
export global HeadsetServiceClassID_UUID16 := 4360

/**
 * @type {Integer (UInt32)}
 */
export global CordlessTelephonyServiceClassID_UUID16 := 4361

/**
 * @type {Integer (UInt32)}
 */
export global AudioSourceServiceClassID_UUID16 := 4362

/**
 * @type {Integer (UInt32)}
 */
export global AudioSinkServiceClassID_UUID16 := 4363

/**
 * @type {Integer (UInt32)}
 */
export global AVRemoteControlTargetServiceClassID_UUID16 := 4364

/**
 * @type {Integer (UInt32)}
 */
export global AVRemoteControlServiceClassID_UUID16 := 4366

/**
 * @type {Integer (UInt32)}
 */
export global AVRemoteControlControllerServiceClass_UUID16 := 4367

/**
 * @type {Integer (UInt32)}
 */
export global IntercomServiceClassID_UUID16 := 4368

/**
 * @type {Integer (UInt32)}
 */
export global FaxServiceClassID_UUID16 := 4369

/**
 * @type {Integer (UInt32)}
 */
export global HeadsetAudioGatewayServiceClassID_UUID16 := 4370

/**
 * @type {Integer (UInt32)}
 */
export global WAPServiceClassID_UUID16 := 4371

/**
 * @type {Integer (UInt32)}
 */
export global WAPClientServiceClassID_UUID16 := 4372

/**
 * @type {Integer (UInt32)}
 */
export global PANUServiceClassID_UUID16 := 4373

/**
 * @type {Integer (UInt32)}
 */
export global NAPServiceClassID_UUID16 := 4374

/**
 * @type {Integer (UInt32)}
 */
export global GNServiceClassID_UUID16 := 4375

/**
 * @type {Integer (UInt32)}
 */
export global DirectPrintingServiceClassID_UUID16 := 4376

/**
 * @type {Integer (UInt32)}
 */
export global ReferencePrintingServiceClassID_UUID16 := 4377

/**
 * @type {Integer (UInt32)}
 */
export global ImagingResponderServiceClassID_UUID16 := 4379

/**
 * @type {Integer (UInt32)}
 */
export global ImagingAutomaticArchiveServiceClassID_UUID16 := 4380

/**
 * @type {Integer (UInt32)}
 */
export global ImagingReferenceObjectsServiceClassID_UUID16 := 4381

/**
 * @type {Integer (UInt32)}
 */
export global HandsfreeServiceClassID_UUID16 := 4382

/**
 * @type {Integer (UInt32)}
 */
export global HandsfreeAudioGatewayServiceClassID_UUID16 := 4383

/**
 * @type {Integer (UInt32)}
 */
export global DirectPrintingReferenceObjectsServiceClassID_UUID16 := 4384

/**
 * @type {Integer (UInt32)}
 */
export global ReflectsUIServiceClassID_UUID16 := 4385

/**
 * @type {Integer (UInt32)}
 */
export global PrintingStatusServiceClassID_UUID16 := 4387

/**
 * @type {Integer (UInt32)}
 */
export global HumanInterfaceDeviceServiceClassID_UUID16 := 4388

/**
 * @type {Integer (UInt32)}
 */
export global HCRPrintServiceClassID_UUID16 := 4390

/**
 * @type {Integer (UInt32)}
 */
export global HCRScanServiceClassID_UUID16 := 4391

/**
 * @type {Integer (UInt32)}
 */
export global CommonISDNAccessServiceClassID_UUID16 := 4392

/**
 * @type {Integer (UInt32)}
 */
export global VideoConferencingGWServiceClassID_UUID16 := 4393

/**
 * @type {Integer (UInt32)}
 */
export global UDIMTServiceClassID_UUID16 := 4394

/**
 * @type {Integer (UInt32)}
 */
export global UDITAServiceClassID_UUID16 := 4395

/**
 * @type {Integer (UInt32)}
 */
export global AudioVideoServiceClassID_UUID16 := 4396

/**
 * @type {Integer (UInt32)}
 */
export global SimAccessServiceClassID_UUID16 := 4397

/**
 * @type {Integer (UInt32)}
 */
export global PhonebookAccessPceServiceClassID_UUID16 := 4398

/**
 * @type {Integer (UInt32)}
 */
export global PhonebookAccessPseServiceClassID_UUID16 := 4399

/**
 * @type {Integer (UInt32)}
 */
export global HeadsetHSServiceClassID_UUID16 := 4401

/**
 * @type {Integer (UInt32)}
 */
export global MessageAccessServerServiceClassID_UUID16 := 4402

/**
 * @type {Integer (UInt32)}
 */
export global MessageNotificationServerServiceClassID_UUID16 := 4403

/**
 * @type {Integer (UInt32)}
 */
export global GNSSServerServiceClassID_UUID16 := 4406

/**
 * @type {Integer (UInt32)}
 */
export global ThreeDimensionalDisplayServiceClassID_UUID16 := 4407

/**
 * @type {Integer (UInt32)}
 */
export global ThreeDimensionalGlassesServiceClassID_UUID16 := 4408

/**
 * @type {Integer (UInt32)}
 */
export global MPSServiceClassID_UUID16 := 4411

/**
 * @type {Integer (UInt32)}
 */
export global CTNAccessServiceClassID_UUID16 := 4412

/**
 * @type {Integer (UInt32)}
 */
export global CTNNotificationServiceClassID_UUID16 := 4413

/**
 * @type {Integer (UInt32)}
 */
export global PnPInformationServiceClassID_UUID16 := 4608

/**
 * @type {Integer (UInt32)}
 */
export global GenericNetworkingServiceClassID_UUID16 := 4609

/**
 * @type {Integer (UInt32)}
 */
export global GenericFileTransferServiceClassID_UUID16 := 4610

/**
 * @type {Integer (UInt32)}
 */
export global GenericAudioServiceClassID_UUID16 := 4611

/**
 * @type {Integer (UInt32)}
 */
export global GenericTelephonyServiceClassID_UUID16 := 4612

/**
 * @type {Integer (UInt32)}
 */
export global UPnpServiceClassID_UUID16 := 4613

/**
 * @type {Integer (UInt32)}
 */
export global UPnpIpServiceClassID_UUID16 := 4614

/**
 * @type {Integer (UInt32)}
 */
export global ESdpUpnpIpPanServiceClassID_UUID16 := 4864

/**
 * @type {Integer (UInt32)}
 */
export global ESdpUpnpIpLapServiceClassID_UUID16 := 4865

/**
 * @type {Integer (UInt32)}
 */
export global ESdpUpnpL2capServiceClassID_UUID16 := 4866

/**
 * @type {Integer (UInt32)}
 */
export global VideoSourceServiceClassID_UUID16 := 4867

/**
 * @type {Integer (UInt32)}
 */
export global VideoSinkServiceClassID_UUID16 := 4868

/**
 * @type {Integer (UInt32)}
 */
export global HealthDeviceProfileSourceServiceClassID_UUID16 := 5121

/**
 * @type {Integer (UInt32)}
 */
export global HealthDeviceProfileSinkServiceClassID_UUID16 := 5122

/**
 * @type {Integer (UInt32)}
 */
export global AdvancedAudioDistributionProfileID_UUID16 := 4365

/**
 * @type {Integer (UInt32)}
 */
export global ImagingServiceProfileID_UUID16 := 4378

/**
 * @type {Integer (UInt32)}
 */
export global BasicPrintingProfileID_UUID16 := 4386

/**
 * @type {Integer (UInt32)}
 */
export global HardcopyCableReplacementProfileID_UUID16 := 4389

/**
 * @type {Integer (UInt32)}
 */
export global PhonebookAccessProfileID_UUID16 := 4400

/**
 * @type {Integer (UInt32)}
 */
export global MessageAccessProfileID_UUID16 := 4404

/**
 * @type {Integer (UInt32)}
 */
export global GNSSProfileID_UUID16 := 4405

/**
 * @type {Integer (UInt32)}
 */
export global ThreeDimensionalSynchronizationProfileID_UUID16 := 4409

/**
 * @type {Integer (UInt32)}
 */
export global MPSProfileID_UUID16 := 4410

/**
 * @type {Integer (UInt32)}
 */
export global CTNProfileID_UUID16 := 4414

/**
 * @type {Integer (UInt32)}
 */
export global VideoDistributionProfileID_UUID16 := 4869

/**
 * @type {Integer (UInt32)}
 */
export global HealthDeviceProfileID_UUID16 := 5120

/**
 * @type {Integer (UInt32)}
 */
export global VideoConferencingServiceClassID_UUID16 := 4367

/**
 * @type {Integer (UInt32)}
 */
export global CommonISDNAccessServiceClass_UUID16 := 4392

/**
 * @type {Integer (UInt32)}
 */
export global VideoConferencingGWServiceClass_UUID16 := 4393

/**
 * @type {Integer (UInt32)}
 */
export global UDIMTServiceClass_UUID16 := 4394

/**
 * @type {Integer (UInt32)}
 */
export global UDITAServiceClass_UUID16 := 4395

/**
 * @type {Integer (UInt32)}
 */
export global AudioVideoServiceClass_UUID16 := 4396

/**
 * @type {Integer (UInt32)}
 */
export global CordlessServiceClassID_UUID16 := 4361

/**
 * @type {Integer (UInt32)}
 */
export global AudioSinkSourceServiceClassID_UUID16 := 4363

/**
 * @type {Integer (UInt32)}
 */
export global AdvancedAudioDistributionServiceClassID_UUID16 := 4365

/**
 * @type {Integer (UInt32)}
 */
export global ImagingServiceClassID_UUID16 := 4378

/**
 * @type {Integer (UInt32)}
 */
export global BasicPrintingServiceClassID_UUID16 := 4386

/**
 * @type {Integer (UInt32)}
 */
export global HardcopyCableReplacementServiceClassID_UUID16 := 4389

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MAX_NAME_SIZE := 248

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MAX_PIN_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LINK_KEY_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_ERICSSON := 0

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_NOKIA := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_INTEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_IBM := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_TOSHIBA := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_3COM := 5

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_MICROSOFT := 6

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_LUCENT := 7

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_MOTOROLA := 8

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_INFINEON := 9

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_CSR := 10

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_SILICONWAVE := 11

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_DIGIANSWER := 12

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_TI := 13

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_PARTHUS := 14

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_BROADCOM := 15

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_MITEL := 16

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_WIDCOMM := 17

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_ZEEVO := 18

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_ATMEL := 19

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_MITSIBUSHI := 20

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_RTX_TELECOM := 21

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_KC_TECHNOLOGY := 22

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_NEWLOGIC := 23

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_TRANSILICA := 24

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_ROHDE_SCHWARZ := 25

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_TTPCOM := 26

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_SIGNIA := 27

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_CONEXANT := 28

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_QUALCOMM := 29

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_INVENTEL := 30

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_AVM_BERLIN := 31

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_BANDSPEED := 32

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_MANSELLA := 33

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_NEC := 34

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_WAVEPLUS_TECHNOLOGY_CO := 35

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_ALCATEL := 36

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_PHILIPS_SEMICONDUCTOR := 37

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_C_TECHNOLOGIES := 38

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_OPEN_INTERFACE := 39

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_RF_MICRO_DEVICES := 40

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_HITACHI := 41

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_SYMBOL_TECHNOLOGIES := 42

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_TENOVIS := 43

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_MACRONIX_INTERNATIONAL := 44

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_MARVELL := 72

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_APPLE := 76

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_NORDIC_SEMICONDUCTORS_ASA := 89

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_ARUBA_NETWORKS := 283

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MFG_INTERNAL_USE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global SAP_BIT_OFFSET := 0

/**
 * @type {Integer (UInt32)}
 */
export global COD_FORMAT_BIT_OFFSET := 0

/**
 * @type {Integer (UInt32)}
 */
export global COD_MINOR_BIT_OFFSET := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_FORMAT_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global COD_MINOR_MASK := 252

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_MASK := 7936

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_MASK := 16769024

/**
 * @type {Integer (UInt32)}
 */
export global COD_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_LIMITED := 1

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_LE_AUDIO := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_POSITIONING := 8

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_NETWORKING := 16

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_RENDERING := 32

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_CAPTURING := 64

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_OBJECT_XFER := 128

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_AUDIO := 256

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_TELEPHONY := 512

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_INFORMATION := 1024

/**
 * @type {Integer (UInt32)}
 */
export global COD_SERVICE_MAX_COUNT := 10

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_MISCELLANEOUS := 0

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_COMPUTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_PHONE := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_LAN_ACCESS := 3

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_AUDIO := 4

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_PERIPHERAL := 5

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_IMAGING := 6

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_WEARABLE := 7

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_TOY := 8

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_HEALTH := 9

/**
 * @type {Integer (UInt32)}
 */
export global COD_MAJOR_UNCLASSIFIED := 31

/**
 * @type {Integer (UInt32)}
 */
export global COD_COMPUTER_MINOR_UNCLASSIFIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global COD_COMPUTER_MINOR_DESKTOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global COD_COMPUTER_MINOR_SERVER := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_COMPUTER_MINOR_LAPTOP := 3

/**
 * @type {Integer (UInt32)}
 */
export global COD_COMPUTER_MINOR_HANDHELD := 4

/**
 * @type {Integer (UInt32)}
 */
export global COD_COMPUTER_MINOR_PALM := 5

/**
 * @type {Integer (UInt32)}
 */
export global COD_COMPUTER_MINOR_WEARABLE := 6

/**
 * @type {Integer (UInt32)}
 */
export global COD_PHONE_MINOR_UNCLASSIFIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global COD_PHONE_MINOR_CELLULAR := 1

/**
 * @type {Integer (UInt32)}
 */
export global COD_PHONE_MINOR_CORDLESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_PHONE_MINOR_SMART := 3

/**
 * @type {Integer (UInt32)}
 */
export global COD_PHONE_MINOR_WIRED_MODEM := 4

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_UNCLASSIFIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_HEADSET := 1

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_HANDS_FREE := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_HEADSET_HANDS_FREE := 3

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_MICROPHONE := 4

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_LOUDSPEAKER := 5

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_HEADPHONES := 6

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_PORTABLE_AUDIO := 7

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_CAR_AUDIO := 8

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_SET_TOP_BOX := 9

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_HIFI_AUDIO := 10

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_VCR := 11

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_VIDEO_CAMERA := 12

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_CAMCORDER := 13

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_VIDEO_MONITOR := 14

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_VIDEO_DISPLAY_LOUDSPEAKER := 15

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_VIDEO_DISPLAY_CONFERENCING := 16

/**
 * @type {Integer (UInt32)}
 */
export global COD_AUDIO_MINOR_GAMING_TOY := 18

/**
 * @type {Integer (UInt32)}
 */
export global COD_PERIPHERAL_MINOR_KEYBOARD_MASK := 16

/**
 * @type {Integer (UInt32)}
 */
export global COD_PERIPHERAL_MINOR_POINTER_MASK := 32

/**
 * @type {Integer (UInt32)}
 */
export global COD_PERIPHERAL_MINOR_NO_CATEGORY := 0

/**
 * @type {Integer (UInt32)}
 */
export global COD_PERIPHERAL_MINOR_JOYSTICK := 1

/**
 * @type {Integer (UInt32)}
 */
export global COD_PERIPHERAL_MINOR_GAMEPAD := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_PERIPHERAL_MINOR_REMOTE_CONTROL := 3

/**
 * @type {Integer (UInt32)}
 */
export global COD_PERIPHERAL_MINOR_SENSING := 4

/**
 * @type {Integer (UInt32)}
 */
export global COD_IMAGING_MINOR_DISPLAY_MASK := 4

/**
 * @type {Integer (UInt32)}
 */
export global COD_IMAGING_MINOR_CAMERA_MASK := 8

/**
 * @type {Integer (UInt32)}
 */
export global COD_IMAGING_MINOR_SCANNER_MASK := 16

/**
 * @type {Integer (UInt32)}
 */
export global COD_IMAGING_MINOR_PRINTER_MASK := 32

/**
 * @type {Integer (UInt32)}
 */
export global COD_WEARABLE_MINOR_WRIST_WATCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global COD_WEARABLE_MINOR_PAGER := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_WEARABLE_MINOR_JACKET := 3

/**
 * @type {Integer (UInt32)}
 */
export global COD_WEARABLE_MINOR_HELMET := 4

/**
 * @type {Integer (UInt32)}
 */
export global COD_WEARABLE_MINOR_GLASSES := 5

/**
 * @type {Integer (UInt32)}
 */
export global COD_TOY_MINOR_ROBOT := 1

/**
 * @type {Integer (UInt32)}
 */
export global COD_TOY_MINOR_VEHICLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_TOY_MINOR_DOLL_ACTION_FIGURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global COD_TOY_MINOR_CONTROLLER := 4

/**
 * @type {Integer (UInt32)}
 */
export global COD_TOY_MINOR_GAME := 5

/**
 * @type {Integer (UInt32)}
 */
export global COD_HEALTH_MINOR_BLOOD_PRESSURE_MONITOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global COD_HEALTH_MINOR_THERMOMETER := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_HEALTH_MINOR_WEIGHING_SCALE := 3

/**
 * @type {Integer (UInt32)}
 */
export global COD_HEALTH_MINOR_GLUCOSE_METER := 4

/**
 * @type {Integer (UInt32)}
 */
export global COD_HEALTH_MINOR_PULSE_OXIMETER := 5

/**
 * @type {Integer (UInt32)}
 */
export global COD_HEALTH_MINOR_HEART_PULSE_MONITOR := 6

/**
 * @type {Integer (UInt32)}
 */
export global COD_HEALTH_MINOR_HEALTH_DATA_DISPLAY := 7

/**
 * @type {Integer (UInt32)}
 */
export global COD_HEALTH_MINOR_STEP_COUNTER := 8

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_ACCESS_BIT_OFFSET := 5

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_MINOR_MASK := 28

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_ACCESS_MASK := 224

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_MINOR_UNCLASSIFIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_ACCESS_0_USED := 0

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_ACCESS_17_USED := 1

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_ACCESS_33_USED := 2

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_ACCESS_50_USED := 3

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_ACCESS_67_USED := 4

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_ACCESS_83_USED := 5

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_ACCESS_99_USED := 6

/**
 * @type {Integer (UInt32)}
 */
export global COD_LAN_ACCESS_FULL := 7

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_FLAGS_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_16_UUIDS_PARTIAL_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_16_UUIDS_COMPLETE_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_32_UUIDS_PARTIAL_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_32_UUIDS_COMPLETE_ID := 5

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_128_UUIDS_PARTIAL_ID := 6

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_128_UUIDS_COMPLETE_ID := 7

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_LOCAL_NAME_PARTIAL_ID := 8

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_LOCAL_NAME_COMPLETE_ID := 9

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_TX_POWER_LEVEL_ID := 10

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_OOB_OPT_DATA_LEN_ID := 11

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_OOB_BD_ADDR_ID := 12

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_OOB_COD_ID := 13

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_OOB_SP_HASH_ID := 14

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_OOB_SP_RANDOMIZER_ID := 15

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_MANUFACTURER_ID := 255

/**
 * @type {Integer (UInt32)}
 */
export global BTH_EIR_SIZE := 240

/**
 * @type {Integer (UInt32)}
 */
export global LAP_GIAC_VALUE := 10390323

/**
 * @type {Integer (UInt32)}
 */
export global LAP_LIAC_VALUE := 10390272

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ADDR_IAC_FIRST := 10390272

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ADDR_IAC_LAST := 10390335

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ADDR_LIAC := 10390272

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ADDR_GIAC := 10390323

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_UNKNOWN_HCI_COMMAND := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_NO_CONNECTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_HARDWARE_FAILURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_PAGE_TIMEOUT := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_AUTHENTICATION_FAILURE := 5

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_KEY_MISSING := 6

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_MEMORY_FULL := 7

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_CONNECTION_TIMEOUT := 8

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_MAX_NUMBER_OF_CONNECTIONS := 9

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_MAX_NUMBER_OF_SCO_CONNECTIONS := 10

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_ACL_CONNECTION_ALREADY_EXISTS := 11

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_COMMAND_DISALLOWED := 12

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_HOST_REJECTED_LIMITED_RESOURCES := 13

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_HOST_REJECTED_SECURITY_REASONS := 14

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_HOST_REJECTED_PERSONAL_DEVICE := 15

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_HOST_TIMEOUT := 16

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_UNSUPPORTED_FEATURE_OR_PARAMETER := 17

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_INVALID_HCI_PARAMETER := 18

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_REMOTE_USER_ENDED_CONNECTION := 19

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_REMOTE_LOW_RESOURCES := 20

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_REMOTE_POWERING_OFF := 21

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_LOCAL_HOST_TERMINATED_CONNECTION := 22

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_REPEATED_ATTEMPTS := 23

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_PAIRING_NOT_ALLOWED := 24

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_UKNOWN_LMP_PDU := 25

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_UNSUPPORTED_REMOTE_FEATURE := 26

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_SCO_OFFSET_REJECTED := 27

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_SCO_INTERVAL_REJECTED := 28

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_SCO_AIRMODE_REJECTED := 29

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_INVALID_LMP_PARAMETERS := 30

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_UNSPECIFIED_ERROR := 31

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_UNSUPPORTED_LMP_PARM_VALUE := 32

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_ROLE_CHANGE_NOT_ALLOWED := 33

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_LMP_RESPONSE_TIMEOUT := 34

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_LMP_TRANSACTION_COLLISION := 35

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_LMP_PDU_NOT_ALLOWED := 36

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_ENCRYPTION_MODE_NOT_ACCEPTABLE := 37

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_UNIT_KEY_NOT_USED := 38

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_QOS_IS_NOT_SUPPORTED := 39

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_INSTANT_PASSED := 40

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_PAIRING_WITH_UNIT_KEY_NOT_SUPPORTED := 41

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_DIFFERENT_TRANSACTION_COLLISION := 42

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_QOS_UNACCEPTABLE_PARAMETER := 44

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_QOS_REJECTED := 45

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_CHANNEL_CLASSIFICATION_NOT_SUPPORTED := 46

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_INSUFFICIENT_SECURITY := 47

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_PARAMETER_OUT_OF_MANDATORY_RANGE := 48

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_ROLE_SWITCH_PENDING := 50

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_RESERVED_SLOT_VIOLATION := 52

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_ROLE_SWITCH_FAILED := 53

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_EXTENDED_INQUIRY_RESPONSE_TOO_LARGE := 54

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_SECURE_SIMPLE_PAIRING_NOT_SUPPORTED_BY_HOST := 55

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_HOST_BUSY_PAIRING := 56

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_CONNECTION_REJECTED_DUE_TO_NO_SUITABLE_CHANNEL_FOUND := 57

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_CONTROLLER_BUSY := 58

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_UNACCEPTABLE_CONNECTION_INTERVAL := 59

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_DIRECTED_ADVERTISING_TIMEOUT := 60

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_CONNECTION_TERMINATED_DUE_TO_MIC_FAILURE := 61

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_CONNECTION_FAILED_TO_BE_ESTABLISHED := 62

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_MAC_CONNECTION_FAILED := 63

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_COARSE_CLOCK_ADJUSTMENT_REJECTED := 64

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_TYPE_0_SUBMAP_NOT_DEFINED := 65

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_UNKNOWN_ADVERTISING_IDENTIFIER := 66

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_LIMIT_REACHED := 67

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_OPERATION_CANCELLED_BY_HOST := 68

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_PACKET_TOO_LONG := 69

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ERROR_UNSPECIFIED := 255

/**
 * @type {Integer (UInt32)}
 */
export global L2CAP_MIN_MTU := 48

/**
 * @type {Integer (UInt32)}
 */
export global L2CAP_MAX_MTU := 65535

/**
 * @type {Integer (UInt32)}
 */
export global L2CAP_DEFAULT_MTU := 672

/**
 * @type {Integer (UInt32)}
 */
export global MAX_L2CAP_PING_DATA_LENGTH := 44

/**
 * @type {Integer (UInt32)}
 */
export global MAX_L2CAP_INFO_DATA_LENGTH := 44

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_ADDRESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_COD := 2

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_NAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_PAIRED := 8

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_PERSONAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_CONNECTED := 32

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_SHORT_NAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_VISIBLE := 128

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_SSP_SUPPORTED := 256

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_SSP_PAIRED := 512

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_SSP_MITM_PROTECTED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_RSSI := 4096

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_EIR := 8192

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_BR := 16384

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_PAIRED := 65536

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_PERSONAL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_MITM_PROTECTED := 262144

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_PRIVACY_ENABLED := 524288

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_RANDOM_ADDRESS_TYPE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_DISCOVERABLE := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_NAME := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_VISIBLE := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_CONNECTED := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_CONNECTABLE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_BR_SECURE_CONNECTION_PAIRED := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_SECURE_CONNECTION_PAIRED := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_DEBUGKEY := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_LE_DEBUGKEY := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global BDIF_TX_POWER := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global HCI_CONNECTION_TYPE_ACL := 1

/**
 * @type {Integer (UInt32)}
 */
export global HCI_CONNECTION_TYPE_SCO := 2

/**
 * @type {Integer (UInt32)}
 */
export global HCI_CONNECTION_TYPE_LE := 3

/**
 * @type {Integer (UInt32)}
 */
export global HCI_CONNNECTION_TYPE_ACL := 1

/**
 * @type {Integer (UInt32)}
 */
export global HCI_CONNNECTION_TYPE_SCO := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_MAX_SERVICE_NAME_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_UUIDS_IN_QUERY := 12

/**
 * @type {Integer (UInt32)}
 */
export global BTH_VID_DEFAULT_VALUE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ERROR_INVALID_SDP_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ERROR_INVALID_RECORD_HANDLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ERROR_INVALID_REQUEST_SYNTAX := 3

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ERROR_INVALID_PDU_SIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ERROR_INVALID_CONTINUATION_STATE := 5

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ERROR_INSUFFICIENT_RESOURCES := 6

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_RECORD_HANDLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_CLASS_ID_LIST := 1

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_RECORD_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_SERVICE_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_PROTOCOL_DESCRIPTOR_LIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_BROWSE_GROUP_LIST := 5

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_LANG_BASE_ATTRIB_ID_LIST := 6

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_INFO_TIME_TO_LIVE := 7

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_AVAILABILITY := 8

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_PROFILE_DESCRIPTOR_LIST := 9

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_DOCUMENTATION_URL := 10

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_CLIENT_EXECUTABLE_URL := 11

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_ICON_URL := 12

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_ADDITIONAL_PROTOCOL_DESCRIPTOR_LIST := 13

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_PROFILE_SPECIFIC := 512

/**
 * @type {Integer (UInt32)}
 */
export global LANG_BASE_LANGUAGE_INDEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global LANG_BASE_ENCODING_INDEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global LANG_BASE_OFFSET_INDEX := 2

/**
 * @type {Integer (UInt32)}
 */
export global LANG_DEFAULT_ID := 256

/**
 * @type {Integer (UInt32)}
 */
export global LANGUAGE_EN_US := 25966

/**
 * @type {Integer (UInt32)}
 */
export global ENCODING_UTF_8 := 106

/**
 * @type {Integer (UInt32)}
 */
export global STRING_NAME_OFFSET := 0

/**
 * @type {Integer (UInt32)}
 */
export global STRING_DESCRIPTION_OFFSET := 1

/**
 * @type {Integer (UInt32)}
 */
export global STRING_PROVIDER_NAME_OFFSET := 2

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_SDP_VERSION_NUMBER_LIST := 512

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_SDP_DATABASE_STATE := 513

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_BROWSE_GROUP_ID := 512

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_CORDLESS_EXTERNAL_NETWORK := 769

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_FAX_CLASS_1_SUPPORT := 770

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_FAX_CLASS_2_0_SUPPORT := 771

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_FAX_CLASS_2_SUPPORT := 772

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_FAX_AUDIO_FEEDBACK_SUPPORT := 773

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HEADSET_REMOTE_AUDIO_VOLUME_CONTROL := 770

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_LAN_LPSUBNET := 512

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_OBJECT_PUSH_SUPPORTED_FORMATS_LIST := 771

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_SYNCH_SUPPORTED_DATA_STORES_LIST := 769

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_SERVICE_VERSION := 768

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_PAN_NETWORK_ADDRESS := 774

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_PAN_WAP_GATEWAY := 775

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_PAN_HOME_PAGE_URL := 776

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_PAN_WAP_STACK_TYPE := 777

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_PAN_SECURITY_DESCRIPTION := 778

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_PAN_NET_ACCESS_TYPE := 779

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_PAN_MAX_NET_ACCESS_RATE := 780

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_IMAGING_SUPPORTED_CAPABILITIES := 784

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_IMAGING_SUPPORTED_FEATURES := 785

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_IMAGING_SUPPORTED_FUNCTIONS := 786

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_IMAGING_TOTAL_DATA_CAPACITY := 787

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_DI_SPECIFICATION_ID := 512

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_DI_VENDOR_ID := 513

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_DI_PRODUCT_ID := 514

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_DI_VERSION := 515

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_DI_PRIMARY_RECORD := 516

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_DI_VENDOR_ID_SOURCE := 517

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_DEVICE_RELEASE_NUMBER := 512

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_PARSER_VERSION := 513

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_DEVICE_SUBCLASS := 514

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_COUNTRY_CODE := 515

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_VIRTUAL_CABLE := 516

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_RECONNECT_INITIATE := 517

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_DESCRIPTOR_LIST := 518

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_LANG_ID_BASE_LIST := 519

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_SDP_DISABLE := 520

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_BATTERY_POWER := 521

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_REMOTE_WAKE := 522

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_PROFILE_VERSION := 523

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_SUPERVISION_TIMEOUT := 524

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_NORMALLY_CONNECTABLE := 525

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_BOOT_DEVICE := 526

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_SSR_HOST_MAX_LATENCY := 527

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HID_SSR_HOST_MIN_TIMEOUT := 528

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_A2DP_SUPPORTED_FEATURES := 785

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_AVRCP_SUPPORTED_FEATURES := 785

/**
 * @type {Integer (UInt32)}
 */
export global SDP_ATTRIB_HFP_SUPPORTED_FEATURES := 785

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_CATEGORY_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_CATEGORY_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_CATEGORY_3 := 4

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_CATEGORY_4 := 8

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_CT_BROWSING := 64

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_CT_COVER_ART_IMAGE_PROPERTIES := 128

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_CT_COVER_ART_IMAGE := 256

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_CT_COVER_ART_LINKED_THUMBNAIL := 512

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_TG_PLAYER_APPLICATION_SETTINGS := 16

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_TG_GROUP_NAVIGATION := 32

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_TG_BROWSING := 64

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_TG_MULTIPLE_PLAYER_APPLICATIONS := 128

/**
 * @type {Integer (UInt32)}
 */
export global AVRCP_SUPPORTED_FEATURES_TG_COVER_ART := 256

/**
 * @type {Integer (UInt32)}
 */
export global A2DP_SINK_SUPPORTED_FEATURES_HEADPHONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global A2DP_SINK_SUPPORTED_FEATURES_SPEAKER := 2

/**
 * @type {Integer (UInt32)}
 */
export global A2DP_SINK_SUPPORTED_FEATURES_RECORDER := 4

/**
 * @type {Integer (UInt32)}
 */
export global A2DP_SINK_SUPPORTED_FEATURES_AMPLIFIER := 8

/**
 * @type {Integer (UInt32)}
 */
export global A2DP_SOURCE_SUPPORTED_FEATURES_PLAYER := 1

/**
 * @type {Integer (UInt32)}
 */
export global A2DP_SOURCE_SUPPORTED_FEATURES_MICROPHONE := 2

/**
 * @type {Integer (UInt32)}
 */
export global A2DP_SOURCE_SUPPORTED_FEATURES_TUNER := 4

/**
 * @type {Integer (UInt32)}
 */
export global A2DP_SOURCE_SUPPORTED_FEATURES_MIXER := 8

/**
 * @type {Integer (UInt32)}
 */
export global CORDLESS_EXTERNAL_NETWORK_PSTN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CORDLESS_EXTERNAL_NETWORK_ISDN := 2

/**
 * @type {Integer (UInt32)}
 */
export global CORDLESS_EXTERNAL_NETWORK_GSM := 3

/**
 * @type {Integer (UInt32)}
 */
export global CORDLESS_EXTERNAL_NETWORK_CDMA := 4

/**
 * @type {Integer (UInt32)}
 */
export global CORDLESS_EXTERNAL_NETWORK_ANALOG_CELLULAR := 5

/**
 * @type {Integer (UInt32)}
 */
export global CORDLESS_EXTERNAL_NETWORK_PACKET_SWITCHED := 6

/**
 * @type {Integer (UInt32)}
 */
export global CORDLESS_EXTERNAL_NETWORK_OTHER := 7

/**
 * @type {Integer (UInt32)}
 */
export global OBJECT_PUSH_FORMAT_VCARD_2_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global OBJECT_PUSH_FORMAT_VCARD_3_0 := 2

/**
 * @type {Integer (UInt32)}
 */
export global OBJECT_PUSH_FORMAT_VCAL_1_0 := 3

/**
 * @type {Integer (UInt32)}
 */
export global OBJECT_PUSH_FORMAT_ICAL_2_0 := 4

/**
 * @type {Integer (UInt32)}
 */
export global OBJECT_PUSH_FORMAT_VNOTE := 5

/**
 * @type {Integer (UInt32)}
 */
export global OBJECT_PUSH_FORMAT_VMESSAGE := 6

/**
 * @type {Integer (UInt32)}
 */
export global OBJECT_PUSH_FORMAT_ANY := 255

/**
 * @type {Integer (UInt32)}
 */
export global SYNCH_DATA_STORE_PHONEBOOK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNCH_DATA_STORE_CALENDAR := 3

/**
 * @type {Integer (UInt32)}
 */
export global SYNCH_DATA_STORE_NOTES := 5

/**
 * @type {Integer (UInt32)}
 */
export global SYNCH_DATA_STORE_MESSAGES := 6

/**
 * @type {Integer (UInt32)}
 */
export global DI_VENDOR_ID_SOURCE_BLUETOOTH_SIG := 1

/**
 * @type {Integer (UInt32)}
 */
export global DI_VENDOR_ID_SOURCE_USB_IF := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSM_SDP := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSM_RFCOMM := 3

/**
 * @type {Integer (UInt32)}
 */
export global PSM_TCS_BIN := 5

/**
 * @type {Integer (UInt32)}
 */
export global PSM_TCS_BIN_CORDLESS := 7

/**
 * @type {Integer (UInt32)}
 */
export global PSM_BNEP := 15

/**
 * @type {Integer (UInt32)}
 */
export global PSM_HID_CONTROL := 17

/**
 * @type {Integer (UInt32)}
 */
export global PSM_HID_INTERRUPT := 19

/**
 * @type {Integer (UInt32)}
 */
export global PSM_UPNP := 21

/**
 * @type {Integer (UInt32)}
 */
export global PSM_AVCTP := 23

/**
 * @type {Integer (UInt32)}
 */
export global PSM_AVDTP := 25

/**
 * @type {Integer (UInt32)}
 */
export global PSM_AVCTP_BROWSE := 27

/**
 * @type {Integer (UInt32)}
 */
export global PSM_UDI_C_PLANE := 29

/**
 * @type {Integer (UInt32)}
 */
export global PSM_ATT := 31

/**
 * @type {Integer (UInt32)}
 */
export global PSM_3DSP := 33

/**
 * @type {Integer (UInt32)}
 */
export global PSM_LE_IPSP := 35

/**
 * @type {String}
 */
export global STR_ADDR_FMTA := "(%02x:%02x:%02x:%02x:%02x:%02x)"

/**
 * @type {String}
 */
export global STR_ADDR_FMTW := "(%02x:%02x:%02x:%02x:%02x:%02x)"

/**
 * @type {String}
 */
export global STR_ADDR_SHORT_FMTA := "%04x%08x"

/**
 * @type {String}
 */
export global STR_ADDR_SHORT_FMTW := "%04x%08x"

/**
 * @type {String}
 */
export global STR_USBHCI_CLASS_HARDWAREIDA := "USB\Class_E0&SubClass_01&Prot_01"

/**
 * @type {String}
 */
export global STR_USBHCI_CLASS_HARDWAREIDW := "USB\Class_E0&SubClass_01&Prot_01"

/**
 * @type {String}
 */
export global STR_ADDR_FMT := "(%02x:%02x:%02x:%02x:%02x:%02x)"

/**
 * @type {String}
 */
export global STR_ADDR_SHORT_FMT := "%04x%08x"

/**
 * @type {String}
 */
export global STR_USBHCI_CLASS_HARDWAREID := "USB\Class_E0&SubClass_01&Prot_01"

/**
 * @type {Integer (UInt32)}
 */
export global BTH_IOCTL_BASE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SDP_CONNECT_CACHE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SDP_CONNECT_ALLOW_PIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global SDP_REQUEST_TO_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SDP_REQUEST_TO_MIN := 10

/**
 * @type {Integer (UInt32)}
 */
export global SDP_REQUEST_TO_MAX := 45

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_OPTION_DO_NOT_PUBLISH := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_OPTION_NO_PUBLIC_BROWSE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_OPTION_DO_NOT_PUBLISH_EIR := 8

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SECURITY_USE_DEFAULTS := 0

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SECURITY_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SECURITY_AUTHORIZE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SECURITY_AUTHENTICATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SECURITY_ENCRYPT_REQUIRED := 16

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SECURITY_ENCRYPT_OPTIONAL := 32

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SECURITY_DISABLED := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SECURITY_NO_ASK := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SDP_SEARCH_NO_PARSE_CHECK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SDP_SEARCH_NO_FORMAT_CHECK := 2

/**
 * @type {Integer (UInt64)}
 */
export global BTH_HOST_FEATURE_ENHANCED_RETRANSMISSION_MODE := 1

/**
 * @type {Integer (UInt64)}
 */
export global BTH_HOST_FEATURE_STREAMING_MODE := 2

/**
 * @type {Integer (UInt64)}
 */
export global BTH_HOST_FEATURE_LOW_ENERGY := 4

/**
 * @type {Integer (UInt64)}
 */
export global BTH_HOST_FEATURE_SCO_HCI := 8

/**
 * @type {Integer (UInt64)}
 */
export global BTH_HOST_FEATURE_SCO_HCIBYPASS := 16

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_MAX_NAME_SIZE := 248

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_MAX_PASSKEY_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_MAX_PASSKEY_BUFFER_SIZE := 17

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_MAX_SERVICE_NAME_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_DEVICE_NAME_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_SERVICE_DISABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_SERVICE_ENABLE := 1

/**
 * @type {Guid}
 */
export global GUID_BLUETOOTHLE_DEVICE_INTERFACE := Guid("{781aee18-7733-4ce4-add0-91f41c67b592}")

/**
 * @type {Guid}
 */
export global GUID_BLUETOOTH_GATT_SERVICE_DEVICE_INTERFACE := Guid("{6e3bb679-4372-40c8-9eaa-4509df260cd8}")

/**
 * @type {Guid}
 */
export global BTH_LE_ATT_BLUETOOTH_BASE_GUID := Guid("{00000000-0000-1000-8000-00805f9b34fb}")

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_SERVICE_GAP := 6144

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_SERVICE_GATT := 6145

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_ATTRIBUTE_TYPE_PRIMARY_SERVICE := 10240

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_ATTRIBUTE_TYPE_SECONDARY_SERVICE := 10241

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_ATTRIBUTE_TYPE_INCLUDE := 10242

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_ATTRIBUTE_TYPE_CHARACTERISTIC := 10243

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_EXTENDED_PROPERTIES := 10496

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_USER_DESCRIPTION := 10497

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_CLIENT_CONFIGURATION := 10498

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_SERVER_CONFIGURATION := 10499

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_FORMAT := 10500

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_AGGREGATE_FORMAT := 10501

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_TYPE_DEVICE_NAME := 10752

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_TYPE_APPEARANCE := 10753

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_TYPE_PERIPHERAL_PRIVACY_FLAG := 10754

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_TYPE_RECONNECTION_ADDRESS := 10755

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_TYPE_PERIPHERAL_PREFERED_CONNECTION_PARAMETER := 10756

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_CHARACTERISTIC_TYPE_SERVICE_CHANGED := 10757

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_OFFSET := 6

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_MASK := 1023

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_SUB_CATEGORY_MASK := 63

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_UNCATEGORIZED := 0

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_PHONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_COMPUTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_WATCH := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_CLOCK := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_DISPLAY := 5

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_REMOTE_CONTROL := 6

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_EYE_GLASSES := 7

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_TAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_KEYRING := 9

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_MEDIA_PLAYER := 10

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_BARCODE_SCANNER := 11

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_THERMOMETER := 12

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_HEART_RATE := 13

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_BLOOD_PRESSURE := 14

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_HID := 15

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_GLUCOSE_METER := 16

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_RUNNING_WALKING_SENSOR := 17

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_CYCLING := 18

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_CONTROL_DEVICE := 19

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_NETWORK_DEVICE := 20

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_SENSOR := 21

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_LIGHT_FIXTURES := 22

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_FAN := 23

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_HVAC := 24

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_AIR_CONDITIONING := 25

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_HUMIDIFIER := 26

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_HEATING := 27

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_ACCESS_CONTROL := 28

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_MOTORIZED_DEVICE := 29

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_POWER_DEVICE := 30

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_LIGHT_SOURCE := 31

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_WINDOW_COVERING := 32

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_AUDIO_SINK := 33

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_AUDIO_SOURCE := 34

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_MOTORIZED_VEHICLE := 35

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_DOMESTIC_APPLIANCE := 36

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_WEARABLE_AUDIO_DEVICE := 37

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_AIRCRAFT := 38

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_AV_EQUIPMENT := 39

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_DISPLAY_EQUIPMENT := 40

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_HEARING_AID := 41

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_GAMING := 42

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_SIGNAGE := 43

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_PLUSE_OXIMETER := 49

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_WEIGHT_SCALE := 50

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_PERSONAL_MOBILITY_DEVICE := 51

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_CONTINUOUS_GLUCOSE_MONITOR := 52

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_INSULIN_PUMP := 53

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_MEDICATION_DELIVERY := 54

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CATEGORY_OUTDOOR_SPORTS_ACTIVITY := 81

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_SUBCATEGORY_GENERIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_WATCH_SUBCATEGORY_SPORTS_WATCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_THERMOMETER_SUBCATEGORY_EAR := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HEART_RATE_SUBCATEGORY_HEART_RATE_BELT := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_BLOOD_PRESSURE_SUBCATEGORY_ARM := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_BLOOD_PRESSURE_SUBCATEGORY_WRIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_KEYBOARD := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_MOUSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_JOYSTICK := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_GAMEPAD := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_DIGITIZER_TABLET := 5

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_CARD_READER := 6

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_DIGITAL_PEN := 7

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_BARCODE_SCANNER := 8

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_TOUCHPAD := 9

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_PRESENTATION_REMOTE := 10

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_RUNNING_WALKING_SENSOR_SUBCATEGORY_IN_SHOE := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_RUNNING_WALKING_SENSOR_SUBCATEGORY_ON_SHOE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_RUNNING_WALKING_SENSOR_SUBCATEGORY_ON_HIP := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CYCLING_SUBCATEGORY_CYCLING_COMPUTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CYCLING_SUBCATEGORY_SPEED_SENSOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CYCLING_SUBCATEGORY_CADENCE_SENSOR := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CYCLING_SUBCATEGORY_POWER_SENSOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_CYCLING_SUBCATEGORY_SPEED_AND_CADENCE_SENSOR := 5

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SINK_SUBCATEGORY_STANDALONE_SPEAKER := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SINK_SUBCATEGORY_SOUNDBAR := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SINK_SUBCATEGORY_BOOKSHELF_SPEAKER := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SINK_SUBCATEGORY_STANDMOUNTED_SPEAKER := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SINK_SUBCATEGORY_SPEAKERPHONE := 5

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_MICROPHONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_ALARM := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_BELL := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_HORN := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_BROADCASTING_DEVICE := 5

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_SERVICE_DESK := 6

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_KIOSK := 7

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_BROADCASTING_ROOM := 8

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_AUDITORIUM := 9

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_WEARABLE_AUDIO_DEVICE_SUBCATEGORY_EARBUD := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_WEARABLE_AUDIO_DEVICE_SUBCATEGORY_HEADSET := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_WEARABLE_AUDIO_DEVICE_SUBCATEGORY_HEADPHONES := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_WEARABLE_AUDIO_DEVICE_SUBCATEGORY_NECKBAND := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HEARING_AID_SUBCATEGORY_IN_EAR_HEARING_AID := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HEARING_AID_SUBCATEGORY_BEHIND_EAR_HEARING_AID := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_HEARING_AID_SUBCATEGORY_COCHLEAR_IMPLANT := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_PULSE_OXIMETER_SUBCATEGORY_FINGERTIP := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_PULSE_OXIMETER_SUBCATEGORY_WRIST_WORN := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_OUTDOOR_SPORTS_ACTIVITY_SUBCATEGORY_LOCATION_DISPLAY_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_OUTDOOR_SPORTS_ACTIVITY_SUBCATEGORY_LOCATION_NAVIGATION_DISPLAY_DEVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_OUTDOOR_SPORTS_ACTIVITY_SUBCATEGORY_LOCATION_POD := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GAP_APPEARANCE_OUTDOOR_SPORTS_ACTIVITY_SUBCATEGORY_LOCATION_NAVIGATION_POD := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_GATT_DEFAULT_MAX_INCLUDED_SERVICES_DEPTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ATT_TRANSACTION_TIMEOUT := 30

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ATT_MAX_VALUE_SIZE := 512

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ATT_CID := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTHLEENUM_ATT_MTU_MIN := 23

/**
 * @type {Integer (UInt32)}
 */
export global BTHLEENUM_ATT_MTU_MAX := 65535

/**
 * @type {Integer (UInt32)}
 */
export global BTHLEENUM_ATT_MTU_DEFAULT := 23

/**
 * @type {Integer (UInt32)}
 */
export global BTHLEENUM_ATT_MTU_INITIAL_NEGOTIATION := 525

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_INVALID_HANDLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_READ_NOT_PERMITTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_WRITE_NOT_PERMITTED := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_INVALID_PDU := 4

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_INSUFFICIENT_AUTHENTICATION := 5

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_REQUEST_NOT_SUPPORTED := 6

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_INVALID_OFFSET := 7

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_INSUFFICIENT_AUTHORIZATION := 8

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_PREPARE_QUEUE_FULL := 9

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_ATTRIBUTE_NOT_FOUND := 10

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_ATTRIBUTE_NOT_LONG := 11

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_INSUFFICIENT_ENCRYPTION_KEY_SIZE := 12

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_INVALID_ATTRIBUTE_VALUE_LENGTH := 13

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_UNLIKELY := 14

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_INSUFFICIENT_ENCRYPTION := 15

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_UNSUPPORTED_GROUP_TYPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_INSUFFICIENT_RESOURCES := 17

/**
 * @type {Integer (UInt32)}
 */
export global BTH_LE_ERROR_UNKNOWN := 4096

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_GATT_FLAG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_GATT_FLAG_CONNECTION_ENCRYPTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_GATT_FLAG_CONNECTION_AUTHENTICATED := 2

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_DEVICE := 4

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_CACHE := 8

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_GATT_FLAG_SIGNED_WRITE := 16

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_GATT_FLAG_WRITE_WITHOUT_RESPONSE := 32

/**
 * @type {Integer (UInt32)}
 */
export global BLUETOOTH_GATT_FLAG_RETURN_ALL := 64

/**
 * @type {Integer (UInt32)}
 */
export global BT_PORT_MIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global BT_PORT_MAX := 65535

/**
 * @type {Integer (UInt32)}
 */
export global BT_PORT_DYN_FIRST := 4097

/**
 * @type {Integer (UInt16)}
 */
export global AF_BTH := 32

/**
 * @type {Integer (UInt16)}
 */
export global PF_BTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global NS_BTH := 16

/**
 * @type {Guid}
 */
export global SVCID_BTH_PROVIDER := Guid("{06aa63e0-7d60-41ff-afb2-3ee6d2d9392d}")

/**
 * @type {Integer (UInt32)}
 */
export global BTH_ADDR_STRING_SIZE := 12

/**
 * @type {Integer (UInt32)}
 */
export global BTHPROTO_RFCOMM := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTHPROTO_L2CAP := 256

/**
 * @type {Integer (UInt32)}
 */
export global SOL_RFCOMM := 3

/**
 * @type {Integer (UInt32)}
 */
export global SOL_L2CAP := 256

/**
 * @type {Integer (UInt32)}
 */
export global SOL_SDP := 257

/**
 * @type {Integer (UInt32)}
 */
export global SO_BTH_AUTHENTICATE := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global SO_BTH_ENCRYPT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SO_BTH_MTU := 2147483655

/**
 * @type {Integer (UInt32)}
 */
export global SO_BTH_MTU_MAX := 2147483656

/**
 * @type {Integer (UInt32)}
 */
export global SO_BTH_MTU_MIN := 2147483658

/**
 * @type {Integer (UInt32)}
 */
export global RFCOMM_MAX_MTU := 1011

/**
 * @type {Integer (UInt32)}
 */
export global RFCOMM_MIN_MTU := 23

/**
 * @type {Integer (UInt32)}
 */
export global BTH_SDP_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SDP_DEFAULT_INQUIRY_SECONDS := 6

/**
 * @type {Integer (UInt32)}
 */
export global SDP_MAX_INQUIRY_SECONDS := 60

/**
 * @type {Integer (UInt32)}
 */
export global SDP_DEFAULT_INQUIRY_MAX_RESPONSES := 255

/**
 * @type {Integer (UInt32)}
 */
export global SDP_SERVICE_SEARCH_REQUEST := 1

/**
 * @type {Integer (UInt32)}
 */
export global SDP_SERVICE_ATTRIBUTE_REQUEST := 2

/**
 * @type {Integer (UInt32)}
 */
export global SDP_SERVICE_SEARCH_ATTRIBUTE_REQUEST := 3

/**
 * @type {Integer (UInt32)}
 */
export global BTHNS_RESULT_DEVICE_CONNECTED := 65536

/**
 * @type {Integer (UInt32)}
 */
export global BTHNS_RESULT_DEVICE_REMEMBERED := 131072

/**
 * @type {Integer (UInt32)}
 */
export global BTHNS_RESULT_DEVICE_AUTHENTICATED := 262144

/**
 * @type {Integer (UInt32)}
 */
export global RLS_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global RLS_OVERRUN := 2

/**
 * @type {Integer (UInt32)}
 */
export global RLS_PARITY := 4

/**
 * @type {Integer (UInt32)}
 */
export global RLS_FRAMING := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPN_BAUD_2400 := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPN_BAUD_4800 := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPN_BAUD_7200 := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPN_BAUD_9600 := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPN_BAUD_19200 := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPN_BAUD_38400 := 5

/**
 * @type {Integer (UInt32)}
 */
export global RPN_BAUD_57600 := 6

/**
 * @type {Integer (UInt32)}
 */
export global RPN_BAUD_115200 := 7

/**
 * @type {Integer (UInt32)}
 */
export global RPN_BAUD_230400 := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPN_DATA_5 := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPN_DATA_6 := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPN_DATA_7 := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPN_DATA_8 := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPN_STOP_1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPN_STOP_1_5 := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARITY_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARITY_ODD := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARITY_EVEN := 24

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARITY_MARK := 40

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARITY_SPACE := 56

/**
 * @type {Integer (UInt32)}
 */
export global RPN_FLOW_X_IN := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPN_FLOW_X_OUT := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPN_FLOW_RTR_IN := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPN_FLOW_RTR_OUT := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPN_FLOW_RTC_IN := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPN_FLOW_RTC_OUT := 32

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_BAUD := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_STOP := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_PARITY := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_P_TYPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_XON := 32

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_XOFF := 64

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_X_IN := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_X_OUT := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_RTR_IN := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_RTR_OUT := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_RTC_IN := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPN_PARAM_RTC_OUT := 32

/**
 * @type {Integer (UInt32)}
 */
export global RFCOMM_CMD_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RFCOMM_CMD_MSC := 1

/**
 * @type {Integer (UInt32)}
 */
export global RFCOMM_CMD_RLS := 2

/**
 * @type {Integer (UInt32)}
 */
export global RFCOMM_CMD_RPN := 3

/**
 * @type {Integer (UInt32)}
 */
export global RFCOMM_CMD_RPN_REQUEST := 4

/**
 * @type {Integer (UInt32)}
 */
export global RFCOMM_CMD_RPN_RESPONSE := 5
;@endregion Constants
