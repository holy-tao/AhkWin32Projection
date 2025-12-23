#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class Imapi {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPI_SECTOR_SIZE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPI2_DEFAULT_COMMAND_TIMEOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DDISCMASTER2EVENTS_DEVICEADDED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DDISCMASTER2EVENTS_DEVICEREMOVED => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_EJECTMEDIA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_CLOSETRAY => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_ACQUIREEXCLUSIVEACCESS => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_RELEASEEXCLUSIVEACCESS => 259

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_DISABLEMCN => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_ENABLEMCN => 261

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_INITIALIZEDISCRECORDER => 262

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_ACTIVEDISCRECORDER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_VENDORID => 513

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_PRODUCTID => 514

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_PRODUCTREVISION => 515

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_VOLUMENAME => 516

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_VOLUMEPATHNAMES => 517

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_DEVICECANLOADMEDIA => 518

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_LEGACYDEVICENUMBER => 519

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_SUPPORTEDFEATUREPAGES => 520

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_CURRENTFEATUREPAGES => 521

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_SUPPORTEDPROFILES => 522

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_CURRENTPROFILES => 523

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_SUPPORTEDMODEPAGES => 524

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCRECORDER2_EXCLUSIVEACCESSOWNER => 525

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2_WRITESECTION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2_CANCELWRITE => 513

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2_DISCRECORDER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2_USESTREAMINGWRITE12 => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2_STARTINGSECTORSPERSECOND => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2_ENDINGSECTORSPERSECOND => 259

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2_BYTESPERSECTOR => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2_WRITEINPROGRESS => 261

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2EVENTARGS_STARTLBA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2EVENTARGS_SECTORCOUNT => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2EVENTARGS_LASTREADLBA => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2EVENTARGS_LASTWRITTENLBA => 259

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2EVENTARGS_TOTALDEVICEBUFFER => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2EVENTARGS_USEDDEVICEBUFFER => 261

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2EVENTARGS_TOTALSYSTEMBUFFER => 262

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2EVENTARGS_USEDSYSTEMBUFFER => 263

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWRITEENGINE2EVENTARGS_FREESYSTEMBUFFER => 264

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DWRITEENGINE2EVENTS_UPDATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2_RECORDERSUPPORTED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2_MEDIASUPPORTED => 2049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2_MEDIAPHYSICALLYBLANK => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2_MEDIAHEURISTICALLYBLANK => 1793

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2_SUPPORTEDMEDIATYPES => 1794

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2ERASE_RECORDER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2ERASE_FULLERASE => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2ERASE_MEDIATYPE => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2ERASE_CLIENTNAME => 259

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2ERASE_ERASEMEDIA => 513

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2ERASEEVENTS_UPDATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_RECORDER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_BUFFERUNDERRUNFREEDISABLED => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_POSTGAPALREADYINIMAGE => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_CURRENTMEDIASTATUS => 262

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_WRITEPROTECTSTATUS => 263

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_TOTALSECTORS => 264

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_FREESECTORS => 265

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_NEXTWRITABLEADDRESS => 266

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_STARTSECTOROFPREVIOUSSESSION => 267

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_LASTSECTOROFPREVIOUSSESSION => 268

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_FORCEMEDIATOBECLOSED => 269

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_DISABLEDVDCOMPATIBILITYMODE => 270

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_CURRENTMEDIATYPE => 271

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_CLIENTNAME => 272

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_REQUESTEDWRITESPEED => 273

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_REQUESTEDROTATIONTYPEISPURECAV => 274

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_CURRENTWRITESPEED => 275

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_CURRENTROTATIONTYPEISPURECAV => 276

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_SUPPORTEDWRITESPEEDS => 277

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_SUPPORTEDWRITESPEEDDESCRIPTORS => 278

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_FORCEOVERWRITE => 279

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_MUTLISESSIONINTERFACES => 280

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_WRITE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_CANCELWRITE => 513

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATA_SETWRITESPEED => 514

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DDISCFORMAT2DATAEVENTS_UPDATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATAEVENTARGS_ELAPSEDTIME => 768

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATAEVENTARGS_ESTIMATEDREMAININGTIME => 769

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATAEVENTARGS_ESTIMATEDTOTALTIME => 770

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2DATAEVENTARGS_CURRENTACTION => 771

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_RECORDER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_BUFFERUNDERRUNFREEDISABLED => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_NUMBEROFEXISTINGTRACKS => 259

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_TOTALSECTORSONMEDIA => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_FREESECTORSONMEDIA => 261

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_USEDSECTORSONMEDIA => 262

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_DONOTFINALIZEMEDIA => 263

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_EXPECTEDTABLEOFCONTENTS => 266

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_CURRENTMEDIATYPE => 267

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_CLIENTNAME => 270

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_REQUESTEDWRITESPEED => 271

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_REQUESTEDROTATIONTYPEISPURECAV => 272

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_CURRENTWRITESPEED => 273

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_CURRENTROTATIONTYPEISPURECAV => 274

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_SUPPORTEDWRITESPEEDS => 275

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_SUPPORTEDWRITESPEEDDESCRIPTORS => 276

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_PREPAREMEDIA => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_ADDAUDIOTRACK => 513

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_CANCELADDTRACK => 514

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_FINISHMEDIA => 515

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAO_SETWRITESPEED => 516

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DDISCFORMAT2TAOEVENTS_UPDATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAOEVENTARGS_CURRENTTRACKNUMBER => 768

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAOEVENTARGS_CURRENTACTION => 769

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAOEVENTARGS_ELAPSEDTIME => 770

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAOEVENTARGS_ESTIMATEDREMAININGTIME => 771

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2TAOEVENTARGS_ESTIMATEDTOTALTIME => 772

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_RECORDER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_BUFFERUNDERRUNFREEDISABLED => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_STARTOFNEXTSESSION => 259

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_LASTPOSSIBLESTARTOFLEADOUT => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_CURRENTMEDIATYPE => 261

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_SUPPORTEDDATASECTORTYPES => 264

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_REQUESTEDDATASECTORTYPE => 265

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_CLIENTNAME => 266

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_REQUESTEDWRITESPEED => 267

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_REQUESTEDROTATIONTYPEISPURECAV => 268

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_CURRENTWRITESPEED => 269

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_CURRENTROTATIONTYPEISPURECAV => 270

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_SUPPORTEDWRITESPEEDS => 271

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_SUPPORTEDWRITESPEEDDESCRIPTORS => 272

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_PREPAREMEDIA => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_WRITEMEDIA => 513

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_WRITEMEDIAWITHVALIDATION => 514

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_CANCELWRITE => 515

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_RELEASEMEDIA => 516

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCD_SETWRITESPEED => 517

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DDISCFORMAT2RAWCDEVENTS_UPDATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCDEVENTARGS_CURRENTTRACKNUMBER => 768

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCDEVENTARGS_CURRENTACTION => 769

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCDEVENTARGS_ELAPSEDTIME => 768

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCDEVENTARGS_ESTIMATEDREMAININGTIME => 769

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDISCFORMAT2RAWCDEVENTARGS_ESTIMATEDTOTALTIME => 770

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPI_SECTORS_PER_SECOND_AT_1X_CD => 75

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPI_SECTORS_PER_SECOND_AT_1X_DVD => 680

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPI_SECTORS_PER_SECOND_AT_1X_BD => 2195

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPI_SECTORS_PER_SECOND_AT_1X_HD_DVD => 4568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_SUPPORTEDONCURRENTMEDIA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_INUSE => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_IMPORTRECORDER => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_FIRSTDATASESSION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_STARTSECTOROFPREVIOUSSESSION => 513

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_LASTSECTOROFPREVIOUSSESSION => 514

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_NEXTWRITABLEADDRESS => 515

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_FREESECTORS => 516

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_WRITEUNITSIZE => 517

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_LASTWRITTENADDRESS => 518

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMULTISESSION_SECTORSONMEDIA => 519

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_CREATERESULTIMAGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_ADDTRACK => 513

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_ADDSPECIALPREGAP => 514

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_ADDSUBCODERWGENERATOR => 515

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_RESULTINGIMAGETYPE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_STARTOFLEADOUT => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_STARTOFLEADOUTLIMIT => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_DISABLEGAPLESSAUDIO => 259

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_MEDIACATALOGNUMBER => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_STARTINGTRACKNUMBER => 261

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_TRACKINFO => 262

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_NUMBEROFEXISTINGTRACKS => 263

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_USEDSECTORSONDISC => 264

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDIMAGECREATOR_EXPECTEDTABLEOFCONTENTS => 265

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDTRACKINFO_STARTINGLBA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDTRACKINFO_SECTORCOUNT => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDTRACKINFO_TRACKNUMBER => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDTRACKINFO_SECTORTYPE => 259

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDTRACKINFO_ISRC => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDTRACKINFO_DIGITALAUDIOCOPYSETTING => 261

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRAWCDTRACKINFO_AUDIOHASPREEMPHASIS => 262

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IBLOCKRANGE_STARTLBA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IBLOCKRANGE_ENDLBA => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IBLOCKRANGELIST_BLOCKRANGES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPILib2_MajorVersion => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPILib2_MinorVersion => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPI2FS_BOOT_ENTRY_COUNT_MAX => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DFILESYSTEMIMAGEEVENTS_UPDATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DFILESYSTEMIMAGEIMPORTEVENTS_UPDATEIMPORT => 257

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPI2FS_MajorVersion => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAPI2FS_MinorVersion => 0

    /**
     * @type {String}
     */
    static IMAPI2FS_FullVersion_STR => "1.0"

    /**
     * @type {String}
     */
    static IMAPI2FS_FullVersion_WSTR => "1.0"

    /**
     * @type {Integer (UInt32)}
     */
    static MP_MSGCLASS_SYSTEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MP_MSGCLASS_REPLICATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MP_MSGCLASS_DELIVERY_REPORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MP_MSGCLASS_NONDELIVERY_REPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MP_STATUS_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MP_STATUS_RETRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MP_STATUS_ABORT_DELIVERY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MP_STATUS_BAD_MAIL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MP_STATUS_SUBMITTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MP_STATUS_CATEGORIZED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MP_STATUS_ABANDON_DELIVERY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RP_RECIP_FLAGS_RESERVED => 15

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_NOTIFY_SUCCESS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_NOTIFY_FAILURE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_NOTIFY_DELAY => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_NOTIFY_NEVER => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_NOTIFY_MASK => 251658240

    /**
     * @type {Integer (UInt32)}
     */
    static RP_HANDLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RP_GENERAL_FAILURE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_HANDLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DELIVERED => 272

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_SENT_NDR => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static RP_FAILED => 2096

    /**
     * @type {Integer (UInt32)}
     */
    static RP_UNRESOLVED => 4144

    /**
     * @type {Integer (UInt32)}
     */
    static RP_ENPANDED => 8208

    /**
     * @type {Integer (UInt32)}
     */
    static RP_EXPANDED => 8208

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_SENT_DELAYED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_SENT_EXPANDED => 32832

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_SENT_RELAYED => 65600

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_SENT_DELIVERED => 131136

    /**
     * @type {Integer (UInt32)}
     */
    static RP_REMOTE_MTA_NO_DSN => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static RP_ERROR_CONTEXT_STORE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static RP_ERROR_CONTEXT_CAT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static RP_ERROR_CONTEXT_MTA => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static RP_VOLATILE_FLAGS_MASK => 4026531840

    /**
     * @type {Integer (UInt32)}
     */
    static RP_DSN_NOTIFY_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPV_INBOUND_CUTOFF_EXCEEDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPV_WRITE_CONTENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NMP_PROCESS_POST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NMP_PROCESS_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NMP_PROCESS_MODERATOR => 4

    /**
     * @type {Guid}
     */
    static GUID_SMTP_SOURCE_TYPE => Guid("{fb65c4dc-e468-11d1-aa67-00c04fa345f6}")

    /**
     * @type {Guid}
     */
    static GUID_SMTPSVC_SOURCE => Guid("{1b3c0666-e470-11d1-aa67-00c04fa345f6}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_ON_INBOUND_COMMAND => Guid("{f6628c8d-0d5e-11d2-aa68-00c04fa35b82}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_ON_SERVER_RESPONSE => Guid("{f6628c8e-0d5e-11d2-aa68-00c04fa35b82}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_ON_SESSION_START => Guid("{f6628c8f-0d5e-11d2-aa68-00c04fa35b82}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_ON_MESSAGE_START => Guid("{f6628c90-0d5e-11d2-aa68-00c04fa35b82}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_ON_PER_RECIPIENT => Guid("{f6628c91-0d5e-11d2-aa68-00c04fa35b82}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_ON_BEFORE_DATA => Guid("{f6628c92-0d5e-11d2-aa68-00c04fa35b82}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_ON_SESSION_END => Guid("{f6628c93-0d5e-11d2-aa68-00c04fa35b82}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_STORE_DRIVER => Guid("{59175850-e533-11d1-aa67-00c04fa345f6}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_TRANSPORT_SUBMISSION => Guid("{ff3caa23-00b9-11d2-9dfb-00c04fa322ba}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_TRANSPORT_PRECATEGORIZE => Guid("{a3acfb0d-83ff-11d2-9e14-00c04fa322ba}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_TRANSPORT_CATEGORIZE => Guid("{960252a3-0a3a-11d2-9e00-00c04fa322ba}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_TRANSPORT_POSTCATEGORIZE => Guid("{76719654-05a6-11d2-9dfd-00c04fa322ba}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_TRANSPORT_ROUTER => Guid("{283430c9-1850-11d2-9e03-00c04fa322ba}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_MSGTRACKLOG => Guid("{c6df52aa-7db0-11d2-94f4-00c04f79f1d6}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_DNSRESOLVERRECORDSINK => Guid("{bd0b4366-8e03-11d2-94f6-00c04f79f1d6}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_MAXMSGSIZE => Guid("{ebf159de-a67e-11d2-94f7-00c04f79f1d6}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_LOG => Guid("{93d0a538-2c1e-4b68-a7c9-d73a8aa6ee97}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_GET_AUX_DOMAIN_INFO_FLAGS => Guid("{84ff368a-fab3-43d7-bcdf-692c5b46e6b1}")

    /**
     * @type {Guid}
     */
    static CLSID_SmtpCat => Guid("{b23c35b7-9219-11d2-9e17-00c04fa322ba}")

    /**
     * @type {Guid}
     */
    static CATID_SMTP_DSN => Guid("{22b55731-f5f8-4d23-bd8f-87b52371a73a}")

    /**
     * @type {String}
     */
    static SZ_PROGID_SMTPCAT => "Smtp.Cat"

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_S_PROPERTIESIGNORED => 262656

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_S_BUFFER_TO_SMALL => 262657

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NOTOPENED => -2147220981

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NOTINITIALIZED => -2147220980

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_USERABORT => -2147220979

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_GENERIC => -2147220978

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_MEDIUM_NOTPRESENT => -2147220977

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_MEDIUM_INVALIDTYPE => -2147220976

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DEVICE_NOPROPERTIES => -2147220975

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DEVICE_NOTACCESSIBLE => -2147220974

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DEVICE_NOTPRESENT => -2147220973

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DEVICE_INVALIDTYPE => -2147220972

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_INITIALIZE_WRITE => -2147220971

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_INITIALIZE_ENDWRITE => -2147220970

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_FILESYSTEM => -2147220969

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_FILEACCESS => -2147220968

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DISCINFO => -2147220967

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_TRACKNOTOPEN => -2147220966

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_TRACKOPEN => -2147220965

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DISCFULL => -2147220964

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_BADJOLIETNAME => -2147220963

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_INVALIDIMAGE => -2147220962

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NOACTIVEFORMAT => -2147220961

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NOACTIVERECORDER => -2147220960

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_WRONGFORMAT => -2147220959

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_ALREADYOPEN => -2147220958

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_WRONGDISC => -2147220957

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_FILEEXISTS => -2147220956

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_STASHINUSE => -2147220955

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_DEVICE_STILL_IN_USE => -2147220954

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_LOSS_OF_STREAMING => -2147220953

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_COMPRESSEDSTASH => -2147220952

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_ENCRYPTEDSTASH => -2147220951

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_NOTENOUGHDISKFORSTASH => -2147220950

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_REMOVABLESTASH => -2147220949

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_CANNOT_WRITE_TO_MEDIA => -2147220948

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_TRACK_NOT_BIG_ENOUGH => -2147220947

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_E_BOOTIMAGE_AND_NONBLANK_DISC => -2147220946
;@endregion Constants

;@region Methods
    /**
     * Describes the syntax, parameters, and return value of OpenIMsgSession, which creates and opens a message session that groups the messages created within it.
     * @remarks
     * A message session is used by client applications and service providers that want to deal with several related MAPI [IMessage : IMAPIProp](imessageimapiprop.md) objects built on top of underlying OLE **IStorage** objects. The client or provider uses the **OpenIMsgSession** and [CloseIMsgSession](closeimsgsession.md) functions to wrap the creation of such messages inside a message session. Once the message session is opened, the client or provider passes a pointer to it in a call to [OpenIMsgOnIStg](openimsgonistg.md) to create a new **IMessage**-on- **IStorage** object.
     * 
     * A message session keeps track of all **IMessage**-on- **IStorage** objects created during the duration of the session, in addition to all the attachments and other properties of the messages. When a client or provider calls **CloseIMsgSession**, it closes all these objects. Calling **CloseIMsgSession** is the only way to close **IMessage**-on- **IStorage** objects.
     * 
     *  **OpenIMsgSession** is used by clients and providers that require the ability to handle several related messages as OLE **IStorage** objects. If only one such message is to be open at a time, there is no need to track multiple messages and no reason to create a message session with **OpenIMsgSession**.
     * 
     * Because it is dealing with an underlying OLE object, MAPI needs to use OLE memory allocation. For more information about OLE structured storage objects and OLE memory allocation, see [OLE and Data Transfer](https://msdn.microsoft.com/library/d4a57956-37ba-44ca-8efc-bf617ad5e77b.aspx).
     * @param {IMalloc} lpMalloc > [in] Pointer to a memory allocator object exposing the OLE [IMalloc](/windows/desktop/api/objidl/nn-objidl-imalloc) interface. MAPI needs to use this allocation method when working with the OLE [IStorage](/windows/desktop/api/objidl/nn-objidl-istorage) interface.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @param {Pointer<LPMSGSESS>} lppMsgSess > [out] Pointer to a pointer to the returned message session object.
     * @returns {Integer} S_OK
     * 
     * > The session was opened.
     * 
     * MAPI_E_INVALID_PARAMETER
     * 
     * > _lpMalloc_ or _lppMsgSess_ is NULL.
     * 
     * MAPI_E_INVALID_FLAGS
     * 
     * > Invalid flags were passed.
     * 
     * MAPI_UNICODE
     * 
     * > When calling this function, a client or service provider sets the MAPI_UNICODE flag to create Unicode .msg files. The resulting [Imessage](imessageimapiprop.md) file shows STORE_UNICODE_OK in its PR_STORE_SUPPORT_MASK and supports Unicode properties.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/openimsgsession
     */
    static OpenIMsgSession(lpMalloc, ulFlags, lppMsgSess) {
        lppMsgSessMarshal := lppMsgSess is VarRef ? "ptr*" : "ptr"

        result := DllCall("MAPI32.dll\OpenIMsgSession", "ptr", lpMalloc, "uint", ulFlags, lppMsgSessMarshal, lppMsgSess, "int")
        return result
    }

    /**
     * CloseIMsgSession closes a message session and all the messages created within that session.
     * @remarks
     * A message session is used by client applications and service providers that want to deal with several related MAPI **IMessage** objects built on top of underlying OLE **IStorage** objects. The client or provider uses the [OpenIMsgSession](openimsgsession.md) and **CloseIMsgSession** functions to wrap the creation of such messages inside a message session. Once the message session is opened, the client or provider passes a pointer to it in a call to [OpenIMsgOnIStg](openimsgonistg.md) to create a new **IMessage**-on- **IStorage** object. 
     *   
     * A message session keeps track of all **IMessage**-on- **IStorage** objects opened during the duration of the session, in addition to all the attachments and other properties of the messages. When a client or provider calls **CloseIMsgSession**, it closes all these objects. Calling **CloseIMsgSession** is the only way to close **IMessage**-on- **IStorage** objects.
     * @param {LPMSGSESS} lpMsgSess > [in] Pointer to the message session object obtained using the [OpenIMsgSession](openimsgsession.md) function at the start of the message session.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/closeimsgsession
     */
    static CloseIMsgSession(lpMsgSess) {
        DllCall("MAPI32.dll\CloseIMsgSession", "ptr", lpMsgSess)
    }

    /**
     * Builds a new IMessage object on top of an existing OLE IStorage object, to be used within a message session.
     * @remarks
     * Property attributes can only be accessed on property objects, that is, objects implementing the [IMAPIProp : IUnknown](imapipropiunknown.md) interface. To make MAPI properties available on an OLE structured storage object, **OpenIMsgOnIStg** builds an [IMessage : IMAPIProp](imessageimapiprop.md) object on top of the OLE **IStorage** object. The property attributes on such objects can be set or altered with [SetAttribIMsgOnIStg](setattribimsgonistg.md) and retrieved with [GetAttribIMsgOnIStg](getattribimsgonistg.md).
     * @param {LPMSGSESS} lpMsgSess > [in] Pointer to a message session object within which the new **IMessage**-on- **IStorage** object is to be created.
     * @param {Pointer<LPALLOCATEBUFFER>} lpAllocateBuffer > [in] Pointer to the [MAPIAllocateBuffer](mapiallocatebuffer.md) function, to be used to allocate memory.
     * @param {Pointer<LPALLOCATEMORE>} lpAllocateMore > [in] Pointer to the [MAPIAllocateMore](mapiallocatemore.md) function, to be used to allocate additional memory.
     * @param {Pointer<LPFREEBUFFER>} lpFreeBuffer > [in] Pointer to the [MAPIFreeBuffer](mapifreebuffer.md) function, to be used to free memory.
     * @param {IMalloc} lpMalloc > [in] Pointer to a memory allocator object exposing the OLE **IMalloc** interface. The **IMessage** interface needs to use this allocation method when working with interfaces such as **IStorage** and **IStream**.
     * @param {Pointer<Void>} lpMapiSup > [in] Optional pointer to a MAPI support object that a service provider can use to call the methods of the [IMAPISupport : IUnknown](imapisupportiunknown.md) interface.
     * @param {IStorage} lpStg > [in, out] Pointer to an OLE **IStorage** object that is open and has read-only or read/write permission. Because **IMessage** does not support write-only access, **OpenIMsgOnIStg** does not accept a storage object opened in write-only mode.
     * @param {Pointer<Pointer<MSGCALLRELEASE>>} lpfMsgCallRelease > [in] Optional pointer to a callback function based on the [MSGCALLRELEASE](msgcallrelease.md) prototype that MAPI is to call following the last release on the **IMessage**-on- **IStorage** object.
     * @param {Integer} ulCallerData > [in] Caller data saved by MAPI with the **IMessage**-on- **IStorage** object and passed to the **MSGCALLRELEASE** based callback function. The data provides context about the **IMessage** object being released and the **IStorage** object on top of which it was built.
     * @param {Integer} ulFlags > [in] Bitmask of flags used to control whether the OLE **IStorage::Commit** method is called when the client application or service provider calls the **IMessage::SaveChanges** method. The following flags can be set:
     * 
     * IMSG_NO_ISTG_COMMIT
     *   
     * > The OLE method **IStorage::Commit** is not to be called when the client or provider calls [SaveChanges](imapiprop-savechanges.md).
     * 
     * MAPI_UNICODE
     *   
     * > Enables creation of Unicode .msg files. The resulting [IMessage](imessageimapiprop.md) file shows STORE_UNICODE_OK in its [PR_STORE_SUPPORT_MASK](pidtagstoresupportmask-canonical-property.md) and supports Unicode properties.
     * 
     *   > [!NOTE]
     *   > The MAPI_UNICODE flag is only supported in this function on Outlook 2003 or higher.
     * @param {Pointer<IMessage>} lppMsg > [out] Pointer to a pointer to the opened **IMessage** object.
     * @returns {Integer} S_OK
     *   
     * > The call succeeded and has returned the expected value or values.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/openimsgonistg
     */
    static OpenIMsgOnIStg(lpMsgSess, lpAllocateBuffer, lpAllocateMore, lpFreeBuffer, lpMalloc, lpMapiSup, lpStg, lpfMsgCallRelease, ulCallerData, ulFlags, lppMsg) {
        lpMapiSupMarshal := lpMapiSup is VarRef ? "ptr" : "ptr"
        lpfMsgCallReleaseMarshal := lpfMsgCallRelease is VarRef ? "ptr*" : "ptr"

        result := DllCall("MAPI32.dll\OpenIMsgOnIStg", "ptr", lpMsgSess, "ptr", lpAllocateBuffer, "ptr", lpAllocateMore, "ptr", lpFreeBuffer, "ptr", lpMalloc, lpMapiSupMarshal, lpMapiSup, "ptr", lpStg, lpfMsgCallReleaseMarshal, lpfMsgCallRelease, "uint", ulCallerData, "uint", ulFlags, "ptr*", lppMsg, "int")
        return result
    }

    /**
     * Describes GetAttribIMsgOnIStg and provides syntax, parameters, and return value.
     * @remarks
     * Property attributes can only be accessed on property objects, that is, objects implementing the [IMAPIProp : IUnknown](imapipropiunknown.md) interface. To make MAPI properties available on an OLE structured storage object, [OpenIMsgOnIStg](openimsgonistg.md) builds an [IMessage : IMAPIProp](imessageimapiprop.md) object on top of the OLE **IStorage** object. The property attributes on such objects can be set or altered with [SetAttribIMsgOnIStg](setattribimsgonistg.md) and retrieved with **GetAttribIMsgOnIStg**. 
     *   
     * > [!NOTE]
     * > **GetAttribIMsgOnIStg** and **SetAttribIMsgOnIStg** do not operate on all **IMessage** objects. They are only valid for **IMessage**-on- **IStorage** objects returned by **OpenIMsgOnIStg**. 
     *   
     * The number and positions of the attributes in the _lppPropAttrArray_ parameter correspond to the number and positions of the property tags in the _lpPropTagArray_ parameter.
     * @param {Pointer<Void>} lpObject > [in] Pointer to an **IMessage** object obtained from the [OpenIMsgOnIStg](openimsgonistg.md) function.
     * @param {Pointer<SPropTagArray>} lpPropTagArray > [in] Pointer to an [SPropTagArray](sproptagarray.md) structure that contains an array of property tags indicating the properties for which attributes are to be retrieved.
     * @param {Pointer<Pointer<SPropAttrArray>>} lppPropAttrArray > [out] Pointer to a pointer to the returned [SPropAttrArray](spropattrarray.md) structure that contains the retrieved property attributes.
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and has returned the expected value or values. 
     *     
     * MAPI_W_ERRORS_RETURNED 
     *   
     * > The call succeeded overall, but one or more properties could not be accessed and were returned with a property type of PT_ERROR.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/getattribimsgonistg
     */
    static GetAttribIMsgOnIStg(lpObject, lpPropTagArray, lppPropAttrArray) {
        lpObjectMarshal := lpObject is VarRef ? "ptr" : "ptr"
        lppPropAttrArrayMarshal := lppPropAttrArray is VarRef ? "ptr*" : "ptr"

        result := DllCall("MAPI32.dll\GetAttribIMsgOnIStg", lpObjectMarshal, lpObject, "ptr", lpPropTagArray, lppPropAttrArrayMarshal, lppPropAttrArray, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or alters attributes of properties on an IMessage object supplied by the OpenIMsgOnIStg function.
     * @remarks
     * Property attributes can only be accessed on property objects, that is, objects implementing the [IMAPIProp : IUnknown](imapipropiunknown.md) interface. To make MAPI properties available on an OLE structured storage object, [OpenIMsgOnIStg](openimsgonistg.md) builds an [IMessage : IMAPIProp](imessageimapiprop.md) object on top of the OLE **IStorage** object. The property attributes on such objects can be set or altered with **SetAttribIMsgOnIStg** and retrieved with [GetAttribIMsgOnIStg](getattribimsgonistg.md). 
     *   
     *  **Note** **GetAttribIMsgOnIStg** and **SetAttribIMsgOnIStg** do not operate on all **IMessage** objects. They are only valid for **IMessage**-on- **IStorage** objects returned by **OpenIMsgOnIStg**. 
     *   
     * In the  _lpPropAttrs_ parameter, the number and position of the attributes must match the number and position of the property tags passed in the _lpPropTags_ parameter. 
     *   
     * The **SetAttribIMsgOnIStg** function is used to make message properties read-only when required by the **IMessage** schema. The sample message store provider uses it for this purpose. For more information, see [Messages](mapi-messages.md).
     * @param {Pointer<Void>} lpObject > [in] Pointer to the object for which property attributes are being set.
     * @param {Pointer<SPropTagArray>} lpPropTags > [in] Pointer to an [SPropTagArray](sproptagarray.md) structure containing an array of property tags indicating the properties for which property attributes are being set.
     * @param {Pointer<SPropAttrArray>} lpPropAttrs > [in] Pointer to an [SPropAttrArray](spropattrarray.md) structure listing the property attributes to set.
     * @param {Pointer<Pointer<SPropProblemArray>>} lppPropProblems > [out] Pointer to the returned [SPropProblemArray](spropproblemarray.md) structure containing a set of property problems. This structure identifies problems encountered if **SetAttribIMsgOnIStg** has been able to set some properties, but not all. If a pointer to NULL is passed in the _lppPropProblems_ parameter, no property problem array is returned even if some properties were not set.
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and has returned the expected value or values.
     *     
     * MAPI_W_ERRORS_RETURNED 
     *   
     * > The call succeeded overall, but one or more properties could not be accessed and were returned with a property type of PT_ERROR.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/setattribimsgonistg
     */
    static SetAttribIMsgOnIStg(lpObject, lpPropTags, lpPropAttrs, lppPropProblems) {
        lpObjectMarshal := lpObject is VarRef ? "ptr" : "ptr"
        lppPropProblemsMarshal := lppPropProblems is VarRef ? "ptr*" : "ptr"

        result := DllCall("MAPI32.dll\SetAttribIMsgOnIStg", lpObjectMarshal, lpObject, "ptr", lpPropTags, "ptr", lpPropAttrs, lppPropProblemsMarshal, lppPropProblems, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Describes the syntax, parameters, and return value of MapStorageSCode, which maps an SCODE return value from an OLE storage object to an HRESULT type.
     * @remarks
     * MAPI provides the **MapStorageSCode** function for the internal use of MAPI components that base their message implementations on the message DLL. Because these components open OLE storage themselves, they must be able to map error values returned for problems with OLE storage to an HRESULT value. 
     *   
     * For more information, see [Structured Storage](structured-storage-in-mapi.md).
     * @param {Integer} StgSCode > [in] MAPI SCODE return value from an OLE storage object to be mapped to a HRESULT value.
     * @returns {Integer} S_OK 
     *   
     * > The call succeeded and returned the expected value.
     *     
     * MAPI_E_CALL_FAILED 
     *   
     * > The function cannot find a matching value.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapstoragescode
     */
    static MapStorageSCode(StgSCode) {
        result := DllCall("MAPI32.dll\MapStorageSCode", "int", StgSCode, "int")
        return result
    }

;@endregion Methods
}
