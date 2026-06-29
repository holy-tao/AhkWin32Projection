#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.IndexServer
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global CI_VERSION_WDS30 := 258

/**
 * @type {Integer (UInt32)}
 */
export global CI_VERSION_WDS40 := 265

/**
 * @type {Integer (UInt32)}
 */
export global CI_VERSION_WIN70 := 1792

/**
 * @type {String}
 */
export global CINULLCATALOG := "::_noindex_::"

/**
 * @type {String}
 */
export global CIADMIN := "::_nodocstore_::"

/**
 * @type {Integer (UInt32)}
 */
export global LIFF_LOAD_DEFINED_FILTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global LIFF_IMPLEMENT_TEXT_FILTER_FALLBACK_POLICY := 2

/**
 * @type {Integer (UInt32)}
 */
export global LIFF_FORCE_TEXT_FILTER_FALLBACK := 3

/**
 * @type {Guid}
 */
export global CLSID_INDEX_SERVER_DSO := Guid("{f9ae8980-7e52-11d0-8964-00c04fd611d7}")

/**
 * @type {Guid}
 */
export global PSGUID_FILENAME := Guid("{41cf5ae0-f75a-4806-bd87-59c7d9248eb9}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_FILENAME := 100

/**
 * @type {Guid}
 */
export global DBPROPSET_FSCIFRMWRK_EXT := Guid("{a9bd1526-6a80-11d0-8c9d-0020af1d740e}")

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_CI_CATALOG_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_CI_INCLUDE_SCOPES := 3

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_CI_DEPTHS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_CI_SCOPE_FLAGS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_CI_EXCLUDE_SCOPES := 5

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_CI_SECURITY_ID := 6

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_CI_QUERY_TYPE := 7

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_CI_PROVIDER := 8

/**
 * @type {Integer (UInt32)}
 */
export global CI_PROVIDER_MSSEARCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global CI_PROVIDER_INDEXING_SERVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CI_PROVIDER_ALL := 4294967295

/**
 * @type {Guid}
 */
export global DBPROPSET_SESS_QUERYEXT := Guid("{63623309-2d8b-4d17-b152-6e2956c26a70}")

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_DEFAULT_EQUALS_BEHAVIOR := 2

/**
 * @type {Guid}
 */
export global DBPROPSET_QUERYEXT := Guid("{a7ac77ed-f8d7-11ce-a798-0020f8008025}")

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_USECONTENTINDEX := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_DEFERNONINDEXEDTRIMMING := 3

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_USEEXTENDEDDBTYPES := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_IGNORENOISEONLYCLAUSES := 5

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_GENERICOPTIONS_STRING := 6

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_FIRSTROWS := 7

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_DEFERCATALOGVERIFICATION := 8

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_CATALOGLISTID := 9

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_GENERATEPARSETREE := 10

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_APPLICATION_NAME := 11

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_FREETEXTANYTERM := 12

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_FREETEXTUSESTEMMING := 13

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_IGNORESBRI := 14

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_DONOTCOMPUTEEXPENSIVEPROPS := 15

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_ENABLEROWSETEVENTS := 16

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_SESSION_ID := 17

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_QUERY_ID := 18

/**
 * @type {Guid}
 */
export global DBPROPSET_CIFRMWRKCORE_EXT := Guid("{afafaca5-b5d1-11d0-8c62-00c04fc2db8d}")

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_MACHINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBPROP_CLIENT_CLSID := 3

/**
 * @type {Guid}
 */
export global DBPROPSET_MSIDXS_ROWSETEXT := Guid("{aa6ee6b0-e828-11d0-b23e-00aa0047fc01}")

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_ROWSETQUERYSTATUS := 2

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_COMMAND_LOCALE_STRING := 3

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_QUERY_RESTRICTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_PARSE_TREE := 5

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_MAX_RANK := 6

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_RESULTS_FOUND := 7

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_WHEREID := 8

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_SERVER_VERSION := 9

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_SERVER_WINVER_MAJOR := 10

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_SERVER_WINVER_MINOR := 11

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_SERVER_NLSVERSION := 12

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_SERVER_NLSVER_DEFINED := 13

/**
 * @type {Integer (UInt32)}
 */
export global MSIDXSPROP_SAME_SORTORDER_USED := 14

/**
 * @type {Integer (UInt32)}
 */
export global STAT_BUSY := 0

/**
 * @type {Integer (UInt32)}
 */
export global STAT_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global STAT_DONE := 2

/**
 * @type {Integer (UInt32)}
 */
export global STAT_REFRESH := 3

/**
 * @type {Integer (UInt32)}
 */
export global STAT_PARTIAL_SCOPE := 8

/**
 * @type {Integer (UInt32)}
 */
export global STAT_NOISE_WORDS := 16

/**
 * @type {Integer (UInt32)}
 */
export global STAT_CONTENT_OUT_OF_DATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global STAT_REFRESH_INCOMPLETE := 64

/**
 * @type {Integer (UInt32)}
 */
export global STAT_CONTENT_QUERY_INCOMPLETE := 128

/**
 * @type {Integer (UInt32)}
 */
export global STAT_TIME_LIMIT_EXCEEDED := 256

/**
 * @type {Integer (UInt32)}
 */
export global STAT_SHARING_VIOLATION := 512

/**
 * @type {Integer (UInt32)}
 */
export global STAT_MISSING_RELDOC := 1024

/**
 * @type {Integer (UInt32)}
 */
export global STAT_MISSING_PROP_IN_RELDOC := 2048

/**
 * @type {Integer (UInt32)}
 */
export global STAT_RELDOC_ACCESS_DENIED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global STAT_COALESCE_COMP_ALL_NOISE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global QUERY_SHALLOW := 0

/**
 * @type {Integer (UInt32)}
 */
export global QUERY_DEEP := 1

/**
 * @type {Integer (UInt32)}
 */
export global QUERY_PHYSICAL_PATH := 0

/**
 * @type {Integer (UInt32)}
 */
export global QUERY_VIRTUAL_PATH := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROPID_QUERY_WORKID := 5

/**
 * @type {Integer (UInt32)}
 */
export global PROPID_QUERY_UNFILTERED := 7

/**
 * @type {Integer (UInt32)}
 */
export global PROPID_QUERY_VIRTUALPATH := 9

/**
 * @type {Integer (UInt32)}
 */
export global PROPID_QUERY_LASTSEENTIME := 10

/**
 * @type {Integer (UInt32)}
 */
export global CICAT_STOPPED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CICAT_READONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global CICAT_WRITABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CICAT_NO_QUERY := 8

/**
 * @type {Integer (UInt32)}
 */
export global CICAT_GET_STATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CICAT_ALL_OPENED := 32

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_SHADOW_MERGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_MASTER_MERGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_CONTENT_SCAN_REQUIRED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_ANNEALING_MERGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_SCANNING := 16

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_RECOVERING := 32

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_INDEX_MIGRATION_MERGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_LOW_MEMORY := 128

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_HIGH_IO := 256

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_MASTER_MERGE_PAUSED := 512

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_READ_ONLY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_BATTERY_POWER := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_USER_ACTIVE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_STARTING := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_READING_USNS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_DELETION_MERGE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_LOW_DISK := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_HIGH_CPU := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CI_STATE_BATTERY_POLICY := 262144

/**
 * @type {Integer (UInt32)}
 */
export global GENERATE_METHOD_EXACT := 0

/**
 * @type {Integer (UInt32)}
 */
export global GENERATE_METHOD_PREFIX := 1

/**
 * @type {Integer (UInt32)}
 */
export global GENERATE_METHOD_INFLECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCOPE_FLAG_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global SCOPE_FLAG_INCLUDE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCOPE_FLAG_DEEP := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCOPE_TYPE_MASK := 4294967040

/**
 * @type {Integer (UInt32)}
 */
export global SCOPE_TYPE_WINPATH := 256

/**
 * @type {Integer (UInt32)}
 */
export global SCOPE_TYPE_VPATH := 512

/**
 * @type {Integer (UInt32)}
 */
export global PROPID_QUERY_RANKVECTOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROPID_QUERY_RANK := 3

/**
 * @type {Integer (UInt32)}
 */
export global PROPID_QUERY_HITCOUNT := 4

/**
 * @type {Integer (UInt32)}
 */
export global PROPID_QUERY_ALL := 6

/**
 * @type {Integer (UInt32)}
 */
export global PROPID_STG_CONTENTS := 19

/**
 * @type {Integer (UInt32)}
 */
export global VECTOR_RANK_MIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global VECTOR_RANK_MAX := 1

/**
 * @type {Integer (UInt32)}
 */
export global VECTOR_RANK_INNER := 2

/**
 * @type {Integer (UInt32)}
 */
export global VECTOR_RANK_DICE := 3

/**
 * @type {Integer (UInt32)}
 */
export global VECTOR_RANK_JACCARD := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBSETFUNC_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DBSETFUNC_ALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBSETFUNC_DISTINCT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROXIMITY_UNIT_WORD := 0

/**
 * @type {Integer (UInt32)}
 */
export global PROXIMITY_UNIT_SENTENCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROXIMITY_UNIT_PARAGRAPH := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROXIMITY_UNIT_CHAPTER := 3

/**
 * @type {Integer (Int32)}
 */
export global NOT_AN_ERROR := 524288

/**
 * @type {Integer (Int32)}
 */
export global FILTER_E_END_OF_CHUNKS := -2147215616

/**
 * @type {Integer (Int32)}
 */
export global FILTER_E_NO_MORE_TEXT := -2147215615

/**
 * @type {Integer (Int32)}
 */
export global FILTER_E_NO_MORE_VALUES := -2147215614

/**
 * @type {Integer (Int32)}
 */
export global FILTER_E_ACCESS := -2147215613

/**
 * @type {Integer (Int32)}
 */
export global FILTER_W_MONIKER_CLIPPED := 268036

/**
 * @type {Integer (Int32)}
 */
export global FILTER_E_NO_TEXT := -2147215611

/**
 * @type {Integer (Int32)}
 */
export global FILTER_E_NO_VALUES := -2147215610

/**
 * @type {Integer (Int32)}
 */
export global FILTER_E_EMBEDDING_UNAVAILABLE := -2147215609

/**
 * @type {Integer (Int32)}
 */
export global FILTER_E_LINK_UNAVAILABLE := -2147215608

/**
 * @type {Integer (Int32)}
 */
export global FILTER_S_LAST_TEXT := 268041

/**
 * @type {Integer (Int32)}
 */
export global FILTER_S_LAST_VALUES := 268042

/**
 * @type {Integer (Int32)}
 */
export global FILTER_E_PASSWORD := -2147215605

/**
 * @type {Integer (Int32)}
 */
export global FILTER_E_UNKNOWNFORMAT := -2147215604
;@endregion Constants
