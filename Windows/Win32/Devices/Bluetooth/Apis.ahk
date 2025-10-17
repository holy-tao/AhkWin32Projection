#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\HBLUETOOTH_RADIO_FIND.ahk
#Include .\HBLUETOOTH_DEVICE_FIND.ahk
/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class Bluetooth {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MAJORVERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MINORVERSION => 1

    /**
     * @type {String}
     */
    static GUID_BTHPORT_DEVICE_INTERFACE => "{0850302a-b344-4fda-9be9-90576b8d46f0}"

    /**
     * @type {String}
     */
    static GUID_BTH_RFCOMM_SERVICE_DEVICE_INTERFACE => "{b142fc3e-fa4e-460b-8abc-072b628b3c70}"

    /**
     * @type {String}
     */
    static GUID_BLUETOOTH_RADIO_IN_RANGE => "{ea3b5b82-26ee-450e-b0d8-d26fe30a3869}"

    /**
     * @type {String}
     */
    static GUID_BLUETOOTH_RADIO_OUT_OF_RANGE => "{e28867c9-c2aa-4ced-b969-4570866037c4}"

    /**
     * @type {String}
     */
    static GUID_BLUETOOTH_L2CAP_EVENT => "{7eae4030-b709-4aa8-ac55-e953829c9daa}"

    /**
     * @type {String}
     */
    static GUID_BLUETOOTH_HCI_EVENT => "{fc240062-1541-49be-b463-84c4dcd7bf7f}"

    /**
     * @type {String}
     */
    static GUID_BLUETOOTH_AUTHENTICATION_REQUEST => "{5dc9136d-996c-46db-84f5-32c0a3f47352}"

    /**
     * @type {String}
     */
    static GUID_BLUETOOTH_KEYPRESS_EVENT => "{d668dfcd-0f4e-4efc-bfe0-392eeec5109c}"

    /**
     * @type {String}
     */
    static GUID_BLUETOOTH_HCI_VENDOR_EVENT => "{547247e6-45bb-4c33-af8c-c00efe15a71d}"

    /**
     * @type {String}
     */
    static Bluetooth_Base_UUID => "{00000000-0000-1000-8000-00805f9b34fb}"

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_PROTOCOL_UUID16 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UDP_PROTOCOL_UUID16 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RFCOMM_PROTOCOL_UUID16 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TCP_PROTOCOL_UUID16 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TCSBIN_PROTOCOL_UUID16 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TCSAT_PROTOCOL_UUID16 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ATT_PROTOCOL_UUID16 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static OBEX_PROTOCOL_UUID16 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IP_PROTOCOL_UUID16 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FTP_PROTOCOL_UUID16 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_PROTOCOL_UUID16 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WSP_PROTOCOL_UUID16 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static BNEP_PROTOCOL_UUID16 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static UPNP_PROTOCOL_UUID16 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HID_PROTOCOL_UUID16 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static HCCC_PROTOCOL_UUID16 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static HCDC_PROTOCOL_UUID16 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static HCN_PROTOCOL_UUID16 => 22

    /**
     * @type {Integer (UInt32)}
     */
    static AVCTP_PROTOCOL_UUID16 => 23

    /**
     * @type {Integer (UInt32)}
     */
    static AVDTP_PROTOCOL_UUID16 => 25

    /**
     * @type {Integer (UInt32)}
     */
    static CMPT_PROTOCOL_UUID16 => 27

    /**
     * @type {Integer (UInt32)}
     */
    static UDI_C_PLANE_PROTOCOL_UUID16 => 29

    /**
     * @type {Integer (UInt32)}
     */
    static L2CAP_PROTOCOL_UUID16 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ServiceDiscoveryServerServiceClassID_UUID16 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static BrowseGroupDescriptorServiceClassID_UUID16 => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static PublicBrowseGroupServiceClassID_UUID16 => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static SerialPortServiceClassID_UUID16 => 4353

    /**
     * @type {Integer (UInt32)}
     */
    static LANAccessUsingPPPServiceClassID_UUID16 => 4354

    /**
     * @type {Integer (UInt32)}
     */
    static DialupNetworkingServiceClassID_UUID16 => 4355

    /**
     * @type {Integer (UInt32)}
     */
    static IrMCSyncServiceClassID_UUID16 => 4356

    /**
     * @type {Integer (UInt32)}
     */
    static OBEXObjectPushServiceClassID_UUID16 => 4357

    /**
     * @type {Integer (UInt32)}
     */
    static OBEXFileTransferServiceClassID_UUID16 => 4358

    /**
     * @type {Integer (UInt32)}
     */
    static IrMcSyncCommandServiceClassID_UUID16 => 4359

    /**
     * @type {Integer (UInt32)}
     */
    static HeadsetServiceClassID_UUID16 => 4360

    /**
     * @type {Integer (UInt32)}
     */
    static CordlessTelephonyServiceClassID_UUID16 => 4361

    /**
     * @type {Integer (UInt32)}
     */
    static AudioSourceServiceClassID_UUID16 => 4362

    /**
     * @type {Integer (UInt32)}
     */
    static AudioSinkServiceClassID_UUID16 => 4363

    /**
     * @type {Integer (UInt32)}
     */
    static AVRemoteControlTargetServiceClassID_UUID16 => 4364

    /**
     * @type {Integer (UInt32)}
     */
    static AVRemoteControlServiceClassID_UUID16 => 4366

    /**
     * @type {Integer (UInt32)}
     */
    static AVRemoteControlControllerServiceClass_UUID16 => 4367

    /**
     * @type {Integer (UInt32)}
     */
    static IntercomServiceClassID_UUID16 => 4368

    /**
     * @type {Integer (UInt32)}
     */
    static FaxServiceClassID_UUID16 => 4369

    /**
     * @type {Integer (UInt32)}
     */
    static HeadsetAudioGatewayServiceClassID_UUID16 => 4370

    /**
     * @type {Integer (UInt32)}
     */
    static WAPServiceClassID_UUID16 => 4371

    /**
     * @type {Integer (UInt32)}
     */
    static WAPClientServiceClassID_UUID16 => 4372

    /**
     * @type {Integer (UInt32)}
     */
    static PANUServiceClassID_UUID16 => 4373

    /**
     * @type {Integer (UInt32)}
     */
    static NAPServiceClassID_UUID16 => 4374

    /**
     * @type {Integer (UInt32)}
     */
    static GNServiceClassID_UUID16 => 4375

    /**
     * @type {Integer (UInt32)}
     */
    static DirectPrintingServiceClassID_UUID16 => 4376

    /**
     * @type {Integer (UInt32)}
     */
    static ReferencePrintingServiceClassID_UUID16 => 4377

    /**
     * @type {Integer (UInt32)}
     */
    static ImagingResponderServiceClassID_UUID16 => 4379

    /**
     * @type {Integer (UInt32)}
     */
    static ImagingAutomaticArchiveServiceClassID_UUID16 => 4380

    /**
     * @type {Integer (UInt32)}
     */
    static ImagingReferenceObjectsServiceClassID_UUID16 => 4381

    /**
     * @type {Integer (UInt32)}
     */
    static HandsfreeServiceClassID_UUID16 => 4382

    /**
     * @type {Integer (UInt32)}
     */
    static HandsfreeAudioGatewayServiceClassID_UUID16 => 4383

    /**
     * @type {Integer (UInt32)}
     */
    static DirectPrintingReferenceObjectsServiceClassID_UUID16 => 4384

    /**
     * @type {Integer (UInt32)}
     */
    static ReflectsUIServiceClassID_UUID16 => 4385

    /**
     * @type {Integer (UInt32)}
     */
    static PrintingStatusServiceClassID_UUID16 => 4387

    /**
     * @type {Integer (UInt32)}
     */
    static HumanInterfaceDeviceServiceClassID_UUID16 => 4388

    /**
     * @type {Integer (UInt32)}
     */
    static HCRPrintServiceClassID_UUID16 => 4390

    /**
     * @type {Integer (UInt32)}
     */
    static HCRScanServiceClassID_UUID16 => 4391

    /**
     * @type {Integer (UInt32)}
     */
    static CommonISDNAccessServiceClassID_UUID16 => 4392

    /**
     * @type {Integer (UInt32)}
     */
    static VideoConferencingGWServiceClassID_UUID16 => 4393

    /**
     * @type {Integer (UInt32)}
     */
    static UDIMTServiceClassID_UUID16 => 4394

    /**
     * @type {Integer (UInt32)}
     */
    static UDITAServiceClassID_UUID16 => 4395

    /**
     * @type {Integer (UInt32)}
     */
    static AudioVideoServiceClassID_UUID16 => 4396

    /**
     * @type {Integer (UInt32)}
     */
    static SimAccessServiceClassID_UUID16 => 4397

    /**
     * @type {Integer (UInt32)}
     */
    static PhonebookAccessPceServiceClassID_UUID16 => 4398

    /**
     * @type {Integer (UInt32)}
     */
    static PhonebookAccessPseServiceClassID_UUID16 => 4399

    /**
     * @type {Integer (UInt32)}
     */
    static HeadsetHSServiceClassID_UUID16 => 4401

    /**
     * @type {Integer (UInt32)}
     */
    static MessageAccessServerServiceClassID_UUID16 => 4402

    /**
     * @type {Integer (UInt32)}
     */
    static MessageNotificationServerServiceClassID_UUID16 => 4403

    /**
     * @type {Integer (UInt32)}
     */
    static GNSSServerServiceClassID_UUID16 => 4406

    /**
     * @type {Integer (UInt32)}
     */
    static ThreeDimensionalDisplayServiceClassID_UUID16 => 4407

    /**
     * @type {Integer (UInt32)}
     */
    static ThreeDimensionalGlassesServiceClassID_UUID16 => 4408

    /**
     * @type {Integer (UInt32)}
     */
    static MPSServiceClassID_UUID16 => 4411

    /**
     * @type {Integer (UInt32)}
     */
    static CTNAccessServiceClassID_UUID16 => 4412

    /**
     * @type {Integer (UInt32)}
     */
    static CTNNotificationServiceClassID_UUID16 => 4413

    /**
     * @type {Integer (UInt32)}
     */
    static PnPInformationServiceClassID_UUID16 => 4608

    /**
     * @type {Integer (UInt32)}
     */
    static GenericNetworkingServiceClassID_UUID16 => 4609

    /**
     * @type {Integer (UInt32)}
     */
    static GenericFileTransferServiceClassID_UUID16 => 4610

    /**
     * @type {Integer (UInt32)}
     */
    static GenericAudioServiceClassID_UUID16 => 4611

    /**
     * @type {Integer (UInt32)}
     */
    static GenericTelephonyServiceClassID_UUID16 => 4612

    /**
     * @type {Integer (UInt32)}
     */
    static UPnpServiceClassID_UUID16 => 4613

    /**
     * @type {Integer (UInt32)}
     */
    static UPnpIpServiceClassID_UUID16 => 4614

    /**
     * @type {Integer (UInt32)}
     */
    static ESdpUpnpIpPanServiceClassID_UUID16 => 4864

    /**
     * @type {Integer (UInt32)}
     */
    static ESdpUpnpIpLapServiceClassID_UUID16 => 4865

    /**
     * @type {Integer (UInt32)}
     */
    static ESdpUpnpL2capServiceClassID_UUID16 => 4866

    /**
     * @type {Integer (UInt32)}
     */
    static VideoSourceServiceClassID_UUID16 => 4867

    /**
     * @type {Integer (UInt32)}
     */
    static VideoSinkServiceClassID_UUID16 => 4868

    /**
     * @type {Integer (UInt32)}
     */
    static HealthDeviceProfileSourceServiceClassID_UUID16 => 5121

    /**
     * @type {Integer (UInt32)}
     */
    static HealthDeviceProfileSinkServiceClassID_UUID16 => 5122

    /**
     * @type {Integer (UInt32)}
     */
    static AdvancedAudioDistributionProfileID_UUID16 => 4365

    /**
     * @type {Integer (UInt32)}
     */
    static ImagingServiceProfileID_UUID16 => 4378

    /**
     * @type {Integer (UInt32)}
     */
    static BasicPrintingProfileID_UUID16 => 4386

    /**
     * @type {Integer (UInt32)}
     */
    static HardcopyCableReplacementProfileID_UUID16 => 4389

    /**
     * @type {Integer (UInt32)}
     */
    static PhonebookAccessProfileID_UUID16 => 4400

    /**
     * @type {Integer (UInt32)}
     */
    static MessageAccessProfileID_UUID16 => 4404

    /**
     * @type {Integer (UInt32)}
     */
    static GNSSProfileID_UUID16 => 4405

    /**
     * @type {Integer (UInt32)}
     */
    static ThreeDimensionalSynchronizationProfileID_UUID16 => 4409

    /**
     * @type {Integer (UInt32)}
     */
    static MPSProfileID_UUID16 => 4410

    /**
     * @type {Integer (UInt32)}
     */
    static CTNProfileID_UUID16 => 4414

    /**
     * @type {Integer (UInt32)}
     */
    static VideoDistributionProfileID_UUID16 => 4869

    /**
     * @type {Integer (UInt32)}
     */
    static HealthDeviceProfileID_UUID16 => 5120

    /**
     * @type {Integer (UInt32)}
     */
    static VideoConferencingServiceClassID_UUID16 => 4367

    /**
     * @type {Integer (UInt32)}
     */
    static CommonISDNAccessServiceClass_UUID16 => 4392

    /**
     * @type {Integer (UInt32)}
     */
    static VideoConferencingGWServiceClass_UUID16 => 4393

    /**
     * @type {Integer (UInt32)}
     */
    static UDIMTServiceClass_UUID16 => 4394

    /**
     * @type {Integer (UInt32)}
     */
    static UDITAServiceClass_UUID16 => 4395

    /**
     * @type {Integer (UInt32)}
     */
    static AudioVideoServiceClass_UUID16 => 4396

    /**
     * @type {Integer (UInt32)}
     */
    static CordlessServiceClassID_UUID16 => 4361

    /**
     * @type {Integer (UInt32)}
     */
    static AudioSinkSourceServiceClassID_UUID16 => 4363

    /**
     * @type {Integer (UInt32)}
     */
    static AdvancedAudioDistributionServiceClassID_UUID16 => 4365

    /**
     * @type {Integer (UInt32)}
     */
    static ImagingServiceClassID_UUID16 => 4378

    /**
     * @type {Integer (UInt32)}
     */
    static BasicPrintingServiceClassID_UUID16 => 4386

    /**
     * @type {Integer (UInt32)}
     */
    static HardcopyCableReplacementServiceClassID_UUID16 => 4389

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MAX_NAME_SIZE => 248

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MAX_PIN_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LINK_KEY_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_ERICSSON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_NOKIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_INTEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_IBM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_TOSHIBA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_3COM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_MICROSOFT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_LUCENT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_MOTOROLA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_INFINEON => 9

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_CSR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_SILICONWAVE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_DIGIANSWER => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_TI => 13

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_PARTHUS => 14

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_BROADCOM => 15

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_MITEL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_WIDCOMM => 17

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_ZEEVO => 18

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_ATMEL => 19

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_MITSIBUSHI => 20

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_RTX_TELECOM => 21

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_KC_TECHNOLOGY => 22

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_NEWLOGIC => 23

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_TRANSILICA => 24

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_ROHDE_SCHWARZ => 25

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_TTPCOM => 26

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_SIGNIA => 27

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_CONEXANT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_QUALCOMM => 29

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_INVENTEL => 30

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_AVM_BERLIN => 31

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_BANDSPEED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_MANSELLA => 33

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_NEC => 34

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_WAVEPLUS_TECHNOLOGY_CO => 35

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_ALCATEL => 36

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_PHILIPS_SEMICONDUCTOR => 37

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_C_TECHNOLOGIES => 38

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_OPEN_INTERFACE => 39

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_RF_MICRO_DEVICES => 40

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_HITACHI => 41

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_SYMBOL_TECHNOLOGIES => 42

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_TENOVIS => 43

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_MACRONIX_INTERNATIONAL => 44

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_MARVELL => 72

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_APPLE => 76

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_NORDIC_SEMICONDUCTORS_ASA => 89

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_ARUBA_NETWORKS => 283

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MFG_INTERNAL_USE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static SAP_BIT_OFFSET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COD_FORMAT_BIT_OFFSET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MINOR_BIT_OFFSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_FORMAT_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MINOR_MASK => 252

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_MASK => 7936

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_MASK => 16769024

    /**
     * @type {Integer (UInt32)}
     */
    static COD_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_LIMITED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_LE_AUDIO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_POSITIONING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_NETWORKING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_RENDERING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_CAPTURING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_OBJECT_XFER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_AUDIO => 256

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_TELEPHONY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_INFORMATION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static COD_SERVICE_MAX_COUNT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_MISCELLANEOUS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_COMPUTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_PHONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_LAN_ACCESS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_AUDIO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_PERIPHERAL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_IMAGING => 6

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_WEARABLE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_TOY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_HEALTH => 9

    /**
     * @type {Integer (UInt32)}
     */
    static COD_MAJOR_UNCLASSIFIED => 31

    /**
     * @type {Integer (UInt32)}
     */
    static COD_COMPUTER_MINOR_UNCLASSIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COD_COMPUTER_MINOR_DESKTOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COD_COMPUTER_MINOR_SERVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_COMPUTER_MINOR_LAPTOP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COD_COMPUTER_MINOR_HANDHELD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COD_COMPUTER_MINOR_PALM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static COD_COMPUTER_MINOR_WEARABLE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PHONE_MINOR_UNCLASSIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PHONE_MINOR_CELLULAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PHONE_MINOR_CORDLESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PHONE_MINOR_SMART => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PHONE_MINOR_WIRED_MODEM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_UNCLASSIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_HEADSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_HANDS_FREE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_HEADSET_HANDS_FREE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_MICROPHONE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_LOUDSPEAKER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_HEADPHONES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_PORTABLE_AUDIO => 7

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_CAR_AUDIO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_SET_TOP_BOX => 9

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_HIFI_AUDIO => 10

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_VCR => 11

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_VIDEO_CAMERA => 12

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_CAMCORDER => 13

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_VIDEO_MONITOR => 14

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_VIDEO_DISPLAY_LOUDSPEAKER => 15

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_VIDEO_DISPLAY_CONFERENCING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static COD_AUDIO_MINOR_GAMING_TOY => 18

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PERIPHERAL_MINOR_KEYBOARD_MASK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PERIPHERAL_MINOR_POINTER_MASK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PERIPHERAL_MINOR_NO_CATEGORY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PERIPHERAL_MINOR_JOYSTICK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PERIPHERAL_MINOR_GAMEPAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PERIPHERAL_MINOR_REMOTE_CONTROL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COD_PERIPHERAL_MINOR_SENSING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COD_IMAGING_MINOR_DISPLAY_MASK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COD_IMAGING_MINOR_CAMERA_MASK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static COD_IMAGING_MINOR_SCANNER_MASK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static COD_IMAGING_MINOR_PRINTER_MASK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static COD_WEARABLE_MINOR_WRIST_WATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COD_WEARABLE_MINOR_PAGER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_WEARABLE_MINOR_JACKET => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COD_WEARABLE_MINOR_HELMET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COD_WEARABLE_MINOR_GLASSES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static COD_TOY_MINOR_ROBOT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COD_TOY_MINOR_VEHICLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_TOY_MINOR_DOLL_ACTION_FIGURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COD_TOY_MINOR_CONTROLLER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COD_TOY_MINOR_GAME => 5

    /**
     * @type {Integer (UInt32)}
     */
    static COD_HEALTH_MINOR_BLOOD_PRESSURE_MONITOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COD_HEALTH_MINOR_THERMOMETER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_HEALTH_MINOR_WEIGHING_SCALE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COD_HEALTH_MINOR_GLUCOSE_METER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COD_HEALTH_MINOR_PULSE_OXIMETER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static COD_HEALTH_MINOR_HEART_PULSE_MONITOR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static COD_HEALTH_MINOR_HEALTH_DATA_DISPLAY => 7

    /**
     * @type {Integer (UInt32)}
     */
    static COD_HEALTH_MINOR_STEP_COUNTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_ACCESS_BIT_OFFSET => 5

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_MINOR_MASK => 28

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_ACCESS_MASK => 224

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_MINOR_UNCLASSIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_ACCESS_0_USED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_ACCESS_17_USED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_ACCESS_33_USED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_ACCESS_50_USED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_ACCESS_67_USED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_ACCESS_83_USED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_ACCESS_99_USED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static COD_LAN_ACCESS_FULL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_FLAGS_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_16_UUIDS_PARTIAL_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_16_UUIDS_COMPLETE_ID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_32_UUIDS_PARTIAL_ID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_32_UUIDS_COMPLETE_ID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_128_UUIDS_PARTIAL_ID => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_128_UUIDS_COMPLETE_ID => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_LOCAL_NAME_PARTIAL_ID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_LOCAL_NAME_COMPLETE_ID => 9

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_TX_POWER_LEVEL_ID => 10

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_OOB_OPT_DATA_LEN_ID => 11

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_OOB_BD_ADDR_ID => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_OOB_COD_ID => 13

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_OOB_SP_HASH_ID => 14

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_OOB_SP_RANDOMIZER_ID => 15

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_MANUFACTURER_ID => 255

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_EIR_SIZE => 240

    /**
     * @type {Integer (UInt32)}
     */
    static LAP_GIAC_VALUE => 10390323

    /**
     * @type {Integer (UInt32)}
     */
    static LAP_LIAC_VALUE => 10390272

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ADDR_IAC_FIRST => 10390272

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ADDR_IAC_LAST => 10390335

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ADDR_LIAC => 10390272

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ADDR_GIAC => 10390323

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_UNKNOWN_HCI_COMMAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_NO_CONNECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_HARDWARE_FAILURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_PAGE_TIMEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_AUTHENTICATION_FAILURE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_KEY_MISSING => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_MEMORY_FULL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_CONNECTION_TIMEOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_MAX_NUMBER_OF_CONNECTIONS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_MAX_NUMBER_OF_SCO_CONNECTIONS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_ACL_CONNECTION_ALREADY_EXISTS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_COMMAND_DISALLOWED => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_HOST_REJECTED_LIMITED_RESOURCES => 13

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_HOST_REJECTED_SECURITY_REASONS => 14

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_HOST_REJECTED_PERSONAL_DEVICE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_HOST_TIMEOUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_UNSUPPORTED_FEATURE_OR_PARAMETER => 17

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_INVALID_HCI_PARAMETER => 18

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_REMOTE_USER_ENDED_CONNECTION => 19

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_REMOTE_LOW_RESOURCES => 20

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_REMOTE_POWERING_OFF => 21

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_LOCAL_HOST_TERMINATED_CONNECTION => 22

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_REPEATED_ATTEMPTS => 23

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_PAIRING_NOT_ALLOWED => 24

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_UKNOWN_LMP_PDU => 25

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_UNSUPPORTED_REMOTE_FEATURE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_SCO_OFFSET_REJECTED => 27

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_SCO_INTERVAL_REJECTED => 28

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_SCO_AIRMODE_REJECTED => 29

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_INVALID_LMP_PARAMETERS => 30

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_UNSPECIFIED_ERROR => 31

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_UNSUPPORTED_LMP_PARM_VALUE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_ROLE_CHANGE_NOT_ALLOWED => 33

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_LMP_RESPONSE_TIMEOUT => 34

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_LMP_TRANSACTION_COLLISION => 35

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_LMP_PDU_NOT_ALLOWED => 36

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_ENCRYPTION_MODE_NOT_ACCEPTABLE => 37

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_UNIT_KEY_NOT_USED => 38

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_QOS_IS_NOT_SUPPORTED => 39

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_INSTANT_PASSED => 40

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_PAIRING_WITH_UNIT_KEY_NOT_SUPPORTED => 41

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_DIFFERENT_TRANSACTION_COLLISION => 42

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_QOS_UNACCEPTABLE_PARAMETER => 44

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_QOS_REJECTED => 45

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_CHANNEL_CLASSIFICATION_NOT_SUPPORTED => 46

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_INSUFFICIENT_SECURITY => 47

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_PARAMETER_OUT_OF_MANDATORY_RANGE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_ROLE_SWITCH_PENDING => 50

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_RESERVED_SLOT_VIOLATION => 52

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_ROLE_SWITCH_FAILED => 53

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_EXTENDED_INQUIRY_RESPONSE_TOO_LARGE => 54

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_SECURE_SIMPLE_PAIRING_NOT_SUPPORTED_BY_HOST => 55

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_HOST_BUSY_PAIRING => 56

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_CONNECTION_REJECTED_DUE_TO_NO_SUITABLE_CHANNEL_FOUND => 57

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_CONTROLLER_BUSY => 58

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_UNACCEPTABLE_CONNECTION_INTERVAL => 59

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_DIRECTED_ADVERTISING_TIMEOUT => 60

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_CONNECTION_TERMINATED_DUE_TO_MIC_FAILURE => 61

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_CONNECTION_FAILED_TO_BE_ESTABLISHED => 62

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_MAC_CONNECTION_FAILED => 63

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_COARSE_CLOCK_ADJUSTMENT_REJECTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_TYPE_0_SUBMAP_NOT_DEFINED => 65

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_UNKNOWN_ADVERTISING_IDENTIFIER => 66

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_LIMIT_REACHED => 67

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_OPERATION_CANCELLED_BY_HOST => 68

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_PACKET_TOO_LONG => 69

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ERROR_UNSPECIFIED => 255

    /**
     * @type {Integer (UInt32)}
     */
    static L2CAP_MIN_MTU => 48

    /**
     * @type {Integer (UInt32)}
     */
    static L2CAP_MAX_MTU => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static L2CAP_DEFAULT_MTU => 672

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_L2CAP_PING_DATA_LENGTH => 44

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_L2CAP_INFO_DATA_LENGTH => 44

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_ADDRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_COD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_PAIRED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_PERSONAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_CONNECTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_SHORT_NAME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_VISIBLE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_SSP_SUPPORTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_SSP_PAIRED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_SSP_MITM_PROTECTED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_RSSI => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_EIR => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_BR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_PAIRED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_PERSONAL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_MITM_PROTECTED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_PRIVACY_ENABLED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_RANDOM_ADDRESS_TYPE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_DISCOVERABLE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_NAME => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_VISIBLE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_CONNECTED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_CONNECTABLE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_BR_SECURE_CONNECTION_PAIRED => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_SECURE_CONNECTION_PAIRED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_DEBUGKEY => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_LE_DEBUGKEY => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static BDIF_TX_POWER => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static HCI_CONNECTION_TYPE_ACL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HCI_CONNECTION_TYPE_SCO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HCI_CONNECTION_TYPE_LE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static HCI_CONNNECTION_TYPE_ACL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HCI_CONNNECTION_TYPE_SCO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_MAX_SERVICE_NAME_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_UUIDS_IN_QUERY => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_VID_DEFAULT_VALUE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ERROR_INVALID_SDP_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ERROR_INVALID_RECORD_HANDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ERROR_INVALID_REQUEST_SYNTAX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ERROR_INVALID_PDU_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ERROR_INVALID_CONTINUATION_STATE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ERROR_INSUFFICIENT_RESOURCES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_RECORD_HANDLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_CLASS_ID_LIST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_RECORD_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_SERVICE_ID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_PROTOCOL_DESCRIPTOR_LIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_BROWSE_GROUP_LIST => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_LANG_BASE_ATTRIB_ID_LIST => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_INFO_TIME_TO_LIVE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_AVAILABILITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_PROFILE_DESCRIPTOR_LIST => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_DOCUMENTATION_URL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_CLIENT_EXECUTABLE_URL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_ICON_URL => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_ADDITIONAL_PROTOCOL_DESCRIPTOR_LIST => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_PROFILE_SPECIFIC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BASE_LANGUAGE_INDEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BASE_ENCODING_INDEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BASE_OFFSET_INDEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_DEFAULT_ID => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LANGUAGE_EN_US => 25966

    /**
     * @type {Integer (UInt32)}
     */
    static ENCODING_UTF_8 => 106

    /**
     * @type {Integer (UInt32)}
     */
    static STRING_NAME_OFFSET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STRING_DESCRIPTION_OFFSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STRING_PROVIDER_NAME_OFFSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_SDP_VERSION_NUMBER_LIST => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_SDP_DATABASE_STATE => 513

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_BROWSE_GROUP_ID => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_CORDLESS_EXTERNAL_NETWORK => 769

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_FAX_CLASS_1_SUPPORT => 770

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_FAX_CLASS_2_0_SUPPORT => 771

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_FAX_CLASS_2_SUPPORT => 772

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_FAX_AUDIO_FEEDBACK_SUPPORT => 773

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HEADSET_REMOTE_AUDIO_VOLUME_CONTROL => 770

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_LAN_LPSUBNET => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_OBJECT_PUSH_SUPPORTED_FORMATS_LIST => 771

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_SYNCH_SUPPORTED_DATA_STORES_LIST => 769

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_SERVICE_VERSION => 768

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_PAN_NETWORK_ADDRESS => 774

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_PAN_WAP_GATEWAY => 775

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_PAN_HOME_PAGE_URL => 776

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_PAN_WAP_STACK_TYPE => 777

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_PAN_SECURITY_DESCRIPTION => 778

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_PAN_NET_ACCESS_TYPE => 779

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_PAN_MAX_NET_ACCESS_RATE => 780

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_IMAGING_SUPPORTED_CAPABILITIES => 784

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_IMAGING_SUPPORTED_FEATURES => 785

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_IMAGING_SUPPORTED_FUNCTIONS => 786

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_IMAGING_TOTAL_DATA_CAPACITY => 787

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_DI_SPECIFICATION_ID => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_DI_VENDOR_ID => 513

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_DI_PRODUCT_ID => 514

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_DI_VERSION => 515

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_DI_PRIMARY_RECORD => 516

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_DI_VENDOR_ID_SOURCE => 517

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_DEVICE_RELEASE_NUMBER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_PARSER_VERSION => 513

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_DEVICE_SUBCLASS => 514

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_COUNTRY_CODE => 515

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_VIRTUAL_CABLE => 516

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_RECONNECT_INITIATE => 517

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_DESCRIPTOR_LIST => 518

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_LANG_ID_BASE_LIST => 519

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_SDP_DISABLE => 520

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_BATTERY_POWER => 521

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_REMOTE_WAKE => 522

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_PROFILE_VERSION => 523

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_SUPERVISION_TIMEOUT => 524

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_NORMALLY_CONNECTABLE => 525

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_BOOT_DEVICE => 526

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_SSR_HOST_MAX_LATENCY => 527

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HID_SSR_HOST_MIN_TIMEOUT => 528

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_A2DP_SUPPORTED_FEATURES => 785

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_AVRCP_SUPPORTED_FEATURES => 785

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_ATTRIB_HFP_SUPPORTED_FEATURES => 785

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_CATEGORY_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_CATEGORY_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_CATEGORY_3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_CATEGORY_4 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_CT_BROWSING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_CT_COVER_ART_IMAGE_PROPERTIES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_CT_COVER_ART_IMAGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_CT_COVER_ART_LINKED_THUMBNAIL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_TG_PLAYER_APPLICATION_SETTINGS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_TG_GROUP_NAVIGATION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_TG_BROWSING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_TG_MULTIPLE_PLAYER_APPLICATIONS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AVRCP_SUPPORTED_FEATURES_TG_COVER_ART => 256

    /**
     * @type {Integer (UInt32)}
     */
    static A2DP_SINK_SUPPORTED_FEATURES_HEADPHONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static A2DP_SINK_SUPPORTED_FEATURES_SPEAKER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static A2DP_SINK_SUPPORTED_FEATURES_RECORDER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static A2DP_SINK_SUPPORTED_FEATURES_AMPLIFIER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static A2DP_SOURCE_SUPPORTED_FEATURES_PLAYER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static A2DP_SOURCE_SUPPORTED_FEATURES_MICROPHONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static A2DP_SOURCE_SUPPORTED_FEATURES_TUNER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static A2DP_SOURCE_SUPPORTED_FEATURES_MIXER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CORDLESS_EXTERNAL_NETWORK_PSTN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CORDLESS_EXTERNAL_NETWORK_ISDN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CORDLESS_EXTERNAL_NETWORK_GSM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CORDLESS_EXTERNAL_NETWORK_CDMA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CORDLESS_EXTERNAL_NETWORK_ANALOG_CELLULAR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CORDLESS_EXTERNAL_NETWORK_PACKET_SWITCHED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CORDLESS_EXTERNAL_NETWORK_OTHER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_PUSH_FORMAT_VCARD_2_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_PUSH_FORMAT_VCARD_3_0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_PUSH_FORMAT_VCAL_1_0 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_PUSH_FORMAT_ICAL_2_0 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_PUSH_FORMAT_VNOTE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_PUSH_FORMAT_VMESSAGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_PUSH_FORMAT_ANY => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCH_DATA_STORE_PHONEBOOK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCH_DATA_STORE_CALENDAR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCH_DATA_STORE_NOTES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCH_DATA_STORE_MESSAGES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DI_VENDOR_ID_SOURCE_BLUETOOTH_SIG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI_VENDOR_ID_SOURCE_USB_IF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_SDP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_RFCOMM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_TCS_BIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_TCS_BIN_CORDLESS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_BNEP => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_HID_CONTROL => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_HID_INTERRUPT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_UPNP => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_AVCTP => 23

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_AVDTP => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_AVCTP_BROWSE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_UDI_C_PLANE => 29

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_ATT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_3DSP => 33

    /**
     * @type {Integer (UInt32)}
     */
    static PSM_LE_IPSP => 35

    /**
     * @type {String}
     */
    static STR_ADDR_FMTA => "(%02x:%02x:%02x:%02x:%02x:%02x)"

    /**
     * @type {String}
     */
    static STR_ADDR_FMTW => "(%02x:%02x:%02x:%02x:%02x:%02x)"

    /**
     * @type {String}
     */
    static STR_ADDR_SHORT_FMTA => "%04x%08x"

    /**
     * @type {String}
     */
    static STR_ADDR_SHORT_FMTW => "%04x%08x"

    /**
     * @type {String}
     */
    static STR_USBHCI_CLASS_HARDWAREIDA => "USB\Class_E0&SubClass_01&Prot_01"

    /**
     * @type {String}
     */
    static STR_USBHCI_CLASS_HARDWAREIDW => "USB\Class_E0&SubClass_01&Prot_01"

    /**
     * @type {String}
     */
    static STR_ADDR_FMT => "(%02x:%02x:%02x:%02x:%02x:%02x)"

    /**
     * @type {String}
     */
    static STR_ADDR_SHORT_FMT => "%04x%08x"

    /**
     * @type {String}
     */
    static STR_USBHCI_CLASS_HARDWAREID => "USB\Class_E0&SubClass_01&Prot_01"

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_IOCTL_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_CONNECT_CACHE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_CONNECT_ALLOW_PIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_REQUEST_TO_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_REQUEST_TO_MIN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_REQUEST_TO_MAX => 45

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_OPTION_DO_NOT_PUBLISH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_OPTION_NO_PUBLIC_BROWSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_OPTION_DO_NOT_PUBLISH_EIR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SECURITY_USE_DEFAULTS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SECURITY_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SECURITY_AUTHORIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SECURITY_AUTHENTICATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SECURITY_ENCRYPT_REQUIRED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SECURITY_ENCRYPT_OPTIONAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SECURITY_DISABLED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SECURITY_NO_ASK => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_SEARCH_NO_PARSE_CHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_SEARCH_NO_FORMAT_CHECK => 2

    /**
     * @type {Integer (UInt64)}
     */
    static BTH_HOST_FEATURE_ENHANCED_RETRANSMISSION_MODE => 1

    /**
     * @type {Integer (UInt64)}
     */
    static BTH_HOST_FEATURE_STREAMING_MODE => 2

    /**
     * @type {Integer (UInt64)}
     */
    static BTH_HOST_FEATURE_LOW_ENERGY => 4

    /**
     * @type {Integer (UInt64)}
     */
    static BTH_HOST_FEATURE_SCO_HCI => 8

    /**
     * @type {Integer (UInt64)}
     */
    static BTH_HOST_FEATURE_SCO_HCIBYPASS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_MAX_NAME_SIZE => 248

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_MAX_PASSKEY_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_MAX_PASSKEY_BUFFER_SIZE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_MAX_SERVICE_NAME_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_DEVICE_NAME_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_SERVICE_DISABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_SERVICE_ENABLE => 1

    /**
     * @type {String}
     */
    static GUID_BLUETOOTHLE_DEVICE_INTERFACE => "{781aee18-7733-4ce4-add0-91f41c67b592}"

    /**
     * @type {String}
     */
    static GUID_BLUETOOTH_GATT_SERVICE_DEVICE_INTERFACE => "{6e3bb679-4372-40c8-9eaa-4509df260cd8}"

    /**
     * @type {String}
     */
    static BTH_LE_ATT_BLUETOOTH_BASE_GUID => "{00000000-0000-1000-8000-00805f9b34fb}"

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_SERVICE_GAP => 6144

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_SERVICE_GATT => 6145

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_ATTRIBUTE_TYPE_PRIMARY_SERVICE => 10240

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_ATTRIBUTE_TYPE_SECONDARY_SERVICE => 10241

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_ATTRIBUTE_TYPE_INCLUDE => 10242

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_ATTRIBUTE_TYPE_CHARACTERISTIC => 10243

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_EXTENDED_PROPERTIES => 10496

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_USER_DESCRIPTION => 10497

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_CLIENT_CONFIGURATION => 10498

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_SERVER_CONFIGURATION => 10499

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_FORMAT => 10500

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_DESCRIPTOR_AGGREGATE_FORMAT => 10501

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_TYPE_DEVICE_NAME => 10752

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_TYPE_APPEARANCE => 10753

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_TYPE_PERIPHERAL_PRIVACY_FLAG => 10754

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_TYPE_RECONNECTION_ADDRESS => 10755

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_TYPE_PERIPHERAL_PREFERED_CONNECTION_PARAMETER => 10756

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_CHARACTERISTIC_TYPE_SERVICE_CHANGED => 10757

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_OFFSET => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_MASK => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_SUB_CATEGORY_MASK => 63

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_UNCATEGORIZED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_PHONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_COMPUTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_WATCH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_CLOCK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_DISPLAY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_REMOTE_CONTROL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_EYE_GLASSES => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_TAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_KEYRING => 9

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_MEDIA_PLAYER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_BARCODE_SCANNER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_THERMOMETER => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_HEART_RATE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_BLOOD_PRESSURE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_HID => 15

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_GLUCOSE_METER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_RUNNING_WALKING_SENSOR => 17

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_CYCLING => 18

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_CONTROL_DEVICE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_NETWORK_DEVICE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_SENSOR => 21

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_LIGHT_FIXTURES => 22

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_FAN => 23

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_HVAC => 24

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_AIR_CONDITIONING => 25

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_HUMIDIFIER => 26

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_HEATING => 27

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_ACCESS_CONTROL => 28

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_MOTORIZED_DEVICE => 29

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_POWER_DEVICE => 30

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_LIGHT_SOURCE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_WINDOW_COVERING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_AUDIO_SINK => 33

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_AUDIO_SOURCE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_MOTORIZED_VEHICLE => 35

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_DOMESTIC_APPLIANCE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_WEARABLE_AUDIO_DEVICE => 37

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_AIRCRAFT => 38

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_AV_EQUIPMENT => 39

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_DISPLAY_EQUIPMENT => 40

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_HEARING_AID => 41

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_GAMING => 42

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_SIGNAGE => 43

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_PLUSE_OXIMETER => 49

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_WEIGHT_SCALE => 50

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_PERSONAL_MOBILITY_DEVICE => 51

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_CONTINUOUS_GLUCOSE_MONITOR => 52

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_INSULIN_PUMP => 53

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_MEDICATION_DELIVERY => 54

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CATEGORY_OUTDOOR_SPORTS_ACTIVITY => 81

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_SUBCATEGORY_GENERIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_WATCH_SUBCATEGORY_SPORTS_WATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_THERMOMETER_SUBCATEGORY_EAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HEART_RATE_SUBCATEGORY_HEART_RATE_BELT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_BLOOD_PRESSURE_SUBCATEGORY_ARM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_BLOOD_PRESSURE_SUBCATEGORY_WRIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_KEYBOARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_MOUSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_JOYSTICK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_GAMEPAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_DIGITIZER_TABLET => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_CARD_READER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_DIGITAL_PEN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_BARCODE_SCANNER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_TOUCHPAD => 9

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HID_SUBCATEGORY_PRESENTATION_REMOTE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_RUNNING_WALKING_SENSOR_SUBCATEGORY_IN_SHOE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_RUNNING_WALKING_SENSOR_SUBCATEGORY_ON_SHOE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_RUNNING_WALKING_SENSOR_SUBCATEGORY_ON_HIP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CYCLING_SUBCATEGORY_CYCLING_COMPUTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CYCLING_SUBCATEGORY_SPEED_SENSOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CYCLING_SUBCATEGORY_CADENCE_SENSOR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CYCLING_SUBCATEGORY_POWER_SENSOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_CYCLING_SUBCATEGORY_SPEED_AND_CADENCE_SENSOR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SINK_SUBCATEGORY_STANDALONE_SPEAKER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SINK_SUBCATEGORY_SOUNDBAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SINK_SUBCATEGORY_BOOKSHELF_SPEAKER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SINK_SUBCATEGORY_STANDMOUNTED_SPEAKER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SINK_SUBCATEGORY_SPEAKERPHONE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_MICROPHONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_ALARM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_BELL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_HORN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_BROADCASTING_DEVICE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_SERVICE_DESK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_KIOSK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_BROADCASTING_ROOM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_AUDIO_SOURCE_SUBCATEGORY_AUDITORIUM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_WEARABLE_AUDIO_DEVICE_SUBCATEGORY_EARBUD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_WEARABLE_AUDIO_DEVICE_SUBCATEGORY_HEADSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_WEARABLE_AUDIO_DEVICE_SUBCATEGORY_HEADPHONES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_WEARABLE_AUDIO_DEVICE_SUBCATEGORY_NECKBAND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HEARING_AID_SUBCATEGORY_IN_EAR_HEARING_AID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HEARING_AID_SUBCATEGORY_BEHIND_EAR_HEARING_AID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_HEARING_AID_SUBCATEGORY_COCHLEAR_IMPLANT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_PULSE_OXIMETER_SUBCATEGORY_FINGERTIP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_PULSE_OXIMETER_SUBCATEGORY_WRIST_WORN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_OUTDOOR_SPORTS_ACTIVITY_SUBCATEGORY_LOCATION_DISPLAY_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_OUTDOOR_SPORTS_ACTIVITY_SUBCATEGORY_LOCATION_NAVIGATION_DISPLAY_DEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_OUTDOOR_SPORTS_ACTIVITY_SUBCATEGORY_LOCATION_POD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GAP_APPEARANCE_OUTDOOR_SPORTS_ACTIVITY_SUBCATEGORY_LOCATION_NAVIGATION_POD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_GATT_DEFAULT_MAX_INCLUDED_SERVICES_DEPTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ATT_TRANSACTION_TIMEOUT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ATT_MAX_VALUE_SIZE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ATT_CID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTHLEENUM_ATT_MTU_MIN => 23

    /**
     * @type {Integer (UInt32)}
     */
    static BTHLEENUM_ATT_MTU_MAX => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static BTHLEENUM_ATT_MTU_DEFAULT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static BTHLEENUM_ATT_MTU_INITIAL_NEGOTIATION => 525

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_INVALID_HANDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_READ_NOT_PERMITTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_WRITE_NOT_PERMITTED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_INVALID_PDU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_INSUFFICIENT_AUTHENTICATION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_REQUEST_NOT_SUPPORTED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_INVALID_OFFSET => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_INSUFFICIENT_AUTHORIZATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_PREPARE_QUEUE_FULL => 9

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_ATTRIBUTE_NOT_FOUND => 10

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_ATTRIBUTE_NOT_LONG => 11

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_INSUFFICIENT_ENCRYPTION_KEY_SIZE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_INVALID_ATTRIBUTE_VALUE_LENGTH => 13

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_UNLIKELY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_INSUFFICIENT_ENCRYPTION => 15

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_UNSUPPORTED_GROUP_TYPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_INSUFFICIENT_RESOURCES => 17

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_LE_ERROR_UNKNOWN => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_GATT_FLAG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_GATT_FLAG_CONNECTION_ENCRYPTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_GATT_FLAG_CONNECTION_AUTHENTICATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_DEVICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_CACHE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_GATT_FLAG_SIGNED_WRITE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_GATT_FLAG_WRITE_WITHOUT_RESPONSE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_GATT_FLAG_RETURN_ALL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BT_PORT_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BT_PORT_MAX => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static BT_PORT_DYN_FIRST => 4097

    /**
     * @type {Integer (UInt16)}
     */
    static AF_BTH => 32

    /**
     * @type {Integer (UInt16)}
     */
    static PF_BTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NS_BTH => 16

    /**
     * @type {String}
     */
    static SVCID_BTH_PROVIDER => "{06aa63e0-7d60-41ff-afb2-3ee6d2d9392d}"

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_ADDR_STRING_SIZE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BTHPROTO_RFCOMM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTHPROTO_L2CAP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SOL_RFCOMM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SOL_L2CAP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SOL_SDP => 257

    /**
     * @type {Integer (UInt32)}
     */
    static SO_BTH_AUTHENTICATE => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static SO_BTH_ENCRYPT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SO_BTH_MTU => 2147483655

    /**
     * @type {Integer (UInt32)}
     */
    static SO_BTH_MTU_MAX => 2147483656

    /**
     * @type {Integer (UInt32)}
     */
    static SO_BTH_MTU_MIN => 2147483658

    /**
     * @type {Integer (UInt32)}
     */
    static RFCOMM_MAX_MTU => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static RFCOMM_MIN_MTU => 23

    /**
     * @type {Integer (UInt32)}
     */
    static BTH_SDP_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_DEFAULT_INQUIRY_SECONDS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_MAX_INQUIRY_SECONDS => 60

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_DEFAULT_INQUIRY_MAX_RESPONSES => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_SERVICE_SEARCH_REQUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_SERVICE_ATTRIBUTE_REQUEST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SDP_SERVICE_SEARCH_ATTRIBUTE_REQUEST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BTHNS_RESULT_DEVICE_CONNECTED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static BTHNS_RESULT_DEVICE_REMEMBERED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static BTHNS_RESULT_DEVICE_AUTHENTICATED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static RLS_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RLS_OVERRUN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RLS_PARITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RLS_FRAMING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_BAUD_2400 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_BAUD_4800 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_BAUD_7200 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_BAUD_9600 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_BAUD_19200 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_BAUD_38400 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_BAUD_57600 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_BAUD_115200 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_BAUD_230400 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_DATA_5 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_DATA_6 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_DATA_7 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_DATA_8 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_STOP_1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_STOP_1_5 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARITY_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARITY_ODD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARITY_EVEN => 24

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARITY_MARK => 40

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARITY_SPACE => 56

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_FLOW_X_IN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_FLOW_X_OUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_FLOW_RTR_IN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_FLOW_RTR_OUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_FLOW_RTC_IN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_FLOW_RTC_OUT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_BAUD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_STOP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_PARITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_P_TYPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_XON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_XOFF => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_X_IN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_X_OUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_RTR_IN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_RTR_OUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_RTC_IN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPN_PARAM_RTC_OUT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RFCOMM_CMD_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RFCOMM_CMD_MSC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RFCOMM_CMD_RLS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RFCOMM_CMD_RPN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RFCOMM_CMD_RPN_REQUEST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RFCOMM_CMD_RPN_RESPONSE => 5
;@endregion Constants

;@region Methods
    /**
     * The BluetoothFindFirstRadio function begins the enumeration of local Bluetooth radios.
     * @param {Pointer<BLUETOOTH_FIND_RADIO_PARAMS>} pbtfrp Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_find_radio_params">BLUETOOTH_FIND_RADIO_PARAMS</a> structure. The <b>dwSize</b> member of the <b>BLUETOOTH_FIND_RADIO_PARAMS</b> structure pointed to by <i>pbtfrp</i> must match the size of the structure.
     * @param {Pointer<HANDLE>} phRadio Pointer to where the first enumerated radio handle will be returned. When no longer needed, this handle must be closed via <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * @returns {HBLUETOOTH_RADIO_FIND} In addition to the handle indicated by <i>phRadio</i>, calling this function will also create a HBLUETOOTH_RADIO_FIND handle for use with the <a href="/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindnextradio">BluetoothFindNextRadio</a> function. When this handle is no longer needed, it must be closed via the <a href="/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindradioclose">BluetoothFindRadioClose</a>.
     * 
     * Returns <b>NULL</b> upon failure. Call the  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information on the error. The following table  describe common errors:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Bluetooth radios found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbtfrp</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The structure pointed to by <i>pbtfrp</i> is not the correct size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothfindfirstradio
     * @since windows6.0.6000
     */
    static BluetoothFindFirstRadio(pbtfrp, phRadio) {
        A_LastError := 0

        result := DllCall("BluetoothApis.dll\BluetoothFindFirstRadio", "ptr", pbtfrp, "ptr", phRadio, "ptr")
        if(A_LastError)
            throw OSError()

        return HBLUETOOTH_RADIO_FIND({Value: result}, True)
    }

    /**
     * The BluetoothFindNextRadio function finds the next Bluetooth radio.
     * @param {HBLUETOOTH_RADIO_FIND} hFind Handle returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstradio">BluetoothFindFirstRadio</a> function. Use <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindradioclose">BluetoothFindRadioClose</a> to close this handle when it is no longer needed.
     * @param {Pointer<HANDLE>} phRadio Pointer to where the next enumerated radio handle will be returned.  When no longer needed, this handle must be released via <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * @returns {BOOL} Returns <b>TRUE</b> when the next available radio is found.
     * 
     * Returns <b>FALSE</b> when no new radios are found.  Call the  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information on the error. The following table  describe common errors:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more radios were found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothfindnextradio
     * @since windows6.0.6000
     */
    static BluetoothFindNextRadio(hFind, phRadio) {
        hFind := hFind is Win32Handle ? NumGet(hFind, "ptr") : hFind

        A_LastError := 0

        result := DllCall("BluetoothApis.dll\BluetoothFindNextRadio", "ptr", hFind, "ptr", phRadio, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The BluetoothFindRadioClose function closes the enumeration handle associated with finding Bluetooth radios.
     * @param {HBLUETOOTH_RADIO_FIND} hFind Enumeration handle to close, obtained with a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstradio">BluetoothFindFirstRadio</a> function.
     * @returns {BOOL} Returns <b>TRUE</b> when the handle is successfully closed. Returns <b>FALSE</b> if the attempt fails to close the enumeration handle. For additional information on possible errors associated with closing the handle, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothfindradioclose
     * @since windows6.0.6000
     */
    static BluetoothFindRadioClose(hFind) {
        hFind := hFind is Win32Handle ? NumGet(hFind, "ptr") : hFind

        A_LastError := 0

        result := DllCall("BluetoothApis.dll\BluetoothFindRadioClose", "ptr", hFind, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Obtains information about a Bluetooth radio.
     * @param {HANDLE} hRadio A handle to a local Bluetooth radio, obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstradio">BluetoothFindFirstRadio</a> or similar functions, or the <b>SetupDiEnumerateDeviceInterfances</b> function.
     * @param {Pointer<BLUETOOTH_RADIO_INFO>} pRadioInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-bluetooth_radio_info">BLUETOOTH_RADIO_INFO</a> structure into which information about the radio will be placed. The <b>dwSize</b> member of the <b>BLUETOOTH_RADIO_INFO</b> structure must match the size of the structure.
     * @returns {Integer} The following table  lists common return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The radio information was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hRadio</i> or <i>pRadioInfo</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwSize</b> member of the <a href="/windows/desktop/api/bluetoothapis/ns-bluetoothapis-bluetooth_radio_info">BLUETOOTH_RADIO_INFO</a> structure pointed to by <i>pRadioInfo</i> is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothgetradioinfo
     * @since windows6.0.6000
     */
    static BluetoothGetRadioInfo(hRadio, pRadioInfo) {
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        A_LastError := 0

        result := DllCall("BluetoothApis.dll\BluetoothGetRadioInfo", "ptr", hRadio, "ptr", pRadioInfo, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The BluetoothFindFirstDevice function begins the enumeration Bluetooth devices.
     * @param {Pointer<BLUETOOTH_DEVICE_SEARCH_PARAMS>} pbtsp Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_search_params">BLUETOOTH_DEVICE_SEARCH_PARAMS</a> structure. The <b>dwSize</b> member of the <b>BLUETOOTH_DEVICE_SEARCH_PARAMS</b> structure pointed to by <i>pbtsp</i> must match the size of the structure.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure into which information about the first Bluetooth device found is placed. The <b>dwSize</b> member of the <b>BLUETOOTH_DEVICE_INFO</b> structure pointed to by <i>pbtdi</i> must match the size of the structure, or the call to the <b>BluetoothFindFirstDevice</b> function fails.
     * @returns {HBLUETOOTH_DEVICE_FIND} Returns a valid handle to the first Bluetooth device upon successful completion, and the <i>pbtdi</i> parameter points to information about the device. When this handle is no longer needed, it must be closed via the <a href="/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfinddeviceclose">BluetoothFindDeviceClose</a>.
     * 
     * Returns <b>NULL</b> upon failure. Call the  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information on the error. The following table  describe common errors:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbtsp</i> or <i>pbtdi</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The structure pointed to by <i>pbtsp</i> or <i>pbtdi</i> is not the correct size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothfindfirstdevice
     * @since windows6.0.6000
     */
    static BluetoothFindFirstDevice(pbtsp, pbtdi) {
        A_LastError := 0

        result := DllCall("BluetoothApis.dll\BluetoothFindFirstDevice", "ptr", pbtsp, "ptr", pbtdi, "ptr")
        if(A_LastError)
            throw OSError()

        return HBLUETOOTH_DEVICE_FIND({Value: result}, True)
    }

    /**
     * The BluetoothFindNextDevice function finds the next Bluetooth device.
     * @param {HBLUETOOTH_DEVICE_FIND} hFind Handle for the query obtained in a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstdevice">BluetoothFindFirstDevice</a> function.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure into which information about the next Bluetooth device found is placed. The <b>dwSize</b> member of the <b>BLUETOOTH_DEVICE_INFO</b> structure pointed to by <i>pbtdi</i> must match the size of the structure, or the call to <b>BluetoothFindNextDevice</b> fails.
     * @returns {BOOL} Returns <b>TRUE</b> when the next device is successfully found, and the <i>pbtdi</i> parameter points to information about the device. Returns <b>FALSE</b> upon error. Call the  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information on the error. The following table  describe common errors:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more devices were found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothfindnextdevice
     * @since windows6.0.6000
     */
    static BluetoothFindNextDevice(hFind, pbtdi) {
        hFind := hFind is Win32Handle ? NumGet(hFind, "ptr") : hFind

        A_LastError := 0

        result := DllCall("BluetoothApis.dll\BluetoothFindNextDevice", "ptr", hFind, "ptr", pbtdi, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The BluetoothFindDeviceClose function closes an enumeration handle associated with a device query.
     * @param {HBLUETOOTH_DEVICE_FIND} hFind Handle for the query to be closed. Obtained in a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstdevice">BluetoothFindFirstDevice</a> function.
     * @returns {BOOL} Returns <b>TRUE</b> when the handle is successfully closed. Returns <b>FALSE</b> upon error. Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information on the failure.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothfinddeviceclose
     * @since windows6.0.6000
     */
    static BluetoothFindDeviceClose(hFind) {
        hFind := hFind is Win32Handle ? NumGet(hFind, "ptr") : hFind

        A_LastError := 0

        result := DllCall("BluetoothApis.dll\BluetoothFindDeviceClose", "ptr", hFind, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a remote Bluetooth device.
     * @param {HANDLE} hRadio A handle to a local radio, obtained from a call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstradio">BluetoothFindFirstRadio</a> or similar functions, or from a call to the <b>SetupDiEnumerateDeviceInterfaces</b> function.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure into which data about the first Bluetooth device will be placed. For more information, see Remarks.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon success, indicating that data about the remote Bluetooth device was retrieved. Returns error codes upon failure. The following table lists common error codes associated with the <b>BluetoothGetDeviceInfo</b> function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the BLUETOOTH_DEVICE_INFO is not compatible. Check
     * the <b>dwSize</b> member of the <a href="/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The radio is not known by the system, or the <b>Address</b> member of the <a href="/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure is all zeros.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbtdi</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothgetdeviceinfo
     * @since windows6.0.6000
     */
    static BluetoothGetDeviceInfo(hRadio, pbtdi) {
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        result := DllCall("BluetoothApis.dll\BluetoothGetDeviceInfo", "ptr", hRadio, "ptr", pbtdi, "uint")
        return result
    }

    /**
     * Updates the local computer cache about a Bluetooth device.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure to update. For more information, see the Remarks section.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon success. The following table  lists common errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbtdi</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwSize</b> member of the structure pointed to in the <i>pbtdi</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothupdatedevicerecord
     * @since windows6.0.6000
     */
    static BluetoothUpdateDeviceRecord(pbtdi) {
        result := DllCall("BluetoothApis.dll\BluetoothUpdateDeviceRecord", "ptr", pbtdi, "uint")
        return result
    }

    /**
     * Removes authentication between a Bluetooth device and the computer and clears cached service information for the device.
     * @param {Pointer<BLUETOOTH_ADDRESS>} pAddress A pointer to the address of the Bluetooth device to be removed.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon successful removal of the Bluetooth device. Returns <b>ERROR_NOT_FOUND</b> if the device was not found.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothremovedevice
     * @since windows6.0.6000
     */
    static BluetoothRemoveDevice(pAddress) {
        result := DllCall("BluetoothApis.dll\BluetoothRemoveDevice", "ptr", pAddress, "uint")
        return result
    }

    /**
     * Enables Bluetooth device selection.
     * @param {Pointer<BLUETOOTH_SELECT_DEVICE_PARAMS>} pbtsdp A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_select_device_params">BLUETOOTH_SELECT_DEVICE_PARAMS</a> structure that identifies Bluetooth devices.
     * @returns {BOOL} Returns <b>TRUE</b> if a user selected a device.
     * 
     * Returns <b>FALSE</b> if no valid data was returned. Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to retrieve error information. The following conditions apply to returned error information.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user canceled the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbtsdp</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The structure passed in <i>pbtsdp</i> is of unknown size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothselectdevices
     * @since windows6.0.6000
     */
    static BluetoothSelectDevices(pbtsdp) {
        A_LastError := 0

        result := DllCall("bthprops.cpl\BluetoothSelectDevices", "ptr", pbtsdp, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees resources associated with a previous call to BluetoothSelectDevices.
     * @param {Pointer<BLUETOOTH_SELECT_DEVICE_PARAMS>} pbtsdp A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_select_device_params">BLUETOOTH_SELECT_DEVICE_PARAMS</a> structure that identifies the Bluetooth device resources to free.
     * @returns {BOOL} Returns <b>TRUE</b> upon success. Returns <b>FALSE</b> if there are no resources to free.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothselectdevicesfree
     * @since windows6.0.6000
     */
    static BluetoothSelectDevicesFree(pbtsdp) {
        result := DllCall("bthprops.cpl\BluetoothSelectDevicesFree", "ptr", pbtsdp, "int")
        return result
    }

    /**
     * Starts Control Panel device information property sheet.
     * @param {HWND} hwndParent A handle to the parent window of the property sheet.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure that contains information about the Bluetooth device.
     * @returns {BOOL} Returns <b>TRUE</b> if the property sheet is successfully displayed. Returns <b>FALSE</b> if the property sheet was not displayed successfully; call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for additional error information.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothdisplaydeviceproperties
     * @since windows6.0.6000
     */
    static BluetoothDisplayDeviceProperties(hwndParent, pbtdi) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        A_LastError := 0

        result := DllCall("bthprops.cpl\BluetoothDisplayDeviceProperties", "ptr", hwndParent, "ptr", pbtdi, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends an authentication request to a remote Bluetooth device.
     * @param {HWND} hwndParent A window to be the parent of the Authentication wizard. If set to <b>NULL</b>, the wizard is removed from the desktop.
     * @param {HANDLE} hRadio A valid local radio handle, or <b>NULL</b>. If <b>NULL</b>, authentication is attempted on all local radios; if any radio succeeds, the function call succeeds.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtbi A structure of type <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> that contains the record of the Bluetooth device to be authenticated.
     * @param {PWSTR} pszPasskey A Personal Identification Number (PIN) to be used for device authentication. If set to <b>NULL</b>, the user interface is displayed and the user must follow the authentication process provided in the user interface. If <i>pszPasskey</i> is not <b>NULL</b>, no user interface is displayed. If the passkey is not  <b>NULL</b>, it must be a <b>NULL</b>-terminated string. For more information, see the Remarks section.
     * @param {Integer} ulPasskeyLength The size, in characters, of <i>pszPasskey</i>. The size of <i>pszPasskey</i> must be less than or equal to <b>BLUETOOTH_MAX_PASSKEY_SIZE</b>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon successful completion.
     * 
     * Common errors are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user canceled the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device structure in the <i>pbtdi</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device pointed to by <i>pbtdi</i>  is already marked as authenticated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothauthenticatedevice
     * @since windows6.0.6000
     */
    static BluetoothAuthenticateDevice(hwndParent, hRadio, pbtbi, pszPasskey, ulPasskeyLength) {
        pszPasskey := pszPasskey is String ? StrPtr(pszPasskey) : pszPasskey
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        result := DllCall("bthprops.cpl\BluetoothAuthenticateDevice", "ptr", hwndParent, "ptr", hRadio, "ptr", pbtbi, "ptr", pszPasskey, "uint", ulPasskeyLength, "uint")
        return result
    }

    /**
     * The BluetoothAuthenticateDeviceEx function sends an authentication request to a remote Bluetooth device.
     * @param {HWND} hwndParentIn The window to parent the authentication wizard. If <b>NULL</b>, the 
     * wizard will be parented off the desktop.
     * @param {HANDLE} hRadioIn A valid local radio handle or <b>NULL</b>. If <b>NULL</b>, then all radios will
     *           be tried. If any of the radios succeed, then the call will
     * succeed.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdiInout A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure describing the device          being authenticated.
     * @param {Pointer<BLUETOOTH_OOB_DATA_INFO>} pbtOobData Pointer to device specific out-of-band data to be provided with this API call.  If <b>NULL</b>, then a UI is
     *           displayed to continue the authentication process.
     * If not <b>NULL</b>, no UI is displayed.
     * 
     * <div class="alert"><b>Note</b>  If a callback is registered using <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthenticationex">BluetoothRegisterForAuthenticationEx</a>, then a UI will not be displayed.</div>
     * <div> </div>
     * @param {Integer} authenticationRequirement An <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_authentication_requirements">BLUETOOTH_AUTHENTICATION_REQUIREMENTS</a>value that specifies the protection required for authentication.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion; returns the following error codes upon failure:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user aborted the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device structure specified in <i>pbdti</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device in pbtdi is already been marked as authenticated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothauthenticatedeviceex
     * @since windows5.1.2600
     */
    static BluetoothAuthenticateDeviceEx(hwndParentIn, hRadioIn, pbtdiInout, pbtOobData, authenticationRequirement) {
        hwndParentIn := hwndParentIn is Win32Handle ? NumGet(hwndParentIn, "ptr") : hwndParentIn
        hRadioIn := hRadioIn is Win32Handle ? NumGet(hRadioIn, "ptr") : hRadioIn

        result := DllCall("bthprops.cpl\BluetoothAuthenticateDeviceEx", "ptr", hwndParentIn, "ptr", hRadioIn, "ptr", pbtdiInout, "ptr", pbtOobData, "int", authenticationRequirement, "uint")
        return result
    }

    /**
     * Enables the caller to prompt for multiple devices to be authenticated during a single instance of the Bluetooth Connection wizard.
     * @param {HWND} hwndParent A window to be the parent of the Authentication wizard. If set to <b>NULL</b>, the wizard is parented off the desktop.
     * @param {HANDLE} hRadio The valid local radio handle, or <b>NULL</b>. If <b>NULL</b>, authentication is attempted on all local radios; if any radio succeeds, the function call succeeds.
     * @param {Integer} cDevices The number of devices in the <i>pbtdi</i> array of <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structures.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} rgbtdi An array of <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structures that contain records for the Bluetooth devices to be authenticated.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon successful completion; check the <b>fAuthenticate</b> flag for each device.
     * 
     * The following table  lists common errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user canceled the operation. Check the <b>fAuthenticate</b> flag for each Bluetooth device to determine whether any devices were authenticated before the user canceled the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the devices in the <i>pbtdi</i> array was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All  devices pointed to by <i>pbtdi</i>  are already marked as authenticated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothauthenticatemultipledevices
     * @since windows6.0.6000
     */
    static BluetoothAuthenticateMultipleDevices(hwndParent, hRadio, cDevices, rgbtdi) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        result := DllCall("bthprops.cpl\BluetoothAuthenticateMultipleDevices", "ptr", hwndParent, "ptr", hRadio, "uint", cDevices, "ptr", rgbtdi, "uint")
        return result
    }

    /**
     * Enables or disables services for a Bluetooth device.
     * @param {HANDLE} hRadio A handle of the local Bluetooth radio.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure. Must be a previously found radio address.
     * @param {Pointer<Guid>} pGuidService A pointer to the service GUID on the remote device.
     * @param {Integer} dwServiceFlags The flags that adjust the service. To disable the service, set to <b>BLUETOOTH_SERVICE_DISABLE</b>; to enable the service, set to <b>BLUETOOTH_SERVICE_ENABLE</b>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon successful completion. The following table  lists common errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwServiceFlags</i> are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GUID specified in <i>pGuidService</i> is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwServiceFlags</i>  is set to <b>BLUETOOTH_SERVICE_DISABLE</b> and the service is already disabled, or <i>dwServiceFlags</i>  is set to  <b>BLUETOOTH_SERVICE_ENABLE</b> and the service is already enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothsetservicestate
     * @since windows6.0.6000
     */
    static BluetoothSetServiceState(hRadio, pbtdi, pGuidService, dwServiceFlags) {
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        result := DllCall("BluetoothApis.dll\BluetoothSetServiceState", "ptr", hRadio, "ptr", pbtdi, "ptr", pGuidService, "uint", dwServiceFlags, "uint")
        return result
    }

    /**
     * The BluetoothEnumerateInstalledServices function enumerates the services GUIDs (Globally Unique Identifiers) enabled on a Bluetooth device.
     * @param {HANDLE} hRadio Handle of the local Bluetooth radio device. If <b>NULL</b>,   all local radios are searched for enabled services that match the radio address in <i>pbtdi</i>.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure.
     * @param {Pointer<UInt32>} pcServiceInout On input, the number of records pointed to by the <i>pGuidServices</i> parameter. On output, the number of valid records returned in the <i>pGuidServices</i> parameter. If pGuidServices is <b>NULL</b>, on output <i>pcServices</i> contains the number of services enabled.
     * @param {Pointer<Guid>} pGuidServices Pointer to a buffer in memory to receive GUIDs for installed services. The buffer must be at least *<i>pcServices</i> *<b>sizeof</b>(GUID) bytes.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion, and the pGuidServices parameter contains a complete list of enabled service GUIDs.
     * 
     * The following table  describes a common error:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded. The <i>pGuidServices</i> parameter contains an incomplete list of enabled service GUIDs.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothenumerateinstalledservices
     * @since windows6.0.6000
     */
    static BluetoothEnumerateInstalledServices(hRadio, pbtdi, pcServiceInout, pGuidServices) {
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        result := DllCall("BluetoothApis.dll\BluetoothEnumerateInstalledServices", "ptr", hRadio, "ptr", pbtdi, "uint*", pcServiceInout, "ptr", pGuidServices, "uint")
        return result
    }

    /**
     * The BluetoothEnableDiscovery function changes the discovery state of a local Bluetooth radio or radios.
     * @param {HANDLE} hRadio Valid local radio handle, or <b>NULL</b>. If <b>NULL</b>, discovery is modified on all local radios; if any radio is modified by the call, the function call succeeds.
     * @param {BOOL} fEnabled Flag specifying whether discovery is to be enabled or disabled. Set to <b>TRUE</b> to enable discovery, set to <b>FALSE</b> to disable discovery.
     * @returns {BOOL} Returns <b>TRUE</b> if the discovery state was successfully changed. If <i>hRadio</i> is <b>NULL</b>, a return value of <b>TRUE</b> indicates that at least one local radio state was successfully changed. Returns <b>FALSE</b> if discovery state was not changed; if <i>hRadio</i> was <b>NULL</b>, no radio accepted the state change.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothenablediscovery
     * @since windows6.0.6000
     */
    static BluetoothEnableDiscovery(hRadio, fEnabled) {
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        result := DllCall("BluetoothApis.dll\BluetoothEnableDiscovery", "ptr", hRadio, "int", fEnabled, "int")
        return result
    }

    /**
     * The BluetoothIsDiscoverable function determines whether a Bluetooth radio or radios is discoverable.
     * @param {HANDLE} hRadio Valid local radio handle, or <b>NULL</b>. If <b>NULL</b>, discovery is determined for all local radios; if any radio is discoverable, the function call succeeds.
     * @returns {BOOL} Returns <b>TRUE</b> if at least one Bluetooth radio is discoverable. Returns <b>FALSE</b> if no Bluetooth radios are discoverable.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothisdiscoverable
     * @since windows6.0.6000
     */
    static BluetoothIsDiscoverable(hRadio) {
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        result := DllCall("BluetoothApis.dll\BluetoothIsDiscoverable", "ptr", hRadio, "int")
        return result
    }

    /**
     * The BluetoothEnableIncomingConnections function modifies whether a local Bluetooth radio accepts incoming connections.
     * @param {HANDLE} hRadio Valid local radio handle for which to change whether incoming connections are enabled, or <b>NULL</b>. If <b>NULL</b>, the attempt to modify incoming connection acceptance iterates through all local radios; if any radio is modified by the call, the function call succeeds.
     * @param {BOOL} fEnabled Flag specifying whether incoming connection acceptance is to be enabled or disabled. Set to <b>TRUE</b> to enable incoming connections, set to <b>FALSE</b> to disable incoming connections.
     * @returns {BOOL} Returns <b>TRUE</b> if the incoming connection  state was successfully changed. If <i>hRadio</i> is <b>NULL</b>, a return value of <b>TRUE</b> indicates that at least one local radio state was successfully changed. Returns <b>FALSE</b> if incoming connection  state was not changed; if <i>hRadio</i> was <b>NULL</b>, no radio accepted the state change.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothenableincomingconnections
     * @since windows6.0.6000
     */
    static BluetoothEnableIncomingConnections(hRadio, fEnabled) {
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        result := DllCall("BluetoothApis.dll\BluetoothEnableIncomingConnections", "ptr", hRadio, "int", fEnabled, "int")
        return result
    }

    /**
     * The BluetoothIsConnectable function determines whether a Bluetooth radio or radios is connectable.
     * @param {HANDLE} hRadio Valid local radio handle, or <b>NULL</b>. If <b>NULL</b>, all local radios are checked for connectability; if any radio is connectable, the function call succeeds.
     * @returns {BOOL} Returns <b>TRUE</b> if at least one Bluetooth radio is accepting incoming connections. Returns <b>FALSE</b> if no radios are accepting incoming connections.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothisconnectable
     * @since windows6.0.6000
     */
    static BluetoothIsConnectable(hRadio) {
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        result := DllCall("BluetoothApis.dll\BluetoothIsConnectable", "ptr", hRadio, "int")
        return result
    }

    /**
     * The BluetoothRegisterForAuthentication function registers a callback function that is called when a particular Bluetooth device requests authentication.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi Pointer to a  <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure. The Address member is used for comparison.
     * @param {Pointer<IntPtr>} phRegHandle Pointer to a structure in which the registration HANDLE is stored. Call the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothunregisterauthentication">BluetoothUnregisterAuthentication</a> to close the handle.
     * @param {Pointer<PFN_AUTHENTICATION_CALLBACK>} pfnCallback Function to be called when the authentication event occurs. The function should match the prototype described in PFN_AUTHENTICATION_CALLBACK.
     * @param {Pointer<Void>} pvParam Optional parameter to be passed through the callback function.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion, and a valid registration handle was returned in <i>phRegHandle</i>. Any other return value indicates failure.
     * 
     * Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to obtain more information about the error. The following table  describes a common error:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthentication
     * @since windows6.0.6000
     */
    static BluetoothRegisterForAuthentication(pbtdi, phRegHandle, pfnCallback, pvParam) {
        A_LastError := 0

        result := DllCall("BluetoothApis.dll\BluetoothRegisterForAuthentication", "ptr", pbtdi, "ptr*", phRegHandle, "ptr", pfnCallback, "ptr", pvParam, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The BluetoothRegisterForAuthenticationEx function registers an application for a pin request, numeric comparison and callback function.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdiIn A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure that specifies the bluetooth address to be utilized for comparison.
     * @param {Pointer<IntPtr>} phRegHandleOut A pointer to a <b>HBLUETOOTH_AUTHENTICATION_REGISTRATION</b> handle associated with the registered application. Call <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothunregisterauthentication">BluetoothUnregisterAuthentication</a> to close
     * the handle.
     * @param {Pointer<PFN_AUTHENTICATION_CALLBACK_EX>} pfnCallbackIn The function that will be called when the authentication event          occurs. This function should match the prototype of <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nc-bluetoothapis-pfn_authentication_callback_ex">PFN_AUTHENTICATION_CALLBACK_EX</a>.
     * @param {Pointer<Void>} pvParam Optional parameter to be passed through to the callback function specified by <i>pfnCallbackIn</i>.          This parameter  can be anything the application is required to define.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion; returns the following error codes upon failure:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Win32 Error</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The registration handle that was provided is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthenticationex
     * @since windows6.0.6000
     */
    static BluetoothRegisterForAuthenticationEx(pbtdiIn, phRegHandleOut, pfnCallbackIn, pvParam) {
        result := DllCall("BluetoothApis.dll\BluetoothRegisterForAuthenticationEx", "ptr", pbtdiIn, "ptr*", phRegHandleOut, "ptr", pfnCallbackIn, "ptr", pvParam, "uint")
        return result
    }

    /**
     * The BluetoothUnregisterAuthentication function removes registration for a callback routine that was previously registered with a call to the BluetoothRegisterForAuthentication function.
     * @param {Pointer} hRegHandle Handle returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthentication">BluetoothRegisterForAuthentication</a> function.
     * @returns {BOOL} Returns <b>TRUE</b> when the authentication registration is successfully removed. Returns <b>FALSE</b> if the specified handle is not successfully closed.
     * 
     * Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to obtain more information about the error. The following table  describes a common error:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothunregisterauthentication
     * @since windows6.0.6000
     */
    static BluetoothUnregisterAuthentication(hRegHandle) {
        A_LastError := 0

        result := DllCall("BluetoothApis.dll\BluetoothUnregisterAuthentication", "ptr", hRegHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The BluetoothSendAuthenticationResponse function is called when an authentication request to send the passkey response is received.
     * @param {HANDLE} hRadio Optional handle to the local radio handle, or <b>NULL</b>. If <b>NULL</b>, the function attempts to send an authentication response on all local radios.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure describing the Bluetooth device being authenticated. This can be the same structure passed to the callback function.
     * @param {PWSTR} pszPasskey Pointer to a UNICODE zero-terminated string of the passkey response
     * to be sent back to the authenticating device. the <i>pszPasskey</i> parameter can be no larger than BLUETOOTH_MAX_PASSKEY_SIZE, excluding <b>NULL</b>. If translation to ANSI is performed, the <i>pszPasskey</i> parameter cannot be larger than 16 bytes, excluding <b>NULL</b>.
     * @returns {Integer} Returns ERROR_SUCCESS when the device accepts the passkey response; the device is authenticated. Any other return value indicates failure. The following table  describes common errors:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Bluetooth device denied the passkey response. This error is also returned if a communication problem exists with the local radio.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device returned a failure code during authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothsendauthenticationresponse
     * @since windows6.0.6000
     */
    static BluetoothSendAuthenticationResponse(hRadio, pbtdi, pszPasskey) {
        pszPasskey := pszPasskey is String ? StrPtr(pszPasskey) : pszPasskey
        hRadio := hRadio is Win32Handle ? NumGet(hRadio, "ptr") : hRadio

        result := DllCall("BluetoothApis.dll\BluetoothSendAuthenticationResponse", "ptr", hRadio, "ptr", pbtdi, "ptr", pszPasskey, "uint")
        return result
    }

    /**
     * The BluetoothSendAuthenticationResponseEx function is called when an authentication request to send the passkey or a Numeric Comparison response is made.
     * @param {HANDLE} hRadioIn A handle of the Bluetooth radio device to specify local service information for.
     * @param {Pointer<BLUETOOTH_AUTHENTICATE_RESPONSE>} pauthResponse Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_authenticate_response">BLUETOOTH_AUTHENTICATE_RESPONSE</a> structure containing the response to the <b>BTH_REMOTE_AUTHENTICATE_REQUEST</b> event.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion; returns the following error codes upon failure:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device was denied the passkey response. This may also indicate a communications problem with the local radio device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device returned a failure code during authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothsendauthenticationresponseex
     * @since windows6.0.6000
     */
    static BluetoothSendAuthenticationResponseEx(hRadioIn, pauthResponse) {
        hRadioIn := hRadioIn is Win32Handle ? NumGet(hRadioIn, "ptr") : hRadioIn

        result := DllCall("BluetoothApis.dll\BluetoothSendAuthenticationResponseEx", "ptr", hRadioIn, "ptr", pauthResponse, "uint")
        return result
    }

    /**
     * Retrieves and parses a single element from an SDP stream.
     * @param {Pointer} pSdpStream A pointer to a valid SDP stream.
     * @param {Integer} cbSdpStreamLength The length, in bytes, of <i>pSdpStream</i>.
     * @param {Pointer<SDP_ELEMENT_DATA>} pData A pointer to a buffer to be filled with the data of the SDP element found at the beginning of the <i>pSdpStream</i> SDP stream.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> when the SDP element is parsed correctly. Returns <b>ERROR_INVALID_PARAMETER</b> if one of the required parameters is <b>NULL</b>, or if the SDP stream pointed to by <i>pSdpStream</i> is not valid.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothsdpgetelementdata
     * @since windows6.0.6000
     */
    static BluetoothSdpGetElementData(pSdpStream, cbSdpStreamLength, pData) {
        result := DllCall("BluetoothApis.dll\BluetoothSdpGetElementData", "ptr", pSdpStream, "uint", cbSdpStreamLength, "ptr", pData, "uint")
        return result
    }

    /**
     * Iterates a container stream and returns each element contained within the container element.
     * @param {Pointer} pContainerStream A pointer to valid SDP stream. The first element in the stream must be a sequence
     * or an alternative.
     * @param {Integer} cbContainerLength The size, in bytes, of the <i>pContainerStream</i> parameter.
     * @param {Pointer<IntPtr>} pElement A value used to track the  location in the stream.  The first
     *           time the <b>BluetoothSdpGetContainerElementData</b> function is called for a  container, *<i>pElement</i>should be <b>NULL</b>.  For subsequent calls, the value should be
     * unmodified.
     * @param {Pointer<SDP_ELEMENT_DATA>} pData A pointer to a buffer filled with data from  the
     * current SDP element of <i>pContainerStream</i>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon success, indicating that the <i>pData</i> parameter contains the data. Returns error codes upon failure. The following table describes common error codes associated with the <b>BluetoothSdpGetContainerElementData</b> function:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more items in the list. The caller should stop calling
     * the <a href="/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothsdpgetcontainerelementdata">BluetoothSdpGetContainerElementData</a> function for this container.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required pointer is <b>NULL</b>, or the container is not a valid SDP
     * stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothsdpgetcontainerelementdata
     * @since windows6.0.6000
     */
    static BluetoothSdpGetContainerElementData(pContainerStream, cbContainerLength, pElement, pData) {
        result := DllCall("BluetoothApis.dll\BluetoothSdpGetContainerElementData", "ptr", pContainerStream, "uint", cbContainerLength, "ptr*", pElement, "ptr", pData, "uint")
        return result
    }

    /**
     * The BluetoothSdpGetAttributeValue function retrieves the attribute value for an attribute identifier.
     * @param {Pointer} pRecordStream Pointer to a valid record stream that is formatted as a single SDP record.
     * @param {Integer} cbRecordLength Length of <i>pRecordStream</i>, in bytes.
     * @param {Integer} usAttributeId Attribute identifier to search for. See Remarks.
     * @param {Pointer<SDP_ELEMENT_DATA>} pAttributeData Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-sdp_element_data">SDP_ELEMENT_DATA</a> structure into which the attribute's identifier value is placed.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion; the <i>pAddributeData</i> parameter contains the attribute value. Any other return value indicates error. The following table describes common error codes associated with the <b>BluetoothSdpGetAttributeValue</b> function:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either one of the required pointers was <b>NULL</b>, the <i>pRecordStream</i> parameter was not a valid SDP stream, or the <i>pRecordStream</i> parameter was not a properly formatted SDP record.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The identifier provided in <i>usAttributeId</i> was not found in the record.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothsdpgetattributevalue
     * @since windows6.0.6000
     */
    static BluetoothSdpGetAttributeValue(pRecordStream, cbRecordLength, usAttributeId, pAttributeData) {
        result := DllCall("BluetoothApis.dll\BluetoothSdpGetAttributeValue", "ptr", pRecordStream, "uint", cbRecordLength, "ushort", usAttributeId, "ptr", pAttributeData, "uint")
        return result
    }

    /**
     * Converts a raw string embedded in the SDP record into a Unicode string.
     * @param {Pointer} pRecordStream A pointer to a valid record stream formatted as a single SDP record.
     * @param {Integer} cbRecordLength The length, in bytes, of <i>pRecordStream</i>.
     * @param {Pointer<SDP_STRING_TYPE_DATA>} pStringData When set to <b>NULL</b>, the calling thread locale is used to search          for a matching string in the SDP record.  If not <b>NULL</b>, the <b>mibeNum</b> and <b>attributeId</b> members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-sdp_string_type_data">SDP_STRING_TYPE_DATA</a> structure are used to find the string to convert.
     * @param {Integer} usStringOffset SDP string type offset to convert.  The <i>usStringOffset</i> is added to the base attribute identifier  of the string.   SDP specification-defined offsets are: STRING_NAME_OFFSET, STRING_DESCRIPTION_OFFSET, and STRING_PROVIDER_NAME_OFFSET. These offsets can be found in the bthdef.h header file.
     * @param {PWSTR} pszString If not <b>NULL</b>, contains the converted string on output. When set to <b>NULL</b>, the <i>pcchStringLength</i> parameter is filled with the required number of characters, not bytes, to retrieve the converted string.
     * @param {Pointer<UInt32>} pcchStringLength On input, contains the length of
     * <i>pszString</i> if <i>pszString</i> is not <b>NULL</b>, in characters.
     * 
     * Upon output, contains the
     * number of required characters including <b>NULL</b> if an error is returned,
     * or the number of characters written to <i>pszString</i>, including <b>NULL</b>.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion; the <i>pszString</i> parameter contains the converted string. Returns error codes upon failure. Common errors are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pszString</i> parameter was <b>NULL</b> or too small to contain the converted string; the <i>pcchStringLength</i> parameter contains, in characters, the required length.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The conversion cannot be performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system cannot allocate memory internally to perform the conversion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the required pointers was <b>NULL</b>, the <i>pRecordStream</i> parameter was not a valid
     * SDP stream, the <i>pRecordStream</i> was not a properly formatted record, or
     * the requested attribute plus offset was not a string.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothsdpgetstring
     * @since windows6.0.6000
     */
    static BluetoothSdpGetString(pRecordStream, cbRecordLength, pStringData, usStringOffset, pszString, pcchStringLength) {
        pszString := pszString is String ? StrPtr(pszString) : pszString

        result := DllCall("BluetoothApis.dll\BluetoothSdpGetString", "ptr", pRecordStream, "uint", cbRecordLength, "ptr", pStringData, "ushort", usStringOffset, "ptr", pszString, "uint*", pcchStringLength, "uint")
        return result
    }

    /**
     * The BluetoothSdpEnumAttributes function enumerates through the SDP record stream, and calls the callback function for each attribute in the record.
     * @param {Pointer} pSDPStream Pointer to a valid record stream that is formatted as a single SDP record.
     * @param {Integer} cbStreamSize Size of the stream pointed to by <i>pSDPStream</i>, in bytes.
     * @param {Pointer<PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK>} pfnCallback Pointer to the callback routine. See <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nc-bluetoothapis-pfn_bluetooth_enum_attributes_callback">PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK</a> for more information about the callback.
     * @param {Pointer<Void>} pvParam Optional parameter to be passed to the callback routine.
     * @returns {BOOL} Returns <b>TRUE</b> if an enumeration occurred. Returns <b>FALSE</b> upon failure. Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information. The following table describes common error codes associated with the <b>BluetoothSdpEnumAttributes</b> function:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSDPStream</i> or <i>pfnCallback</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SDP stream is corrupt.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothsdpenumattributes
     * @since windows6.0.6000
     */
    static BluetoothSdpEnumAttributes(pSDPStream, cbStreamSize, pfnCallback, pvParam) {
        A_LastError := 0

        result := DllCall("BluetoothApis.dll\BluetoothSdpEnumAttributes", "ptr", pSDPStream, "uint", cbStreamSize, "ptr", pfnCallback, "ptr", pvParam, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets local service information for a specific Bluetooth radio.
     * @param {HANDLE} hRadioIn A handle of the Bluetooth radio device to specify local service information for. If <b>NULL</b>, 
     *      <b>BluetoothSetLocalServiceInfo</b> searches for the first available local Bluetooth radio.
     * @param {Pointer<Guid>} pClassGuid The GUID of the service to expose. This should match the <b>GUID</b> in the server-side INF file.
     * @param {Integer} ulInstance An instance ID for the device node of the Plug and Play (PnP) ID.
     * @param {Pointer<BLUETOOTH_LOCAL_SERVICE_INFO>} pServiceInfoIn A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_local_service_info_struct">BLUETOOTH_LOCAL_SERVICE_INFO</a> structure that describes the local service to
     *      set.
     * @returns {Integer} The 
     *      <b>BluetoothSetLocalServiceInfo</b> function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified Bluetooth radio was not detected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_UNIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Bluetooth radios were detected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INSUFFICIENT_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sufficient resources were not available to complete the operation. You can receive this error
     *        when more than 100 local physical device objects (PDOs) correspond to Bluetooth services.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_PRIVILEGE_NOT_HELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the required privileges. See the Remarks section for information about
     *        how to elevate privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothsetlocalserviceinfo
     * @since windows6.0.6000
     */
    static BluetoothSetLocalServiceInfo(hRadioIn, pClassGuid, ulInstance, pServiceInfoIn) {
        hRadioIn := hRadioIn is Win32Handle ? NumGet(hRadioIn, "ptr") : hRadioIn

        result := DllCall("BluetoothApis.dll\BluetoothSetLocalServiceInfo", "ptr", hRadioIn, "ptr", pClassGuid, "uint", ulInstance, "ptr", pServiceInfoIn, "uint")
        return result
    }

    /**
     * BluetoothIsVersionAvailable function indicates if the installed Bluetooth binary set supports the requested version.
     * @param {Integer} MajorVersion The major version number.
     * @param {Integer} MinorVersion The minor version number.
     * @returns {BOOL} <b>TRUE</b> if the installed bluetooth binaries support the specified <i>MajorVersion</i> and <i>MinorVersion</i>; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/nf-bluetoothapis-bluetoothisversionavailable
     * @since windows6.0.6000
     */
    static BluetoothIsVersionAvailable(MajorVersion, MinorVersion) {
        result := DllCall("BluetoothApis.dll\BluetoothIsVersionAvailable", "char", MajorVersion, "char", MinorVersion, "int")
        return result
    }

    /**
     * The BluetoothGATTGetServices function gets all the primary services available for a server.
     * @param {HANDLE} hDevice Handle to the Bluetooth device from which to obtain the list of primary services.
     * @param {Integer} ServicesBufferCount The number of elements allocated for the <i>ServicesBuffer</i> parameter.
     * @param {Pointer<BTH_LE_GATT_SERVICE>} ServicesBuffer Pointer to buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_service">BTH_LE_GATT_SERVICE</a> structure into which to return services.
     * @param {Pointer<UInt16>} ServicesBufferActual Pointer to buffer into which the actual number of services were returned in the <i>ServicesBuffer</i> parameter.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetServices</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer parameter is NULL and the number of items available is being returned instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following conditions occurred:
     * 
     * <ul>
     * <li><i>ServicesBuffer</i> is <b>NULL</b>, and <i>ServicesBufferCount</i> is 0</li>
     * <li><i>ServicesBuffer</i> is non-<b>NULL</b>, but <i>ServicesBufferCount</i> is <b>NULL</b></li>
     * <li><i>ServicesBuffer</i> is non-<b>NULL</b>, and <i>ServicesBufferCount</i> is 0</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A buffer is specified, but the buffer count
     *             size is smaller than what is required, in bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Services were specified to be retrieved from
     *             the cache, but no services are present in the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_COMMAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current data in the cache appears to be
     *             inconsistent, and is leading to internal errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation ran out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetservices
     * @since windows8.0
     */
    static BluetoothGATTGetServices(hDevice, ServicesBufferCount, ServicesBuffer, ServicesBufferActual, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTGetServices", "ptr", hDevice, "ushort", ServicesBufferCount, "ptr", ServicesBuffer, "ushort*", ServicesBufferActual, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets all the included services available for a given service.
     * @param {HANDLE} hDevice Handle to the Bluetooth device or parent service.
     * @param {Pointer<BTH_LE_GATT_SERVICE>} ParentService Address of a <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_service">BTH_LE_GATT_SERVICE</a> structure that contains the parent service of the included services to be retrieved. This parameter is required if a device handle is passed to <i>hDevice</i>. This parameter is optional if a service handle was passed to <i>hDevice</i>, in which case the service specified by the service handle will be treated as the parent.
     * @param {Integer} IncludedServicesBufferCount The number of elements allocated for the <i>IncludedServicesBuffer</i> parameter.
     * @param {Pointer<BTH_LE_GATT_SERVICE>} IncludedServicesBuffer Address of a buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_service">BTH_LE_GATT_SERVICE</a> structure into which to return included services.
     * @param {Pointer<UInt16>} IncludedServicesBufferActual Pointer to buffer into which the actual number of included services were returned in the <i>IncludedServicesBuffer</i> parameter.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetIncludedServices</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer parameter is <b>NULL</b> and the number of items available is being returned instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following conditions occurred:
     * 
     * <ul>
     * <li><i>IncludedServicesBuffer</i> is <b>NULL</b>, and <i>IncludedServicesBufferCount</i> is 0.</li>
     * <li><i>IncludedServicesBuffer</i> is non-<b>NULL</b>, but <i>IncludedServicesBufferCount</i> is <b>NULL</b>.</li>
     * <li><i>IncludedServicesBuffer</i> is non-<b>NULL</b>, and <i>IncludedServicesBufferCount</i> is 0.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A buffer is specified, but the buffer count
     *             size is smaller than what is required, in bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Services were specified to be retrieved from
     *             the cache, but no services are present in the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_COMMAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current data in the cache appears to be
     *             inconsistent, and is leading to internal errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation ran out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetincludedservices
     * @since windows8.0
     */
    static BluetoothGATTGetIncludedServices(hDevice, ParentService, IncludedServicesBufferCount, IncludedServicesBuffer, IncludedServicesBufferActual, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTGetIncludedServices", "ptr", hDevice, "ptr", ParentService, "ushort", IncludedServicesBufferCount, "ptr", IncludedServicesBuffer, "ushort*", IncludedServicesBufferActual, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets all the characteristics available for the specified service.
     * @param {HANDLE} hDevice Handle to the Bluetooth device or service.
     * @param {Pointer<BTH_LE_GATT_SERVICE>} Service Address of a <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_service">BTH_LE_GATT_SERVICE</a> structure containing the parent service of the included services to be retrieved. This parameter is required if a device handle is passed to <i>hDevice</i>. This parameter is optional if a service handle was passed to <i>hDevice</i>, in which case the service specified by the service handle will be treated as the parent.
     * @param {Integer} CharacteristicsBufferCount The number of elements allocated for the <i>CharacteristicsBuffer</i> parameter.
     * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC>} CharacteristicsBuffer Pointer to buffer into which to return characteristics in a <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_service">BTH_LE_GATT_SERVICE</a> structure.
     * @param {Pointer<UInt16>} CharacteristicsBufferActual Pointer to buffer into which the actual number of characteristics were returned in the <i>CharacteristicsBuffer</i> parameter.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetCharacteristics</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer parameter is <b>NULL</b> and the number of items available is being returned instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following conditions occurred:
     * 
     * <ul>
     * <li><i>CharacteristicsBuffer</i> is <b>NULL</b>, and <i>CharacteristicsBufferCount</i> is 0</li>
     * <li><i>CharacteristicsBuffer</i> is non-<b>NULL</b>, but <i>CharacteristicsBufferCount</i> is <b>NULL</b></li>
     * <li><i>CharacteristicsBuffer</i> is non-<b>NULL</b>, and <i>CharacteristicsBufferCount</i> is 0</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A buffer is specified, but the buffer count
     *             size is smaller than what is required, in bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_COMMAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current data in the cache appears to be
     *             inconsistent, and is leading to internal errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation ran out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetcharacteristics
     * @since windows8.0
     */
    static BluetoothGATTGetCharacteristics(hDevice, Service, CharacteristicsBufferCount, CharacteristicsBuffer, CharacteristicsBufferActual, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTGetCharacteristics", "ptr", hDevice, "ptr", Service, "ushort", CharacteristicsBufferCount, "ptr", CharacteristicsBuffer, "ushort*", CharacteristicsBufferActual, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets all the descriptors available for the specified characteristic.
     * @param {HANDLE} hDevice Handle to the Bluetooth device or service.  If a service handle is passed, then the service must be the grandparent of the descriptor.
     * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC>} Characteristic Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_characteristic">BTH_LE_GATT_CHARACTERISTIC</a> structure containing the parent characteristic of the descriptors to be retrieved.
     * @param {Integer} DescriptorsBufferCount The number of elements allocated for the <i>DescriptorsBuffer</i> parameter.
     * @param {Pointer<BTH_LE_GATT_DESCRIPTOR>} DescriptorsBuffer Pointer to buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_descriptor">BTH_LE_GATT_DESCRIPTOR</a> structure into which to return descriptors.
     * @param {Pointer<UInt16>} DescriptorsBufferActual Pointer to buffer into which the actual number of descriptors were returned in the <i>DescriptorsBuffer</i> parameter.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetDescriptors</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer parameter is NULL and the number of items available is being returned instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following conditions occurred: 
     * 
     * <ul>
     * <li><i>DescriptorsBuffer</i> is <b>NULL</b>, and <i>DescriptorsBufferCount</i> is 0.</li>
     * <li><i>DescriptorsBuffer</i> is non-<b>NULL</b>, but <i>DescriptorsBufferCount</i> is <b>NULL</b>.</li>
     * <li><i>DescriptorsBuffer</i> is non-<b>NULL</b>, and <i>DescriptorsBufferCount</i> is 0.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A buffer is specified, but the buffer count
     *             size is smaller than what is required, in bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_COMMAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current data in the cache appears to be
     *             inconsistent, and is leading to internal errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation ran out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetdescriptors
     * @since windows8.0
     */
    static BluetoothGATTGetDescriptors(hDevice, Characteristic, DescriptorsBufferCount, DescriptorsBuffer, DescriptorsBufferActual, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTGetDescriptors", "ptr", hDevice, "ptr", Characteristic, "ushort", DescriptorsBufferCount, "ptr", DescriptorsBuffer, "ushort*", DescriptorsBufferActual, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the value of the specified characteristic.
     * @param {HANDLE} hDevice Handle to the service.
     * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC>} Characteristic Pointer to the parent characteristic of the characteristic value to be retrieved.
     * @param {Integer} CharacteristicValueDataSize The number of bytes allocated for the <i>CharacteristicValue</i> parameter.
     * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC_VALUE>} CharacteristicValue Pointer to buffer into which to return the characteristic value.
     * @param {Pointer<UInt16>} CharacteristicValueSizeRequired Pointer to buffer into which to store the number of bytes needed to return data in the buffer pointed to by <i>CharacteristicValue</i>.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetCharacteristicValue</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_CONNECTION_ENCRYPTED</b>
     * 
     * </td>
     * <td>
     * The client requests the data to be transmitted over an encrypted channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_CONNECTION_AUTHENTICATED</b>
     * 
     * </td>
     * <td>
     * The client requests the data to be transmitted over an authenticated channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_DEVICE</b>
     * 
     * </td>
     * <td>
     * The characteristic value is to be read directly from the device.  This overwrites the one in the cache if one is already present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_CACHE</b>
     * 
     * </td>
     * <td>
     * The characteristic value is to be read from the cache (regardless of whether it is present in the cache or not).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The <b>BluetoothGATTGetCharacteristicValue</b> function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer parameter is NULL and the number of items available is being returned instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Both <i>CharacteristicValue</i> and <i>CharacteristicValueSizeRequired</i> are 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A buffer is specified, but the buffer count size is smaller than what is required, in bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_COMMAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current data in the cache appears to be
     *             inconsistent, and is leading to internal errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_RESP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target server did not provide an
     *             appropriate network response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request timed-out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PRIVILEGE_NOT_HELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The characteristic value is not readable as
     *             dictated by the characteristic properties.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute handle given was not valid on this server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_READ_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_PDU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute PDU was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authentication before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attribute server does not support the request received from the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_OFFSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Offset specified was past the end of the attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authorization before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Too many prepare writes have been queued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No attribute found within the given attribute handle range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read or written using the Read Blob Request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Encryption Key Size used for encrypting this link is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute value length is invalid for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNLIKELY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires encryption before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute type is not a supported grouping attribute as defined by a higher layer specification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient Resources to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNKNOWN_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error that lies in the reserved range has been received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetcharacteristicvalue
     * @since windows8.0
     */
    static BluetoothGATTGetCharacteristicValue(hDevice, Characteristic, CharacteristicValueDataSize, CharacteristicValue, CharacteristicValueSizeRequired, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTGetCharacteristicValue", "ptr", hDevice, "ptr", Characteristic, "uint", CharacteristicValueDataSize, "ptr", CharacteristicValue, "ushort*", CharacteristicValueSizeRequired, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the value of the specified descriptor.
     * @param {HANDLE} hDevice Handle to the service.
     * @param {Pointer<BTH_LE_GATT_DESCRIPTOR>} Descriptor Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_descriptor">BTH_LE_GATT_DESCRIPTOR</a> structure containing the parent descriptor of the descriptor value to be retrieved.
     * @param {Integer} DescriptorValueDataSize The number of bytes allocated for the <i>DescriptorValue</i> parameter.
     * @param {Pointer<BTH_LE_GATT_DESCRIPTOR_VALUE>} DescriptorValue Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_descriptor_value">BTH_LE_GATT_DESCRIPTOR_VALUE</a> structure into which to return the descriptor value.
     * @param {Pointer<UInt16>} DescriptorValueSizeRequired Pointer to buffer into which to store the number of additional bytes needed to return data in the buffer pointed to by <i>DescriptorValue</i>.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetDescriptorValue</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_CONNECTION_ENCRYPTED</b>
     * 
     * </td>
     * <td>
     * The client requests the data to be transmitted over an encrypted channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_CONNECTION_AUTHENTICATED</b>
     * 
     * </td>
     * <td>
     * The client requests the data to be transmitted over an authenticated channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_DEVICE</b>
     * 
     * </td>
     * <td>
     * The descriptor value is to be read directly from the device.  This overwrites the one in the cache if one is already present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_CACHE</b>
     * 
     * </td>
     * <td>
     * The descriptor value is to be read from the cache (regardless of whether it is present in the cache or not).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The <b>BluetoothGATTGetDescriptorValue</b> function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer parameter is <b>NULL</b> and the number of items available is being returned instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Both <i>DescriptorValue</i> and <i>DescriptorValueSizeRequired</i> are 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A buffer is specified, but the buffer count
     *             size is smaller than what is required, in bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A descriptor value was specified to be retrieved from
     *             the cache, but the descriptor value is not present in the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_COMMAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current data in the cache appears to be
     *             inconsistent, and is leading to internal errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_RESP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target server did not provide an
     *             appropriate network response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request timed-out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute handle given was not valid on this server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_READ_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_PDU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute PDU was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authentication before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attribute server does not support the request received from the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_OFFSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Offset specified was past the end of the attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authorization before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Too many prepare writes have been queued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No attribute found within the given attribute handle range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read or written using the Read Blob Request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Encryption Key Size used for encrypting this link is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute value length is invalid for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNLIKELY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires encryption before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute type is not a supported grouping attribute as defined by a higher layer specification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient Resources to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNKNOWN_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error that lies in the reserved range has been received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetdescriptorvalue
     * @since windows8.0
     */
    static BluetoothGATTGetDescriptorValue(hDevice, Descriptor, DescriptorValueDataSize, DescriptorValue, DescriptorValueSizeRequired, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTGetDescriptorValue", "ptr", hDevice, "ptr", Descriptor, "uint", DescriptorValueDataSize, "ptr", DescriptorValue, "ushort*", DescriptorValueSizeRequired, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The BluetoothGATTBeginReliableWrite function specifies that reliable writes are about to begin.
     * @param {HANDLE} hDevice Handle to the service.
     * @param {Pointer<UInt64>} ReliableWriteContext Address of a <b>BTH_LE_GATT_RELIABLE_WRITE_CONTEXT</b> structure containing the context describing the reliable write operation.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTBeginReliableWrite</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The <b>BluetoothGATTBeginReliableWrite</b> function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A reliable write operation is already presently underway.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattbeginreliablewrite
     * @since windows8.0
     */
    static BluetoothGATTBeginReliableWrite(hDevice, ReliableWriteContext, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTBeginReliableWrite", "ptr", hDevice, "uint*", ReliableWriteContext, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes the specified characteristic value to the Bluetooth device.
     * @param {HANDLE} hDevice Handle to the service.
     * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC>} Characteristic Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_characteristic">BTH_LE_GATT_CHARACTERISTIC</a> structure containing the parent characteristic.
     * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC_VALUE>} CharacteristicValue Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_characteristic_value">BTH_LE_GATT_CHARACTERISTIC_VALUE</a> structure containing the characteristic value.
     * @param {Integer} ReliableWriteContext BTH_LE_GATT_RELIABLE_WRITE_CONTEXT structure containint the context describing the reliable write operation returned from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattbeginreliablewrite">BluetoothGATTBeginReliableWrite</a>.
     * @param {Integer} Flags Flags to modify the behavior of BluetoothGATTSetCharacteristicValue:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_CONNECTION_ENCRYPTED</b>
     * 
     * </td>
     * <td>
     * The client requests the data to be transmitted over an encrypted channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_CONNECTION_AUTHENTICATED</b>
     * 
     * </td>
     * <td>
     * The client requests the data to be transmitted over an authenticated channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_WRITE_WITHOUT_RESPONSE</b>
     * 
     * </td>
     * <td>
     * Write without response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_SIGNED_WRITE</b>
     * 
     * </td>
     * <td>
     * Signed write. Profile drivers must use with <b>BLUETOOTH_GATT_FLAG_WRITE_WITHOUT_RESPONSE</b> in order to produce signed write without a response.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The <b>BluetoothGATTSetCharacteristicValue</b> function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_RESP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target server did not provide an
     *             appropriate network response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request timed-out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A reliable write operation is already presently underway.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute handle given was not valid on this server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_READ_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_PDU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute PDU was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authentication before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attribute server does not support the request received from the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_OFFSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Offset specified was past the end of the attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authorization before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Too many prepare writes have been queued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No attribute found within the given attribute handle range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read or written using the Read Blob Request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Encryption Key Size used for encrypting this link is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute value length is invalid for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNLIKELY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires encryption before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute type is not a supported grouping attribute as defined by a higher layer specification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient Resources to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNKNOWN_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error that lies in the reserved range has been received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattsetcharacteristicvalue
     * @since windows8.0
     */
    static BluetoothGATTSetCharacteristicValue(hDevice, Characteristic, CharacteristicValue, ReliableWriteContext, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTSetCharacteristicValue", "ptr", hDevice, "ptr", Characteristic, "ptr", CharacteristicValue, "uint", ReliableWriteContext, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Specifies the end of reliable writes, and the writes should be committed.
     * @param {HANDLE} hDevice Handle to the service.
     * @param {Integer} ReliableWriteContext The context describing the reliable write operation returned from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattbeginreliablewrite">BluetoothGATTBeginReliableWrite</a>.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTEndReliableWrite</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The <b>BluetoothGATTEndReliableWrite</b> function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A reliable write operation is not presently underway.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_RESP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target server did not provide an
     *             appropriate network response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request timed-out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute handle given was not valid on this server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_READ_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_PDU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute PDU was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authentication before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attribute server does not support the request received from the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_OFFSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Offset specified was past the end of the attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authorization before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Too many prepare writes have been queued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No attribute found within the given attribute handle range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read or written using the Read Blob Request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Encryption Key Size used for encrypting this link is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute value length is invalid for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNLIKELY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires encryption before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute type is not a supported grouping attribute as defined by a higher layer specification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient Resources to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNKNOWN_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error that lies in the reserved range has been received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattendreliablewrite
     * @since windows8.0
     */
    static BluetoothGATTEndReliableWrite(hDevice, ReliableWriteContext, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTEndReliableWrite", "ptr", hDevice, "uint", ReliableWriteContext, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Specifies the end of reliable write procedures, and the writes should be aborted.
     * @param {HANDLE} hDevice Handle to the service.
     * @param {Integer} ReliableWriteContext The context describing the reliable write operation returned from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattbeginreliablewrite">BluetoothGATTBeginReliableWrite</a>.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTAbortReliableWrite</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The <b>BluetoothGATTAbortReliableWrite</b> function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A reliable write operation is not presently underway.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_RESP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target server did not provide an
     *             appropriate network response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request timed-out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute handle given was not valid on this server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_READ_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_PDU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute PDU was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authentication before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attribute server does not support the request received from the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_OFFSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Offset specified was past the end of the attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authorization before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Too many prepare writes have been queued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No attribute found within the given attribute handle range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read or written using the Read Blob Request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Encryption Key Size used for encrypting this link is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute value length is invalid for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNLIKELY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires encryption before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute type is not a supported grouping attribute as defined by a higher layer specification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient Resources to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNKNOWN_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error that lies in the reserved range has been received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattabortreliablewrite
     * @since windows8.0
     */
    static BluetoothGATTAbortReliableWrite(hDevice, ReliableWriteContext, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTAbortReliableWrite", "ptr", hDevice, "uint", ReliableWriteContext, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes the specified descriptor value to the Bluetooth device.
     * @param {HANDLE} hDevice Handle to the service.
     * @param {Pointer<BTH_LE_GATT_DESCRIPTOR>} Descriptor Pointer to the parent descriptor.
     * @param {Pointer<BTH_LE_GATT_DESCRIPTOR_VALUE>} DescriptorValue Pointer to the descriptor's value.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTSetDescriptorValue</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_CONNECTION_ENCRYPTED</b>
     * 
     * </td>
     * <td>
     * The client requests the data to be transmitted over an encrypted channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_CONNECTION_AUTHENTICATED</b>
     * 
     * </td>
     * <td>
     * The client requests the data to be transmitted over an authenticated channel.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The BluetoothGATTSetDescriptorValue function returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_RESP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target server did not provide an
     *             appropriate network response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request timed-out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute handle given was not valid on this server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_READ_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_PDU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute PDU was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authentication before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attribute server does not support the request received from the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_OFFSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Offset specified was past the end of the attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires authorization before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Too many prepare writes have been queued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No attribute found within the given attribute handle range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be read or written using the Read Blob Request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Encryption Key Size used for encrypting this link is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute value length is invalid for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNLIKELY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute requires encryption before it can be read or written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute type is not a supported grouping attribute as defined by a higher layer specification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient Resources to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BLUETOOTH_ATT_UNKNOWN_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error that lies in the reserved range has been received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattsetdescriptorvalue
     * @since windows8.0
     */
    static BluetoothGATTSetDescriptorValue(hDevice, Descriptor, DescriptorValue, Flags) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("BluetoothApis.dll\BluetoothGATTSetDescriptorValue", "ptr", hDevice, "ptr", Descriptor, "ptr", DescriptorValue, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a routine to be called back during a characteristic value change event on the given characteristic identified by its characteristic handle.
     * @param {HANDLE} hService Handle to the service.
     * @param {Integer} EventType A value from <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ne-bthledef-bth_le_gatt_event_type">BTH_LE_GATT_EVENT_TYPE</a>. Currently, only <b>CharacteristicValueChangedEvent</b> is supported.
     * @param {Pointer<Void>} EventParameterIn Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bluetooth_gatt_value_changed_event_registration">BLUETOOTH_GATT_VALUE_CHANGED_EVENT_REGISTRATION</a> structure to pass when the event is triggered.
     * @param {Pointer<PFNBLUETOOTH_GATT_EVENT_CALLBACK>} Callback The routine to call when the Characteristic value changes.
     * @param {Pointer<Void>} CallbackContext Context to pass to <i>Callback</i>.
     * @param {Pointer<IntPtr>} pEventHandle Pointer to buffer to receive a handle for the registration.  Profile drivers must pass this handle when calling <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattunregisterevent">BluetoothGATTUnregisterEvent</a>.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTRegisterEvent</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} <b>BluetoothGATTRegisterEvent</b> returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent
     * @since windows8.0
     */
    static BluetoothGATTRegisterEvent(hService, EventType, EventParameterIn, Callback, CallbackContext, pEventHandle, Flags) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        result := DllCall("BluetoothApis.dll\BluetoothGATTRegisterEvent", "ptr", hService, "int", EventType, "ptr", EventParameterIn, "ptr", Callback, "ptr", CallbackContext, "ptr*", pEventHandle, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters the given characteristic value change event.
     * @param {Pointer} EventHandle Handle returned from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a>.
     * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTUnregisterEvent</b>:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>BLUETOOTH_GATT_FLAG_NONE</b>
     * 
     * </td>
     * <td>
     * The client does not have specific GATT requirements (default).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} <b>BluetoothGATTUnregisterEvent</b> returns the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bluetoothleapis/nf-bluetoothleapis-bluetoothgattunregisterevent
     * @since windows8.0
     */
    static BluetoothGATTUnregisterEvent(EventHandle, Flags) {
        result := DllCall("BluetoothApis.dll\BluetoothGATTUnregisterEvent", "ptr", EventHandle, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
