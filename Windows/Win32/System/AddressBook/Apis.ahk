#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\Com\IStream.ahk
#Include .\IMAPIAdviseSink.ahk
#Include ..\Com\StructuredStorage\IStorage.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class AddressBook {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static PROP_ID_SECURE_MIN => 26608

    /**
     * @type {Integer (UInt32)}
     */
    static PROP_ID_SECURE_MAX => 26623

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_DIM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fMapiUnicode => 0

    /**
     * @type {Integer (UInt32)}
     */
    static hrSuccess => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_P1 => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_SUBMITTED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_SHORTTERM => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_NOTRECIP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_THISSESSION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_NOW => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_NOTRESERVED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_COMPOUND => 128

    /**
     * @type {Integer (UInt32)}
     */
    static cchProfileNameMax => 64

    /**
     * @type {Integer (UInt32)}
     */
    static cchProfilePassMax => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MV_FLAG => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PROP_ID_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROP_ID_INVALID => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MV_INSTANCE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static TABLE_CHANGED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TABLE_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TABLE_ROW_ADDED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TABLE_ROW_DELETED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TABLE_ROW_MODIFIED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TABLE_SORT_DONE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TABLE_RESTRICT_DONE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static TABLE_SETCOL_DONE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TABLE_RELOAD => 9

    /**
     * @type {String}
     */
    static szMAPINotificationMsg => "MAPI Notify window message"

    /**
     * @type {Integer (Int32)}
     */
    static MAPI_ERROR_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_USE_DEFAULT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MNID_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MNID_STRING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WAB_LOCAL_CONTAINERS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WAB_PROFILE_CONTENTS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static WAB_IGNORE_PROFILES => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_ONE_OFF_NO_RICH_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UI_SERVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UI_ALWAYS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_UI_ALLOWED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static UI_CURRENT_PROVIDER_FIRST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WABOBJECT_LDAPURL_RETURN_MAILUSER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WABOBJECT_ME_NEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WABOBJECT_ME_NOCREATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WAB_VCARD_FILE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WAB_VCARD_STREAM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WAB_USE_OE_SENDMAIL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WAB_ENABLE_PROFILES => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static WAB_DISPLAY_LDAPURL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WAB_CONTEXT_ADRLIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WAB_DISPLAY_ISNTDS => 4

    /**
     * @type {String}
     */
    static WAB_DLL_NAME => "WAB32.DLL"

    /**
     * @type {String}
     */
    static WAB_DLL_PATH_KEY => "Software\Microsoft\WAB\DLLPath"

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_REQUEST_CANCELLED => -1062600702

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_REQUIRED => -1062600701

    /**
     * @type {Integer (Int32)}
     */
    static S_IMAPI_SPEEDADJUSTED => 11141124

    /**
     * @type {Integer (Int32)}
     */
    static S_IMAPI_ROTATIONADJUSTED => 11141125

    /**
     * @type {Integer (Int32)}
     */
    static S_IMAPI_BOTHADJUSTED => 11141126

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_BURN_VERIFICATION_FAILED => -1062600697

    /**
     * @type {Integer (Int32)}
     */
    static S_IMAPI_COMMAND_HAS_SENSE_DATA => 11141632

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_NO_SUCH_MODE_PAGE => -1062600191

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_MEDIA_NO_MEDIA => -1062600190

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_MEDIA_INCOMPATIBLE => -1062600189

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_MEDIA_UPSIDE_DOWN => -1062600188

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_MEDIA_BECOMING_READY => -1062600187

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_MEDIA_FORMAT_IN_PROGRESS => -1062600186

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_MEDIA_BUSY => -1062600185

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_INVALID_MODE_PARAMETERS => -1062600184

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_MEDIA_WRITE_PROTECTED => -1062600183

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_NO_SUCH_FEATURE => -1062600182

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_FEATURE_IS_NOT_CURRENT => -1062600181

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_GET_CONFIGURATION_NOT_SUPPORTED => -1062600180

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_COMMAND_TIMEOUT => -1062600179

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_DVD_STRUCTURE_NOT_PRESENT => -1062600178

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_MEDIA_SPEED_MISMATCH => -1062600177

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_LOCKED => -1062600176

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_CLIENT_NAME_IS_NOT_VALID => -1062600175

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_MEDIA_NOT_FORMATTED => -1062600174

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RECORDER_INVALID_RESPONSE_FROM_DEVICE => -1062599937

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_LOSS_OF_STREAMING => -1062599936

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_UNEXPECTED_RESPONSE_FROM_DEVICE => -1062599935

    /**
     * @type {Integer (Int32)}
     */
    static S_IMAPI_WRITE_NOT_IN_PROGRESS => 11141890

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2DATA_WRITE_IN_PROGRESS => -1062599680

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2DATA_WRITE_NOT_IN_PROGRESS => -1062599679

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2DATA_INVALID_MEDIA_STATE => -1062599678

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2DATA_STREAM_NOT_SUPPORTED => -1062599677

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2DATA_STREAM_TOO_LARGE_FOR_CURRENT_MEDIA => -1062599676

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2DATA_MEDIA_NOT_BLANK => -1062599675

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2DATA_MEDIA_IS_NOT_SUPPORTED => -1062599674

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2DATA_RECORDER_NOT_SUPPORTED => -1062599673

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2DATA_CLIENT_NAME_IS_NOT_VALID => -1062599672

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_WRITE_IN_PROGRESS => -1062599424

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_WRITE_NOT_IN_PROGRESS => -1062599423

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_MEDIA_IS_NOT_PREPARED => -1062599422

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_MEDIA_IS_PREPARED => -1062599421

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_PROPERTY_FOR_BLANK_MEDIA_ONLY => -1062599420

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_TABLE_OF_CONTENTS_EMPTY_DISC => -1062599419

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_MEDIA_IS_NOT_BLANK => -1062599418

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_MEDIA_IS_NOT_SUPPORTED => -1062599417

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_TRACK_LIMIT_REACHED => -1062599416

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_NOT_ENOUGH_SPACE => -1062599415

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_NO_RECORDER_SPECIFIED => -1062599414

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_INVALID_ISRC => -1062599413

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_INVALID_MCN => -1062599412

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_STREAM_NOT_SUPPORTED => -1062599411

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_RECORDER_NOT_SUPPORTED => -1062599410

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2TAO_CLIENT_NAME_IS_NOT_VALID => -1062599409

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_WRITE_IN_PROGRESS => -1062599168

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_WRITE_NOT_IN_PROGRESS => -1062599167

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_MEDIA_IS_NOT_PREPARED => -1062599166

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_MEDIA_IS_PREPARED => -1062599165

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_CLIENT_NAME_IS_NOT_VALID => -1062599164

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_MEDIA_IS_NOT_BLANK => -1062599162

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_MEDIA_IS_NOT_SUPPORTED => -1062599161

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_NOT_ENOUGH_SPACE => -1062599159

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_NO_RECORDER_SPECIFIED => -1062599158

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_STREAM_NOT_SUPPORTED => -1062599155

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_DATA_BLOCK_TYPE_NOT_SUPPORTED => -1062599154

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_STREAM_LEADIN_TOO_SHORT => -1062599153

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_DF2RAW_RECORDER_NOT_SUPPORTED => -1062599152

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_RECORDER_IN_USE => -2136340224

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_ONLY_ONE_RECORDER_SUPPORTED => -2136340223

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_DISC_INFORMATION_TOO_SMALL => -2136340222

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_MODE_PAGE_2A_TOO_SMALL => -2136340221

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_MEDIA_IS_NOT_ERASABLE => -2136340220

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_DRIVE_FAILED_ERASE_COMMAND => -2136340219

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_TOOK_LONGER_THAN_ONE_HOUR => -2136340218

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_UNEXPECTED_DRIVE_RESPONSE_DURING_ERASE => -2136340217

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_DRIVE_FAILED_SPINUP_COMMAND => -2136340216

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_MEDIA_IS_NOT_SUPPORTED => -1062598391

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_RECORDER_NOT_SUPPORTED => -1062598390

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_ERASE_CLIENT_NAME_IS_NOT_VALID => -1062598389

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RAW_IMAGE_IS_READ_ONLY => -2136339968

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RAW_IMAGE_TOO_MANY_TRACKS => -2136339967

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RAW_IMAGE_SECTOR_TYPE_NOT_SUPPORTED => -2136339966

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RAW_IMAGE_NO_TRACKS => -2136339965

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RAW_IMAGE_TRACKS_ALREADY_ADDED => -2136339964

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RAW_IMAGE_INSUFFICIENT_SPACE => -2136339963

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RAW_IMAGE_TOO_MANY_TRACK_INDEXES => -2136339962

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RAW_IMAGE_TRACK_INDEX_NOT_FOUND => -2136339961

    /**
     * @type {Integer (Int32)}
     */
    static S_IMAPI_RAW_IMAGE_TRACK_INDEX_ALREADY_EXISTS => 11143688

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RAW_IMAGE_TRACK_INDEX_OFFSET_ZERO_CANNOT_BE_CLEARED => -2136339959

    /**
     * @type {Integer (Int32)}
     */
    static E_IMAPI_RAW_IMAGE_TRACK_INDEX_TOO_CLOSE_TO_OTHER_INDEX => -2136339958

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_IMAPI2 => 170

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_FSI_INTERNAL_ERROR => -1062555392

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_INVALID_PARAM => -1062555391

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_READONLY => -1062555390

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NO_OUTPUT => -1062555389

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_INVALID_VOLUME_NAME => -1062555388

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_INVALID_DATE => -1062555387

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_FILE_SYSTEM_NOT_EMPTY => -1062555386

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NOT_FILE => -1062555384

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NOT_DIR => -1062555383

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DIR_NOT_EMPTY => -1062555382

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NOT_IN_FILE_SYSTEM => -1062555381

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_INVALID_PATH => -1062555376

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_RESTRICTED_NAME_VIOLATION => -1062555375

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DUP_NAME => -1062555374

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NO_UNIQUE_NAME => -1062555373

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_ITEM_NOT_FOUND => -1062555368

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_FILE_NOT_FOUND => -1062555367

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DIR_NOT_FOUND => -1062555366

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMAGE_SIZE_LIMIT => -1062555360

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMAGE_TOO_BIG => -1062555359

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DATA_STREAM_INCONSISTENCY => -1062555352

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DATA_STREAM_READ_FAILURE => -1062555351

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DATA_STREAM_CREATE_FAILURE => -1062555350

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DIRECTORY_READ_FAILURE => -1062555349

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_TOO_MANY_DIRS => -1062555344

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_ISO9660_LEVELS => -1062555343

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DATA_TOO_BIG => -1062555342

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_INCOMPATIBLE_PREVIOUS_SESSION => -1062555341

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_STASHFILE_OPEN_FAILURE => -1062555336

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_STASHFILE_SEEK_FAILURE => -1062555335

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_STASHFILE_WRITE_FAILURE => -1062555334

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_STASHFILE_READ_FAILURE => -1062555333

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_INVALID_WORKING_DIRECTORY => -1062555328

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_WORKING_DIRECTORY_SPACE => -1062555327

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_STASHFILE_MOVE => -1062555326

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_BOOT_IMAGE_DATA => -1062555320

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_BOOT_OBJECT_CONFLICT => -1062555319

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_BOOT_EMULATION_IMAGE_SIZE_MISMATCH => -1062555318

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_EMPTY_DISC => -1062555312

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NO_SUPPORTED_FILE_SYSTEM => -1062555311

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_FILE_SYSTEM_NOT_FOUND => -1062555310

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_FILE_SYSTEM_READ_CONSISTENCY_ERROR => -1062555309

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_FILE_SYSTEM_FEATURE_NOT_SUPPORTED => -1062555308

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMPORT_TYPE_COLLISION_FILE_EXISTS_AS_DIRECTORY => -1062555307

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMPORT_SEEK_FAILURE => -1062555306

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMPORT_READ_FAILURE => -1062555305

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DISC_MISMATCH => -1062555304

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMPORT_MEDIA_NOT_ALLOWED => -1062555303

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_UDF_NOT_WRITE_COMPATIBLE => -1062555302

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_INCOMPATIBLE_MULTISESSION_TYPE => -1062555301

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NO_COMPATIBLE_MULTISESSION_TYPE => -1062555300

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_MULTISESSION_NOT_SET => -1062555299

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMPORT_TYPE_COLLISION_DIRECTORY_EXISTS_AS_FILE => -1062555298

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_S_IMAGE_FEATURE_NOT_SUPPORTED => 11186527

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_PROPERTY_NOT_ACCESSIBLE => -1062555296

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_UDF_REVISION_CHANGE_NOT_ALLOWED => -1062555295

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_BAD_MULTISESSION_PARAMETER => -1062555294

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_FILE_SYSTEM_CHANGE_NOT_ALLOWED => -1062555293

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMAGEMANAGER_IMAGE_NOT_ALIGNED => -1062555136

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMAGEMANAGER_NO_VALID_VD_FOUND => -1062555135

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMAGEMANAGER_NO_IMAGE => -1062555134

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_IMAGEMANAGER_IMAGE_TOO_BIG => -1062555133

    /**
     * @type {Integer (Int32)}
     */
    static MAPI_E_CALL_FAILED => -2147467259

    /**
     * @type {Integer (Int32)}
     */
    static MAPI_E_NOT_ENOUGH_MEMORY => -2147024882

    /**
     * @type {Integer (Int32)}
     */
    static MAPI_E_INVALID_PARAMETER => -2147024809

    /**
     * @type {Integer (Int32)}
     */
    static MAPI_E_INTERFACE_NOT_SUPPORTED => -2147467262

    /**
     * @type {Integer (Int32)}
     */
    static MAPI_E_NO_ACCESS => -2147024891

    /**
     * @type {Integer (UInt32)}
     */
    static TAD_ALL_ROWS => 1

    /**
     * @type {Integer (Int32)}
     */
    static PRILOWEST => -32768

    /**
     * @type {Integer (UInt32)}
     */
    static PRIHIGHEST => 32767

    /**
     * @type {Integer (UInt32)}
     */
    static PRIUSER => 0

    /**
     * @type {String}
     */
    static OPENSTREAMONFILE => "OpenStreamOnFile"

    /**
     * @type {String}
     */
    static szHrDispatchNotifications => "HrDispatchNotifications"

    /**
     * @type {String}
     */
    static szScCreateConversationIndex => "ScCreateConversationIndex"
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Pointer<LPALLOCATEBUFFER>} lpAllocateBuffer 
     * @param {Pointer<LPALLOCATEMORE>} lpAllocateMore 
     * @param {Pointer<LPFREEBUFFER>} lpFreeBuffer 
     * @param {Pointer<Void>} lpvReserved 
     * @param {Integer} ulTableType 
     * @param {Integer} ulPropTagIndexColumn 
     * @param {Pointer<SPropTagArray>} lpSPropTagArrayColumns 
     * @param {Pointer<ITableData>} lppTableData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/createtable
     */
    static CreateTable(lpInterface, lpAllocateBuffer, lpAllocateMore, lpFreeBuffer, lpvReserved, ulTableType, ulPropTagIndexColumn, lpSPropTagArrayColumns, lppTableData) {
        lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("rtm.dll\CreateTable", "ptr", lpInterface, "ptr", lpAllocateBuffer, "ptr", lpAllocateMore, "ptr", lpFreeBuffer, lpvReservedMarshal, lpvReserved, "uint", ulTableType, "uint", ulPropTagIndexColumn, "ptr", lpSPropTagArrayColumns, "ptr*", lppTableData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Pointer<LPALLOCATEBUFFER>} lpAllocateBuffer 
     * @param {Pointer<LPALLOCATEMORE>} lpAllocateMore 
     * @param {Pointer<LPFREEBUFFER>} lpFreeBuffer 
     * @param {Pointer<Void>} lpvReserved 
     * @param {Pointer<IPropData>} lppPropData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/createiprop
     */
    static CreateIProp(lpInterface, lpAllocateBuffer, lpAllocateMore, lpFreeBuffer, lpvReserved, lppPropData) {
        lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("MAPI32.dll\CreateIProp", "ptr", lpInterface, "ptr", lpAllocateBuffer, "ptr", lpAllocateMore, "ptr", lpFreeBuffer, lpvReservedMarshal, lpvReserved, "ptr*", lppPropData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvReserved 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapiinitidle
     */
    static MAPIInitIdle(lpvReserved) {
        lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("MAPI32.dll\MAPIInitIdle", lpvReservedMarshal, lpvReserved, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static MAPIDeinitIdle() {
        DllCall("MAPI32.dll\MAPIDeinitIdle")
    }

    /**
     * 
     * @param {Pointer<PFNIDLE>} lpfnIdle 
     * @param {Pointer<Void>} lpvIdleParam 
     * @param {Integer} priIdle 
     * @param {Integer} csecIdle 
     * @param {Integer} iroIdle 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftgregisteridleroutine
     */
    static FtgRegisterIdleRoutine(lpfnIdle, lpvIdleParam, priIdle, csecIdle, iroIdle) {
        lpvIdleParamMarshal := lpvIdleParam is VarRef ? "ptr" : "ptr"

        result := DllCall("MAPI32.dll\FtgRegisterIdleRoutine", "ptr", lpfnIdle, lpvIdleParamMarshal, lpvIdleParam, "short", priIdle, "uint", csecIdle, "ushort", iroIdle, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ftg 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/deregisteridleroutine
     */
    static DeregisterIdleRoutine(ftg) {
        ftgMarshal := ftg is VarRef ? "ptr" : "ptr"

        DllCall("MAPI32.dll\DeregisterIdleRoutine", ftgMarshal, ftg)
    }

    /**
     * 
     * @param {Pointer<Void>} ftg 
     * @param {BOOL} fEnable 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/enableidleroutine
     */
    static EnableIdleRoutine(ftg, fEnable) {
        ftgMarshal := ftg is VarRef ? "ptr" : "ptr"

        DllCall("MAPI32.dll\EnableIdleRoutine", ftgMarshal, ftg, "int", fEnable)
    }

    /**
     * 
     * @param {Pointer<Void>} ftg 
     * @param {Pointer<PFNIDLE>} lpfnIdle 
     * @param {Pointer<Void>} lpvIdleParam 
     * @param {Integer} priIdle 
     * @param {Integer} csecIdle 
     * @param {Integer} iroIdle 
     * @param {Integer} ircIdle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/changeidleroutine
     */
    static ChangeIdleRoutine(ftg, lpfnIdle, lpvIdleParam, priIdle, csecIdle, iroIdle, ircIdle) {
        ftgMarshal := ftg is VarRef ? "ptr" : "ptr"
        lpvIdleParamMarshal := lpvIdleParam is VarRef ? "ptr" : "ptr"

        DllCall("MAPI32.dll\ChangeIdleRoutine", ftgMarshal, ftg, "ptr", lpfnIdle, lpvIdleParamMarshal, lpvIdleParam, "short", priIdle, "uint", csecIdle, "ushort", iroIdle, "ushort", ircIdle)
    }

    /**
     * 
     * @returns {IMalloc} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapigetdefaultmalloc
     */
    static MAPIGetDefaultMalloc() {
        result := DllCall("MAPI32.dll\MAPIGetDefaultMalloc", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<LPALLOCATEBUFFER>} lpAllocateBuffer 
     * @param {Pointer<LPFREEBUFFER>} lpFreeBuffer 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpszFileName 
     * @param {Pointer<Integer>} lpszPrefix 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/openstreamonfile
     */
    static OpenStreamOnFile(lpAllocateBuffer, lpFreeBuffer, ulFlags, lpszFileName, lpszPrefix) {
        lpszFileNameMarshal := lpszFileName is VarRef ? "char*" : "ptr"
        lpszPrefixMarshal := lpszPrefix is VarRef ? "char*" : "ptr"

        result := DllCall("MAPI32.dll\OpenStreamOnFile", "ptr", lpAllocateBuffer, "ptr", lpFreeBuffer, "uint", ulFlags, lpszFileNameMarshal, lpszFileName, lpszPrefixMarshal, lpszPrefix, "ptr*", &lppStream := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IStream(lppStream)
    }

    /**
     * 
     * @param {Pointer<SPropValue>} lpSPropValueDest 
     * @param {Pointer<SPropValue>} lpSPropValueSrc 
     * @param {Pointer<LPALLOCATEMORE>} lpfAllocMore 
     * @param {Pointer<Void>} lpvObject 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/propcopymore
     */
    static PropCopyMore(lpSPropValueDest, lpSPropValueSrc, lpfAllocMore, lpvObject) {
        lpvObjectMarshal := lpvObject is VarRef ? "ptr" : "ptr"

        result := DllCall("MAPI32.dll\PropCopyMore", "ptr", lpSPropValueDest, "ptr", lpSPropValueSrc, "ptr", lpfAllocMore, lpvObjectMarshal, lpvObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropValue>} lpSPropValue 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ulpropsize
     */
    static UlPropSize(lpSPropValue) {
        result := DllCall("MAPI32.dll\UlPropSize", "ptr", lpSPropValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MAPINAMEID>} lpName1 
     * @param {Pointer<MAPINAMEID>} lpName2 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/fequalnames
     */
    static FEqualNames(lpName1, lpName2) {
        result := DllCall("MAPI32.dll\FEqualNames", "ptr", lpName1, "ptr", lpName2, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropValue>} lpSPropValueDst 
     * @param {Pointer<SPropValue>} lpSPropValueSrc 
     * @param {Integer} ulFuzzyLevel 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/fpropcontainsprop
     */
    static FPropContainsProp(lpSPropValueDst, lpSPropValueSrc, ulFuzzyLevel) {
        result := DllCall("MAPI32.dll\FPropContainsProp", "ptr", lpSPropValueDst, "ptr", lpSPropValueSrc, "uint", ulFuzzyLevel, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropValue>} lpSPropValue1 
     * @param {Integer} ulRelOp 
     * @param {Pointer<SPropValue>} lpSPropValue2 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/fpropcompareprop
     */
    static FPropCompareProp(lpSPropValue1, ulRelOp, lpSPropValue2) {
        result := DllCall("MAPI32.dll\FPropCompareProp", "ptr", lpSPropValue1, "uint", ulRelOp, "ptr", lpSPropValue2, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropValue>} lpSPropValueA 
     * @param {Pointer<SPropValue>} lpSPropValueB 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/lpropcompareprop
     */
    static LPropCompareProp(lpSPropValueA, lpSPropValueB) {
        result := DllCall("MAPI32.dll\LPropCompareProp", "ptr", lpSPropValueA, "ptr", lpSPropValueB, "int")
        return result
    }

    /**
     * 
     * @param {IMAPITable} lptbl 
     * @param {Pointer<SPropTagArray>} lpproptagColumnsNew 
     * @param {Pointer<LPALLOCATEBUFFER>} lpAllocateBuffer 
     * @param {Pointer<LPFREEBUFFER>} lpFreeBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hraddcolumns
     */
    static HrAddColumns(lptbl, lpproptagColumnsNew, lpAllocateBuffer, lpFreeBuffer) {
        result := DllCall("MAPI32.dll\HrAddColumns", "ptr", lptbl, "ptr", lpproptagColumnsNew, "ptr", lpAllocateBuffer, "ptr", lpFreeBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IMAPITable} lptbl 
     * @param {Pointer<SPropTagArray>} lpproptagColumnsNew 
     * @param {Pointer<LPALLOCATEBUFFER>} lpAllocateBuffer 
     * @param {Pointer<LPFREEBUFFER>} lpFreeBuffer 
     * @param {Pointer} lpfnFilterColumns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hraddcolumnsex
     */
    static HrAddColumnsEx(lptbl, lpproptagColumnsNew, lpAllocateBuffer, lpFreeBuffer, lpfnFilterColumns) {
        result := DllCall("MAPI32.dll\HrAddColumnsEx", "ptr", lptbl, "ptr", lpproptagColumnsNew, "ptr", lpAllocateBuffer, "ptr", lpFreeBuffer, "ptr", lpfnFilterColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LPNOTIFCALLBACK>} lpfnCallback 
     * @param {Pointer<Void>} lpvContext 
     * @returns {IMAPIAdviseSink} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrallocadvisesink
     */
    static HrAllocAdviseSink(lpfnCallback, lpvContext) {
        lpvContextMarshal := lpvContext is VarRef ? "ptr" : "ptr"

        result := DllCall("MAPI32.dll\HrAllocAdviseSink", "ptr", lpfnCallback, lpvContextMarshal, lpvContext, "ptr*", &lppAdviseSink := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IMAPIAdviseSink(lppAdviseSink)
    }

    /**
     * 
     * @param {IMAPIAdviseSink} lpAdviseSink 
     * @returns {IMAPIAdviseSink} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrthisthreadadvisesink
     */
    static HrThisThreadAdviseSink(lpAdviseSink) {
        result := DllCall("MAPI32.dll\HrThisThreadAdviseSink", "ptr", lpAdviseSink, "ptr*", &lppAdviseSink := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IMAPIAdviseSink(lppAdviseSink)
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrdispatchnotifications
     */
    static HrDispatchNotifications(ulFlags) {
        result := DllCall("MAPI32.dll\HrDispatchNotifications", "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LPALLOCATEBUFFER>} lpAllocateBuffer 
     * @param {Pointer<LPALLOCATEMORE>} lpAllocateMore 
     * @param {Pointer<LPFREEBUFFER>} lpFreeBuffer 
     * @param {IMalloc} lpMalloc 
     * @param {HINSTANCE} hInstance 
     * @param {Integer} cPages 
     * @param {Pointer<DTPAGE>} lpPage 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @param {Pointer<ITableData>} lppTblData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/builddisplaytable
     */
    static BuildDisplayTable(lpAllocateBuffer, lpAllocateMore, lpFreeBuffer, lpMalloc, hInstance, cPages, lpPage, ulFlags, lppTable, lppTblData) {
        hInstance := hInstance is Win32Handle ? NumGet(hInstance, "ptr") : hInstance

        result := DllCall("MAPI32.dll\BuildDisplayTable", "ptr", lpAllocateBuffer, "ptr", lpAllocateMore, "ptr", lpFreeBuffer, "ptr", lpMalloc, "ptr", hInstance, "uint", cPages, "ptr", lpPage, "uint", ulFlags, "ptr*", lppTable, "ptr*", lppTblData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cNotifications 
     * @param {Pointer<NOTIFICATION>} lpNotifications 
     * @param {Pointer<Integer>} lpcb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sccountnotifications
     */
    static ScCountNotifications(cNotifications, lpNotifications, lpcb) {
        lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

        result := DllCall("MAPI32.dll\ScCountNotifications", "int", cNotifications, "ptr", lpNotifications, lpcbMarshal, lpcb, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cNotification 
     * @param {Pointer<NOTIFICATION>} lpNotifications 
     * @param {Pointer<Void>} lpvDst 
     * @param {Pointer<Integer>} lpcb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sccopynotifications
     */
    static ScCopyNotifications(cNotification, lpNotifications, lpvDst, lpcb) {
        lpvDstMarshal := lpvDst is VarRef ? "ptr" : "ptr"
        lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

        result := DllCall("MAPI32.dll\ScCopyNotifications", "int", cNotification, "ptr", lpNotifications, lpvDstMarshal, lpvDst, lpcbMarshal, lpcb, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cNotification 
     * @param {Pointer<NOTIFICATION>} lpNotifications 
     * @param {Pointer<Void>} lpvBaseOld 
     * @param {Pointer<Void>} lpvBaseNew 
     * @param {Pointer<Integer>} lpcb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/screlocnotifications
     */
    static ScRelocNotifications(cNotification, lpNotifications, lpvBaseOld, lpvBaseNew, lpcb) {
        lpvBaseOldMarshal := lpvBaseOld is VarRef ? "ptr" : "ptr"
        lpvBaseNewMarshal := lpvBaseNew is VarRef ? "ptr" : "ptr"
        lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

        result := DllCall("MAPI32.dll\ScRelocNotifications", "int", cNotification, "ptr", lpNotifications, lpvBaseOldMarshal, lpvBaseOld, lpvBaseNewMarshal, lpvBaseNew, lpcbMarshal, lpcb, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpPropArray 
     * @param {Pointer<Integer>} lpcb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sccountprops
     */
    static ScCountProps(cValues, lpPropArray, lpcb) {
        lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

        result := DllCall("MAPI32.dll\ScCountProps", "int", cValues, "ptr", lpPropArray, lpcbMarshal, lpcb, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ulPropTag 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpPropArray 
     * @returns {Pointer<SPropValue>} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/lpvalfindprop
     */
    static LpValFindProp(ulPropTag, cValues, lpPropArray) {
        result := DllCall("MAPI32.dll\LpValFindProp", "uint", ulPropTag, "uint", cValues, "ptr", lpPropArray, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpPropArray 
     * @param {Pointer<Void>} lpvDst 
     * @param {Pointer<Integer>} lpcb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sccopyprops
     */
    static ScCopyProps(cValues, lpPropArray, lpvDst, lpcb) {
        lpvDstMarshal := lpvDst is VarRef ? "ptr" : "ptr"
        lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

        result := DllCall("MAPI32.dll\ScCopyProps", "int", cValues, "ptr", lpPropArray, lpvDstMarshal, lpvDst, lpcbMarshal, lpcb, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpPropArray 
     * @param {Pointer<Void>} lpvBaseOld 
     * @param {Pointer<Void>} lpvBaseNew 
     * @param {Pointer<Integer>} lpcb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/screlocprops
     */
    static ScRelocProps(cValues, lpPropArray, lpvBaseOld, lpvBaseNew, lpcb) {
        lpvBaseOldMarshal := lpvBaseOld is VarRef ? "ptr" : "ptr"
        lpvBaseNewMarshal := lpvBaseNew is VarRef ? "ptr" : "ptr"
        lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

        result := DllCall("MAPI32.dll\ScRelocProps", "int", cValues, "ptr", lpPropArray, lpvBaseOldMarshal, lpvBaseOld, lpvBaseNewMarshal, lpvBaseNew, lpcbMarshal, lpcb, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpPropArray 
     * @param {Pointer<LPALLOCATEBUFFER>} lpAllocateBuffer 
     * @param {Pointer<Pointer<SPropValue>>} lppPropArray 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/scduppropset
     */
    static ScDupPropset(cValues, lpPropArray, lpAllocateBuffer, lppPropArray) {
        lppPropArrayMarshal := lppPropArray is VarRef ? "ptr*" : "ptr"

        result := DllCall("MAPI32.dll\ScDupPropset", "int", cValues, "ptr", lpPropArray, "ptr", lpAllocateBuffer, lppPropArrayMarshal, lppPropArray, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpunk 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/uladdref
     */
    static UlAddRef(lpunk) {
        lpunkMarshal := lpunk is VarRef ? "ptr" : "ptr"

        result := DllCall("MAPI32.dll\UlAddRef", lpunkMarshal, lpunk, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpunk 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ulrelease
     */
    static UlRelease(lpunk) {
        lpunkMarshal := lpunk is VarRef ? "ptr" : "ptr"

        result := DllCall("MAPI32.dll\UlRelease", lpunkMarshal, lpunk, "uint")
        return result
    }

    /**
     * 
     * @param {IMAPIProp} lpMapiProp 
     * @param {Integer} ulPropTag 
     * @param {Pointer<Pointer<SPropValue>>} lppProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrgetoneprop
     */
    static HrGetOneProp(lpMapiProp, ulPropTag, lppProp) {
        lppPropMarshal := lppProp is VarRef ? "ptr*" : "ptr"

        result := DllCall("MAPI32.dll\HrGetOneProp", "ptr", lpMapiProp, "uint", ulPropTag, lppPropMarshal, lppProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IMAPIProp} lpMapiProp 
     * @param {Pointer<SPropValue>} lpProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrsetoneprop
     */
    static HrSetOneProp(lpMapiProp, lpProp) {
        result := DllCall("MAPI32.dll\HrSetOneProp", "ptr", lpMapiProp, "ptr", lpProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IMAPIProp} lpMapiProp 
     * @param {Integer} ulPropTag 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/fpropexists
     */
    static FPropExists(lpMapiProp, ulPropTag) {
        result := DllCall("MAPI32.dll\FPropExists", "ptr", lpMapiProp, "uint", ulPropTag, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropValue>} lpPropArray 
     * @param {Integer} cValues 
     * @param {Integer} ulPropTag 
     * @returns {Pointer<SPropValue>} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ppropfindprop
     */
    static PpropFindProp(lpPropArray, cValues, ulPropTag) {
        result := DllCall("MAPI32.dll\PpropFindProp", "ptr", lpPropArray, "uint", cValues, "uint", ulPropTag, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ADRLIST>} lpAdrlist 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/freepadrlist
     */
    static FreePadrlist(lpAdrlist) {
        DllCall("MAPI32.dll\FreePadrlist", "ptr", lpAdrlist)
    }

    /**
     * 
     * @param {Pointer<SRowSet>} lpRows 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/freeprows
     */
    static FreeProws(lpRows) {
        DllCall("MAPI32.dll\FreeProws", "ptr", lpRows)
    }

    /**
     * 
     * @param {IMAPITable} lpTable 
     * @param {Pointer<SPropTagArray>} lpPropTags 
     * @param {Pointer<SRestriction>} lpRestriction 
     * @param {Pointer<SSortOrderSet>} lpSortOrderSet 
     * @param {Integer} crowsMax 
     * @param {Pointer<Pointer<SRowSet>>} lppRows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrqueryallrows
     */
    static HrQueryAllRows(lpTable, lpPropTags, lpRestriction, lpSortOrderSet, crowsMax, lppRows) {
        lppRowsMarshal := lppRows is VarRef ? "ptr*" : "ptr"

        result := DllCall("MAPI32.dll\HrQueryAllRows", "ptr", lpTable, "ptr", lpPropTags, "ptr", lpRestriction, "ptr", lpSortOrderSet, "int", crowsMax, lppRowsMarshal, lppRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpsz 
     * @param {Integer} ch 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/szfindch
     */
    static SzFindCh(lpsz, ch) {
        lpszMarshal := lpsz is VarRef ? "char*" : "ptr"

        result := DllCall("MAPI32.dll\SzFindCh", lpszMarshal, lpsz, "ushort", ch, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpsz 
     * @param {Integer} ch 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/szfindlastch
     */
    static SzFindLastCh(lpsz, ch) {
        lpszMarshal := lpsz is VarRef ? "char*" : "ptr"

        result := DllCall("MAPI32.dll\SzFindLastCh", lpszMarshal, lpsz, "ushort", ch, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpsz 
     * @param {Pointer<Integer>} lpszKey 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/szfindsz
     */
    static SzFindSz(lpsz, lpszKey) {
        lpszMarshal := lpsz is VarRef ? "char*" : "ptr"
        lpszKeyMarshal := lpszKey is VarRef ? "char*" : "ptr"

        result := DllCall("MAPI32.dll\SzFindSz", lpszMarshal, lpsz, lpszKeyMarshal, lpszKey, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpsz 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ufromsz
     */
    static UFromSz(lpsz) {
        lpszMarshal := lpsz is VarRef ? "char*" : "ptr"

        result := DllCall("MAPI32.dll\UFromSz", lpszMarshal, lpsz, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} lpszLocal 
     * @param {PSTR} lpszUNC 
     * @param {Integer} cchUNC 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/scuncfromlocalpath
     */
    static ScUNCFromLocalPath(lpszLocal, lpszUNC, cchUNC) {
        lpszLocal := lpszLocal is String ? StrPtr(lpszLocal) : lpszLocal
        lpszUNC := lpszUNC is String ? StrPtr(lpszUNC) : lpszUNC

        result := DllCall("MAPI32.dll\ScUNCFromLocalPath", "ptr", lpszLocal, "ptr", lpszUNC, "uint", cchUNC, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} lpszUNC 
     * @param {PSTR} lpszLocal 
     * @param {Integer} cchLocal 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sclocalpathfromunc
     */
    static ScLocalPathFromUNC(lpszUNC, lpszLocal, cchLocal) {
        lpszUNC := lpszUNC is String ? StrPtr(lpszUNC) : lpszUNC
        lpszLocal := lpszLocal is String ? StrPtr(lpszLocal) : lpszLocal

        result := DllCall("MAPI32.dll\ScLocalPathFromUNC", "ptr", lpszUNC, "ptr", lpszLocal, "uint", cchLocal, "int")
        return result
    }

    /**
     * 
     * @param {FILETIME} ftAddend1 
     * @param {FILETIME} ftAddend2 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftaddft
     */
    static FtAddFt(ftAddend1, ftAddend2) {
        result := DllCall("MAPI32.dll\FtAddFt", "ptr", ftAddend1, "ptr", ftAddend2, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} ftMultiplicand 
     * @param {Integer} ftMultiplier 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftmuldwdw
     */
    static FtMulDwDw(ftMultiplicand, ftMultiplier) {
        result := DllCall("MAPI32.dll\FtMulDwDw", "uint", ftMultiplicand, "uint", ftMultiplier, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} ftMultiplier 
     * @param {FILETIME} ftMultiplicand 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftmuldw
     */
    static FtMulDw(ftMultiplier, ftMultiplicand) {
        result := DllCall("MAPI32.dll\FtMulDw", "uint", ftMultiplier, "ptr", ftMultiplicand, "ptr")
        return result
    }

    /**
     * 
     * @param {FILETIME} ftMinuend 
     * @param {FILETIME} ftSubtrahend 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftsubft
     */
    static FtSubFt(ftMinuend, ftSubtrahend) {
        result := DllCall("MAPI32.dll\FtSubFt", "ptr", ftMinuend, "ptr", ftSubtrahend, "ptr")
        return result
    }

    /**
     * 
     * @param {FILETIME} ft 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftnegft
     */
    static FtNegFt(ft) {
        result := DllCall("MAPI32.dll\FtNegFt", "ptr", ft, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} cbParent 
     * @param {Pointer<Integer>} lpbParent 
     * @param {Pointer<Integer>} lpcbConvIndex 
     * @param {Pointer<Pointer<Integer>>} lppbConvIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sccreateconversationindex
     */
    static ScCreateConversationIndex(cbParent, lpbParent, lpcbConvIndex, lppbConvIndex) {
        lpbParentMarshal := lpbParent is VarRef ? "char*" : "ptr"
        lpcbConvIndexMarshal := lpcbConvIndex is VarRef ? "uint*" : "ptr"
        lppbConvIndexMarshal := lppbConvIndex is VarRef ? "ptr*" : "ptr"

        result := DllCall("MAPI32.dll\ScCreateConversationIndex", "uint", cbParent, lpbParentMarshal, lpbParent, lpcbConvIndexMarshal, lpcbConvIndex, lppbConvIndexMarshal, lppbConvIndex, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpszDLLName 
     * @param {Integer} cbOrigEntry 
     * @param {Pointer} lpOrigEntry 
     * @param {Pointer} lppWrappedEntry 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/wrapstoreentryid
     */
    static WrapStoreEntryID(ulFlags, lpszDLLName, cbOrigEntry, lpOrigEntry, lppWrappedEntry) {
        lpszDLLNameMarshal := lpszDLLName is VarRef ? "char*" : "ptr"

        result := DllCall("MAPI32.dll\WrapStoreEntryID", "uint", ulFlags, lpszDLLNameMarshal, lpszDLLName, "uint", cbOrigEntry, "ptr", lpOrigEntry, "uint*", &lpcbWrappedEntry := 0, "ptr", lppWrappedEntry, "int")
        if(result != 0)
            throw OSError(result)

        return lpcbWrappedEntry
    }

    /**
     * 
     * @param {IMessage} lpMessage 
     * @param {Integer} ulFlags 
     * @param {Pointer<BOOL>} lpfMessageUpdated 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/rtfsync
     */
    static RTFSync(lpMessage, ulFlags, lpfMessageUpdated) {
        lpfMessageUpdatedMarshal := lpfMessageUpdated is VarRef ? "int*" : "ptr"

        result := DllCall("MAPI32.dll\RTFSync", "ptr", lpMessage, "uint", ulFlags, lpfMessageUpdatedMarshal, lpfMessageUpdated, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IStream} lpCompressedRTFStream 
     * @param {Integer} ulFlags 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/wrapcompressedrtfstream
     */
    static WrapCompressedRTFStream(lpCompressedRTFStream, ulFlags) {
        result := DllCall("MAPI32.dll\WrapCompressedRTFStream", "ptr", lpCompressedRTFStream, "uint", ulFlags, "ptr*", &lpUncompressedRTFStream := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IStream(lpUncompressedRTFStream)
    }

    /**
     * 
     * @param {IUnknown} lpUnkIn 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @returns {IStorage} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hristoragefromstream
     */
    static HrIStorageFromStream(lpUnkIn, lpInterface, ulFlags) {
        result := DllCall("MAPI32.dll\HrIStorageFromStream", "ptr", lpUnkIn, "ptr", lpInterface, "uint", ulFlags, "ptr*", &lppStorageOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IStorage(lppStorageOut)
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/scinitmapiutil
     */
    static ScInitMapiUtil(ulFlags) {
        result := DllCall("MAPI32.dll\ScInitMapiUtil", "uint", ulFlags, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/deinitmapiutil
     */
    static DeinitMapiUtil() {
        DllCall("MAPI32.dll\DeinitMapiUtil")
    }

;@endregion Methods
}
