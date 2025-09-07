#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPROPENUM{

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ABORTPRESERVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ACTIVESESSIONS => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_APPENDONLY => 187

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ASYNCTXNABORT => 168

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ASYNCTXNCOMMIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_AUTH_CACHE_AUTHINFO => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_AUTH_ENCRYPT_PASSWORD => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_AUTH_INTEGRATED => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_AUTH_MASK_PASSWORD => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_AUTH_PASSWORD => 9

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_AUTH_PERSIST_ENCRYPTED => 10

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_AUTH_PERSIST_SENSITIVE_AUTHINFO => 11

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_AUTH_USERID => 12

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_BLOCKINGSTORAGEOBJECTS => 13

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_BOOKMARKS => 14

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_BOOKMARKSKIPPED => 15

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_BOOKMARKTYPE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_BYREFACCESSORS => 120

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_CACHEDEFERRED => 17

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_CANFETCHBACKWARDS => 18

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_CANHOLDROWS => 19

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_CANSCROLLBACKWARDS => 21

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_CATALOGLOCATION => 22

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_CATALOGTERM => 23

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_CATALOGUSAGE => 24

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_CHANGEINSERTEDROWS => 188

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COL_AUTOINCREMENT => 26

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COL_DEFAULT => 27

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COL_DESCRIPTION => 28

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COL_FIXEDLENGTH => 167

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COL_NULLABLE => 29

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COL_PRIMARYKEY => 30

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COL_UNIQUE => 31

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COLUMNDEFINITION => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COLUMNRESTRICT => 33

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COMMANDTIMEOUT => 34

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_COMMITPRESERVE => 35

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_CONCATNULLBEHAVIOR => 36

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_CURRENTCATALOG => 37

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_DATASOURCENAME => 38

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_DATASOURCEREADONLY => 39

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_DBMSNAME => 40

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_DBMSVER => 41

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_DEFERRED => 42

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_DELAYSTORAGEOBJECTS => 43

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_DSOTHREADMODEL => 169

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_GROUPBY => 44

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_HETEROGENEOUSTABLES => 45

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IAccessor => 121

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IColumnsInfo => 122

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IColumnsRowset => 123

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IConnectionPointContainer => 124

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IConvertType => 194

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowset => 126

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetChange => 127

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetIdentity => 128

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetIndex => 159

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetInfo => 129

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetLocate => 130

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetResynch => 132

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetScroll => 133

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetUpdate => 134

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ISupportErrorInfo => 135

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ILockBytes => 136

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ISequentialStream => 137

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IStorage => 138

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IStream => 139

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IDENTIFIERCASE => 46

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IMMOBILEROWS => 47

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_AUTOUPDATE => 48

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_CLUSTERED => 49

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_FILLFACTOR => 50

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_INITIALSIZE => 51

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_NULLCOLLATION => 52

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_NULLS => 53

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_PRIMARYKEY => 54

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_SORTBOOKMARKS => 55

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_TEMPINDEX => 163

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_TYPE => 56

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INDEX_UNIQUE => 57

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_DATASOURCE => 59

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_HWND => 60

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_IMPERSONATION_LEVEL => 61

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_LCID => 186

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_LOCATION => 62

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_MODE => 63

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_PROMPT => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_PROTECTION_LEVEL => 65

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_PROVIDERSTRING => 160

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_INIT_TIMEOUT => 66

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_LITERALBOOKMARKS => 67

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_LITERALIDENTITY => 68

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAXINDEXSIZE => 70

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAXOPENROWS => 71

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAXPENDINGROWS => 72

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAXROWS => 73

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAXROWSIZE => 74

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAXROWSIZEINCLUDESBLOB => 75

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAXTABLESINSELECT => 76

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MAYWRITECOLUMN => 77

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MEMORYUSAGE => 78

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MULTIPLEPARAMSETS => 191

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MULTIPLERESULTS => 196

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MULTIPLESTORAGEOBJECTS => 80

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_MULTITABLEUPDATE => 81

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFICATIONGRANULARITY => 198

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFICATIONPHASES => 82

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYCOLUMNSET => 171

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWDELETE => 173

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWFIRSTCHANGE => 174

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWINSERT => 175

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWRESYNCH => 177

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWSETCHANGED => 211

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWSETRELEASE => 178

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWSETFETCHPOSITIONCHANGE => 179

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWUNDOCHANGE => 180

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWUNDODELETE => 181

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWUNDOINSERT => 182

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NOTIFYROWUPDATE => 183

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_NULLCOLLATION => 83

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_OLEOBJECTS => 84

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ORDERBYCOLUMNSINSELECT => 85

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ORDEREDBOOKMARKS => 86

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_OTHERINSERT => 87

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_OTHERUPDATEDELETE => 88

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_OUTPUTPARAMETERAVAILABILITY => 184

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_OWNINSERT => 89

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_OWNUPDATEDELETE => 90

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_PERSISTENTIDTYPE => 185

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_PREPAREABORTBEHAVIOR => 91

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_PREPARECOMMITBEHAVIOR => 92

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_PROCEDURETERM => 93

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_PROVIDERNAME => 96

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_PROVIDEROLEDBVER => 97

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_PROVIDERVER => 98

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_QUICKRESTART => 99

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_QUOTEDIDENTIFIERCASE => 100

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_REENTRANTEVENTS => 101

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_REMOVEDELETED => 102

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_REPORTMULTIPLECHANGES => 103

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_RETURNPENDINGINSERTS => 189

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ROWRESTRICT => 104

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ROWSETCONVERSIONSONCOMMAND => 192

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_ROWTHREADMODEL => 105

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SCHEMATERM => 106

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SCHEMAUSAGE => 107

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SERVERCURSOR => 108

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SESS_AUTOCOMMITISOLEVELS => 190

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SQLSUPPORT => 109

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_STRONGIDENTITY => 119

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_STRUCTUREDSTORAGE => 111

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SUBQUERIES => 112

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SUPPORTEDTXNDDL => 161

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SUPPORTEDTXNISOLEVELS => 113

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SUPPORTEDTXNISORETAIN => 114

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_TABLETERM => 115

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_TBL_TEMPTABLE => 140

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_TRANSACTEDOBJECT => 116

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_UPDATABILITY => 117

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_USERNAME => 118
}
