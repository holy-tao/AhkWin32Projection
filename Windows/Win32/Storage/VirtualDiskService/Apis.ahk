#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VirtualDiskService {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_VOLUME_ARRIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_VOLUME_DEPART => 5

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_VOLUME_MODIFY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_VOLUME_REBUILDING_PROGRESS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PARTITION_ARRIVE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PARTITION_DEPART => 12

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PARTITION_MODIFY => 13

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_SUB_SYSTEM_ARRIVE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_SUB_SYSTEM_DEPART => 102

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PORTAL_ARRIVE => 123

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PORTAL_DEPART => 124

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PORTAL_MODIFY => 125

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_TARGET_ARRIVE => 126

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_TARGET_DEPART => 127

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_TARGET_MODIFY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PORTAL_GROUP_ARRIVE => 129

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PORTAL_GROUP_DEPART => 130

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PORTAL_GROUP_MODIFY => 131

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_SUB_SYSTEM_MODIFY => 151

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_LETTER_FREE => 201

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_LETTER_ASSIGN => 202

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_MOUNT_POINTS_CHANGE => 205

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_FILE_SYSTEM_SHRINKING_PROGRESS => 206

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_SERVICE_OUT_OF_SYNC => 301

    /**
     * @type {Integer (UInt32)}
     */
    static GPT_PARTITION_NAME_LENGTH => 36

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_FASTCRASHRECOVERYREQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_MOSTLYREADS => 2

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_OPTIMIZEFORSEQUENTIALREADS => 4

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_OPTIMIZEFORSEQUENTIALWRITES => 8

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_READBACKVERIFYENABLED => 16

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_REMAPENABLED => 32

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_WRITETHROUGHCACHINGENABLED => 64

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_HARDWARECHECKSUMENABLED => 128

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_ISYANKABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_ALLOCATEHOTSPARE => 512

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_BUSTYPE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_USEMIRROREDCACHE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_READCACHINGENABLED => 4096

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_WRITECACHINGENABLED => 8192

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_MEDIASCANENABLED => 16384

    /**
     * @type {Integer (Int32)}
     */
    static VDS_HINT_CONSISTENCYCHECKENABLED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_REBUILD_PRIORITY_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_REBUILD_PRIORITY_MAX => 16

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_RAIDTYPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_BUSTYPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_ALLOW_SPINDOWN => 4

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_THIN_PROVISION => 8

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_NO_SINGLE_POF => 16

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_DATA_RDNCY_MAX => 32

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_DATA_RDNCY_MIN => 64

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_DATA_RDNCY_DEF => 128

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_PKG_RDNCY_MAX => 256

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_PKG_RDNCY_MIN => 512

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_PKG_RDNCY_DEF => 1024

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_STRIPE_SIZE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_STRIPE_SIZE_MAX => 4096

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_STRIPE_SIZE_MIN => 8192

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_STRIPE_SIZE_DEF => 16384

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_NUM_CLMNS => 32768

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_NUM_CLMNS_MAX => 65536

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_NUM_CLMNS_MIN => 131072

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_NUM_CLMNS_DEF => 262144

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_DATA_AVL_HINT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_ACCS_RNDM_HINT => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_ACCS_DIR_HINT => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_ACCS_SIZE_HINT => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_ACCS_LTNCY_HINT => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_ACCS_BDW_WT_HINT => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_STOR_COST_HINT => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_STOR_EFFCY_HINT => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static VDS_POOL_ATTRIB_CUSTOM_ATTRIB => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_ATTACH_VIRTUAL_DISK_FLAG_USE_FILE_ACL => 1

    /**
     * @type {String}
     */
    static CLSID_VdsLoader => "{9c38ed61-d565-4728-aeee-c80952f0ecde}"

    /**
     * @type {String}
     */
    static CLSID_VdsService => "{7d1933cb-86f6-4a98-8628-01be94c9a575}"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_FS_NAME_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_FS_FORMAT_SUPPORT_NAME_SIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_FS_ALLOWED_CLUSTER_SIZES_SIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VER_VDS_LUN_INFORMATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NOT_SUPPORTED => -2147212288

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INITIALIZED_FAILED => -2147212287

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INITIALIZE_NOT_CALLED => -2147212286

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ALREADY_REGISTERED => -2147212285

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ANOTHER_CALL_IN_PROGRESS => -2147212284

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_OBJECT_NOT_FOUND => -2147212283

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_SPACE => -2147212282

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PARTITION_LIMIT_REACHED => -2147212281

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PARTITION_NOT_EMPTY => -2147212280

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_OPERATION_PENDING => -2147212279

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_OPERATION_DENIED => -2147212278

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_OBJECT_DELETED => -2147212277

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CANCEL_TOO_LATE => -2147212276

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_OPERATION_CANCELED => -2147212275

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CANNOT_EXTEND => -2147212274

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NOT_ENOUGH_SPACE => -2147212273

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NOT_ENOUGH_DRIVE => -2147212272

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_BAD_COOKIE => -2147212271

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_MEDIA => -2147212270

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DEVICE_IN_USE => -2147212269

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_NOT_EMPTY => -2147212268

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_OPERATION => -2147212267

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PATH_NOT_FOUND => -2147212266

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_NOT_INITIALIZED => -2147212265

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NOT_AN_UNALLOCATED_DISK => -2147212264

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_UNRECOVERABLE_ERROR => -2147212263

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_DISK_PARTIALLY_CLEANED => 271386

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DMADMIN_SERVICE_CONNECTION_FAILED => -2147212261

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PROVIDER_INITIALIZATION_FAILED => -2147212260

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_OBJECT_EXISTS => -2147212259

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_DISKS_FOUND => -2147212258

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PROVIDER_CACHE_CORRUPT => -2147212257

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DMADMIN_METHOD_CALL_FAILED => -2147212256

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_PROVIDER_ERROR_LOADING_CACHE => 271393

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PROVIDER_VOL_DEVICE_NAME_NOT_FOUND => -2147212254

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PROVIDER_VOL_OPEN => -2147212253

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DMADMIN_CORRUPT_NOTIFICATION => -2147212252

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INCOMPATIBLE_FILE_SYSTEM => -2147212251

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INCOMPATIBLE_MEDIA => -2147212250

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ACCESS_DENIED => -2147212249

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MEDIA_WRITE_PROTECTED => -2147212248

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_BAD_LABEL => -2147212247

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CANT_QUICK_FORMAT => -2147212246

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_IO_ERROR => -2147212245

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_TOO_SMALL => -2147212244

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_TOO_BIG => -2147212243

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CLUSTER_SIZE_TOO_SMALL => -2147212242

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CLUSTER_SIZE_TOO_BIG => -2147212241

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CLUSTER_COUNT_BEYOND_32BITS => -2147212240

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_OBJECT_STATUS_FAILED => -2147212239

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_INCOMPLETE => -2147212238

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_EXTENT_SIZE_LESS_THAN_MIN => -2147212237

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_UPDATE_BOOTFILE_FAILED => 271412

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_BOOT_PARTITION_NUMBER_CHANGE => 271414

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_BOOT_PARTITION_NUMBER_CHANGE => -2147212234

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_FREE_SPACE => -2147212233

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ACTIVE_PARTITION => -2147212232

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PARTITION_OF_UNKNOWN_TYPE => -2147212231

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LEGACY_VOLUME_FORMAT => -2147212230

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NON_CONTIGUOUS_DATA_PARTITIONS => -2147212229

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MIGRATE_OPEN_VOLUME => -2147212228

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_NOT_ONLINE => -2147212227

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_NOT_HEALTHY => -2147212226

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_SPANS_DISKS => -2147212225

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_REQUIRES_CONTIGUOUS_DISK_SPACE => -2147212224

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_BAD_PROVIDER_DATA => -2147212223

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PROVIDER_FAILURE => -2147212222

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_VOLUME_COMPRESS_FAILED => 271427

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PACK_OFFLINE => -2147212220

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_NOT_A_MIRROR => -2147212219

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_EXTENTS_FOR_VOLUME => -2147212218

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_NOT_LOADED_TO_CACHE => -2147212217

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INTERNAL_ERROR => -2147212216

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_ACCESS_PATH_NOT_DELETED => 279108

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PROVIDER_TYPE_NOT_SUPPORTED => -2147212214

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_NOT_ONLINE => -2147212213

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_IN_USE_BY_VOLUME => -2147212212

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_IN_PROGRESS => 271437

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ASYNC_OBJECT_FAILURE => -2147212210

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_NOT_MOUNTED => -2147212209

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PACK_NOT_FOUND => -2147212208

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_IMPORT_SET_INCOMPLETE => -2147212207

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_NOT_IMPORTED => -2147212206

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_OBJECT_OUT_OF_SYNC => -2147212205

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MISSING_DISK => -2147212204

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_PNP_REG_CORRUPT => -2147212203

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LBN_REMAP_ENABLED_FLAG => -2147212202

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_DRIVELETTER_FLAG => -2147212201

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_REVERT_ON_CLOSE => -2147212200

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_REVERT_ON_CLOSE_SET => -2147212199

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_IA64_BOOT_MIRRORED_TO_MBR => -2147212198

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_IA64_BOOT_MIRRORED_TO_MBR => 271450

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_UNABLE_TO_GET_GPT_ATTRIBUTES => 271451

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_TEMPORARILY_DISMOUNTED => -2147212196

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_PERMANENTLY_DISMOUNTED => -2147212195

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_HAS_PATH => -2147212194

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_TIMEOUT => -2147212193

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_REPAIR_VOLUMESTATE => -2147212192

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LDM_TIMEOUT => -2147212191

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_REVERT_ON_CLOSE_MISMATCH => -2147212190

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_RETRY => -2147212189

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ONLINE_PACK_EXISTS => -2147212188

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_EXTEND_FILE_SYSTEM_FAILED => 271461

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_EXTEND_FILE_SYSTEM_FAILED => -2147212186

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_MBR_BOOT_MIRRORED_TO_GPT => 271463

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MAX_USABLE_MBR => -2147212184

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_GPT_BOOT_MIRRORED_TO_MBR => -2147212183

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_SOFTWARE_PROVIDERS_LOADED => -2147212032

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_NOT_MISSING => -2147212031

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_VOLUME_LAYOUT => -2147212030

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CORRUPT_VOLUME_INFO => -2147212029

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_ENUMERATOR => -2147212028

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DRIVER_INTERNAL_ERROR => -2147212027

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_INVALID_NAME => -2147212025

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_DISK_IS_MISSING => 271624

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CORRUPT_PARTITION_INFO => -2147212023

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_NONCONFORMANT_PARTITION_INFO => 271626

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CORRUPT_EXTENT_INFO => -2147212021

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DUP_EMPTY_PACK_GUID => -2147212020

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DRIVER_NO_PACK_NAME => -2147212019

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_SYSTEM_PARTITION => 271630

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_BAD_PNP_MESSAGE => -2147212017

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_PNP_DISK_ARRIVE => -2147212016

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_PNP_VOLUME_ARRIVE => -2147212015

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_PNP_DISK_REMOVE => -2147212014

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_PNP_VOLUME_REMOVE => -2147212013

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PROVIDER_EXITING => -2147212012

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_EXTENT_EXCEEDS_DISK_FREE_SPACE => -2147212011

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MEMBER_SIZE_INVALID => -2147212010

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_NO_NOTIFICATION => 271639

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_DEFAULT_PLEX_MEMBER_IDS => 271640

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_DISK => -2147212007

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PACK => -2147212006

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_ON_DISK => -2147212005

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DRIVER_INVALID_PARAM => -2147212004

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_TARGET_PACK_NOT_EMPTY => -2147212003

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CANNOT_SHRINK => -2147212002

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MULTIPLE_PACKS => -2147212001

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PACK_ONLINE => -2147212000

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PLEX_COUNT => -2147211999

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_MEMBER_COUNT => -2147211998

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PLEX_ORDER => -2147211997

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_MEMBER_ORDER => -2147211996

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_STRIPE_SIZE => -2147211995

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_DISK_COUNT => -2147211994

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_EXTENT_COUNT => -2147211993

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SOURCE_IS_TARGET_PACK => -2147211992

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_DISK_COUNT_MAX_EXCEEDED => -2147211991

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CORRUPT_NOTIFICATION_INFO => -2147211990

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PLEX_GUID => -2147211988

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_NOT_FOUND_IN_PACK => -2147211987

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DUPLICATE_DISK => -2147211986

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LAST_VALID_DISK => -2147211985

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_SECTOR_SIZE => -2147211984

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ONE_EXTENT_PER_DISK => -2147211983

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_BLOCK_SIZE => -2147211982

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PLEX_SIZE_INVALID => -2147211981

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_EXTENTS_FOR_PLEX => -2147211980

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PLEX_TYPE => -2147211979

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PLEX_BLOCK_SIZE => -2147211978

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_HEALTHY_DISKS => -2147211977

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CONFIG_LIMIT => -2147211976

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_CONFIGURATION_CORRUPTED => -2147211975

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_CONFIGURATION_NOT_IN_SYNC => -2147211974

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_CONFIGURATION_UPDATE_FAILED => -2147211973

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_DYNAMIC => -2147211972

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DRIVER_OBJECT_NOT_FOUND => -2147211971

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PARTITION_NOT_CYLINDER_ALIGNED => -2147211970

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_LAYOUT_PARTITIONS_TOO_SMALL => -2147211969

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_IO_FAILING => -2147211968

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DYNAMIC_DISKS_NOT_SUPPORTED => -2147211967

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_FAULT_TOLERANT_DISKS_NOT_SUPPORTED => -2147211966

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_GPT_ATTRIBUTES_INVALID => -2147211965

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MEMBER_IS_HEALTHY => -2147211964

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MEMBER_REGENERATING => -2147211963

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PACK_NAME_INVALID => -2147211962

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PLEX_IS_HEALTHY => -2147211961

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PLEX_LAST_ACTIVE => -2147211960

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PLEX_MISSING => -2147211959

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MEMBER_MISSING => -2147211958

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PLEX_REGENERATING => -2147211957

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_UNEXPECTED_DISK_LAYOUT_CHANGE => -2147211955

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_VOLUME_LENGTH => -2147211954

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_LENGTH_NOT_SECTOR_SIZE_MULTIPLE => -2147211953

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_NOT_RETAINED => -2147211952

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_RETAINED => -2147211951

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ALIGN_BEYOND_FIRST_CYLINDER => -2147211949

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ALIGN_NOT_SECTOR_SIZE_MULTIPLE => -2147211948

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ALIGN_NOT_ZERO => -2147211947

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CACHE_CORRUPT => -2147211946

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CANNOT_CLEAR_VOLUME_FLAG => -2147211945

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_BEING_CLEANED => -2147211944

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_NOT_CONVERTIBLE => -2147211943

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_REMOVEABLE => -2147211942

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_REMOVEABLE_NOT_EMPTY => -2147211941

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DRIVE_LETTER_NOT_FREE => -2147211940

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_EXTEND_MULTIPLE_DISKS_NOT_SUPPORTED => -2147211939

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_DRIVE_LETTER => -2147211938

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_DRIVE_LETTER_COUNT => -2147211937

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_FS_FLAG => -2147211936

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_FS_TYPE => -2147211935

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_OBJECT_TYPE => -2147211934

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PARTITION_LAYOUT => -2147211933

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PARTITION_STYLE => -2147211932

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PARTITION_TYPE => -2147211931

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PROVIDER_CLSID => -2147211930

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PROVIDER_ID => -2147211929

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PROVIDER_NAME => -2147211928

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PROVIDER_TYPE => -2147211927

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PROVIDER_VERSION_GUID => -2147211926

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PROVIDER_VERSION_STRING => -2147211925

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_QUERY_PROVIDER_FLAG => -2147211924

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_SERVICE_FLAG => -2147211923

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_VOLUME_FLAG => -2147211922

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PARTITION_NOT_OEM => -2147211921

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PARTITION_PROTECTED => -2147211920

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PARTITION_STYLE_MISMATCH => -2147211919

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PROVIDER_INTERNAL_ERROR => -2147211918

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SHRINK_SIZE_LESS_THAN_MIN => -2147211917

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SHRINK_SIZE_TOO_BIG => -2147211916

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_UNRECOVERABLE_PROVIDER_ERROR => -2147211915

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_HIDDEN => -2147211914

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_DISMOUNT_FAILED => 271735

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_REMOUNT_FAILED => 271736

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_FLAG_ALREADY_SET => -2147211911

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_RESYNC_NOTIFICATION_TASK_FAILED => 271738

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISTINCT_VOLUME => -2147211909

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_NOT_FOUND_IN_PACK => -2147211908

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PARTITION_NON_DATA => -2147211907

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CRITICAL_PLEX => -2147211906

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_SYNCHRONIZING => -2147211905

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_REGENERATING => -2147211904

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_VSS_FLUSH_AND_HOLD_WRITES => 271745

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_VSS_RELEASE_WRITES => 271746

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_FS_LOCK => 271747

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_READONLY => -2147211900

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_VOLUME_TYPE => -2147211899

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_BAD_BOOT_DISK => -2147211898

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LOG_UPDATE => -2147211897

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_MIRRORED => -2147211896

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_SIMPLE_SPANNED => -2147211895

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_VALID_LOG_COPIES => -2147211894

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_PLEX_NOT_LOADED_TO_CACHE => 271755

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PLEX_NOT_LOADED_TO_CACHE => -2147211893

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PARTITION_MSR => -2147211892

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PARTITION_LDM => -2147211891

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_WINPE_BOOTENTRY => 271758

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ALIGN_NOT_A_POWER_OF_TWO => -2147211889

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ALIGN_IS_ZERO => -2147211888

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SHRINK_IN_PROGRESS => -2147211887

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CANT_INVALIDATE_FVE => -2147211886

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_FS_NOT_DETERMINED => -2147211885

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_NOT_OFFLINE => -2147211883

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_FAILED_TO_ONLINE_DISK => -2147211882

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_FAILED_TO_OFFLINE_DISK => -2147211881

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_BAD_REVISION_NUMBER => -2147211880

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SHRINK_USER_CANCELLED => -2147211879

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SHRINK_DIRTY_VOLUME => -2147211878

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_NAME_TRUNCATED => 272128

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NAME_NOT_UNIQUE => -2147211519

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_STATUSES_INCOMPLETELY_SET => 272130

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ADDRESSES_INCOMPLETELY_SET => -2147211517

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SECURITY_INCOMPLETELY_SET => -2147211515

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_TARGET_SPECIFIC_NOT_SUPPORTED => -2147211514

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INITIATOR_SPECIFIC_NOT_SUPPORTED => -2147211513

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ISCSI_LOGIN_FAILED => -2147211512

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ISCSI_LOGOUT_FAILED => -2147211511

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ISCSI_SESSION_NOT_FOUND => -2147211510

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ASSOCIATED_LUNS_EXIST => -2147211509

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ASSOCIATED_PORTALS_EXIST => -2147211508

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_DISCOVERY_DOMAIN => -2147211507

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MULTIPLE_DISCOVERY_DOMAINS => -2147211506

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_DISK_PATHNAME => -2147211505

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ISCSI_LOGOUT_INCOMPLETE => -2147211504

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_VOLUME_PATHNAME => -2147211503

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PROVIDER_CACHE_OUTOFSYNC => -2147211502

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_IMPORT_TARGET => -2147211501

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_ALREADY_EXISTS => 272148

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_PROPERTIES_INCOMPLETE => 272149

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_ISCSI_SESSION_NOT_FOUND_PERSISTENT_LOGIN_REMOVED => 272384

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_ISCSI_PERSISTENT_LOGIN_MAY_NOT_BE_REMOVED => 272385

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_ISCSI_LOGIN_ALREAD_EXISTS => 272386

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_UNABLE_TO_FIND_BOOT_DISK => -2147211261

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INCORRECT_BOOT_VOLUME_EXTENT_INFO => -2147211260

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_GET_SAN_POLICY => -2147211259

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SET_SAN_POLICY => -2147211258

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_BOOT_DISK => -2147211257

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_DISK_MOUNT_FAILED => 272392

    /**
     * @type {Integer (Int32)}
     */
    static VDS_S_DISK_DISMOUNT_FAILED => 272393

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_IS_OFFLINE => -2147211254

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_IS_READ_ONLY => -2147211253

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_PAGEFILE_DISK => -2147211252

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_HIBERNATION_FILE_DISK => -2147211251

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CRASHDUMP_DISK => -2147211250

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_UNABLE_TO_FIND_SYSTEM_DISK => -2147211249

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INCORRECT_SYSTEM_VOLUME_EXTENT_INFO => -2147211248

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SYSTEM_DISK => -2147211247

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_SHRINK_FVE_LOCKED => -2147211246

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_SHRINK_FVE_CORRUPT => -2147211245

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_SHRINK_FVE_RECOVERY => -2147211244

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_SHRINK_FVE => -2147211243

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SHRINK_OVER_DATA => -2147211242

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_SHRINK_SIZE => -2147211241

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_DISK_MISSING => -2147211240

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_DISK_FAILED => -2147211239

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_DISK_NOT_READY => -2147211238

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_DISK_NO_MEDIA => -2147211237

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_NOT_READY => -2147211236

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_OFFLINE => -2147211235

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_FAILED => -2147211234

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_EXTEND_FVE_LOCKED => -2147211233

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_EXTEND_FVE_CORRUPT => -2147211232

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_EXTEND_FVE_RECOVERY => -2147211231

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_EXTEND_FVE => -2147211230

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SECTOR_SIZE_ERROR => -2147211229

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INITIATOR_ADAPTER_NOT_FOUND => -2147211008

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_TARGET_PORTAL_NOT_FOUND => -2147211007

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PORT_PATH => -2147211006

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_ISCSI_TARGET_NAME => -2147211005

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SET_TUNNEL_MODE_OUTER_ADDRESS => -2147211004

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ISCSI_GET_IKE_INFO => -2147211003

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ISCSI_SET_IKE_INFO => -2147211002

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SUBSYSTEM_ID_IS_NULL => -2147211001

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ISCSI_INITIATOR_NODE_NAME => -2147211000

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ISCSI_GROUP_PRESHARE_KEY => -2147210999

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_ISCSI_CHAP_SECRET => -2147210998

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_IP_ADDRESS => -2147210997

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_REBOOT_REQUIRED => -2147210996

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VOLUME_GUID_PATHNAME_NOT_ALLOWED => -2147210995

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_BOOT_PAGEFILE_DRIVE_LETTER => -2147210994

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DELETE_WITH_CRITICAL => -2147210993

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CLEAN_WITH_DATA => -2147210992

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CLEAN_WITH_OEM => -2147210991

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CLEAN_WITH_CRITICAL => -2147210990

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_FORMAT_CRITICAL => -2147210989

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NTFS_FORMAT_NOT_SUPPORTED => -2147210988

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_FAT32_FORMAT_NOT_SUPPORTED => -2147210987

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_FAT_FORMAT_NOT_SUPPORTED => -2147210986

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_FORMAT_NOT_SUPPORTED => -2147210985

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_COMPRESSION_NOT_SUPPORTED => -2147210984

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VDISK_NOT_OPEN => -2147210983

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VDISK_INVALID_OP_STATE => -2147210982

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_PATH => -2147210981

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_ISCSI_PATH => -2147210980

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SHRINK_LUN_NOT_UNMASKED => -2147210979

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_DISK_READ_ONLY => -2147210978

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_UPDATE_DISK => -2147210977

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_DYNAMIC => -2147210976

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_DYNAMIC_OFFLINE => -2147210975

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_LUN_SHRINK_GPT_HEADER => -2147210974

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_MIRROR_NOT_SUPPORTED => -2147210973

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_RAID5_NOT_SUPPORTED => -2147210972

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_NOT_CONVERTIBLE_SIZE => -2147210971

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_OFFLINE_NOT_SUPPORTED => -2147210970

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VDISK_PATHNAME_INVALID => -2147210969

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_EXTEND_TOO_MANY_CLUSTERS => -2147210968

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_EXTEND_UNKNOWN_FILESYSTEM => -2147210967

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SHRINK_UNKNOWN_FILESYSTEM => -2147210966

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_DISK_NOT_OPEN => -2147210965

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_DISK_IS_EXPANDING => -2147210964

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_DISK_IS_COMPACTING => -2147210963

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_DISK_IS_MERGING => -2147210962

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_IS_ATTACHED => -2147210961

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_DISK_ALREADY_OPEN => -2147210960

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_DISK_ALREADY_EXPANDING => -2147210959

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_ALREADY_COMPACTING => -2147210958

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_ALREADY_MERGING => -2147210957

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_ALREADY_ATTACHED => -2147210956

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_ALREADY_DETACHED => -2147210955

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_NOT_ATTACHED_READONLY => -2147210954

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_IS_BEING_ATTACHED => -2147210953

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_VD_IS_BEING_DETACHED => -2147210952

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_POOL => -2147210752

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_POOL_CREATED => -2147210751

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_NO_MAINTENANCE_MODE => -2147210750

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_BLOCK_CLUSTERED => -2147210749

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DISK_HAS_BANDS => -2147210748

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_INVALID_STATE => -2147210747

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_REFS_FORMAT_NOT_SUPPORTED => -2147210746

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_DELETE_WITH_BOOTBACKING => -2147210745

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_FORMAT_WITH_BOOTBACKING => -2147210744

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_CLEAN_WITH_BOOTBACKING => -2147210743

    /**
     * @type {Integer (Int32)}
     */
    static VDS_E_SHRINK_EXTEND_UNALIGNED => -2147210496
;@endregion Constants

;@region Methods
;@endregion Methods
}
