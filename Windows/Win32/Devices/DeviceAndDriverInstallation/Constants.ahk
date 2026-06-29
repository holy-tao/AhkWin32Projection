#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CM_PROB_V1 := 37

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CM_PROB_V2 := 50

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CM_PROB_V3 := 51

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CM_PROB_V4 := 52

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CM_PROB_V5 := 53

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CM_PROB_V6 := 54

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CM_PROB_V7 := 55

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CM_PROB_V8 := 57

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CM_PROB_V9 := 58

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CM_PROB := 58

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_FORCECONFIG := 0

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_BOOTCONFIG := 1

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_DESIRED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_NORMAL := 12288

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_LASTBESTCONFIG := 16383

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_SUBOPTIMAL := 20480

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_LASTSOFTCONFIG := 32767

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_RESTART := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_REBOOT := 36864

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_POWEROFF := 40960

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_HARDRECONFIG := 49152

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_HARDWIRED := 57344

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_IMPOSSIBLE := 61440

/**
 * @type {Integer (UInt32)}
 */
export global LCPRI_DISABLED := 65535

/**
 * @type {Integer (UInt32)}
 */
export global MAX_LCPRI := 65535

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_SIDE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_SIDE_TOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_SIDE_BOTTOM := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_SIDE_LEFT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_SIDE_RIGHT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_SIDE_FRONT := 5

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_SIDE_BACK := 6

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_EDGE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_EDGE_TOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_EDGE_BOTTOM := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_EDGE_LEFT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_EDGE_RIGHT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_SHAPE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_SHAPE_RECTANGLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_SHAPE_OVAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_ORIENTATION_HORIZONTAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_ORIENTATION_VERTICAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_JOINT_TYPE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_JOINT_TYPE_PLANAR := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_JOINT_TYPE_HINGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_JOINT_TYPE_PIVOT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_PANEL_JOINT_TYPE_SWIVEL := 4

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_1394 := Guid("{6bdd1fc1-810f-11d0-bec7-08002be2092f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_1394DEBUG := Guid("{66f250d6-7801-4a64-b139-eea80a450b24}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_61883 := Guid("{7ebefbc0-3200-11d2-b4c2-00a0c9697d07}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_ADAPTER := Guid("{4d36e964-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_APMSUPPORT := Guid("{d45b1c18-c8fa-11d1-9f77-0000f805f530}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_AUDIOPROCESSINGOBJECT := Guid("{5989fce8-9cd0-467d-8a6a-5419e31529d4}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_AVC := Guid("{c06ff265-ae09-48f0-812c-16753d7cba83}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_BATTERY := Guid("{72631e54-78a4-11d0-bcf7-00aa00b7b32a}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_BIOMETRIC := Guid("{53d29ef7-377c-4d14-864b-eb3a85769359}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_BLUETOOTH := Guid("{e0cbf06c-cd8b-4647-bb8a-263b43f0f974}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_CAMERA := Guid("{ca3e7ab9-b4c3-4ae6-8251-579ef933890f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_CDROM := Guid("{4d36e965-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_COMPUTEACCELERATOR := Guid("{f01a9d53-3ff6-48d2-9f97-c8a7004be10c}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_COMPUTER := Guid("{4d36e966-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_DECODER := Guid("{6bdd1fc2-810f-11d0-bec7-08002be2092f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_DISKDRIVE := Guid("{4d36e967-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_DISPLAY := Guid("{4d36e968-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_DOT4 := Guid("{48721b56-6795-11d2-b1a8-0080c72e74a2}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_DOT4PRINT := Guid("{49ce6ac8-6f86-11d2-b1e5-0080c72e74a2}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_EHSTORAGESILO := Guid("{9da2b80f-f89f-4a49-a5c2-511b085b9e8a}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_ENUM1394 := Guid("{c459df55-db08-11d1-b009-00a0c9081ff6}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_EXTENSION := Guid("{e2f84ce7-8efa-411c-aa69-97454ca4cb57}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FDC := Guid("{4d36e969-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FIRMWARE := Guid("{f2e7dd72-6468-4e36-b6f1-6488f42c1b52}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FLOPPYDISK := Guid("{4d36e980-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_GENERIC := Guid("{ff494df1-c4ed-4fac-9b3f-3786f6e91e7e}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_GPS := Guid("{6bdd1fc3-810f-11d0-bec7-08002be2092f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_HDC := Guid("{4d36e96a-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_HIDCLASS := Guid("{745a17a0-74d3-11d0-b6fe-00a0c90f57da}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_HOLOGRAPHIC := Guid("{d612553d-06b1-49ca-8938-e39ef80eb16f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_I3C := Guid("{13cfe1b1-6b17-424c-ac3f-16ace8733898}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_IMAGE := Guid("{6bdd1fc6-810f-11d0-bec7-08002be2092f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_INFINIBAND := Guid("{30ef7132-d858-4a0c-ac24-b9028a5cca3f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_INFRARED := Guid("{6bdd1fc5-810f-11d0-bec7-08002be2092f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_KEYBOARD := Guid("{4d36e96b-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_LEGACYDRIVER := Guid("{8ecc055d-047f-11d1-a537-0000f8753ed1}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_MEDIA := Guid("{4d36e96c-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_MEDIUM_CHANGER := Guid("{ce5939ae-ebde-11d0-b181-0000f8753ec4}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_MEMORY := Guid("{5099944a-f6b9-4057-a056-8c550228544c}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_MODEM := Guid("{4d36e96d-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_MONITOR := Guid("{4d36e96e-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_MOUSE := Guid("{4d36e96f-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_MTD := Guid("{4d36e970-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_MULTIFUNCTION := Guid("{4d36e971-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_MULTIPORTSERIAL := Guid("{50906cb8-ba12-11d1-bf5d-0000f805f530}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_NET := Guid("{4d36e972-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_NETCLIENT := Guid("{4d36e973-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_NETDRIVER := Guid("{87ef9ad1-8f70-49ee-b215-ab1fcadcbe3c}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_NETSERVICE := Guid("{4d36e974-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_NETTRANS := Guid("{4d36e975-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_NETUIO := Guid("{78912bc1-cb8e-4b28-a329-f322ebadbe0f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_NODRIVER := Guid("{4d36e976-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_PCMCIA := Guid("{4d36e977-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_PNPPRINTERS := Guid("{4658ee7e-f050-11d1-b6bd-00c04fa372a7}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_PORTS := Guid("{4d36e978-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_PRIMITIVE := Guid("{242681d1-eed3-41d2-a1ef-1468fc843106}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_PRINTER := Guid("{4d36e979-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_PRINTERUPGRADE := Guid("{4d36e97a-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_PRINTQUEUE := Guid("{1ed2bbf9-11f0-4084-b21f-ad83a8e6dcdc}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_PROCESSOR := Guid("{50127dc3-0f36-415e-a6cc-4cb3be910b65}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SBP2 := Guid("{d48179be-ec20-11d1-b6b8-00c04fa372a7}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SCMDISK := Guid("{53966cb1-4d46-4166-bf23-c522403cd495}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SCMVOLUME := Guid("{53ccb149-e543-4c84-b6e0-bce4f6b7e806}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SCSIADAPTER := Guid("{4d36e97b-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SECURITYACCELERATOR := Guid("{268c95a1-edfe-11d3-95c3-0010dc4050a5}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SENSOR := Guid("{5175d334-c371-4806-b3ba-71fd53c9258d}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SIDESHOW := Guid("{997b5d8d-c442-4f2e-baf3-9c8e671e9e21}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SMARTCARDREADER := Guid("{50dd5230-ba8a-11d1-bf5d-0000f805f530}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SMRDISK := Guid("{53487c23-680f-4585-acc3-1f10d6777e82}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SMRVOLUME := Guid("{53b3cf03-8f5a-4788-91b6-d19ed9fcccbf}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SOFTWARECOMPONENT := Guid("{5c4c3332-344d-483c-8739-259e934c9cc8}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SOUND := Guid("{4d36e97c-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_SYSTEM := Guid("{4d36e97d-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_TAPEDRIVE := Guid("{6d807884-7d21-11cf-801c-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_THERMAL := Guid("{ca301ce1-74fc-45ea-a557-461ef48b9e37}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_UNKNOWN := Guid("{4d36e97e-e325-11ce-bfc1-08002be10318}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_UCM := Guid("{e6f1aa1c-7f3b-4473-b2e8-c97d8ac71d53}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_USB := Guid("{36fc9e60-c465-11cf-8056-444553540000}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_VOLUME := Guid("{71a27cdd-812a-11d0-bec7-08002be2092f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_VOLUMESNAPSHOT := Guid("{533c5b84-ec70-11d2-9505-00c04f79deaf}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_WCEUSBS := Guid("{25dbce51-6c8f-4a72-8a6d-b54c2b4fc835}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_WPD := Guid("{eec5ad98-8080-425f-922a-dabf3de3f69a}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_TOP := Guid("{b369baf4-5568-4e82-a87e-a93eb16bca87}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_ACTIVITYMONITOR := Guid("{b86dff51-a31e-4bac-b3cf-e8cfe75c9fc2}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_UNDELETE := Guid("{fe8f1572-c67a-48c0-bbac-0b5c6d66cafb}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_ANTIVIRUS := Guid("{b1d1a169-c54f-4379-81db-bee7d88d7454}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_REPLICATION := Guid("{48d3ebc4-4cf8-48ff-b869-9c68ad42eb9f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_CONTINUOUSBACKUP := Guid("{71aa14f8-6fad-4622-ad77-92bb9d7e6947}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_CONTENTSCREENER := Guid("{3e3f0674-c83c-4558-bb26-9820e1eba5c5}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_QUOTAMANAGEMENT := Guid("{8503c911-a6c7-4919-8f79-5028f5866b0c}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_SYSTEMRECOVERY := Guid("{2db15374-706e-4131-a0c7-d7c78eb0289a}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_CFSMETADATASERVER := Guid("{cdcf0939-b75b-4630-bf76-80f7ba655884}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_HSM := Guid("{d546500a-2aeb-45f6-9482-f4b1799c3177}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_COMPRESSION := Guid("{f3586baf-b5aa-49b5-8d6c-0569284c639f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_ENCRYPTION := Guid("{a0a701c0-a511-42ff-aa6c-06dc0395576f}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_VIRTUALIZATION := Guid("{f75a86c0-10d8-4c3a-b233-ed60e4cdfaac}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_PHYSICALQUOTAMANAGEMENT := Guid("{6a0a8e78-bba6-4fc4-a709-1e33cd09d67e}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_OPENFILEBACKUP := Guid("{f8ecafa6-66d1-41a5-899b-66585d7216b7}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_SECURITYENHANCER := Guid("{d02bc3da-0c8e-4945-9bd5-f1883c226c8c}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_COPYPROTECTION := Guid("{89786ff1-9c12-402f-9c9e-17753c7f4375}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_BOTTOM := Guid("{37765ea0-5958-4fc9-b04b-2fdfef97e59e}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_SYSTEM := Guid("{5d1b9aaa-01e2-46af-849f-272b3f324c46}")

/**
 * @type {Guid}
 */
export global GUID_DEVCLASS_FSFILTER_INFRASTRUCTURE := Guid("{e55fa6f9-128c-4d04-abab-630c74b1453a}")

/**
 * @type {Integer (UInt32)}
 */
export global LINE_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_INF_STRING_LENGTH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MAX_INF_SECTION_NAME_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global MAX_TITLE_LEN := 60

/**
 * @type {Integer (UInt32)}
 */
export global MAX_INSTRUCTION_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_LABEL_LEN := 30

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SERVICE_NAME_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SUBTITLE_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global SP_MAX_MACHINENAME_LENGTH := 263

/**
 * @type {Integer (UInt32)}
 */
export global SP_ALTPLATFORM_FLAGS_VERSION_RANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SP_ALTPLATFORM_FLAGS_SUITE_MASK := 2

/**
 * @type {Integer (Int32)}
 */
export global DIRID_ABSOLUTE := -1

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_ABSOLUTE_16BIT := 65535

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_NULL := 0

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_SRCPATH := 1

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_WINDOWS := 10

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_SYSTEM := 11

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_DRIVERS := 12

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_IOSUBSYS := 12

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_DRIVER_STORE := 13

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_INF := 17

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_HELP := 18

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_FONTS := 20

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_VIEWERS := 21

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_COLOR := 23

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_APPS := 24

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_SHARED := 25

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_BOOT := 30

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_SYSTEM16 := 50

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_SPOOL := 51

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_SPOOLDRIVERS := 52

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_USERPROFILE := 53

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_LOADER := 54

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_PRINTPROCESSOR := 55

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_DEFAULT := 11

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_COMMON_STARTMENU := 16406

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_COMMON_PROGRAMS := 16407

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_COMMON_STARTUP := 16408

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_COMMON_DESKTOPDIRECTORY := 16409

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_COMMON_FAVORITES := 16415

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_COMMON_APPDATA := 16419

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_PROGRAM_FILES := 16422

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_SYSTEM_X86 := 16425

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_PROGRAM_FILES_X86 := 16426

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_PROGRAM_FILES_COMMON := 16427

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_PROGRAM_FILES_COMMONX86 := 16428

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_COMMON_TEMPLATES := 16429

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_COMMON_DOCUMENTS := 16430

/**
 * @type {Integer (UInt32)}
 */
export global DIRID_USER := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_STARTQUEUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_ENDQUEUE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_STARTSUBQUEUE := 3

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_ENDSUBQUEUE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_STARTDELETE := 5

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_ENDDELETE := 6

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_DELETEERROR := 7

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_STARTRENAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_ENDRENAME := 9

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_RENAMEERROR := 10

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_STARTCOPY := 11

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_ENDCOPY := 12

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_COPYERROR := 13

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_NEEDMEDIA := 14

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_QUEUESCAN := 15

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_CABINETINFO := 16

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_FILEINCABINET := 17

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_NEEDNEWCABINET := 18

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_FILEEXTRACTED := 19

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_FILEOPDELAYED := 20

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_STARTBACKUP := 21

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_BACKUPERROR := 22

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_ENDBACKUP := 23

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_QUEUESCAN_EX := 24

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_STARTREGISTRATION := 25

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_ENDREGISTRATION := 32

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_QUEUESCAN_SIGNERINFO := 64

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_LANGMISMATCH := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_TARGETEXISTS := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SPFILENOTIFY_TARGETNEWER := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FILEOP_RENAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILEOP_BACKUP := 3

/**
 * @type {Integer (UInt32)}
 */
export global FILEOP_ABORT := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILEOP_DOIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILEOP_SKIP := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILEOP_RETRY := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILEOP_NEWPATH := 4

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_WARN_IF_SKIP := 1

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_NOSKIP := 2

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_NOVERSIONCHECK := 4

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_FORCE_FILE_IN_USE := 8

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_NO_OVERWRITE := 16

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_NO_VERSION_DIALOG := 32

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_OVERWRITE_OLDER_ONLY := 64

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_PROTECTED_WINDOWS_DRIVER_FILE := 256

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_REPLACEONLY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_NODECOMP := 2048

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_REPLACE_BOOT_FILE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_NOPRUNE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global COPYFLG_IN_USE_TRY_RENAME := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DELFLG_IN_USE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DELFLG_IN_USE1 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SPREG_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global SPREG_LOADLIBRARY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPREG_GETPROCADDR := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPREG_REGSVR := 3

/**
 * @type {Integer (UInt32)}
 */
export global SPREG_DLLINSTALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global SPREG_TIMEOUT := 5

/**
 * @type {Integer (UInt32)}
 */
export global SPREG_UNKNOWN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global SPINT_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPINT_DEFAULT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPINT_REMOVED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SPID_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPID_DEFAULT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPID_REMOVED := 4

/**
 * @type {Integer (UInt32)}
 */
export global ENABLECLASS_QUERY := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENABLECLASS_SUCCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENABLECLASS_FAILURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_INSTALLWIZARD_DYNAPAGES := 20

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_DIDFACTDEFS := 1

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_HARDWAREALLREADYIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_NEEDSHUTDOWN := 512

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_EXPRESSINTRO := 1024

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_SKIPISDEVINSTALLED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_NODETECTEDDEVS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_INSTALLSPECIFIC := 8192

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_SKIPCLASSLIST := 16384

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_CI_PICKED_OEM := 32768

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_PCMCIAMODE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_PCMCIADEVICE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_USERCANCEL := 262144

/**
 * @type {Integer (UInt32)}
 */
export global NDW_INSTALLFLAG_KNOWNCLASS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global DYNAWIZ_FLAG_PAGESADDED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DYNAWIZ_FLAG_ANALYZE_HANDLECONFLICT := 8

/**
 * @type {Integer (UInt32)}
 */
export global DYNAWIZ_FLAG_INSTALLDET_NEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DYNAWIZ_FLAG_INSTALLDET_PREV := 4

/**
 * @type {Integer (UInt32)}
 */
export global MIN_IDD_DYNAWIZ_RESOURCE_ID := 10000

/**
 * @type {Integer (UInt32)}
 */
export global MAX_IDD_DYNAWIZ_RESOURCE_ID := 11000

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_FIRSTPAGE := 10000

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_SELECT_PREVPAGE := 10001

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_SELECT_NEXTPAGE := 10002

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_ANALYZE_PREVPAGE := 10003

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_ANALYZE_NEXTPAGE := 10004

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_SELECTDEV_PAGE := 10009

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_ANALYZEDEV_PAGE := 10010

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_INSTALLDETECTEDDEVS_PAGE := 10011

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_SELECTCLASS_PAGE := 10012

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_INSTALLDETECTED_PREVPAGE := 10006

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_INSTALLDETECTED_NEXTPAGE := 10007

/**
 * @type {Integer (UInt32)}
 */
export global IDD_DYNAWIZ_INSTALLDETECTED_NODEVS := 10008

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_HARDWAREID_RANK := 4095

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_HARDWAREID_MASK := 2147487743

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_UNTRUSTED_RANK := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_W9X_SUSPECT_RANK := 3221225472

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_COMPATID_RANK := 16383

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_UNTRUSTED_HARDWAREID_RANK := 36863

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_UNTRUSTED_COMPATID_RANK := 49151

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_W9X_SUSPECT_HARDWAREID_RANK := 53247

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_W9X_SUSPECT_COMPATID_RANK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global SPPSR_SELECT_DEVICE_RESOURCES := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPPSR_ENUM_BASIC_DEVICE_PROPERTIES := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPPSR_ENUM_ADV_DEVICE_PROPERTIES := 3

/**
 * @type {Integer (UInt32)}
 */
export global INFINFO_INF_SPEC_IS_HINF := 1

/**
 * @type {Integer (UInt32)}
 */
export global INFINFO_INF_NAME_IS_ABSOLUTE := 2

/**
 * @type {Integer (UInt32)}
 */
export global INFINFO_DEFAULT_SEARCH := 3

/**
 * @type {Integer (UInt32)}
 */
export global INFINFO_REVERSE_DEFAULT_SEARCH := 4

/**
 * @type {Integer (UInt32)}
 */
export global INFINFO_INF_PATH_LIST_SEARCH := 5

/**
 * @type {Integer (UInt32)}
 */
export global SRCLIST_TEMPORARY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SRCLIST_NOBROWSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SRCLIST_SYSTEM := 16

/**
 * @type {Integer (UInt32)}
 */
export global SRCLIST_USER := 32

/**
 * @type {Integer (UInt32)}
 */
export global SRCLIST_SYSIFADMIN := 64

/**
 * @type {Integer (UInt32)}
 */
export global SRCLIST_SUBDIRS := 256

/**
 * @type {Integer (UInt32)}
 */
export global SRCLIST_APPEND := 512

/**
 * @type {Integer (UInt32)}
 */
export global SRCLIST_NOSTRIPPLATFORM := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IDF_NOBROWSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IDF_NOSKIP := 2

/**
 * @type {Integer (UInt32)}
 */
export global IDF_NODETAILS := 4

/**
 * @type {Integer (UInt32)}
 */
export global IDF_NOCOMPRESSED := 8

/**
 * @type {Integer (UInt32)}
 */
export global IDF_CHECKFIRST := 256

/**
 * @type {Integer (UInt32)}
 */
export global IDF_NOBEEP := 512

/**
 * @type {Integer (UInt32)}
 */
export global IDF_NOFOREGROUND := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IDF_WARNIFSKIP := 2048

/**
 * @type {Integer (UInt32)}
 */
export global IDF_NOREMOVABLEMEDIAPROMPT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global IDF_USEDISKNAMEASPROMPT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global IDF_OEMDISK := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DPROMPT_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global DPROMPT_CANCEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global DPROMPT_SKIPFILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DPROMPT_BUFFERTOOSMALL := 3

/**
 * @type {Integer (UInt32)}
 */
export global DPROMPT_OUTOFMEMORY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SETDIRID_NOT_FULL_PATH := 1

/**
 * @type {Integer (UInt32)}
 */
export global SRCINFO_PATH := 1

/**
 * @type {Integer (UInt32)}
 */
export global SRCINFO_TAGFILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SRCINFO_DESCRIPTION := 3

/**
 * @type {Integer (UInt32)}
 */
export global SRCINFO_FLAGS := 4

/**
 * @type {Integer (UInt32)}
 */
export global SRCINFO_TAGFILE2 := 5

/**
 * @type {Integer (UInt32)}
 */
export global SRC_FLAGS_CABFILE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SP_FLAG_CABINETCONTINUATION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SP_BACKUP_BACKUPPASS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SP_BACKUP_DEMANDPASS := 2

/**
 * @type {Integer (UInt32)}
 */
export global SP_BACKUP_SPECIAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global SP_BACKUP_BOOTFILE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SPQ_DELAYED_COPY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPQ_FLAG_BACKUP_AWARE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPQ_FLAG_ABORT_IF_UNSIGNED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPQ_FLAG_FILES_MODIFIED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SPQ_FLAG_DO_SHUFFLEMOVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SPQ_FLAG_VALID := 15

/**
 * @type {Integer (UInt32)}
 */
export global SPOST_MAX := 3

/**
 * @type {Integer (UInt32)}
 */
export global SUOI_FORCEDELETE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SUOI_INTERNAL1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPDSL_IGNORE_DISK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPDSL_DISALLOW_NEGATIVE_ADJUST := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPFILEQ_FILE_IN_USE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPFILEQ_REBOOT_RECOMMENDED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPFILEQ_REBOOT_IN_PROGRESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_DELREG_BIT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_BINVALUETYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_NOCLOBBER := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_DELVAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_APPEND := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_KEYONLY := 16

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_OVERWRITEONLY := 32

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_64BITKEY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_KEYONLY_COMMON := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_32BITKEY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_TYPE_SZ := 0

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_TYPE_MULTI_SZ := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDREG_TYPE_EXPAND_SZ := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FLG_DELREG_VALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FLG_DELREG_TYPE_SZ := 0

/**
 * @type {Integer (UInt32)}
 */
export global FLG_DELREG_TYPE_MULTI_SZ := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FLG_DELREG_TYPE_EXPAND_SZ := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FLG_DELREG_64BITKEY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FLG_DELREG_KEYONLY_COMMON := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FLG_DELREG_32BITKEY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FLG_DELREG_OPERATION_MASK := 254

/**
 * @type {Integer (UInt32)}
 */
export global FLG_BITREG_CLEARBITS := 0

/**
 * @type {Integer (UInt32)}
 */
export global FLG_BITREG_SETBITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLG_BITREG_64BITKEY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FLG_BITREG_32BITKEY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FLG_INI2REG_64BITKEY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FLG_INI2REG_32BITKEY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FLG_REGSVR_DLLREGISTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLG_REGSVR_DLLINSTALL := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLG_PROFITEM_CURRENTUSER := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLG_PROFITEM_DELETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLG_PROFITEM_GROUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLG_PROFITEM_CSIDL := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDPROPERTY_NOCLOBBER := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDPROPERTY_OVERWRITEONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDPROPERTY_APPEND := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDPROPERTY_OR := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLG_ADDPROPERTY_AND := 16

/**
 * @type {Integer (UInt32)}
 */
export global FLG_DELPROPERTY_MULTI_SZ_DELSTRING := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_LOGCONFIG := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_INIFILES := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_REGISTRY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_INI2REG := 8

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_FILES := 16

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_BITREG := 32

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_REGSVR := 64

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_UNREGSVR := 128

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_PROFILEITEMS := 256

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_COPYINF := 512

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_PROPERTIES := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_ALL := 2047

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_SINGLESECTION := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_LOGCONFIG_IS_FORCED := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_LOGCONFIGS_ARE_OVERRIDES := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_REGISTERCALLBACKAWARE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SPINST_DEVICEINSTALL := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SPFILELOG_SYSTEMLOG := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPFILELOG_FORCENEW := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPFILELOG_QUERYONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SPFILELOG_OEMFILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LogSevInformation := 0

/**
 * @type {Integer (UInt32)}
 */
export global LogSevWarning := 1

/**
 * @type {Integer (UInt32)}
 */
export global LogSevError := 2

/**
 * @type {Integer (UInt32)}
 */
export global LogSevFatalError := 3

/**
 * @type {Integer (UInt32)}
 */
export global LogSevMaximum := 4

/**
 * @type {Integer (UInt32)}
 */
export global DIOD_INHERIT_CLASSDRVS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DIOD_CANCEL_REMOVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DIODI_NO_ADD := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPRDI_FIND_DUPS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPDIT_NODRIVER := 0

/**
 * @type {Integer (UInt32)}
 */
export global DIBCI_NOINSTALLCLASS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DIBCI_NODISPLAYCLASS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DIOCR_INSTALLER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DIOCR_INTERFACE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DIREG_DEV := 1

/**
 * @type {Integer (UInt32)}
 */
export global DIREG_DRV := 2

/**
 * @type {Integer (UInt32)}
 */
export global DIREG_BOTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global DICLASSPROP_INSTALLER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DICLASSPROP_INTERFACE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPCRP_UPPERFILTERS := 17

/**
 * @type {Integer (UInt32)}
 */
export global SPCRP_LOWERFILTERS := 18

/**
 * @type {Integer (UInt32)}
 */
export global SPCRP_SECURITY := 23

/**
 * @type {Integer (UInt32)}
 */
export global SPCRP_SECURITY_SDS := 24

/**
 * @type {Integer (UInt32)}
 */
export global SPCRP_DEVTYPE := 25

/**
 * @type {Integer (UInt32)}
 */
export global SPCRP_EXCLUSIVE := 26

/**
 * @type {Integer (UInt32)}
 */
export global SPCRP_CHARACTERISTICS := 27

/**
 * @type {Integer (UInt32)}
 */
export global SPCRP_MAXIMUM_PROPERTY := 28

/**
 * @type {Integer (UInt32)}
 */
export global DMI_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMI_BKCOLOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMI_USERECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DIGCDP_FLAG_BASIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global DIGCDP_FLAG_ADVANCED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DIGCDP_FLAG_REMOTE_BASIC := 3

/**
 * @type {Integer (UInt32)}
 */
export global DIGCDP_FLAG_REMOTE_ADVANCED := 4

/**
 * @type {Integer (UInt32)}
 */
export global IDI_RESOURCEFIRST := 159

/**
 * @type {Integer (UInt32)}
 */
export global IDI_RESOURCE := 159

/**
 * @type {Integer (UInt32)}
 */
export global IDI_RESOURCELAST := 161

/**
 * @type {Integer (UInt32)}
 */
export global IDI_RESOURCEOVERLAYFIRST := 161

/**
 * @type {Integer (UInt32)}
 */
export global IDI_RESOURCEOVERLAYLAST := 161

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CONFLICT := 161

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CLASSICON_OVERLAYFIRST := 500

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CLASSICON_OVERLAYLAST := 502

/**
 * @type {Integer (UInt32)}
 */
export global IDI_PROBLEM_OVL := 500

/**
 * @type {Integer (UInt32)}
 */
export global IDI_DISABLED_OVL := 501

/**
 * @type {Integer (UInt32)}
 */
export global IDI_FORCED_OVL := 502

/**
 * @type {Integer (UInt32)}
 */
export global SPWPT_SELECTDEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPWP_USE_DEVINFO_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_UNKNOWN := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_W9X_SUSPECT := 3221225472

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_UNSIGNED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_AUTHENTICODE := 251658240

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_WHQL := 218103813

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_UNCLASSIFIED := 218103812

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_INBOX := 218103811

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_LOGO_STANDARD := 218103810

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_LOGO_PREMIUM := 218103809

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_MASK := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global SIGNERSCORE_SIGNED_MASK := 4026531840

/**
 * @type {Integer (UInt32)}
 */
export global DICUSTOMDEVPROP_MERGE_MULTISZ := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCWMI_CLOBBER_SECURITY := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DEVICE_ID_LEN := 200

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DEVNODE_ID_LEN := 200

/**
 * @type {Integer (UInt32)}
 */
export global MAX_GUID_STRING_LEN := 39

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CLASS_NAME_LEN := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PROFILE_LEN := 80

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CONFIG_VALUE := 9999

/**
 * @type {Integer (UInt32)}
 */
export global MAX_INSTANCE_VALUE := 9999

/**
 * @type {Integer (UInt32)}
 */
export global MAX_MEM_REGISTERS := 9

/**
 * @type {Integer (UInt32)}
 */
export global MAX_IO_PORTS := 20

/**
 * @type {Integer (UInt32)}
 */
export global MAX_IRQS := 7

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DMA_CHANNELS := 7

/**
 * @type {Integer (UInt32)}
 */
export global DWORD_MAX := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CONFIGMG_VERSION := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IO_ALIAS_10_BIT_DECODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IO_ALIAS_12_BIT_DECODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global IO_ALIAS_16_BIT_DECODE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IO_ALIAS_POSITIVE_DECODE := 255

/**
 * @type {Integer (UInt32)}
 */
export global IOA_Local := 255

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESDES_WIDTH_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESDES_WIDTH_32 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESDES_WIDTH_64 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESDES_WIDTH_BITS := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCD_MAX_MEMORY := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCD_MAX_IO := 2

/**
 * @type {Integer (UInt32)}
 */
export global mPMF_AUDIO_ENABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_HWPI_NOT_DOCKABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_HWPI_UNDOCKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_HWPI_DOCKED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_ADD_RANGE_ADDIFCONFLICT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_ADD_RANGE_DONOTADDIFCONFLICT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_ADD_RANGE_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOG_CONF_BITS := 7

/**
 * @type {Integer (UInt32)}
 */
export global PRIORITY_EQUAL_FIRST := 8

/**
 * @type {Integer (UInt32)}
 */
export global PRIORITY_EQUAL_LAST := 0

/**
 * @type {Integer (UInt32)}
 */
export global PRIORITY_BIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global RegDisposition_OpenAlways := 0

/**
 * @type {Integer (UInt32)}
 */
export global RegDisposition_OpenExisting := 1

/**
 * @type {Integer (UInt32)}
 */
export global RegDisposition_Bits := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_ADD_ID_HARDWARE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_ADD_ID_COMPATIBLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_ADD_ID_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVNODE_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVNODE_NO_WAIT_INSTALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVNODE_PHANTOM := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVNODE_GENERATE_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVNODE_DO_NOT_INSTALL := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVNODE_BITS := 15

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVINST_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVINST_NO_WAIT_INSTALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVINST_PHANTOM := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVINST_GENERATE_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVINST_DO_NOT_INSTALL := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_CREATE_DEVINST_BITS := 15

/**
 * @type {Integer (UInt32)}
 */
export global CM_DELETE_CLASS_ONLY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_DELETE_CLASS_SUBKEYS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_DELETE_CLASS_INTERFACE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_DELETE_CLASS_BITS := 3

/**
 * @type {Integer (UInt32)}
 */
export global CM_DETECT_NEW_PROFILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_DETECT_CRASHED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_DETECT_HWPROF_FIRST_BOOT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_DETECT_RUN := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CM_DETECT_BITS := 2147483655

/**
 * @type {Integer (UInt32)}
 */
export global CM_DISABLE_POLITE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_DISABLE_ABSOLUTE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_DISABLE_HARDWARE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_DISABLE_UI_NOT_OK := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_DISABLE_PERSIST := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_DISABLE_BITS := 15

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_ENUMERATOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_SERVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_EJECTRELATIONS := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_REMOVALRELATIONS := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_POWERRELATIONS := 16

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_BUSRELATIONS := 32

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_DONOTGENERATE := 268435520

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_BITS := 268435583

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_TRANSPORTRELATIONS := 128

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_PRESENT := 256

/**
 * @type {Integer (UInt32)}
 */
export global CM_GETIDLIST_FILTER_CLASS := 512

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_DEVICEDESC := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_HARDWAREID := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_COMPATIBLEIDS := 3

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_UNUSED0 := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_SERVICE := 5

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_UNUSED1 := 6

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_UNUSED2 := 7

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_CLASS := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_CLASSGUID := 9

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_DRIVER := 10

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_CONFIGFLAGS := 11

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_MFG := 12

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_FRIENDLYNAME := 13

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_LOCATION_INFORMATION := 14

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_PHYSICAL_DEVICE_OBJECT_NAME := 15

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_CAPABILITIES := 16

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_UI_NUMBER := 17

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_UPPERFILTERS := 18

/**
 * @type {Integer (UInt32)}
 */
export global CM_CRP_UPPERFILTERS := 18

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_LOWERFILTERS := 19

/**
 * @type {Integer (UInt32)}
 */
export global CM_CRP_LOWERFILTERS := 19

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_BUSTYPEGUID := 20

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_LEGACYBUSTYPE := 21

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_BUSNUMBER := 22

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_ENUMERATOR_NAME := 23

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_SECURITY := 24

/**
 * @type {Integer (UInt32)}
 */
export global CM_CRP_SECURITY := 24

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_SECURITY_SDS := 25

/**
 * @type {Integer (UInt32)}
 */
export global CM_CRP_SECURITY_SDS := 25

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_DEVTYPE := 26

/**
 * @type {Integer (UInt32)}
 */
export global CM_CRP_DEVTYPE := 26

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_EXCLUSIVE := 27

/**
 * @type {Integer (UInt32)}
 */
export global CM_CRP_EXCLUSIVE := 27

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_CHARACTERISTICS := 28

/**
 * @type {Integer (UInt32)}
 */
export global CM_CRP_CHARACTERISTICS := 28

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_ADDRESS := 29

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_UI_NUMBER_DESC_FORMAT := 30

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_DEVICE_POWER_DATA := 31

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_REMOVAL_POLICY := 32

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_REMOVAL_POLICY_HW_DEFAULT := 33

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_REMOVAL_POLICY_OVERRIDE := 34

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_INSTALL_STATE := 35

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_LOCATION_PATHS := 36

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_BASE_CONTAINERID := 37

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_MIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_CRP_MIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_DRP_MAX := 37

/**
 * @type {Integer (UInt32)}
 */
export global CM_CRP_MAX := 37

/**
 * @type {Integer (UInt32)}
 */
export global CM_OPEN_CLASS_KEY_INSTALLER := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_OPEN_CLASS_KEY_INTERFACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_OPEN_CLASS_KEY_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_REMOVE_UI_OK := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_REMOVE_UI_NOT_OK := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_REMOVE_NO_RESTART := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_REMOVE_DISABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_REMOVE_BITS := 7

/**
 * @type {Integer (UInt32)}
 */
export global CM_QUERY_REMOVE_UI_OK := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_QUERY_REMOVE_UI_NOT_OK := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_REGISTER_DEVICE_DRIVER_STATIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_REGISTER_DEVICE_DRIVER_DISABLEABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_REGISTER_DEVICE_DRIVER_REMOVABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_REGISTER_DEVICE_DRIVER_BITS := 3

/**
 * @type {Integer (UInt32)}
 */
export global CM_REGISTRY_HARDWARE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_REGISTRY_SOFTWARE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_REGISTRY_USER := 256

/**
 * @type {Integer (UInt32)}
 */
export global CM_REGISTRY_CONFIG := 512

/**
 * @type {Integer (UInt32)}
 */
export global CM_REGISTRY_BITS := 769

/**
 * @type {Integer (UInt32)}
 */
export global CM_SET_DEVNODE_PROBLEM_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_SET_DEVNODE_PROBLEM_OVERRIDE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_SET_DEVNODE_PROBLEM_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_SET_DEVINST_PROBLEM_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_SET_DEVINST_PROBLEM_OVERRIDE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_SET_DEVINST_PROBLEM_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_SET_HW_PROF_FLAGS_UI_NOT_OK := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_SET_HW_PROF_FLAGS_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVNODE_READY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVINST_READY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DOWNLOAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_WRITE_LOG_CONFS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_PROP_CHANGE := 3

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVNODE_RESET := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVINST_RESET := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVNODE_CONFIG := 5

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVINST_CONFIG := 5

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVNODE_CONFIG_CLASS := 6

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVINST_CONFIG_CLASS := 6

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVNODE_CONFIG_EXTENSIONS := 7

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVINST_CONFIG_EXTENSIONS := 7

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVNODE_CONFIG_RESET := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_DEVINST_CONFIG_RESET := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_SETUP_BITS := 15

/**
 * @type {Integer (UInt32)}
 */
export global CM_QUERY_ARBITRATOR_RAW := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_QUERY_ARBITRATOR_TRANSLATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_QUERY_ARBITRATOR_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_CUSTOMDEVPROP_MERGE_MULTISZ := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_CUSTOMDEVPROP_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_NAME_ATTRIBUTE_NAME_RETRIEVED_FROM_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_NAME_ATTRIBUTE_USER_ASSIGNED_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_CLASS_PROPERTY_INSTALLER := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_CLASS_PROPERTY_INTERFACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_CLASS_PROPERTY_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_NOTIFY_FILTER_FLAG_ALL_INTERFACE_CLASSES := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_NOTIFY_FILTER_FLAG_ALL_DEVICE_INSTANCES := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_GLOBAL_STATE_CAN_DO_UI := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_GLOBAL_STATE_ON_BIG_STACK := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_GLOBAL_STATE_SERVICES_AVAILABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_GLOBAL_STATE_SHUTTING_DOWN := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_GLOBAL_STATE_DETECTION_PENDING := 16

/**
 * @type {Integer (UInt32)}
 */
export global CM_GLOBAL_STATE_REBOOT_REQUIRED := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAX_KEY_LEN := 100

/**
 * @type {String}
 */
export global SZ_KEY_OPTIONDESC := "OptionDesc"

/**
 * @type {String}
 */
export global SZ_KEY_LDIDOEM := "LdidOEM"

/**
 * @type {String}
 */
export global SZ_KEY_SRCDISKFILES := "SourceDisksFiles"

/**
 * @type {String}
 */
export global SZ_KEY_SRCDISKNAMES := "SourceDisksNames"

/**
 * @type {String}
 */
export global SZ_KEY_STRINGS := "Strings"

/**
 * @type {String}
 */
export global SZ_KEY_DESTDIRS := "DestinationDirs"

/**
 * @type {String}
 */
export global SZ_KEY_LAYOUT_FILE := "LayoutFile"

/**
 * @type {String}
 */
export global SZ_KEY_DEFDESTDIR := "DefaultDestDir"

/**
 * @type {String}
 */
export global SZ_KEY_LFN_SECTION := "VarLDID.LFN"

/**
 * @type {String}
 */
export global SZ_KEY_SFN_SECTION := "VarLDID.SFN"

/**
 * @type {String}
 */
export global SZ_KEY_UPDATEINIS := "UpdateInis"

/**
 * @type {String}
 */
export global SZ_KEY_UPDATEINIFIELDS := "UpdateIniFields"

/**
 * @type {String}
 */
export global SZ_KEY_INI2REG := "Ini2Reg"

/**
 * @type {String}
 */
export global SZ_KEY_COPYFILES := "CopyFiles"

/**
 * @type {String}
 */
export global SZ_KEY_RENFILES := "RenFiles"

/**
 * @type {String}
 */
export global SZ_KEY_DELFILES := "DelFiles"

/**
 * @type {String}
 */
export global SZ_KEY_ADDREG := "AddReg"

/**
 * @type {String}
 */
export global SZ_KEY_ADDREGNOCLOBBER := "AddRegNoClobber"

/**
 * @type {String}
 */
export global SZ_KEY_DELREG := "DelReg"

/**
 * @type {String}
 */
export global SZ_KEY_BITREG := "BitReg"

/**
 * @type {String}
 */
export global SZ_KEY_COPYINF := "CopyINF"

/**
 * @type {String}
 */
export global SZ_KEY_LOGCONFIG := "LogConfig"

/**
 * @type {String}
 */
export global SZ_KEY_ADDSERVICE := "AddService"

/**
 * @type {String}
 */
export global SZ_KEY_DELSERVICE := "DelService"

/**
 * @type {String}
 */
export global SZ_KEY_ADDTRIGGER := "AddTrigger"

/**
 * @type {String}
 */
export global SZ_KEY_FAILUREACTIONS := "FailureActions"

/**
 * @type {String}
 */
export global SZ_KEY_ADDINTERFACE := "AddInterface"

/**
 * @type {String}
 */
export global SZ_KEY_ADDIME := "AddIme"

/**
 * @type {String}
 */
export global SZ_KEY_DELIME := "DelIme"

/**
 * @type {String}
 */
export global SZ_KEY_REGSVR := "RegisterDlls"

/**
 * @type {String}
 */
export global SZ_KEY_UNREGSVR := "UnregisterDlls"

/**
 * @type {String}
 */
export global SZ_KEY_PROFILEITEMS := "ProfileItems"

/**
 * @type {String}
 */
export global SZ_KEY_MODULES := "Modules"

/**
 * @type {String}
 */
export global SZ_KEY_DEFAULTOPTION := "DefaultOption"

/**
 * @type {String}
 */
export global SZ_KEY_LISTOPTIONS := "ListOptions"

/**
 * @type {String}
 */
export global SZ_KEY_CLEANONLY := "CleanOnly"

/**
 * @type {String}
 */
export global SZ_KEY_UPGRADEONLY := "UpgradeOnly"

/**
 * @type {String}
 */
export global SZ_KEY_EXCLUDEID := "ExcludeId"

/**
 * @type {String}
 */
export global SZ_KEY_ADDPOWERSETTING := "AddPowerSetting"

/**
 * @type {String}
 */
export global SZ_KEY_ADDPROP := "AddProperty"

/**
 * @type {String}
 */
export global SZ_KEY_DELPROP := "DelProperty"

/**
 * @type {String}
 */
export global SZ_KEY_FEATURESCORE := "FeatureScore"

/**
 * @type {String}
 */
export global SZ_KEY_ADDEVENTPROVIDER := "AddEventProvider"

/**
 * @type {String}
 */
export global SZ_KEY_ADDCOMSERVER := "AddComServer"

/**
 * @type {String}
 */
export global SZ_KEY_ADDCOMCLASS := "AddComClass"

/**
 * @type {String}
 */
export global SZ_KEY_ADDCHANNEL := "AddChannel"

/**
 * @type {String}
 */
export global SZ_KEY_IMPORTCHANNEL := "ImportChannel"

/**
 * @type {String}
 */
export global SZ_KEY_ADDAUTOLOGGER := "AddAutoLogger"

/**
 * @type {String}
 */
export global SZ_KEY_UPDATEAUTOLOGGER := "UpdateAutoLogger"

/**
 * @type {String}
 */
export global SZ_KEY_ADDAUTOLOGGERPROVIDER := "AddAutoLoggerProvider"

/**
 * @type {String}
 */
export global SZ_KEY_ADDFILTER := "AddFilter"

/**
 * @type {String}
 */
export global SZ_KEY_FILTERLEVEL := "FilterLevel"

/**
 * @type {String}
 */
export global SZ_KEY_FILTERPOSITION := "FilterPosition"

/**
 * @type {String}
 */
export global SZ_KEY_ADDCOMPONENT := "AddComponent"

/**
 * @type {String}
 */
export global SZ_KEY_PHASE1 := "Phase1"

/**
 * @type {String}
 */
export global SZ_KEY_HARDWARE := "Hardware"

/**
 * @type {String}
 */
export global INFSTR_KEY_CONFIGPRIORITY := "ConfigPriority"

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PRIORITYSTR_LEN := 16

/**
 * @type {String}
 */
export global INFSTR_CFGPRI_HARDWIRED := "HARDWIRED"

/**
 * @type {String}
 */
export global INFSTR_CFGPRI_DESIRED := "DESIRED"

/**
 * @type {String}
 */
export global INFSTR_CFGPRI_NORMAL := "NORMAL"

/**
 * @type {String}
 */
export global INFSTR_CFGPRI_SUBOPTIMAL := "SUBOPTIMAL"

/**
 * @type {String}
 */
export global INFSTR_CFGPRI_DISABLED := "DISABLED"

/**
 * @type {String}
 */
export global INFSTR_CFGPRI_RESTART := "RESTART"

/**
 * @type {String}
 */
export global INFSTR_CFGPRI_REBOOT := "REBOOT"

/**
 * @type {String}
 */
export global INFSTR_CFGPRI_POWEROFF := "POWEROFF"

/**
 * @type {String}
 */
export global INFSTR_CFGPRI_HARDRECONFIG := "HARDRECONFIG"

/**
 * @type {String}
 */
export global INFSTR_CFGPRI_FORCECONFIG := "FORCECONFIG"

/**
 * @type {String}
 */
export global INFSTR_CFGTYPE_BASIC := "BASIC"

/**
 * @type {String}
 */
export global INFSTR_CFGTYPE_FORCED := "FORCED"

/**
 * @type {String}
 */
export global INFSTR_CFGTYPE_OVERRIDE := "OVERRIDE"

/**
 * @type {String}
 */
export global INFSTR_KEY_MEMCONFIG := "MemConfig"

/**
 * @type {String}
 */
export global INFSTR_KEY_MEMLARGECONFIG := "MemLargeConfig"

/**
 * @type {String}
 */
export global INFSTR_KEY_IOCONFIG := "IOConfig"

/**
 * @type {String}
 */
export global INFSTR_KEY_IRQCONFIG := "IRQConfig"

/**
 * @type {String}
 */
export global INFSTR_KEY_DMACONFIG := "DMAConfig"

/**
 * @type {String}
 */
export global INFSTR_KEY_PCCARDCONFIG := "PcCardConfig"

/**
 * @type {String}
 */
export global INFSTR_KEY_MFCARDCONFIG := "MfCardConfig"

/**
 * @type {String}
 */
export global INFSTR_SECT_CLASS_INSTALL := "ClassInstall"

/**
 * @type {String}
 */
export global INFSTR_SECT_CLASS_INSTALL_32 := "ClassInstall32"

/**
 * @type {String}
 */
export global INFSTR_SECT_DEFAULT_INSTALL := "DefaultInstall"

/**
 * @type {String}
 */
export global INFSTR_SECT_DEFAULT_UNINSTALL := "DefaultUninstall"

/**
 * @type {String}
 */
export global INFSTR_SECT_INTERFACE_INSTALL_32 := "InterfaceInstall32"

/**
 * @type {String}
 */
export global INFSTR_SECT_VERSION := "Version"

/**
 * @type {String}
 */
export global INFSTR_KEY_PROVIDER := "Provider"

/**
 * @type {String}
 */
export global INFSTR_KEY_SIGNATURE := "Signature"

/**
 * @type {String}
 */
export global INFSTR_KEY_DRIVERSET := "DriverSet"

/**
 * @type {Integer (UInt32)}
 */
export global MAX_INF_FLAG := 20

/**
 * @type {String}
 */
export global INFSTR_KEY_HARDWARE_CLASS := "Class"

/**
 * @type {String}
 */
export global INFSTR_KEY_HARDWARE_CLASSGUID := "ClassGUID"

/**
 * @type {String}
 */
export global INFSTR_KEY_NOSETUPINF := "NoSetupInf"

/**
 * @type {String}
 */
export global INFSTR_KEY_FROMINET := "FromINet"

/**
 * @type {String}
 */
export global INFSTR_KEY_CATALOGFILE := "CatalogFile"

/**
 * @type {String}
 */
export global INFSTR_KEY_PNPLOCKDOWN := "PnpLockDown"

/**
 * @type {String}
 */
export global INFSTR_KEY_EXTENSIONID := "ExtensionId"

/**
 * @type {String}
 */
export global INFSTR_SECT_MFG := "Manufacturer"

/**
 * @type {String}
 */
export global INFSTR_SECT_TARGETCOMPUTERS := "TargetComputers"

/**
 * @type {String}
 */
export global INFSTR_SECT_EXTENSIONCONTRACTS := "ExtensionContracts"

/**
 * @type {String}
 */
export global INFSTR_KEY_CLASS := "Class"

/**
 * @type {String}
 */
export global INFSTR_KEY_CLASSGUID := "ClassGUID"

/**
 * @type {String}
 */
export global INFSTR_RESTART := "Restart"

/**
 * @type {String}
 */
export global INFSTR_REBOOT := "Reboot"

/**
 * @type {String}
 */
export global INFSTR_KEY_DISPLAYNAME := "DisplayName"

/**
 * @type {String}
 */
export global INFSTR_KEY_SERVICETYPE := "ServiceType"

/**
 * @type {String}
 */
export global INFSTR_KEY_STARTTYPE := "StartType"

/**
 * @type {String}
 */
export global INFSTR_KEY_ERRORCONTROL := "ErrorControl"

/**
 * @type {String}
 */
export global INFSTR_KEY_SERVICEBINARY := "ServiceBinary"

/**
 * @type {String}
 */
export global INFSTR_KEY_LOADORDERGROUP := "LoadOrderGroup"

/**
 * @type {String}
 */
export global INFSTR_KEY_DEPENDENCIES := "Dependencies"

/**
 * @type {String}
 */
export global INFSTR_KEY_REQUIREDPRIVILEGES := "RequiredPrivileges"

/**
 * @type {String}
 */
export global INFSTR_KEY_STARTNAME := "StartName"

/**
 * @type {String}
 */
export global INFSTR_KEY_SECURITY := "Security"

/**
 * @type {String}
 */
export global INFSTR_KEY_DESCRIPTION := "Description"

/**
 * @type {String}
 */
export global INFSTR_KEY_SERVICESIDTYPE := "ServiceSidType"

/**
 * @type {String}
 */
export global INFSTR_KEY_DELAYEDAUTOSTART := "DelayedAutoStart"

/**
 * @type {String}
 */
export global INFSTR_KEY_BOOTFLAGS := "BootFlags"

/**
 * @type {String}
 */
export global INFSTR_KEY_TRIGGER_TYPE := "TriggerType"

/**
 * @type {String}
 */
export global INFSTR_KEY_ACTION := "Action"

/**
 * @type {String}
 */
export global INFSTR_KEY_SUB_TYPE := "SubType"

/**
 * @type {String}
 */
export global INFSTR_KEY_DATA_ITEM := "DataItem"

/**
 * @type {String}
 */
export global INFSTR_KEY_RESET_PERIOD := "ResetPeriod"

/**
 * @type {String}
 */
export global INFSTR_KEY_NON_CRASH_FAILURES := "NonCrashFailures"

/**
 * @type {String}
 */
export global INFSTR_KEY_FAILURE_ACTION := "Action"

/**
 * @type {String}
 */
export global INFSTR_KEY_PROVIDER_NAME := "ProviderName"

/**
 * @type {String}
 */
export global INFSTR_KEY_RESOURCE_FILE := "ResourceFile"

/**
 * @type {String}
 */
export global INFSTR_KEY_MESSAGE_FILE := "MessageFile"

/**
 * @type {String}
 */
export global INFSTR_KEY_PARAMETER_FILE := "ParameterFile"

/**
 * @type {String}
 */
export global INFSTR_KEY_COM_SERVER_TYPE := "ServerType"

/**
 * @type {String}
 */
export global INFSTR_KEY_COM_SERVER_BINARY := "ServerBinary"

/**
 * @type {String}
 */
export global INFSTR_KEY_COM_SERVER_BINARY_WOW64 := "ServerBinaryWow64"

/**
 * @type {String}
 */
export global INFSTR_KEY_COM_SERVER_ADD_COM_CLASS := "AddComClass"

/**
 * @type {String}
 */
export global INFSTR_KEY_COM_CLASS_THREADING_MODEL := "ThreadingModel"

/**
 * @type {String}
 */
export global INFSTR_KEY_COM_CLASS_DESCRIPTION := "Description"

/**
 * @type {String}
 */
export global INFSTR_KEY_COMPONENTIDS := "ComponentIds"

/**
 * @type {String}
 */
export global INFSTR_KEY_CHANNEL_ACCESS := "Access"

/**
 * @type {String}
 */
export global INFSTR_KEY_CHANNEL_ISOLATION := "Isolation"

/**
 * @type {String}
 */
export global INFSTR_KEY_CHANNEL_ENABLED := "Enabled"

/**
 * @type {String}
 */
export global INFSTR_KEY_CHANNEL_VALUE := "Value"

/**
 * @type {String}
 */
export global INFSTR_KEY_LOGGING_MAXSIZE := "LoggingMaxSize"

/**
 * @type {String}
 */
export global INFSTR_KEY_LOGGING_RETENTION := "LoggingRetention"

/**
 * @type {String}
 */
export global INFSTR_KEY_LOGGING_AUTOBACKUP := "LoggingAutoBackup"

/**
 * @type {String}
 */
export global INFSTR_KEY_START := "Start"

/**
 * @type {String}
 */
export global INFSTR_KEY_BUFFER_SIZE := "BufferSize"

/**
 * @type {String}
 */
export global INFSTR_KEY_CLOCK_TYPE := "ClockType"

/**
 * @type {String}
 */
export global INFSTR_KEY_DISABLE_REALTIME_PERSISTENCE := "DisableRealtimePersistence"

/**
 * @type {String}
 */
export global INFSTR_KEY_FILE_NAME := "FileName"

/**
 * @type {String}
 */
export global INFSTR_KEY_FILE_MAX := "FileMax"

/**
 * @type {String}
 */
export global INFSTR_KEY_FLUSH_TIMER := "FlushTimer"

/**
 * @type {String}
 */
export global INFSTR_KEY_LOG_FILE_MODE := "LogFileMode"

/**
 * @type {String}
 */
export global INFSTR_KEY_MAX_FILE_SIZE := "MaxFileSize"

/**
 * @type {String}
 */
export global INFSTR_KEY_MAXIMUM_BUFFERS := "MaximumBuffers"

/**
 * @type {String}
 */
export global INFSTR_KEY_MINIMUM_BUFFERS := "MinimumBuffers"

/**
 * @type {String}
 */
export global INFSTR_KEY_ENABLED := "Enabled"

/**
 * @type {String}
 */
export global INFSTR_KEY_ENABLE_FLAGS := "EnableFlags"

/**
 * @type {String}
 */
export global INFSTR_KEY_ENABLE_LEVEL := "EnableLevel"

/**
 * @type {String}
 */
export global INFSTR_KEY_ENABLE_PROPERTY := "EnableProperty"

/**
 * @type {String}
 */
export global INFSTR_KEY_MATCH_ANY_KEYWORD := "MatchAnyKeyword"

/**
 * @type {String}
 */
export global INFSTR_KEY_MATCH_ALL_KEYWORD := "MatchAllKeyword"

/**
 * @type {String}
 */
export global INFSTR_SECT_DETMODULES := "Det.Modules"

/**
 * @type {String}
 */
export global INFSTR_SECT_DETCLASSINFO := "Det.ClassInfo"

/**
 * @type {String}
 */
export global INFSTR_SECT_MANUALDEV := "Det.ManualDev"

/**
 * @type {String}
 */
export global INFSTR_SECT_AVOIDCFGSYSDEV := "Det.AvoidCfgSysDev"

/**
 * @type {String}
 */
export global INFSTR_SECT_REGCFGSYSDEV := "Det.RegCfgSysDev"

/**
 * @type {String}
 */
export global INFSTR_SECT_DEVINFS := "Det.DevINFs"

/**
 * @type {String}
 */
export global INFSTR_SECT_AVOIDINIDEV := "Det.AvoidIniDev"

/**
 * @type {String}
 */
export global INFSTR_SECT_AVOIDENVDEV := "Det.AvoidEnvDev"

/**
 * @type {String}
 */
export global INFSTR_SECT_REGINIDEV := "Det.RegIniDev"

/**
 * @type {String}
 */
export global INFSTR_SECT_REGENVDEV := "Det.RegEnvDev"

/**
 * @type {String}
 */
export global INFSTR_SECT_HPOMNIBOOK := "Det.HPOmnibook"

/**
 * @type {String}
 */
export global INFSTR_SECT_FORCEHWVERIFY := "Det.ForceHWVerify"

/**
 * @type {String}
 */
export global INFSTR_SECT_DETOPTIONS := "Det.Options"

/**
 * @type {String}
 */
export global INFSTR_SECT_BADPNPBIOS := "BadPnpBios"

/**
 * @type {String}
 */
export global INFSTR_SECT_GOODACPIBIOS := "GoodACPIBios"

/**
 * @type {String}
 */
export global INFSTR_SECT_BADACPIBIOS := "BadACPIBios"

/**
 * @type {String}
 */
export global INFSTR_SECT_BADROUTINGTABLEBIOS := "BadPCIIRQRoutingTableBios"

/**
 * @type {String}
 */
export global INFSTR_SECT_BADPMCALLBIOS := "BadProtectedModeCallBios"

/**
 * @type {String}
 */
export global INFSTR_SECT_BADRMCALLBIOS := "BadRealModeCallBios"

/**
 * @type {String}
 */
export global INFSTR_SECT_MACHINEIDBIOS := "MachineIDBios"

/**
 * @type {String}
 */
export global INFSTR_SECT_BADDISKBIOS := "BadDiskBios"

/**
 * @type {String}
 */
export global INFSTR_SECT_BADDSBIOS := "BadDSBios"

/**
 * @type {String}
 */
export global INFSTR_KEY_DETPARAMS := "Params"

/**
 * @type {String}
 */
export global INFSTR_KEY_SKIPLIST := "SkipList"

/**
 * @type {String}
 */
export global INFSTR_KEY_DETECTLIST := "DetectList"

/**
 * @type {String}
 */
export global INFSTR_KEY_EXCLUDERES := "ExcludeRes"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_LOGCONFIG := "LogConfig"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_DET := "Det"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_FACTDEF := "FactDef"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_POSSIBLEDUPS := "PosDup"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_NORESOURCEDUPS := "NoResDup"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_HW := "Hw"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_CTL := "CTL"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_SERVICES := "Services"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_SOFTWARE := "Software"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_INTERFACES := "Interfaces"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_COINSTALLERS := "CoInstallers"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_LOGCONFIGOVERRIDE := "LogConfigOverride"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_WMI := "WMI"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_EVENTS := "Events"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_COM := "COM"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_FILTERS := "Filters"

/**
 * @type {String}
 */
export global INFSTR_SUBKEY_COMPONENTS := "Components"

/**
 * @type {String}
 */
export global INFSTR_CONTROLFLAGS_SECTION := "ControlFlags"

/**
 * @type {String}
 */
export global INFSTR_KEY_COPYFILESONLY := "CopyFilesOnly"

/**
 * @type {String}
 */
export global INFSTR_KEY_EXCLUDEFROMSELECT := "ExcludeFromSelect"

/**
 * @type {String}
 */
export global INFSTR_KEY_ALWAYSEXCLUDEFROMSELECT := "AlwaysExcludeFromSelect"

/**
 * @type {String}
 */
export global INFSTR_KEY_INTERACTIVEINSTALL := "InteractiveInstall"

/**
 * @type {String}
 */
export global INFSTR_KEY_REQUESTADDITIONALSOFTWARE := "RequestAdditionalSoftware"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_WIN := "Win"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_NT := "NT"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_NTX86 := "NTx86"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_NTMIPS := "NTMIPS"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_NTALPHA := "NTAlpha"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_NTPPC := "NTPPC"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_NTIA64 := "NTIA64"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_NTAXP64 := "NTAXP64"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_NTAMD64 := "NTAMD64"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_NTARM := "NTARM"

/**
 * @type {String}
 */
export global INFSTR_PLATFORM_NTARM64 := "NTARM64"

/**
 * @type {Integer (UInt32)}
 */
export global MAX_INFSTR_STRKEY_LEN := 32

/**
 * @type {String}
 */
export global INFSTR_STRKEY_DRVDESC := "DriverDesc"

/**
 * @type {String}
 */
export global INFSTR_DRIVERSELECT_SECTION := "DriverSelect"

/**
 * @type {String}
 */
export global INFSTR_DRIVERSELECT_FUNCTIONS := "DriverSelectFunctions"

/**
 * @type {String}
 */
export global INFSTR_DRIVERVERSION_SECTION := "DriverVer"

/**
 * @type {String}
 */
export global INFSTR_SOFTWAREVERSION_SECTION := "SoftwareVersion"

/**
 * @type {String}
 */
export global INFSTR_SECT_CFGSYS := "ConfigSysDrivers"

/**
 * @type {String}
 */
export global INFSTR_SECT_AUTOEXECBAT := "AutoexecBatDrivers"

/**
 * @type {String}
 */
export global INFSTR_SECT_SYSINI := "SystemIniDrivers"

/**
 * @type {String}
 */
export global INFSTR_SECT_SYSINIDRV := "SystemIniDriversLine"

/**
 * @type {String}
 */
export global INFSTR_SECT_WININIRUN := "WinIniRunLine"

/**
 * @type {String}
 */
export global INFSTR_KEY_PATH := "Path"

/**
 * @type {String}
 */
export global INFSTR_KEY_NAME := "Name"

/**
 * @type {String}
 */
export global INFSTR_KEY_IO := "IO"

/**
 * @type {String}
 */
export global INFSTR_KEY_MEM := "Mem"

/**
 * @type {String}
 */
export global INFSTR_KEY_IRQ := "IRQ"

/**
 * @type {String}
 */
export global INFSTR_KEY_DMA := "DMA"

/**
 * @type {String}
 */
export global INFSTR_BUS_ISA := "BUS_ISA"

/**
 * @type {String}
 */
export global INFSTR_BUS_EISA := "BUS_EISA"

/**
 * @type {String}
 */
export global INFSTR_BUS_MCA := "BUS_MCA"

/**
 * @type {String}
 */
export global INFSTR_BUS_ALL := "BUS_ALL"

/**
 * @type {String}
 */
export global INFSTR_RISK_NONE := "RISK_NONE"

/**
 * @type {String}
 */
export global INFSTR_RISK_VERYLOW := "RISK_VERYLOW"

/**
 * @type {String}
 */
export global INFSTR_RISK_BIOSROMRD := "RISK_BIOSROMRD"

/**
 * @type {String}
 */
export global INFSTR_RISK_QUERYDRV := "RISK_QUERYDRV"

/**
 * @type {String}
 */
export global INFSTR_RISK_SWINT := "RISK_SWINT"

/**
 * @type {String}
 */
export global INFSTR_RISK_LOW := "RISK_LOW"

/**
 * @type {String}
 */
export global INFSTR_RISK_DELICATE := "RISK_DELICATE"

/**
 * @type {String}
 */
export global INFSTR_RISK_MEMRD := "RISK_MEMRD"

/**
 * @type {String}
 */
export global INFSTR_RISK_IORD := "RISK_IORD"

/**
 * @type {String}
 */
export global INFSTR_RISK_MEMWR := "RISK_MEMWR"

/**
 * @type {String}
 */
export global INFSTR_RISK_IOWR := "RISK_IOWR"

/**
 * @type {String}
 */
export global INFSTR_RISK_UNRELIABLE := "RISK_UNRELIABLE"

/**
 * @type {String}
 */
export global INFSTR_RISK_VERYHIGH := "RISK_VERYHIGH"

/**
 * @type {String}
 */
export global INFSTR_CLASS_SAFEEXCL := "SAFE_EXCL"

/**
 * @type {String}
 */
export global INFSTR_SECT_DISPLAY_CLEANUP := "DisplayCleanup"

/**
 * @type {Guid}
 */
export global GUID_HWPROFILE_QUERY_CHANGE := Guid("{cb3a4001-46f0-11d0-b08f-00609713053f}")

/**
 * @type {Guid}
 */
export global GUID_HWPROFILE_CHANGE_CANCELLED := Guid("{cb3a4002-46f0-11d0-b08f-00609713053f}")

/**
 * @type {Guid}
 */
export global GUID_HWPROFILE_CHANGE_COMPLETE := Guid("{cb3a4003-46f0-11d0-b08f-00609713053f}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_INTERFACE_ARRIVAL := Guid("{cb3a4004-46f0-11d0-b08f-00609713053f}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_INTERFACE_REMOVAL := Guid("{cb3a4005-46f0-11d0-b08f-00609713053f}")

/**
 * @type {Guid}
 */
export global GUID_TARGET_DEVICE_QUERY_REMOVE := Guid("{cb3a4006-46f0-11d0-b08f-00609713053f}")

/**
 * @type {Guid}
 */
export global GUID_TARGET_DEVICE_REMOVE_CANCELLED := Guid("{cb3a4007-46f0-11d0-b08f-00609713053f}")

/**
 * @type {Guid}
 */
export global GUID_TARGET_DEVICE_REMOVE_COMPLETE := Guid("{cb3a4008-46f0-11d0-b08f-00609713053f}")

/**
 * @type {Guid}
 */
export global GUID_PNP_CUSTOM_NOTIFICATION := Guid("{aca73f8e-8d23-11d1-ac7d-0000f87571d0}")

/**
 * @type {Guid}
 */
export global GUID_PNP_POWER_NOTIFICATION := Guid("{c2cf0660-eb7a-11d1-bd7f-0000f87571d0}")

/**
 * @type {Guid}
 */
export global GUID_PNP_POWER_SETTING_CHANGE := Guid("{29c69b3e-c79a-43bf-bbde-a932fa1bea7e}")

/**
 * @type {Guid}
 */
export global GUID_TARGET_DEVICE_TRANSPORT_RELATIONS_CHANGED := Guid("{fcf528f6-a82f-47b1-ad3a-8050594cad28}")

/**
 * @type {Guid}
 */
export global GUID_KERNEL_SOFT_RESTART_PREPARE := Guid("{de373def-a85c-4f76-8cbf-f96bea8bd10f}")

/**
 * @type {Guid}
 */
export global GUID_KERNEL_SOFT_RESTART_CANCEL := Guid("{31d737e7-8c0b-468a-956e-9f433ec358fb}")

/**
 * @type {Guid}
 */
export global GUID_RECOVERY_PCI_PREPARE_SHUTDOWN := Guid("{90d889de-8704-44cf-8115-ed8528d2b2da}")

/**
 * @type {Guid}
 */
export global GUID_RECOVERY_NVMED_PREPARE_SHUTDOWN := Guid("{4b9770ea-bde7-400b-a9b9-4f684f54cc2a}")

/**
 * @type {Guid}
 */
export global GUID_KERNEL_SOFT_RESTART_FINALIZE := Guid("{20e91abd-350a-4d4f-8577-99c81507473a}")

/**
 * @type {Guid}
 */
export global GUID_KERNEL_SOFT_RESTART_PRE_COMPLETE := Guid("{af855082-530b-4a85-b5a6-120b63089451}")

/**
 * @type {Guid}
 */
export global GUID_BUS_INTERFACE_STANDARD := Guid("{496b8280-6f25-11d0-beaf-08002be2092f}")

/**
 * @type {Guid}
 */
export global GUID_PCI_BUS_INTERFACE_STANDARD := Guid("{496b8281-6f25-11d0-beaf-08002be2092f}")

/**
 * @type {Guid}
 */
export global GUID_PCI_BUS_INTERFACE_STANDARD2 := Guid("{de94e966-fdff-4c9c-9998-6747b150e74c}")

/**
 * @type {Guid}
 */
export global GUID_ARBITER_INTERFACE_STANDARD := Guid("{e644f185-8c0e-11d0-becf-08002be2092f}")

/**
 * @type {Guid}
 */
export global GUID_TRANSLATOR_INTERFACE_STANDARD := Guid("{6c154a92-aacf-11d0-8d2a-00a0c906b244}")

/**
 * @type {Guid}
 */
export global GUID_ACPI_INTERFACE_STANDARD := Guid("{b091a08a-ba97-11d0-bd14-00aa00b7b32a}")

/**
 * @type {Guid}
 */
export global GUID_INT_ROUTE_INTERFACE_STANDARD := Guid("{70941bf4-0073-11d1-a09e-00c04fc340b1}")

/**
 * @type {Guid}
 */
export global GUID_PCMCIA_BUS_INTERFACE_STANDARD := Guid("{76173af0-c504-11d1-947f-00c04fb960ee}")

/**
 * @type {Guid}
 */
export global GUID_ACPI_REGS_INTERFACE_STANDARD := Guid("{06141966-7245-6369-462e-4e656c736f6e}")

/**
 * @type {Guid}
 */
export global GUID_LEGACY_DEVICE_DETECTION_STANDARD := Guid("{50feb0de-596a-11d2-a5b8-0000f81a4619}")

/**
 * @type {Guid}
 */
export global GUID_PCI_DEVICE_PRESENT_INTERFACE := Guid("{d1b82c26-bf49-45ef-b216-71cbd7889b57}")

/**
 * @type {Guid}
 */
export global GUID_MF_ENUMERATION_INTERFACE := Guid("{aeb895f0-5586-11d1-8d84-00a0c906b244}")

/**
 * @type {Guid}
 */
export global GUID_REENUMERATE_SELF_INTERFACE_STANDARD := Guid("{2aeb0243-6a6e-486b-82fc-d815f6b97006}")

/**
 * @type {Guid}
 */
export global GUID_AGP_TARGET_BUS_INTERFACE_STANDARD := Guid("{b15cfce8-06d1-4d37-9d4c-bedde0c2a6ff}")

/**
 * @type {Guid}
 */
export global GUID_ACPI_CMOS_INTERFACE_STANDARD := Guid("{3a8d0384-6505-40ca-bc39-56c15f8c5fed}")

/**
 * @type {Guid}
 */
export global GUID_ACPI_PORT_RANGES_INTERFACE_STANDARD := Guid("{f14f609b-cbbd-4957-a674-bc00213f1c97}")

/**
 * @type {Guid}
 */
export global GUID_ACPI_INTERFACE_STANDARD2 := Guid("{e8695f63-1831-4870-a8cf-9c2f03f9dcb5}")

/**
 * @type {Guid}
 */
export global GUID_PNP_LOCATION_INTERFACE := Guid("{70211b0e-0afb-47db-afc1-410bf842497a}")

/**
 * @type {Guid}
 */
export global GUID_PCI_EXPRESS_LINK_QUIESCENT_INTERFACE := Guid("{146cd41c-dae3-4437-8aff-2af3f038099b}")

/**
 * @type {Guid}
 */
export global GUID_PCI_EXPRESS_ROOT_PORT_INTERFACE := Guid("{83a7734a-84c7-4161-9a98-6000ed0c4a33}")

/**
 * @type {Guid}
 */
export global GUID_MSIX_TABLE_CONFIG_INTERFACE := Guid("{1a6a460b-194f-455d-b34b-b84c5b05712b}")

/**
 * @type {Guid}
 */
export global GUID_D3COLD_SUPPORT_INTERFACE := Guid("{b38290e5-3cd0-4f9d-9937-f5fe2b44d47a}")

/**
 * @type {Guid}
 */
export global GUID_PROCESSOR_PCC_INTERFACE_STANDARD := Guid("{37b17e9a-c21c-4296-972d-11c4b32b28f0}")

/**
 * @type {Guid}
 */
export global GUID_PCI_VIRTUALIZATION_INTERFACE := Guid("{64897b47-3a4a-4d75-bc74-89dd6c078293}")

/**
 * @type {Guid}
 */
export global GUID_PCC_INTERFACE_STANDARD := Guid("{3ee8ba63-0f59-4a24-8a45-35808bdd1249}")

/**
 * @type {Guid}
 */
export global GUID_PCC_INTERFACE_INTERNAL := Guid("{7cce62ce-c189-4814-a6a7-12112089e938}")

/**
 * @type {Guid}
 */
export global GUID_THERMAL_COOLING_INTERFACE := Guid("{ecbe47a8-c498-4bb9-bd70-e867e0940d22}")

/**
 * @type {Guid}
 */
export global GUID_PCI_LINK_CONFIG_INTERFACE := Guid("{67593984-7cc0-4760-8d01-cbffd2d080f7}")

/**
 * @type {Guid}
 */
export global GUID_POWER_LIMIT_INTERFACE := Guid("{3b96f4f2-ce49-44d1-91f8-652b8121e93a}")

/**
 * @type {Guid}
 */
export global GUID_DMA_CACHE_COHERENCY_INTERFACE := Guid("{b520f7fa-8a5a-4e40-a3f6-6be1e162d935}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_RESET_INTERFACE_STANDARD := Guid("{649fdf26-3bc0-4813-ad24-7e0c1eda3fa3}")

/**
 * @type {Guid}
 */
export global GUID_IOMMU_BUS_INTERFACE := Guid("{1efee0b2-d278-4ae4-bddc-1b34dd648043}")

/**
 * @type {Guid}
 */
export global GUID_PCI_SECURITY_INTERFACE := Guid("{6e7f1451-199e-4acc-ba2d-762b4edf4674}")

/**
 * @type {Guid}
 */
export global GUID_SCM_BUS_INTERFACE := Guid("{25944783-ce79-4232-815e-4a30014e8eb4}")

/**
 * @type {Guid}
 */
export global GUID_SECURE_DRIVER_INTERFACE := Guid("{370f67e1-4ff5-4a94-9a35-06c5d9cc30e2}")

/**
 * @type {Guid}
 */
export global GUID_SDEV_IDENTIFIER_INTERFACE := Guid("{49d67af8-916c-4ee8-9df1-889f17d21e91}")

/**
 * @type {Guid}
 */
export global GUID_SCM_BUS_NVD_INTERFACE := Guid("{8de064ff-b630-42e4-88ea-6f24c8641175}")

/**
 * @type {Guid}
 */
export global GUID_SCM_BUS_LD_INTERFACE := Guid("{9b89307d-d76b-4f48-b186-54041ae92e8d}")

/**
 * @type {Guid}
 */
export global GUID_SCM_PHYSICAL_NVDIMM_INTERFACE := Guid("{0079c21b-917e-405e-a9ce-0732b5bbcebd}")

/**
 * @type {Guid}
 */
export global GUID_PNP_EXTENDED_ADDRESS_INTERFACE := Guid("{b8e992ec-a797-4dc4-8846-84d041707446}")

/**
 * @type {Guid}
 */
export global GUID_D3COLD_AUX_POWER_AND_TIMING_INTERFACE := Guid("{0044d8aa-f664-4588-9ffc-2afeaf5950b9}")

/**
 * @type {Guid}
 */
export global GUID_PCI_FPGA_CONTROL_INTERFACE := Guid("{2df3f7a8-b9b3-4063-9215-b5d14a0b266e}")

/**
 * @type {Guid}
 */
export global GUID_PCI_PTM_CONTROL_INTERFACE := Guid("{348a5ebb-ba24-44b7-9916-285687735117}")

/**
 * @type {Guid}
 */
export global GUID_BUS_RESOURCE_UPDATE_INTERFACE := Guid("{27d0102d-bfb2-4164-81dd-dbb82f968b48}")

/**
 * @type {Guid}
 */
export global GUID_NPEM_CONTROL_INTERFACE := Guid("{4d95573d-b774-488a-b120-4f284a9eff51}")

/**
 * @type {Guid}
 */
export global GUID_PCI_ATS_INTERFACE := Guid("{010a7fe8-96f5-4943-bedf-95e651b93412}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_INTERNAL := Guid("{1530ea73-086b-11d1-a09f-00c04fc340b1}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_PCMCIA := Guid("{09343630-af9f-11d0-92e9-0000f81e1b30}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_PCI := Guid("{c8ebdfb0-b510-11d0-80e5-00a0c92542e3}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_ISAPNP := Guid("{e676f854-d87d-11d0-92b2-00a0c9055fc5}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_EISA := Guid("{ddc35509-f3fc-11d0-a537-0000f8753ed1}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_MCA := Guid("{1c75997a-dc33-11d0-92b2-00a0c9055fc5}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_SERENUM := Guid("{77114a87-8944-11d1-bd90-00a0c906be2d}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_USB := Guid("{9d7debbc-c85d-11d1-9eb4-006008c3a19a}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_LPTENUM := Guid("{c4ca1000-2ddc-11d5-a17a-00c04f60524d}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_USBPRINT := Guid("{441ee000-4342-11d5-a184-00c04f60524d}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_DOT4PRT := Guid("{441ee001-4342-11d5-a184-00c04f60524d}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_1394 := Guid("{f74e73eb-9ac5-45eb-be4d-772cc71ddfb3}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_HID := Guid("{eeaf37d0-1963-47c4-aa48-72476db7cf49}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_AVC := Guid("{c06ff265-ae09-48f0-812c-16753d7cba83}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_IRDA := Guid("{7ae17dc1-c944-44d6-881f-4c2e61053bc1}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_SD := Guid("{e700cc04-4036-4e89-9579-89ebf45f00cd}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_ACPI := Guid("{d7b46895-001a-4942-891f-a7d46610a843}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_SW_DEVICE := Guid("{06d10322-7de0-4cef-8e25-197d0e7442e2}")

/**
 * @type {Guid}
 */
export global GUID_BUS_TYPE_SCM := Guid("{375a5912-804c-45aa-bdc2-fdd25a1d9512}")

/**
 * @type {Guid}
 */
export global GUID_POWER_DEVICE_ENABLE := Guid("{827c0a6f-feb0-11d0-bd26-00aa00b7b32a}")

/**
 * @type {Guid}
 */
export global GUID_POWER_DEVICE_TIMEOUTS := Guid("{a45da735-feb0-11d0-bd26-00aa00b7b32a}")

/**
 * @type {Guid}
 */
export global GUID_POWER_DEVICE_WAKE_ENABLE := Guid("{a9546a82-feb0-11d0-bd26-00aa00b7b32a}")

/**
 * @type {Guid}
 */
export global GUID_WUDF_DEVICE_HOST_PROBLEM := Guid("{c43d25bd-9346-40ee-a2d2-d70c15f8b75b}")

/**
 * @type {Guid}
 */
export global GUID_PARTITION_UNIT_INTERFACE_STANDARD := Guid("{52363f5b-d891-429b-8195-aec5fef6853c}")

/**
 * @type {Guid}
 */
export global GUID_QUERY_CRASHDUMP_FUNCTIONS := Guid("{9cc6b8ff-32e2-4834-b1de-b32ef8880a4b}")
;@endregion Constants
