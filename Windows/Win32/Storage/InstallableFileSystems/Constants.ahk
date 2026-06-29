#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global FILTER_NAME_MAX_CHARS := 255

/**
 * @type {Integer (UInt32)}
 */
export global VOLUME_NAME_MAX_CHARS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global INSTANCE_NAME_MAX_CHARS := 255

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_AGGREGATE_INFO_IS_MINIFILTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_AGGREGATE_INFO_IS_LEGACYFILTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_ASI_IS_MINIFILTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_ASI_IS_LEGACYFILTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_VSI_DETACHED_VOLUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_IASI_IS_MINIFILTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_IASI_IS_LEGACYFILTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_IASIM_DETACHED_VOLUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_IASIL_DETACHED_VOLUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLT_PORT_FLAG_SYNC_HANDLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_MSNET := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_SMB := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_NETWARE := 196608

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_VINES := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_10NET := 327680

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_LOCUS := 393216

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_SUN_PC_NFS := 458752

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_LANSTEP := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_9TILES := 589824

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_LANTASTIC := 655360

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_AS400 := 720896

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_FTP_NFS := 786432

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_PATHWORKS := 851968

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_LIFENET := 917504

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_POWERLAN := 983040

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_BWNFS := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_COGENT := 1114112

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_FARALLON := 1179648

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_APPLETALK := 1245184

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_INTERGRAPH := 1310720

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_SYMFONET := 1376256

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_CLEARCASE := 1441792

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_FRONTIER := 1507328

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_BMC := 1572864

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_DCE := 1638400

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_AVID := 1703936

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_DOCUSPACE := 1769472

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_MANGOSOFT := 1835008

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_SERNET := 1900544

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_RIVERFRONT1 := 1966080

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_RIVERFRONT2 := 2031616

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_DECORB := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_PROTSTOR := 2162688

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_FJ_REDIR := 2228224

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_DISTINCT := 2293760

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_TWINS := 2359296

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_RDR2SAMPLE := 2424832

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_CSC := 2490368

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_3IN1 := 2555904

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_EXTENDNET := 2686976

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_STAC := 2752512

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_FOXBAT := 2818048

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_YAHOO := 2883584

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_EXIFS := 2949120

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_DAV := 3014656

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_KNOWARE := 3080192

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_OBJECT_DIRE := 3145728

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_MASFAX := 3211264

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_HOB_NFS := 3276800

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_SHIVA := 3342336

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_IBMAL := 3407872

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_LOCK := 3473408

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_TERMSRV := 3538944

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_SRT := 3604480

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_QUINCY := 3670016

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_OPENAFS := 3735552

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_AVID1 := 3801088

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_DFS := 3866624

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_KWNP := 3932160

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_ZENWORKS := 3997696

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_DRIVEONWEB := 4063232

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_VMWARE := 4128768

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_RSFX := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_MFILES := 4259840

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_MS_NFS := 4325376

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_GOOGLE := 4390912

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_NDFS := 4456448

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_DOCUSHARE := 4521984

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_AURISTOR_FS := 4587520

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_SECUREAGENT := 4653056

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_9P := 4718592

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_CRED_MANAGER := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global WNNC_NET_LANMAN := 131072
;@endregion Constants
